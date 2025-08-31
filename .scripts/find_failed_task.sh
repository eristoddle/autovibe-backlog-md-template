#!/bin/bash
#
# find_failed_task.sh - Finds the first task file that has a "Review Failed" label.
# This script uses a robust `grep -c` pattern to avoid exit code issues.

set -e
set -o pipefail

find ./backlog/tasks -name "*.md" -print0 | while IFS= read -r -d '' file; do
    # Explicitly count matches for both conditions
    progress_count=$(grep -c "status: In Progress" "$file" || true)
    failed_count=$(grep -c "  - Review Failed" "$file" || true)

    if [ "$progress_count" -gt 0 ] && [ "$failed_count" -gt 0 ]; then
        echo "$file" # Print the path of the matching file
        exit 0       # Exit immediately after finding the first one
    fi
done