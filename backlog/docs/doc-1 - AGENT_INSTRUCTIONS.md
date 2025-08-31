---
id: doc-1
title: AGENT_INSTRUCTIONS
type: other
created_date: '2025-08-16 22:50'
---
# Agent Instructions

This is the canonical agent instructions file for the AutoVibe project. All AI agents (Claude, Gemini, Cursor, etc.) should reference this file for consistent behavior and workflow guidelines.

### ⚠️ MANDATORY: Branching Policy

**You MUST NOT work on the `main` or `develop` branches directly.** All implementation work must be performed on a dedicated feature branch.

1.  **Before starting any task,** you must be on a feature branch.
2.  The branch name should follow the pattern `feature/task-<id>` (e.g., `feature/task-7.1`).
3.  If you find yourself on the `main` branch and need to start work, you **MUST** create and switch to a new feature branch first using `git checkout -b <branch_name>`.

**Violation of this rule is a critical failure.**

### ⚠️ MANDATORY: Sandboxed Operations Policy

**You MUST NOT pollute the main project backlog with simulated or test data.** All simulated agent activity, load testing, and any operations that create sample tasks must be performed in the dedicated sandbox environment.

**Critical Rules:**

1. **NEVER** create tasks with IDs like `TASK-XXX` or any simulated task data in the main `backlog/tasks/` directory.
2. **For any simulated operations** (load testing, demos, examples), you **MUST** use the sandbox directory: `backlog/sandbox_project/tasks/`
3. **Use the `--backlog-dir` flag** when performing any simulated backlog operations:
   - Example: `backlog --backlog-dir ./backlog/sandbox_project/ task create "Test Task"`
4. **Distinguish between project contexts**: The project you are building (AutoVibe) vs. a simulated project for testing.
5. **All test scenarios and examples** must be created in the sandbox, never in the main backlog.

**Sandbox Directory Structure:**
- `backlog/sandbox_project/tasks/` - For simulated task files
- Use this for any testing, simulation, or demonstration purposes

**Violation of this rule pollutes the main project backlog and is a critical failure.**

<!-- BACKLOG.MD GUIDELINES START -->
# Instructions for the usage of Backlog.md CLI Tool

## 1. Source of Truth

- **Primary Specifications**: **`backlog/docs/doc-2 - PRD_SRS.md`** (master specification) and **`backlog/docs/`** directory (technical docs) and **`docs/`** directory
- Tasks live under **`backlog/tasks/`** (drafts under **`backlog/drafts/`**).
- Every implementation decision starts with reading specifications, then the corresponding Markdown task file.
- Project documentation is in **`backlog/docs/`**.
- Project decisions are in **`backlog/decisions/`**.

## 1.1. Spec-Driven Development

**MANDATORY**: Before any implementation work, you MUST review these authoritative specification documents:

1. **backlog/docs/doc-2 - PRD_SRS.md**: Master Product Requirements Document and Software Requirements Specification
   - Contains business metrics, compliance requirements, and technical specifications
   - Defines AutoVibe Framework architecture and requirements
   - Serves as the authoritative specification for all development work

2. **docs/ Directory**: Technical documentation including:
   - `backlog/docs/doc-7 - API.md`: API specifications and endpoints
   - `backlog/docs/doc-9 - ARCHITECTURE.md`: System architecture and design patterns
   - `backlog/docs/doc-8 - BUILD.md`: Build processes and deployment procedures
   - `backlog/docs/doc-6 - CONFIG.md`: Configuration management and settings
   - `backlog/docs/doc-5 - DATA_MODEL.md`: Data structures and database schemas

**Specification-First Workflow:**
1. Read backlog/docs/doc-2 - PRD_SRS.md and relevant backlog/docs/ files before creating tasks
2. Ensure all tasks align with documented requirements
3. Reference specifications in task descriptions and acceptance criteria
4. Validate implementation against documented requirements
5. Update documentation when specifications need changes

## 2. Defining Tasks

### **Title**

Use a clear brief title that summarizes the task.

### **Description**: (The **"why"**)

Provide a concise summary of the task purpose and its goal. Do not add implementation details here. It
should explain the purpose and context of the task. Code snippets should be avoided.

**IMPORTANT**: Always reference relevant specifications (backlog/docs/doc-2 - PRD_SRS.md sections, docs, backlog/docs files) that support this task.

### **Acceptance Criteria**: (The **"what"**)

List specific, measurable outcomes that define what means to reach the goal from the description. Use checkboxes (`- [ ]`) for tracking.
When defining `## Acceptance Criteria` for a task, focus on **outcomes, behaviors, and verifiable requirements** rather
than step-by-step implementation details.
Acceptance Criteria (AC) define *what* conditions must be met for the task to be considered complete.
They should be testable and confirm that the core purpose of the task is achieved.
**Key Principles for Good ACs:**

- **Outcome-Oriented:** Focus on the result, not the method.
- **Testable/Verifiable:** Each criterion should be something that can be objectively tested or verified.
- **Clear and Concise:** Unambiguous language.
- **Complete:** Collectively, ACs should cover the scope of the task.
- **User-Focused (where applicable):** Frame ACs from the perspective of the end-user or the system's external behavior.

    - *Good Example:* "- [ ] User can successfully log in with valid credentials."
    - *Good Example:* "- [ ] System processes 1000 requests per second without errors."
    - *Bad Example (Implementation Step):* "- [ ] Add a new function `handleLogin()` in `auth.ts`."

### Task file

Once a task is created it will be stored in `backlog/tasks/` directory as a Markdown file with the format
`task-<id> - <title>.md` (e.g. `task-42 - Add GraphQL resolver.md`).

### Additional task requirements

- Tasks must be **atomic** and **testable**. If a task is too large, break it down into smaller subtasks.
  Each task should represent a single unit of work that can be completed in a single PR.

- **Never** reference tasks that are to be done in the future or that are not yet created. You can only reference
  previous
  tasks (id < current task id).

- When creating multiple tasks, ensure they are **independent** and they do not depend on future tasks.
  Example of wrong tasks splitting: task 1: "Add API endpoint for user data", task 2: "Define the user model and DB
  schema".
  Example of correct tasks splitting: task 1: "Add system for handling API requests", task 2: "Add user model and DB
  schema", task 3: "Add API endpoint for user data".

## 3. Recommended Task Anatomy

```markdown
# task‑42 - Add GraphQL resolver

## Description (the why)

Short, imperative explanation of the goal of the task and why it is needed.

## Acceptance Criteria (the what)

- [ ] Resolver returns correct data for happy path
- [ ] Error response matches REST
- [ ] P95 latency ≤ 50 ms under 100 RPS

## Implementation Plan (the how)

1. Research existing GraphQL resolver patterns
2. Implement basic resolver with error handling
3. Add performance monitoring
4. Write unit and integration tests
5. Benchmark performance under load

## Implementation Notes (only added after working on the task)

- Approach taken
- Features implemented or modified
- Technical decisions and trade-offs
- Modified or added files
```

## 6. Implementing Tasks

Mandatory sections for every task:

- **Implementation Plan**: (The **"how"**) Outline the steps to achieve the task. Because the implementation details may
  change after the task is created, **the implementation notes must be added only after putting the task in progress**
  and before starting working on the task.
- **Implementation Notes**: Document your approach, decisions, challenges, and any deviations from the plan. This
  section is added after you are done working on the task. It should summarize what you did and why you did it. Keep it
  concise but informative.

**IMPORTANT**: Do not implement anything else that deviates from the **Acceptance Criteria**. If you need to
implement something that is not in the AC, update the AC first and then implement it or create a new task for it.

### ⚠️ Mandatory Pre-flight Checks (Resulting from task-2.5 Failure)

**A previous task (`task-2.5`) was marked 'Done' incorrectly, leading to critical failure (`task-2.9`) because its implementation did not match the acceptance criteria and tests were failing. This violated the Definition of Done (DoD).**

To prevent this from happening again, the following checks are **MANDATORY** before you begin implementing any task:

1.  **Review the DoD:** Read and confirm you understand every point in the "Definition of Done (DoD)" section of this document.
2.  **Identify the Test Plan:** Locate the relevant tests for the code you will be modifying (e.g., `tests/test_file_manager.py`). If no tests exist, your implementation plan **must** include creating them.
3.  **Confirm Acceptance Criteria:** Ensure you have a clear plan to meet *every single* acceptance criterion in the task file. If any are unclear, you must ask for clarification before proceeding.

## 2. Typical Workflow

```bash
# 1. Review specifications FIRST
cat 'backlog/docs/doc-2 - PRD_SRS.md'
ls docs/ && cat 'backlog/docs/doc-7 - API.md' 'backlog/docs/doc-9 - ARCHITECTURE.md'

# 2. Identify work and select a task (e.g., task-42)
backlog task list -s "To Do" --plain

# 3. Create and switch to a new feature branch
git checkout -b feature/task-42

# 4. Start the task in the backlog
backlog task edit 42 -a @{yourself} -s "In Progress"

# 5. Add implementation plan and perform the work...
# ... (coding, file edits, etc.) ...

# 6. Run local checks to ensure DoD is met
# (Manually verify DoD criteria)

# 7. Submit for automated review (this is your new "Done" step)
backlog task edit 42 -s Done -l "Pending Automated Review"
git add .
git commit -m "feat: Complete task-42, ready for automated review"

# ---> At this point, the automated hook takes over. <---
# You will observe the result and either wait for the human to merge,
# or begin work on a new "FIX" task if your review fails.

### 7. Final Steps Before Marking a Task as Done

Always ensure you have:

1. ✅ **Validated against specifications**: Confirmed implementation matches backlog/docs/doc-2 - PRD_SRS.md and docs requirements
2. ✅ Marked all acceptance criteria as completed (change `- [ ]` to `- [x]`)
3. ✅ Added an `## Implementation Notes` section documenting your approach
4. ✅ Run all tests and linting checks
5. ✅ Updated relevant documentation (including docs/ and backlog/docs/ files if specifications changed)

## 8. Definition of Done (DoD)

A task is **Done** only when **ALL** of the following are complete:

1. **Specification compliance**: Implementation validated against backlog/docs/doc-2 - PRD_SRS.md and docs/ requirements
2. **Acceptance criteria** checklist in the task file is fully checked (all `- [ ]` changed to `- [x]`).
3. **Implementation plan** was followed or deviations were documented in Implementation Notes.
4. **Automated tests** (unit + integration) cover new logic.
5. **Static analysis**: linter & formatter succeed.
6. **Documentation**:
    - All relevant docs updated (backlog/docs/doc-2 - PRD_SRS.md, docs/, backlog/docs, backlog/decisions, etc.).
    - Task file **MUST** have an `## Implementation Notes` section added summarising:
        - Approach taken
        - Specification references used
        - Features implemented or modified
        - Technical decisions and trade-offs
        - Modified or added files
7. **Review**: self review code against specifications.
8. **Task hygiene**: status set to **Done** via CLI (`backlog task edit <id> -s Done`).
9. **No regressions**: performance, security and licence checks green.

⚠️ **IMPORTANT**: Never mark a task as Done without completing ALL items above.

## 9. Handy CLI Commands

| Purpose          | Command                                                                |
|------------------|------------------------------------------------------------------------|
| Create task      | `backlog task create "Add OAuth"`                                      |
| Create with desc | `backlog task create "Feature" -d "Enables users to use this feature"` |
| Create with AC   | `backlog task create "Feature" --ac "Must work,Must be tested"`        |
| Create with deps | `backlog task create "Feature" --dep task-1,task-2`                    |
| Create sub task  | `backlog task create -p 14 "Add Google auth"`                          |
| List tasks       | `backlog task list --plain`                                            |
| View detail      | `backlog task 7 --plain`                                               |
| Edit             | `backlog task edit 7 -a @{yourself} -l auth,backend`                   |
| Add plan         | `backlog task edit 7 --plan "Implementation approach"`                 |
| Add AC           | `backlog task edit 7 --ac "New criterion,Another one"`                 |
| Add deps         | `backlog task edit 7 --dep task-1,task-2`                              |
| Add notes        | `backlog task edit 7 --notes "We added this and that feature because"` |
| Mark as done     | `backlog task edit 7 -s "Done"`                                        |
| Archive          | `backlog task archive 7`                                               |
| Draft flow       | `backlog draft create "Spike GraphQL"` → `backlog draft promote 3.1`   |
| Demote to draft  | `backlog task demote <task-id>`                                        |

## 10. Tips for AI Agents

- **Always use `--plain` flag** when listing or viewing tasks for AI-friendly text output instead of using Backlog.md
  interactive UI.
- When users mention to create a task, they mean to create a task using Backlog.md CLI tool.

## 11. Branching and Automated Review Workflow

To ensure code quality and stability, this project uses a feature-branching model with automated code reviews. All work must be done on a feature branch and will be automatically reviewed before it can be merged into `main`.

**The Core Principle:** Your `git commit` on a feature branch is not a final statement of completion. It is a **formal submission for automated review.**

### Workflow Steps:

**A. Starting a Task:**
1.  When you start a new task (e.g., `task-42`), you **MUST** create a new feature branch from `main`.
2.  The branch name should follow the pattern `feature/task-<id>`.
    *   **Command:** `git checkout main && git pull && git checkout -b feature/task-42`

**B. Implementing a Task:**
1.  All code changes, file edits, and other work for the task must be done on this feature branch.
2.  Do NOT work directly on the `main` branch.

**C. Completing a Task (Submitting for Review):**
1.  Once you believe the task is complete according to the DoD, you **MUST** follow the finalization procedure.
2.  The procedure is to **read the instructions in the file `.claude/commands/donetask.md` and execute the shell commands exactly as described within it.** This handles updating the backlog and making the final commit that triggers the automated review.

**D. The Automated Review:**
1.  The `post-commit` hook will automatically trigger the `code-reviewer` agent.
2.  The reviewer will run tests and validate your work against the DoD on your feature branch.
3.  The reviewer will then make a new commit on your branch indicating the outcome:
    *   **Pass:** The `Pending Automated Review` label will be replaced with `Review Passed`. The branch is now ready for a final human-approved merge into `main`.
    *   **Fail:** The task status will be reverted to "In Progress," a `Review Failed` label will be added, and a new "FIX" task will be created. You should then begin work on the new "FIX" task on the same feature branch.

**Your work on a task is only truly finished when the `code-reviewer` has left a `Review Passed` label on the task.**

### ⚠️ MANDATORY: UI Development Workflow

All UI components for this project **MUST** be created using the **`shadcn-ui` MCP tool**. Do not attempt to build base components (like buttons, cards, tables, etc.) from scratch.

1.  **Technology Stack:** The frontend is built with **React, TypeScript, and Tailwind CSS**.
2.  **Tool Usage:** When a task requires a new UI component, your first step is to use the `shadcn-ui` tool to add the necessary primitive (e.g., `Card`, `Table`, `Progress`, `Button`).
3.  **Customization:** After adding the base component with the tool, you will then write the TSX code to customize it, add logic, and compose it into the required feature.

**This is a strict project requirement to ensure UI consistency and maintainability.**

<!-- BACKLOG.MD GUIDELINES END -->

# Important Project Reminders

Do what has been asked; nothing more, nothing less.
NEVER create files unless they're absolutely necessary for achieving your goal.
ALWAYS prefer editing an existing file to creating a new one.
NEVER proactively create documentation files (*.md) or README files. Only create documentation files if explicitly requested by the User.
