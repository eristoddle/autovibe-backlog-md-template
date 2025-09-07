## Suggested Approach

### ~~For Tasks 1-2 (Configuration & Scripts)~~

~~These are small and related. You could do them together in one session:~~

- ~~Task 1: Update Core Configuration~~
- ~~Task 2: Create QA Detection Scripts~~

**Start a new chat with:**

```
I'm implementing QA integration for the autovibe-backlog-md-template project. Please complete Task 1 and Task 2 from the AutoVibeTemplateQAIntegration.md document. The project is at /Users/stmiller/Library/CloudStorage/Dropbox/python/autovibe-backlog-md-template

Task 1: Update Core Configuration - Modify backlog/config.yml to add new statuses
Task 2: Create QA Detection Scripts - Create .scripts/find_qa_task.sh and .scripts/find_failed_qa_task.sh
```

### For Task 3 (QA Tester Agent)

This is complex and deserves its own session.

**New chat with:**

```
I'm implementing QA integration for the autovibe-backlog-md-template project. Please complete Task 3: Create QA Tester Agent from the AutoVibeTemplateQAIntegration.md document. The project is at /Users/stmiller/Library/CloudStorage/Dropbox/python/autovibe-backlog-md-template

Create .claude/agents/qa-tester.md with capabilities to analyze tasks, determine test requirements, write tests, and handle pass/fail workflow. Reference the existing code-reviewer.md agent for structure.
```

### For Tasks 4-6 (Modify existing commands)

These could be grouped since they're all modifications:

**New chat with:**

```
I'm implementing QA integration for the autovibe-backlog-md-template project. Please complete Tasks 4-6 from the AutoVibeTemplateQAIntegration.md document. The project is at /Users/stmiller/Library/CloudStorage/Dropbox/python/autovibe-backlog-md-template

Task 4: Modify Code Reviewer Agent to route to QA
Task 5: Update Nexttask Command to handle QA workflow
Task 6: Create QA Command for manual invocation
```

### General Tips:

1. **Test as you go**: After tasks 1-6, you'll have a working QA workflow to test
2. **Commit frequently**: Make a commit after each successful task group
3. **Branch strategy**: Consider using a feature branch like `feature/qa-integration`
4. **Context preservation**: If a task needs info from a previous one, mention it in the prompt

Would you like me to help you complete Tasks 1-2 right now in this chat, or would you prefer to start fresh? Tasks 1-2 are simple enough that we could knock them out here without overloading the context.