# Command: breakdown - Intelligently break down the next epic or a specified one

Your goal is to orchestrate the planning of a project phase. This command has two modes:

1.  **Smart Mode (No Arguments):** If run without arguments (`breakdown`), you will determine the next phase to plan by consulting the project roadmap.
2.  **Specific Mode (With Argument):** If run with an epic title (`breakdown "My Epic Title"`), you will use that title directly.

**Your Workflow is a Fixed, Non-Negotiable Algorithm:**

1.  **Determine the Epic Title:**
    *   **If you were given an argument (`$1` is not empty):** The epic title is the argument you received.
    *   **If you were NOT given an argument (`$1` is empty):**
        a. You MUST read the project's official roadmap: `cat backlog/docs/doc-3 - ROADMAP.md`.
        b. Analyze the roadmap to find the first phase that has `(Status: PLANNED)`.
        c. Extract the full title of this phase. This is your epic title.
        d. If no "PLANNED" phase is found, you MUST stop and report: "All planned phases are complete or in progress. No new phase to break down."

2.  **Analyze Context:** Read and internalize the project's core specification documents to prepare for the breakdown.
    *   `backlog/docs/doc-2 - PRD_SRS.md`
    *   `backlog/docs/doc-9 - ARCHITECTURE.md`
    *   `backlog/docs/doc-5 - DATA_MODEL.md`

3.  **Delegate to the Expert (MANDATORY):**
    *   You will now invoke the `project-manager-backlog` agent to perform the detailed work.
    *   **Execute the following command,** which will use the epic title you determined in Step 1.
        ```bash
        @claude project-manager-backlog "Using your deep knowledge of the backlog.md CLI and best practices for creating atomic tasks, please break down the '<Epic Title>' epic. You must first read the backlog/docs/doc-2 - PRD_SRS.md, backlog/docs/doc-9 - ARCHITECTURE.md, and backlog/docs/doc-5 - DATA_MODEL.md to understand the dependencies and correct build order. Then, generate all the necessary child tasks and set their dependencies correctly in a single, continuous operation."
        ```
        *(Replace `<Epic Title>` with the title you determined in Step 1.)*

4.  **Monitor and Stop:**
    *   Once the `project-manager-backlog` agent is running, your job is complete. **Stop.**