# Command: qatask - Manually invoke QA testing on a completed task

Your goal is to have the qa-tester agent complete comprehensive Quality Assurance testing on a task. You will be given a task ID to test. You will act as the QA orchestrator, delegating to the specialized qa-tester agent.

**Input:** You will be given a task ID, like `qatask 2.9`.

**Workflow:**

1.  **Identify the Task and Branch:**
    *   The task ID is your target (e.g., `2.9`).
    *   The work should be on a feature branch named `feature/task-<id>` (e.g., `feature/task-2.9`).
    *   **Execute:** `git checkout feature/task-2.9` to switch to the correct context.

2.  **Validate Task is Ready for QA:**
    *   Read the task file: `backlog/tasks/task-<id> - <title>.md`.
    *   **Check Status:** Task should be in "Pending QA" status. If not, report the issue and stop.
    *   **Check Prerequisites:** Ensure code review has passed and implementation is complete.

3.  **Delegate to QA Tester Agent:**
    *   **Invoke the `qa-tester` agent:** Pass the task ID to the specialized QA agent.
    *   The qa-tester agent will:
        - Analyze the task requirements
        - Determine appropriate test types
        - Create and execute QA tests
        - Validate results
        - Update task status based on outcomes

4.  **Monitor and Report:**
    *   Once the `qa-tester` agent completes its work, report the final outcome.
    *   **Report the final status:** Either "QA PASSED" or "QA FAILED" with reasons.
    *   **Stop.** Your job is complete.

**Note:** This command provides manual QA invocation for cases where automated QA routing needs to be triggered manually or re-run.