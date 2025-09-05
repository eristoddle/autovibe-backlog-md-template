#!/usr/bin/env python3
"""
Template sync script for autovibe-backlog-md-template

Usage:
    python sync_template_changes.py --update-from <source_project_path>
    python sync_template_changes.py --update-to <target_project_path>

--update-from: Update this template from another project
--update-to: Update another project from this template
"""

import argparse
import os
import shutil
import sys
from pathlib import Path
from typing import List, Set

# List of files to sync - add/remove as needed
SYNC_FILES = [
    # Root level files
    "AGENTS.md",
    "CLAUDE.md",
    "GEMINI.md",
    "README.md",
    "ROO.md",
    "requirements.txt",
    "run_claude_loop.sh",
    "setup.sh",
    "repomix.config.json",

    # Dot files and configuration
    ".cursorrules",

    # Claude configuration
    ".claude/settings.local.json",
    ".claude/hooks.json",
    ".claude/agents/code-reviewer.md",
    ".claude/agents/project-manager-backlog.md",
    ".claude/commands/mergetask.md",
    ".claude/commands/donetask.md",
    ".claude/commands/codereview.md",
    ".claude/commands/breakdown.md",
    ".claude/commands/nexttask.md",
    ".claude/commands/startproject.md",

    # Scripts
    ".scripts/find_next_task.py",
    ".scripts/find_review_task.sh",
    ".scripts/find_failed_task.sh",

    # Backlog structure
    "backlog/config.yml",

    # Documentation files
    "backlog/docs/doc-1 - AGENT_INSTRUCTIONS.md",
]

def get_script_dir() -> Path:
    """Get the directory where this script is located (template root)"""
    return Path(__file__).parent.absolute()

def ensure_directory_exists(file_path: Path) -> None:
    """Ensure the directory for a file exists"""
    file_path.parent.mkdir(parents=True, exist_ok=True)

def sync_file(source_path: Path, target_path: Path, dry_run: bool = False) -> bool:
    """
    Sync a single file from source to target
    Returns True if file was synced, False if skipped
    """
    if not source_path.exists():
        print(f"�  Source file not found: {source_path}")
        return False

    if target_path.exists():
        # Compare modification times or content if needed
        print(f"=� Updating: {target_path}")
    else:
        print(f"=� Creating: {target_path}")

    if not dry_run:
        ensure_directory_exists(target_path)
        shutil.copy2(source_path, target_path)

    return True

def sync_directory(source_path: Path, target_path: Path, dry_run: bool = False) -> bool:
    """
    Ensure a directory exists at target
    Returns True if directory was created, False if already existed
    """
    if target_path.exists():
        return False

    print(f"=� Creating directory: {target_path}")
    if not dry_run:
        target_path.mkdir(parents=True, exist_ok=True)

    return True

def update_from_source(source_project_path: Path, dry_run: bool = False) -> None:
    """Update this template from another project"""
    template_root = get_script_dir()

    print(f"= Updating template from: {source_project_path}")
    print(f"<� Template location: {template_root}")

    if dry_run:
        print(">� DRY RUN - No files will be modified")

    synced_count = 0

    for file_path in SYNC_FILES:
        source_file = source_project_path / file_path
        target_file = template_root / file_path

        if file_path.endswith('/'):
            # Directory
            if sync_directory(source_file, target_file, dry_run):
                synced_count += 1
        else:
            # File
            if sync_file(source_file, target_file, dry_run):
                synced_count += 1

    print(f"\n Sync complete! {synced_count} items processed.")

def update_to_target(target_project_path: Path, dry_run: bool = False) -> None:
    """Update another project from this template"""
    template_root = get_script_dir()

    print(f"= Updating project from template: {target_project_path}")
    print(f"=� Template location: {template_root}")

    if dry_run:
        print(">� DRY RUN - No files will be modified")

    synced_count = 0

    for file_path in SYNC_FILES:
        source_file = template_root / file_path
        target_file = target_project_path / file_path

        if file_path.endswith('/'):
            # Directory
            if sync_directory(source_file, target_file, dry_run):
                synced_count += 1
        else:
            # File
            if sync_file(source_file, target_file, dry_run):
                synced_count += 1

    print(f"\n Sync complete! {synced_count} items processed.")

def main():
    parser = argparse.ArgumentParser(
        description="Sync files between template and projects",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__
    )

    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument(
        "--update-from",
        type=str,
        help="Update this template from another project (provide project path)"
    )
    group.add_argument(
        "--update-to",
        type=str,
        help="Update another project from this template (provide project path)"
    )

    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Show what would be done without making changes"
    )

    parser.add_argument(
        "--list-files",
        action="store_true",
        help="List all files that would be synced"
    )

    args = parser.parse_args()

    if args.list_files:
        print("Files that will be synced:")
        for file_path in sorted(SYNC_FILES):
            if file_path.endswith('/'):
                print(f"=� {file_path}")
            else:
                print(f"=� {file_path}")
        return

    try:
        if args.update_from:
            source_path = Path(args.update_from).resolve()
            if not source_path.exists():
                print(f"L Source project path does not exist: {source_path}")
                sys.exit(1)
            update_from_source(source_path, args.dry_run)

        elif args.update_to:
            target_path = Path(args.update_to).resolve()
            if not target_path.exists():
                print(f"L Target project path does not exist: {target_path}")
                sys.exit(1)
            update_to_target(target_path, args.dry_run)

    except KeyboardInterrupt:
        print("\nL Operation cancelled by user")
        sys.exit(1)
    except Exception as e:
        print(f"L Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()