# 🚀 AutoVibe Backlog Template - AI-Driven Development Framework

> Transform your ideas into fully-realized software projects through intelligent AI orchestration and automated task management.

[![Use this template](https://img.shields.io/badge/Use%20this-Template-blue?style=for-the-badge)](../../generate)

## What Makes This Special?

This isn't just another project template. It's a complete AI-driven development system that turns a simple conversation into production-ready code. By combining structured task management with AI agents that understand your entire codebase, you get a development workflow that's both autonomous and transparent.

### ✨ Key Features

- **Zero to Production**: Start with just an idea. The AI handles requirements gathering, architecture design, and implementation
- **Requirements Preservation**: Technical specifications flow seamlessly from PRD → Roadmap → Tasks without loss
- **Security-First Design**: Built-in prompts ensure security, best practices, and compliance are never afterthoughts
- **Adaptive Intelligence**: Works with users at any technical level, from beginners to senior developers
- **Full Context Awareness**: AI agents see your entire project structure, making informed decisions
- **Language Agnostic**: Works with any programming language or framework

## 🛠️ Core Technologies

### [Backlog.md](https://github.com/PaysanCorrezien/backlog.md)
A powerful command-line tool that treats your project tasks as Markdown files living directly in your repository. No external task trackers, no context switching - your backlog lives with your code where it belongs.

- 📝 Tasks as markdown files
- 🔄 Git-based version control
- 📊 Built-in progress tracking
- 🤖 AI-friendly format

### [Repomix](https://github.com/yamadashy/repomix)
An intelligent repository packager that creates a single, context-rich file from your entire codebase. This gives AI agents complete project awareness, enabling them to make better architectural decisions and maintain consistency across your codebase.

- 🗂️ Full repository context
- 🧠 Smart file filtering
- 📦 Optimized for AI consumption
- ⚡ Lightning-fast processing

## 🚀 Getting Started

### Prerequisites
- [Node.js](https://nodejs.org/) (includes `npm`)
- [Python 3](https://www.python.org/downloads/) (includes `pip`)
- An AI assistant CLI (e.g., Claude CLI) configured in your environment

### Quick Setup

#### Option 1: Use as GitHub Template (Recommended)
1. Click the **"Use this template"** button at the top of this repository
2. Create a new repository from the template
3. Clone your new repository:
   ```bash
   git clone <your-new-repo-url>
   cd <your-project-name>
   ```

#### Option 2: Clone Directly
```bash
git clone <this-template-url>
cd autovibe-backlog-template
```

#### Then Install Dependencies
```bash
# Run the automated setup (installs backlog.md and repomix)
./setup.sh

# Start your AI assistant
claude  # or your preferred AI CLI
```

## 💡 The Development Workflow

### Phase 0: From Idea to Blueprint 🎯

1. **Start the conversation**:
   ```bash
   /nexttask
   ```
   
2. **Describe your vision**: The AI will interview you comprehensively, covering:
   - Core requirements and features
   - Security considerations
   - Technology preferences
   - Scalability needs
   - Best practices for your stack

3. **Get a complete project plan**: The AI generates:
   - Detailed PRD & Software Requirements
   - System Architecture
   - Data Models
   - API Specifications
   - Phased Development Roadmap

### Phase 1+: Autonomous Development 🔄

1. **Break down the work**:
   ```bash
   /breakdown
   ```
   The AI analyzes your roadmap and creates specific, actionable tasks.

2. **Execute the development cycle**:
   ```bash
   /nexttask
   ```
   Watch as the AI:
   - Picks up tasks autonomously
   - Writes production-quality code
   - Implements tests
   - Handles dependencies
   - Maintains consistency

3. **Progress to completion**: Repeat the cycle for each phase until your project is production-ready.

## 🎯 Why This Works

### For Non-Technical Founders
- No need to know about security, scalability, or best practices
- The AI guides you through everything you need to consider
- Get a professional-grade application without the learning curve

### For Experienced Developers
- Accelerate development 10x
- Never miss security considerations or best practices
- Maintain perfect consistency across large codebases
- Focus on business logic while AI handles boilerplate

### For Teams
- Standardized development process
- Complete documentation from day one
- Clear task breakdown and progress tracking
- Reduced onboarding time for new developers

## 📚 What Gets Created

```
backlog/
├── docs/
│   ├── PRD_SRS.md          # Product & Software Requirements
│   ├── ROADMAP.md          # Phased Development Plan
│   ├── ARCHITECTURE.md     # System Design
│   ├── DATA_MODEL.md       # Database Schema
│   ├── API.md              # API Specifications
│   ├── CONFIG.md           # Configuration Requirements
│   └── BUILD.md            # Build & Deployment
└── tasks/
    ├── task-1.md           # Project Definition (Pre-configured)
    ├── task-2.md           # Auto-generated development tasks
    └── ...                 # Continues as needed
```

## 🔒 Built-in Best Practices

Every project created with this template automatically includes:

- **Security**: Authentication, authorization, encryption, input validation
- **Scalability**: Proper architecture patterns, caching strategies, database optimization
- **Testing**: Unit tests, integration tests, E2E tests
- **Monitoring**: Logging, metrics, alerting
- **Documentation**: Code comments, API docs, user guides
- **CI/CD**: Automated testing and deployment pipelines

## 🤝 Contributing

Found a way to improve the template? PRs are welcome! This framework gets better with community input.

## 📄 License

MIT - Use this template for any project, commercial or personal.

## 🌟 Start Your Next Project

Ready to experience AI-driven development? Click the **["Use this template"](../../generate)** button above to create your own repository and start building!

---

**Your journey starts with a single command:** `/nexttask` 

Let AI turn your idea into reality. 🚀