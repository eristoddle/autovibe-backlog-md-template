# Generic AI-Driven Development Template

Welcome! This repository is a language-agnostic template for structuring and automating a software development project using a team of specialized AI agents. It provides a robust framework for taking a simple idea, turning it into a detailed plan, and executing that plan through a repeatable, automated workflow.

## The Core Components

-   **`backlog.md`**: A command-line tool that treats your project tasks as Markdown files stored directly in your repository. Your backlog lives with your code.
-   **`repomix`**: A command-line utility that packs your repository into a single, context-rich file, giving your AI agents maximum awareness of your project.

## 🚀 Getting Started

#### 1. Prerequisites
*   [Node.js](https://nodejs.org/) (which includes `npm`)
*   [Python 3](https://www.python.org/downloads/) (which includes `pip`)
*   An AI command-line tool (e.g., the Claude CLI) configured in your environment.

#### 2. Installation
Run the setup script. This installs the required tools (`backlog.md`, `repomix`) globally.

```bash
./setup.sh
```
*You may be prompted for your password.*

## The Project Workflow: From Idea to Execution

This template guides you through a phased process. You don't need to edit any files to start—just have a conversation.

### Phase 0: Project Definition & Planning

1.  **Start Your AI Tool:** Open your terminal in the project's root directory and start your AI assistant (e.g., `claude`).

2.  **Kick Off the Project:** Run the `/nexttask` command.
    ```bash
    /nexttask
    ```
    The template is pre-configured with a special foundational task. The AI will immediately greet you and ask for your initial project idea. Your job is to answer its questions as it guides you through defining features, technology, and scope.

3.  **The Outcome:** When the conversation is complete, the AI will have created a full set of planning documents in the `backlog/docs/` directory, including a phased `ROADMAP.md`.

### Phase 1 & Beyond: The Development Cycle

1.  **Break Down the First Phase:** After the planning is done, run the `breakdown` command:
    ```bash
    /breakdown
    ```
    The AI will read the roadmap it just created, find the first phase, and automatically generate all the necessary implementation tasks.

2.  **Work Through the Tasks:** Now, you enter the main development loop. Simply run the `nexttask` command repeatedly:
    ```bash
    /nexttask
    ```
    The AI will autonomously pick up tasks, write code, run tests, and manage the entire development lifecycle for that phase.

3.  **Repeat for the Next Phase:** Once all the tasks for the current phase are complete, run the `/breakdown` command again to plan the next phase, then re-enter the `/nexttask` loop.

Repeat this cycle until your project is complete.