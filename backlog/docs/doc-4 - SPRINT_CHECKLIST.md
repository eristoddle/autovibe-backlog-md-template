---
id: doc-4
title: SPRINT_CHECKLIST
type: other
created_date: '2025-08-16 23:35'
---
This is so I don't forget the process.

## 1. Sprint Planning
- [ ] Review the high-level epic for this phase in `backlog/drafts/`.
- [ ] Promote the epic to a task: `backlog draft promote <id>`.
- [ ] Use the `breakdown` command to generate and order the child tasks for the epic.
- [ ] Review and refine the generated tasks and their dependencies.
- [ ] Ensure all tasks are in the "To Do" column and the dependency graph is correct.

## 2. Sprint Execution
- [ ] Run the `nexttask` command to select and start a task.
- [ ] Follow the "Definition of Done" for every task.
- [ ] When a task is marked `Done`, it should also get a `Needs Review` label.
- [ ] Ensure `Implementation Notes` are added before marking a task as Done.

## 3. Phase Completion (End of Sprint/Epic)
- [ ] **Archive Completed Work:**
  - [ ] Temporarily move the parent EPIC task out of the "Done" lane (e.g., to "To Do").
  - [ ] Run `backlog task archive --status Done` to archive all completed child tasks.
  - [ ] Move the parent EPIC task back to the "Done" lane.
- [ ] **Update Strategic Documents (MANDATORY):**
  - [ ] Open `backlog/docs/doc-3 - ROADMAP.md`.
  - [ ] Mark the just-completed phase as `(Status: COMPLETE)`.
  - [ ] Update the next phase to `(Status: IN PROGRESS)`.
  - [ ] Review the "Key Deliverables" for the next phase and make any necessary adjustments based on what was learned in the previous phase.
- [ ] **Commit the Process Update:**
  - [ ] Commit all changes with a message like `chore(process): Complete Phase 2 and prepare for Phase 3`.
