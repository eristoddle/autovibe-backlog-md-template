# Command: nexttask - Intelligently resume or start the next task

Your goal is to be the primary orchestrator for this project. You must intelligently assess the project's current state and take the single most appropriate next action to keep the work flowing. You will follow a strict, non-negotiable priority checklist. **Execute the first step that matches the project's state, then stop.**

**--- WORKFLOW PRIORITY CHECKLIST ---**

### Priority 1: State Check - Resume and Complete Incomplete Task

**This is the highest priority. It handles the "session timed out" scenario by intelligently resuming work.**

1.  **Detection:**
    *   Check for an active task: `backlog task list -s "In Progress" --plain`.
    *   Check for uncommitted work: `git status --porcelain`.

2.  **Condition:** If there is exactly one task "In Progress" AND the `git status` is NOT empty.

3.  **Action (if condition met):** This indicates a previously interrupted task. You **must** now assess, complete, and submit this task.
    a. **Identify and Prepare:**
        i. Extract the task ID from the `backlog list` command output.
        ii. The work is on a feature branch. **Execute:** `git checkout feature/task-<id>` to ensure you are in the correct context.

    b. **Analyze and Validate (MANDATORY):**
        i. **Read the requirements:** Read the entire task file (`backlog/tasks/task-<id> - <title>.md`), paying close attention to every single `## Acceptance Criteria`.
        ii. **Read the incomplete code:** Read the contents of all the uncommitted files shown by `git status`.
        iii. **Compare and decide:** Analyze the incomplete code and determine if it already satisfies **ALL** acceptance criteria and meets the full Definition of Done (DoD).

    c. **Execute Based on Validation:**
        *   **PATH A: If your analysis confirms the work IS ALREADY COMPLETE:** The session likely timed out just before submission. **You will now finalize the task.**
        *   **PATH B: If your analysis shows the work IS INCOMPLETE:** You must now **resume implementation**. Continue coding and modifying the files to meet all remaining acceptance criteria. Once you have finished the work and verified it locally, **you will then finalize the task.**

    d. **Finalization (MANDATORY):** To finalize the task, you will **read the instructions in the file `.claude/commands/donetask.md` and execute the shell commands exactly as described within it.** After completing those steps, your job is complete. **Stop.**

*(If the condition in step 2 is not met, proceed to Priority 2.)*

---
### Priority 2: Review Check - Process Pending Reviews

**This step serves as the primary review process for the project.**
1.  **Find the task file pending review:**
    *   **Execute this exact shell command:** `./.scripts/find_review_task.sh`
    *   **If the script fails, you MUST STOP** and report the error.
2.  **Condition:** If the above command returns a file path.
3.  **Action:** Extract the task ID from the file path and **invoke the `code-reviewer` agent to review it.** Then **stop**.

*(If the condition above is not met, proceed to Priority 3.)*

---
### Priority 3: Fix Check - Prioritize Failed Reviews

**This step ensures that broken code is fixed before any new work begins.**

1.  **Find the task file with a failed review:**
    *   **Execute this exact shell command:** `./.scripts/find_failed_task.sh`
    *   **If the script fails, you MUST STOP** and report the error.

2.  **Condition:** If the above command returns a file path.

3.  **Action:**
    a. Extract the task ID from the file path.
    b. **You MUST be on the correct feature branch before proceeding. Execute:** `git checkout feature/task-<id>`.
    c. Proceed immediately to implementation to fix the issues based on the failure comments in the task file. **Do not pause.**
    d. **Upon successful completion of the fix and all local validation, you MUST finalize the task.** To do this, you will **read the instructions in the file `.claude/commands/donetask.md` and execute the shell commands exactly as described within it.** After completing those steps, **stop.**

*(If the condition above is not met, proceed to Priority 4.)*

---
### Priority 4: New Work - Find and Start an Actionable Task

**This is the "happy path" for starting fresh work.**

1.  **Find the Next Ready Task:**
    *   **Execute the trusted Python script to find the file path of the next actionable task:**
        ```bash
        python .scripts/find_next_task.py
        ```
    *   Store the output of this script. It will either be a single file path or empty.

2.  **Take Action Based on the Result:**
    *   **If the script returned a file path:**
        a. This file path is your target task. Extract the task ID from the filename.
        b. Create a new feature branch: `git checkout main && git pull && git checkout -b feature/task-<id>`.
        c. Move the task to "In Progress": `backlog task edit <id> -s "In Progress" -a @claude`.
        d. **Continue without interruption** to the implementation phase, starting with the `## Implementation Plan`.
        e. Upon successful completion, you **must** finalize the task. To do this, you will **read the instructions in the file `.claude/commands/donetask.md` and execute the shell commands exactly as described within it.** After completing those steps, **stop.**
    *   **If the script returned no output:**
        a. You **must stop** and report: "No actionable tasks are ready. All remaining tasks are blocked by dependencies."
