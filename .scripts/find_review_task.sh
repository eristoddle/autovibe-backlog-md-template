#!/bin/bash
#
# find_review_task.sh - Finds the first task file that is pending review.
# This script uses a robust `grep -c` pattern to avoid exit code issues.

set -e
set -o pipefail

find ./backlog/tasks -name "*.md" -print0 | while IFS= read -r -d '' file; do
    # Explicitly count matches for both conditions
    done_count=$(grep -c "status: Done" "$file" || true)
    review_count=$(grep -c "  - Pending Automated Review" "$file" || true)

    if [ "$done_count" -gt 0 ] && [ "$review_count" -gt 0 ]; then
        echo "$file" # Print the path of the matching file
        exit 0       # Exit immediately after finding the first one
    fi
done