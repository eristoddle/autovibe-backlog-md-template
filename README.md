# Generic AI-Driven Development Template

Welcome! This repository is a language-agnostic template for structuring and automating a software development project using a team of specialized AI agents. It provides a robust framework for taking a simple idea, turning it into a detailed plan, and executing that plan through a repeatable, automated workflow.

The core philosophy is to combine the power of AI with a structured, Git-based project management system, ensuring consistency, quality, and velocity.

## The Core Components

This template integrates a few key tools to create a seamless development process.

### What is `Backlog.md`?
[`Backlog.md`](https://backlog.md/) is a command-line tool that treats your project tasks as simple Markdown files stored directly in your repository. Instead of using a separate, web-based project management tool, your backlog lives alongside your code.

**Why we use it:**
*   **Git-Native:** Tasks, plans, and documentation are version-controlled with your code.
*   **AI & Human Friendly:** Plain text Markdown is easy for both AI agents and developers to read, parse, and edit.
*   **Transparent:** The entire history of a task—from acceptance criteria to implementation notes—is captured in one place.

### What is `repomix`?
[`repomix`](https://github.com/yamadashy/repomix/) is a command-line utility designed to pack a repository's code and structure into a single, context-rich file. It intelligently combines relevant files, directory structures, and summaries into a format that can be easily fed to a Large Language Model (LLM).

**Why we use it:**
*   **Maximum Context:** It gives an AI agent a comprehensive snapshot of the entire project in one go. I use this to get second opinions from tools like Google AI Studio.

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
