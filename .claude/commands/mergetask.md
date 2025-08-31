# Command: mergetask - Merge a reviewed feature branch into main

Your goal is to merge a feature branch that has successfully passed an automated review into the `main` branch. You will be given the task ID.

**Input:** You will be given a task ID, like `mergetask 2.9`.

**Workflow:**

1.  **Identify the Feature Branch:**
    *   The task ID is your target (e.g., `2.9`).
    *   The branch to be merged is named `feature/task-<id>` (e.g., `feature/task-2.9`).

2.  **Perform the Merge:**
    *   **Switch to the `main` branch:** `git checkout main`
    *   **Pull the latest changes:** `git pull origin main`
    *   **Merge the feature branch:** `git merge feature/task-<id>`
    *   **Push the changes to `main`:** `git push origin main`
    *   **Delete the local feature branch:** `git branch -d feature/task-<id>`

3.  **Report and Stop:**
    *   Announce that the task has been successfully merged into main.
    *   **Report:** "Task `<id>` has been successfully merged into main and the feature branch has been cleaned up."
    *   **Stop.** Your job is complete.