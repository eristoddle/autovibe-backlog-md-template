---
id: '1'
title: Define Project Scope and Roadmap
status: To Do
created_date: '2025-01-01 00:00'
---

## Description (The "Why")

This is the foundational task for the entire project. Its purpose is to engage in a direct dialogue with the user to understand their high-level idea and transform it into a concrete, detailed, and phased project plan. All project documentation in `backlog/docs/` will be created as a result of completing this task.

## Acceptance Criteria (The "What")

- [ ] The user has been interviewed to clarify all necessary project requirements, features, and constraints.
- [ ] `backlog/docs/doc-2 - PRD_SRS.md` is populated with detailed Product and Software Requirements.
- [ ] `backlog/docs/doc-9 - ARCHITECTURE.md` outlines the proposed high-level technical architecture.
- [ ] `backlog/docs/doc-5 - DATA_MODEL.md` contains the initial proposed data model or schema.
- [ ] All other `backlog/docs/*.md` files are populated with initial considerations.
- [ ] A multi-phase project roadmap has been created, approved by the user, and written to `backlog/docs/doc-3 - ROADMAP.md`.
- [ ] The first phase in the roadmap is marked with `(Status: PLANNED)`.

## Implementation Plan (The "How")

1.  **Initiate the Interview (MANDATORY FIRST STEP):** Your first action is to ask the user for their project idea. Do not look for it in this file. Greet the user and ask them directly to describe the project they want to build. For example: *"Hello! I'm ready to plan your new project. To begin, please tell me about the application you want to build."*

2.  **Conduct the Interview:** Once the user provides their initial idea, ask clarifying and probing questions to fill in all the details for the project's documentation. Cover topics like:
    *   Core Purpose & Users
    *   Key Features (for a first version vs. later)
    *   Technology Preferences or Constraints
    *   Data and API needs
    *   Performance or Security requirements

3.  **Draft and Document:** As you gather information, create the content for all `backlog/docs/` files. Confirm your understanding with the user as you go.

4.  **Create the Roadmap:** Based on the interview, propose a logical, multi-phase roadmap. After getting the user's approval, write the final version to `backlog/docs/doc-3 - ROADMAP.md`, ensuring the first phase is marked `(Status: PLANNED)`.

5.  **Complete the Task:** Once all documents are written and the user has confirmed the plan is correct, mark all acceptance criteria as complete and finalize this task. Announce that the next step is to run the `/breakdown` command.
