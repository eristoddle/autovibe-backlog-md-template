#!/usr/bin/env python3
import os
import sys
import yaml
from pathlib import Path

# --- Configuration ---
TASKS_DIR = Path("./backlog/tasks")
ARCHIVE_DIR = Path("./backlog/archive/tasks")
# --- End Configuration ---

def parse_frontmatter(file_path: Path) -> dict:
    """Safely parses YAML frontmatter from a markdown file."""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        if not content.startswith('---'):
            return {}

        parts = content.split('---', 2)
        if len(parts) < 3:
            return {}

        frontmatter = yaml.safe_load(parts[1])
        return frontmatter if isinstance(frontmatter, dict) else {}
    except Exception:
        return {}

def find_dependency_file(dep_id: str) -> Path | None:
    """Finds a dependency file in tasks or archive, being strict with naming."""
    # Search for a file starting exactly with "task-id - "
    for search_dir in [TASKS_DIR, ARCHIVE_DIR]:
        try:
            # The glob pattern is specific to avoid ambiguity (e.g., task-8 vs task-8.1)
            matches = list(search_dir.glob(f"{dep_id} - *.md"))
            if matches:
                return matches[0]
        except Exception:
            continue
    return None

def main():
    """
    Finds the first actionable task:
    1. Has status "To Do".
    2. Is not an EPIC.
    3. Has all dependencies met (status "Done").
    """
    if not TASKS_DIR.exists():
        return

    candidate_files = sorted(list(TASKS_DIR.glob("*.md")))

    for task_file in candidate_files:
        task_data = parse_frontmatter(task_file)

        # 1. Must be in "To Do" status
        if task_data.get("status") != "To Do":
            continue

        # 2. Must not be an EPIC
        if "epic" in task_data.get("labels", []):
            continue

        # 3. Check dependencies
        dependencies = task_data.get("dependencies")
        if not dependencies:
            # No dependencies, this task is ready!
            print(task_file)
            sys.exit(0)

        all_deps_met = True
        for dep_id in dependencies:
            dep_file = find_dependency_file(dep_id)
            if not dep_file:
                # Dependency file not found anywhere, so it's not done.
                all_deps_met = False
                break

            dep_data = parse_frontmatter(dep_file)
            if dep_data.get("status") != "Done":
                # Dependency is not done.
                all_deps_met = False
                break

        if all_deps_met:
            # All dependencies are met, this task is ready!
            print(task_file)
            sys.exit(0)

if __name__ == "__main__":
    main()
