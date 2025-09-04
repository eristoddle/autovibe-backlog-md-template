# Command: donetask - Complete a task and submit it for automated review

Your goal is to finalize the current task and submit it for automated review according to the project's official **Branching and Automated Review Workflow**. You will be given the task ID.

**Input:** You will be given a task ID, like `donetask 2.3`.

**Pre-flight Checks (MANDATORY):**
Before running the final commands, you must first verify that every single item in the "Definition of Done (DoD)" from `./backlog/docs/doc-1 - AGENT_INSTRUCTIONS.md` has been met. This includes:
- All acceptance criteria are checked `[x]`.
- All of the project's tests are passing
- The `## Implementation Notes` section has been added to the task file.

**Workflow:**

1.  **Update the Backlog:**
    *   Move the task to the `Pending Review` status.
    *   **Execute:** `backlog task edit <id> -s "Pending Review"` (replace `<id>` with the provided task ID).

2.  **Commit for Review:**
    *   Stage all your changes.
    *   **Execute:** `git add .`
    *   Commit the work to the current feature branch. This action will trigger the automated review hook.
    *   **Execute:** `git commit -m "feat: Complete task <id>, ready for automated review"` (replace `<id>` with the task ID).

3.  **Report and Stop:**
    *   Announce that the task has been submitted for automated review.
    *   Your work on this task is now complete. Stop.