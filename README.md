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
    The AI will read the roadmap it just created, find the first phase, and automatically generate all the necessary implementation tasks. When it is done, run the `/clear` command in Claude Code to free up the context:

    ```
    /clear
    ```

2.  **Work Through the Tasks:** Now, you enter the main development loop. Simply run the `nexttask` command repeatedly:
    ```
    /nexttask
    ```
    The AI will autonomously pick up the next available task, write code, run tests, submit its work for an automated code review, fix issues, and merge completed features.

    When it is done with one taske, run the `/clear` command in Claude Code to free up the context:

    ```
    /clear
    ```

3.  **Repeat for the Next Phase:** Once all the tasks for the current phase are complete, run the `/breakdown` command again to plan the next phase, then re-enter the `/nexttask` loop.

Repeat this cycle—`/breakdown` to plan a phase, `/nexttask` to execute it—until your project is complete.