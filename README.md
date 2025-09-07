# 🚀 TLDR: AI-Driven Development Made Simple

**Turn any idea into production-ready software with AI agents doing 95% of the work.**

## ⚡ Super Quick Start
- **Install**: `./setup.sh` (installs backlog.md + dependencies)
- **Plan**: `/startproject` with Claude/AI (just describe your idea)
- **Build**: `/breakdown` then `/nexttask` repeatedly (AI codes everything)
- **Deploy**: Production-ready code with docs, tests, and clean Git history

**That's it.** No project management overhead, no manual task creation, no coordination headaches.

### 🎯 What Makes This Different
- **Zero Setup Friction**: Works with any language/framework out of the box
- **Intelligent QA**: AI determines what tests to write and runs them automatically
- **Git-Native**: All planning and progress tracked in your repository
- **Context Preservation**: AI agents maintain full project understanding across sessions
- **Production Ready**: Generates proper documentation, tests, and deployment configurations

---

# Generic AI-Driven Development Template

Welcome! This repository is a language-agnostic template for structuring and automating a software development project using a team of specialized AI agents. It provides a robust framework for taking a simple idea, turning it into a detailed plan, and executing that plan through a repeatable, automated workflow with **intelligent quality assurance**.

The core philosophy is to combine the power of AI with a structured, Git-based project management system, ensuring consistency, quality, and velocity.

## Why This Template Changes Everything

**Traditional Development:**
- Manual task breakdown and planning
- Context switching between coding and project management
- Inconsistent code quality and documentation
- Hours spent on project coordination
- Manual testing and QA processes

**With This Template:**
- AI conducts structured interviews to capture requirements
- Automatic task generation with proper dependencies
- AI agents write code, tests, and documentation
- **Intelligent QA routing**: UI changes → E2E tests, API changes → Integration tests
- **Automated quality assurance** with visual regression testing
- Git-native workflow with complete audit trail

## The Core Components

This template integrates a few key tools to create a seamless development process.

### What is [`Backlog.md`](https://github.com/MrLesk/Backlog.md)?
`Backlog.md` is a command-line tool that treats your project tasks as simple Markdown files stored directly in your repository. Instead of using a separate, web-based project management tool, your backlog lives alongside your code.

**Why we use it:**
*   **Git-Native:** Tasks, plans, and documentation are version-controlled with your code.
*   **AI & Human Friendly:** Plain text Markdown is easy for both AI agents and developers to read, parse, and edit.
*   **Transparent:** The entire history of a task—from acceptance criteria to implementation notes—is captured in one place.

### What is [`repomix`](https://github.com/yamadashy/repomix)?
`repomix` is a command-line utility designed to pack a repository's code and structure into a single, context-rich file. It intelligently combines relevant files, directory structures, and summaries into a format that can be easily fed to a Large Language Model (LLM).

**Why we use it:**
*   **Maximum Context:** It gives an AI agent a comprehensive snapshot of the entire project in one go. The conversation you and I are having right now is powered by a `repomix` output, which is why I have a deep understanding of your project's files and goals. This template includes it so your AI agents can have that same level of awareness.

## 🚀 Getting Started

Follow these steps to get your project up and running.

#### 1. Prerequisites
*   [Node.js](https://nodejs.org/) (which includes `npm`)
*   [Python 3](https://www.python.org/downloads/) (which includes `pip`)
*   An AI command-line tool, such as the [Claude CLI](https://docs.anthropic.com/claude/reference/claude-cli), configured in your environment.

#### 2. Installation
Run the setup script from the root of the project. This will install the required command-line tools (`backlog.md`, `repomix`) globally on your system.

```bash
./setup.sh
```
*You may be prompted for your password to complete the global installation.*

## The Project Workflow: From Idea to Production

This template guides you through a phased process with **intelligent quality assurance**. Follow these steps carefully to build your project.

### Phase 0: Project Definition & Planning

This initial phase is a guided interview between you and the AI to define the entire scope of the project. You don't need to edit any files—just start a conversation.

1.  **Start Your AI Tool:** Open your terminal in the project's root directory and start your AI assistant (e.g., `claude`).

2.  **Kick Off the Project:** Run the `/startproject` command.
    ```
    /startproject
    ```
    The AI will immediately greet you and ask for your initial project idea. Your job is to answer its questions as it guides you through the process of defining features, technology, and scope.

3.  **The Outcome:** When the conversation is complete, the AI will have created a full set of planning documents in the `backlog/docs/` directory, including a phased `ROADMAP.md`.

### Phase 1 & Beyond: The Automated Development & QA Cycle

With a clear, phased roadmap in place, you can now begin the automated development loop with **intelligent quality assurance**.

1.  **Break Down the First Phase:** After the planning is done, run the `breakdown` command:
    ```
    /breakdown
    ```
    The AI will read the roadmap it just created, find the first phase, and automatically generate all the necessary implementation tasks.

    **💡 Pro Tip:** After each major command completes, run `/clear` to free up context and ensure optimal performance:
    ```
    /clear
    ```

2.  **Work Through the Tasks:** Now, you enter the main development loop. Simply run the `nexttask` command repeatedly:
    ```
    /nexttask
    ```
    The AI will autonomously:
    - Pick up the next available task
    - Create a feature branch
    - Write and test code
    - Submit work for automated code review
    - **Smart QA routing**: Route UI changes to QA, direct simple fixes to completion
    - **Automated testing**: Write and run appropriate tests (E2E, integration, unit)
    - Fix any issues found during review or QA
    - Complete the task when all quality gates pass

    After each task completion, clear the context for the next task:
    ```
    /clear
    ```

3.  **Monitor Progress:** Tasks flow through these statuses:
    - `To Do` → `In Progress` → `Pending Review` → `Done` (simple changes)
    - `To Do` → `In Progress` → `Pending Review` → `Pending QA` → `Done` (UI/user-facing changes)
    - Failed tasks return to `In Progress` for fixes: `Failed Review` or `Failed QA` → `In Progress`

4.  **Repeat for the Next Phase:** Once all the tasks for the current phase are complete, run the `/breakdown` command again to plan the next phase, then re-enter the `/nexttask` loop.

Repeat this cycle—`/breakdown` to plan a phase, `/nexttask` to execute it—until your project is complete.

## 🧪 Intelligent Quality Assurance

This template includes a sophisticated QA system that automatically determines what types of tests to write based on the code changes:

### Automatic QA Detection
The code reviewer analyzes each task and automatically routes it to QA when:
- **UI/Frontend changes**: Files in `src/components/`, `src/pages/`, static assets
- **User-facing features**: Task descriptions mentioning "user", "UI", "interface", "visual"
- **API endpoints**: New or modified routes affecting user interaction
- **Mobile/app code**: Changes in mobile-specific directories

### Test Types by Change Pattern
- **Frontend/UI Changes** → E2E tests + Visual regression testing
- **API/Backend Changes** → Integration tests + Unit tests
- **Database Changes** → Data integrity tests
- **Mobile Changes** → Mobile E2E tests
- **Configuration Changes** → Configuration validation tests

### QA Workflow
1. **Code Review**: AI reviewer analyzes changes and routes to QA if needed
2. **Test Analysis**: QA agent determines required test types from file changes
3. **Test Creation**: Automatically writes appropriate tests in organized structure
4. **Test Execution**: Runs test suites and validates results
5. **Quality Gate**: Pass → merge to main, Fail → back to development with detailed feedback

## ❓ Troubleshooting

**"No actionable tasks are ready"**: All tasks in the current phase are complete. Run `/breakdown` to generate tasks for the next phase.

**AI seems slow or unresponsive**: Run `/clear` to free up context and improve performance.

**Task stuck in "Pending Review"**: The automated review process handles this. Wait for the AI reviewer to complete, or check if there are any failed tasks to fix.

**Task stuck in "Pending QA"**: The QA agent is analyzing and writing tests. This may take longer for complex UI changes.

**Task moved to "Failed Review" or "Failed QA"**: This is normal! The next `/nexttask` will automatically pick up the failed task and work on fixes.

**Need to modify the roadmap**: Edit `backlog/docs/doc-3 - ROADMAP.md` directly, then run `/breakdown` to regenerate tasks.

## 📋 Quick Reference

The complete workflow uses just these commands:

1. **Project Setup:** `/startproject` → `/clear`
2. **Phase Planning:** `/breakdown` → `/clear`
3. **Development Loop:** `/nexttask` → `/clear` (repeat until phase complete)
4. **Manual QA:** `/qatask <task-id>` (if needed)
5. **Next Phase:** Return to step 2

**💡 Why `/clear`?** Each command can generate substantial context. Running `/clear` after each command ensures optimal AI performance and prevents context overflow in longer development sessions.

## 🔧 What Gets Created

When you complete the project setup, your repository will contain:

```
backlog/
├── docs/
│   ├── doc-2 - PRD_SRS.md         # Product & Software Requirements
│   ├── doc-3 - ROADMAP.md         # Phased Development Plan
│   ├── doc-9 - ARCHITECTURE.md    # System Design
│   ├── doc-5 - DATA_MODEL.md      # Database Schema
│   ├── doc-7 - API.md             # API Specifications
│   ├── doc-6 - CONFIG.md          # Configuration Requirements
│   └── doc-8 - BUILD.md           # Build & Deployment
└── tasks/
    ├── task-1.md                  # Auto-generated implementation tasks
    ├── task-2.md                  # (Created by /breakdown command)
    └── ...                        # Continues as needed

tests/                             # Auto-generated by QA agent
├── unit/                          # Unit tests for business logic
├── integration/                   # API and service integration tests
├── e2e/                          # End-to-end user workflow tests
│   └── screenshots/              # Visual regression test captures
└── qa/                           # QA-specific test plans and reports
```

## 🚀 Key Features

- **Conversation-First Planning:** No file editing required - just describe your idea
- **Automated Task Generation:** AI breaks down phases into actionable development tasks
- **Intelligent Code Review:** Automated review process with status-based workflow
- **Smart QA Routing:** UI changes automatically get E2E tests, APIs get integration tests
- **Visual Regression Testing:** Automatic screenshot comparison for UI changes
- **Git-Native Workflow:** All tasks and documentation are version-controlled
- **Language Agnostic:** Works with any programming language or framework
- **Requirements Preservation:** Technical specifications flow seamlessly from planning to implementation
- **Quality Assurance:** Comprehensive testing automatically written and executed

## 🎯 Perfect For

- **Solo Developers:** Accelerate development with AI pair programming and automated QA
- **Startup Teams:** Get from idea to production-ready MVP faster with structured planning
- **Learning Projects:** Understand best practices through AI guidance and comprehensive testing
- **Prototyping:** Rapidly build and iterate on new concepts with quality assurance
- **Production Systems:** Build reliable software with automated testing and documentation

## 🧪 QA Integration Status

**Current Implementation:**
- ✅ QA workflow statuses and routing
- ✅ Intelligent QA detection based on file changes
- ✅ QA agent with comprehensive testing capabilities
- ✅ Manual QA command for edge cases

**TODO:**
- Playwright MCP integration for web testing
- Complete test infrastructure setup
- Visual regression testing examples
- Mobile testing framework integration

The QA foundation is implemented and functional - UI changes will be automatically routed to QA for appropriate testing!