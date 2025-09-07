#!/bin/bash
#
# find_failed_qa_task.sh - Finds the first task file with status "Failed QA".

set -e
set -o pipefail

# Use grep -l to list files containing the pattern, then head to get the first one.
grep -l "status: Failed QA" ./backlog/tasks/*.md 2>/dev/null | head -n 1
