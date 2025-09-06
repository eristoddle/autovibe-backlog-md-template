# Generic AI-Driven Development Template

Welcome! This repository is a language-agnostic template for structuring and automating a software development project using a team of specialized AI agents. It provides a robust framework for taking a simple idea, turning it into a detailed plan, and executing that plan through a repeatable, automated workflow.

The core philosophy is to combine the power of AI with a structured, Git-based project management system, ensuring consistency, quality, and velocity.

## The Core Components

This template integrates a few key tools to create a seamless development process.

### What is `backlog.md`?
`backlog.md` is a command-line tool that treats your project tasks as simple Markdown files stored directly in your repository. Instead of using a separate, web-based project management tool, your backlog lives alongside your code.

**Why we use it:**
*   **Git-Native:** Tasks, plans, and documentation are version-controlled with your code.
*   **AI & Human Friendly:** Plain text Markdown is easy for both AI agents and developers to read, parse, and edit.
*   **Transparent:** The entire history of a task—from acceptance criteria to implementation notes—is captured in one place.

### What is `repomix`?
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

## The Project Workflow: From Idea to Execution

This template guides you through a phased process. Follow these steps carefully to build your project.

### Phase 0: Project Definition & Planning

This initial phase is a guided interview between you and the AI to define the entire scope of the project. You don't need to edit any files—just start a conversation.

1.  **Start Your AI Tool:** Open your terminal in the project's root directory and start your AI assistant (e.g., `claude`).

2.  **Kick Off the Project:** Run the `/startproject` command.
    ```
    /startproject
    ```
    The AI will immediately greet you and ask for your initial project idea. Your job is to answer its questions as it guides you through the process of defining features, technology, and scope.

3.  **The Outcome:** When the conversation is complete, the AI will have created a full set of planning documents in the `backlog/docs/` directory, including a phased `ROADMAP.md`.

### Phase 1 & Beyond: The Development Cycle

With a clear, phased roadmap in place, you can now begin the automated development loop.

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
    - Fix any issues found during review
    - Complete the task when review passes

    After each task completion, clear the context for the next task:
    ```
    /clear
    ```

3.  **Monitor Progress:** Tasks flow through these statuses:
    - `To Do` → `In Progress` → `Pending Review` → `Done` (success)
    - Or `Pending Review` → `Failed Review` → `In Progress` (retry after fixes)

4.  **Repeat for the Next Phase:** Once all the tasks for the current phase are complete, run the `/breakdown` command again to plan the next phase, then re-enter the `/nexttask` loop.

Repeat this cycle—`/breakdown` to plan a phase, `/nexttask` to execute it—until your project is complete.

## ❓ Troubleshooting

**"No actionable tasks are ready"**: All tasks in the current phase are complete. Run `/breakdown` to generate tasks for the next phase.

**AI seems slow or unresponsive**: Run `/clear` to free up context and improve performance.

**Task stuck in "Pending Review"**: The automated review process handles this. Wait for the AI reviewer to complete, or check if there are any failed tasks to fix.

**Task moved to "Failed Review"**: This is normal! The next `/nexttask` will automatically pick up the failed task and work on fixes.

**Need to modify the roadmap**: Edit `backlog/docs/doc-3 - ROADMAP.md` directly, then run `/breakdown` to regenerate tasks.

## 📋 Quick Reference

The complete workflow uses just these commands:

1. **Project Setup:** `/startproject` → `/clear`
2. **Phase Planning:** `/breakdown` → `/clear` 
3. **Development Loop:** `/nexttask` → `/clear` (repeat until phase complete)
4. **Next Phase:** Return to step 2

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
```

## 🚀 Key Features

- **Conversation-First Planning:** No file editing required - just describe your idea
- **Automated Task Generation:** AI breaks down phases into actionable development tasks  
- **Intelligent Code Review:** Automated review process with status-based workflow
- **Git-Native Workflow:** All tasks and documentation are version-controlled
- **Language Agnostic:** Works with any programming language or framework
- **Requirements Preservation:** Technical specifications flow seamlessly from planning to implementation

## 🎯 Perfect For

- **Solo Developers:** Accelerate development with AI pair programming
- **Startup Teams:** Get from idea to MVP faster with structured planning
- **Learning Projects:** Understand best practices through AI guidance
- **Prototyping:** Rapidly build and iterate on new concepts