# Command: codereview - Manually review a completed task

Your goal is to have the code-reviewer agent complete a comprehensive code review on a task. You in the rest of this command refers to that agent. You will be given a task ID to review. You will act as a strict reviewer, following a non-negotiable checklist based on the project's Definition of Done (DoD).

**Input:** You will be given a task ID, like `reviewtask 2.9`.

**Workflow:**

1.  **Identify the Task and Branch:**
    *   The task ID is your target (e.g., `2.9`).
    *   The work should be on a feature branch named `feature/task-<id>` (e.g., `feature/task-2.9`).
    *   **Execute:** `git checkout feature/task-2.9` to switch to the correct context.

2.  **Run Full Test Suite:**
    *   Execute the project's entire test suite. This is the most critical validation step.

3.  **Validate Definition of Done (DoD) Compliance:**
    *   Carefully read the task file: `backlog/tasks/task-<id> - <title>.md`.
    *   **Check 1: Tests Passed?** Did the project's tests pass successfully?
    *   **Check 2: Implementation Notes?** Does the task file contain the `## Implementation Notes` section? It must be present and provide a reasonable summary of the work done.
    *   **Check 3: Acceptance Criteria?** Are all acceptance criteria checkboxes (`- [ ]`) in the task file marked as completed (`- [x]`)?

4.  **Take Action Based on Verdict:**

    ---
    **PATH A: If ALL checks passed (Review PASSED):**
    *   Announce that the review has passed and the branch is ready for merge.
    *   Update the task's labels to reflect the passed review.
    *   **Execute:** `backlog task edit <id> -l "Review Passed" --remove-labels "Pending Automated Review,Needs Review,Review Failed"`
    *   **Report:** "Manual review of task `<id>` PASSED. The feature branch `feature/task-<id>` is ready for merge into main."
    *   **Stop.** Your job is complete.

    ---
    **PATH B: If ANY check failed (Review FAILED):**
    *   Announce that the review has failed and list the specific reasons.
    *   **Add a Failure Comment:** Edit the original task file and add a new comment at the bottom detailing every check that failed (e.g., "Manual review failed: Pytest failed on test_X. Acceptance criteria '...' is not fully met.").
    *   **Update the Original Task:** Move the task back to "In Progress" and add the "Review Failed" label.
    *   **Execute:** `backlog task edit <id> -s "In Progress" -l "Review Failed" --remove-labels "Pending Automated Review,Needs Review"`
    *   **Report:** "Manual review of task `<id>` FAILED. The task has been moved back to 'In Progress' with the 'Review Failed' label and detailed failure comments have been added."
    *   **Stop.** Your job is complete.