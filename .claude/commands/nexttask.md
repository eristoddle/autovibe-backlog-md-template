# Command: nexttask - Intelligently resume or start the next task

Your goal is to be the primary orchestrator for this project. You must intelligently assess the project's current state and take the single most appropriate next action to keep the work flowing. You will use a unified priority checker script, then execute the appropriate action.

**--- SIMPLIFIED WORKFLOW ---**

### Step 1: Check Priority Actions

**Execute this exact shell command to determine the next action:** `./.scripts/priority_checker.sh`

**The script will return one of these results:**
- `RESUME:<task-id>` - Resume incomplete work
- `REVIEW:<task-id>` - Process pending review
- `QA:<task-id>` - Process pending QA
- `FIX:<task-id>` - Fix failed review
- `FIXQA:<task-id>` - Fix failed QA
- *(no output)* - Ready for new work

**Important**: If the result contains malformed output (like `RESUME:No tasks found`), treat it as "no output" and proceed to new work.

### Step 2: Execute Based on Result

**A. RESUME Action:**
If the script returns `RESUME:<task-id>` where `<task-id>` is a valid task identifier (like `task-2.3`):
1. Extract the task ID from the result (everything after the colon).
2. Validate the task ID format matches `task-X` or `task-X.Y` pattern.
3. If the task ID is invalid (like "No tasks found"), treat this as "no output" and go to step F.
4. Switch to the feature branch: `git checkout feature/task-<id>`
5. Read the task file (`backlog/tasks/task-<id> - <title>.md`) and analyze all acceptance criteria.
6. Read all uncommitted files to understand the current state.
7. Determine if work is complete or needs continuation.
8. If complete, finalize using `.claude/commands/donetask.md` instructions.
9. If incomplete, continue implementation until all acceptance criteria are met, then finalize.

**B. REVIEW Action:**
If the script returns `REVIEW:<task-id>`:
1. Extract the task ID from the result.
2. Invoke the `code-reviewer` agent to review the task.
3. **Stop** after invoking the reviewer.

**C. QA Action:**
If the script returns `QA:<task-id>`:
1. Extract the task ID from the result.
2. Invoke the `qa-tester` agent to test the task.
3. **Stop** after invoking the tester.

**D. FIX Action:**
If the script returns `FIX:<task-id>`:
1. Extract the task ID from the result.
2. Switch to the feature branch: `git checkout feature/task-<id>`
3. Move task back to "In Progress": `backlog task edit <id> -s "In Progress" -a @claude`
4. Read the failure comments in the task file to understand what needs fixing.
5. Implement the necessary fixes to address all failure points.
6. When fixes are complete and validated, finalize using `.claude/commands/donetask.md` instructions.

**E. FIXQA Action:**
If the script returns `FIXQA:<task-id>`:
1. Extract the task ID from the result.
2. Switch to the feature branch: `git checkout feature/task-<id>`
3. Move task back to "In Progress": `backlog task edit <id> -s "In Progress" -a @claude`
4. Read the QA failure comments in the task file to understand what needs fixing.
5. Implement the necessary fixes to address all QA failure points.
6. When fixes are complete and validated, finalize using `.claude/commands/donetask.md` instructions.

**F. NEW WORK (No Output):**
If the script returns no output:
1. Find the next actionable task: `python .scripts/find_next_task.py`
2. If a task file is returned:
   - Extract task ID from the filename
   - Create feature branch: `git checkout main && git pull && git checkout -b feature/task-<id>`
   - Move to "In Progress": `backlog task edit <id> -s "In Progress" -a @claude`
   - Implement the task according to its acceptance criteria
   - Finalize using `.claude/commands/donetask.md` instructions
3. If no task file is returned:
   - Report: "No actionable tasks are ready. All remaining tasks are blocked by dependencies."
   - **Stop**

### Key Benefits of This Approach:

1. **Single Source of Truth:** All priority logic is centralized in the shell script
2. **Faster Execution:** Shell script runs all checks efficiently in one pass
3. **Easier Maintenance:** Changes to priority logic only need to be made in one place
4. **Better Error Handling:** Shell script can handle edge cases and errors uniformly
5. **Cleaner AI Logic:** The AI focuses on implementation rather than state checking
6. **Future-Proof:** Easy to add new workflow steps by extending the priority checker

### Technical Notes:

- The priority checker script uses existing helper scripts for consistency
- All task ID extraction is standardized across priority types
- Error handling is built into the script with appropriate exit codes
- The script follows the established priority order from the original workflow
