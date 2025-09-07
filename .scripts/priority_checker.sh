#!/bin/bash
#
# priority_checker.sh - Unified priority task checker for nexttask workflow
# Returns the highest priority action needed, or nothing if ready for new work
#
# Exit codes:
# 0 = Action found (prints action to stdout)
# 1 = No priority actions, ready for new work
# 2 = Error occurred

set -e
set -o pipefail

# --- Helper Functions ---

extract_task_id() {
    local file_path="$1"
    if [[ -z "$file_path" ]]; then
        return 1
    fi
    # Extract task ID from filename like "task-2.3 - Title.md"
    basename "$file_path" | sed -E 's/^(task-[0-9]+(\.[0-9]+)*) - .*/\1/'
}

check_git_status() {
    git status --porcelain 2>/dev/null || true
}

get_in_progress_task() {
    # Get the actual task line (skip the header "In Progress:") and trim whitespace
    backlog task list -s "In Progress" --plain 2>/dev/null | sed -n '2p' | sed 's/^[[:space:]]*//' || true
}

# --- Priority 1: Resume Incomplete Work ---
check_resume_work() {
    local in_progress_task
    local git_status
    
    in_progress_task=$(get_in_progress_task)
    git_status=$(check_git_status)
    
    # Must have exactly one task in progress AND uncommitted changes
    if [[ -n "$in_progress_task" && -n "$git_status" ]]; then
        local task_id
        # Extract task ID from standard backlog.md format: "task-X - Title"
        task_id=$(echo "$in_progress_task" | sed -E 's/^(task-[0-9]+(\.[0-9]+)*) - .*/\1/')
        # Validate that we got a proper task ID
        if [[ "$task_id" =~ ^task-[0-9]+(\.[0-9]+)*$ ]]; then
            echo "RESUME:$task_id"
            return 0
        fi
    fi
    
    return 1
}

# --- Priority 2: Process Pending Reviews ---
check_pending_review() {
    local review_file
    review_file=$(./.scripts/find_review_task.sh 2>/dev/null || true)
    
    if [[ -n "$review_file" ]]; then
        local task_id
        task_id=$(extract_task_id "$review_file")
        if [[ -n "$task_id" ]]; then
            echo "REVIEW:$task_id"
            return 0
        fi
    fi
    
    return 1
}

# --- Priority 2.5: Process Pending QA ---
check_pending_qa() {
    local qa_file
    qa_file=$(./.scripts/find_qa_task.sh 2>/dev/null || true)
    
    if [[ -n "$qa_file" ]]; then
        local task_id
        task_id=$(extract_task_id "$qa_file")
        if [[ -n "$task_id" ]]; then
            echo "QA:$task_id"
            return 0
        fi
    fi
    
    return 1
}

# --- Priority 3: Fix Failed Reviews ---
check_failed_review() {
    local failed_file
    failed_file=$(./.scripts/find_failed_task.sh 2>/dev/null || true)
    
    if [[ -n "$failed_file" ]]; then
        local task_id
        task_id=$(extract_task_id "$failed_file")
        if [[ -n "$task_id" ]]; then
            echo "FIX:$task_id"
            return 0
        fi
    fi
    
    return 1
}

# --- Priority 3.5: Fix Failed QA ---
check_failed_qa() {
    local failed_qa_file
    failed_qa_file=$(./.scripts/find_failed_qa_task.sh 2>/dev/null || true)
    
    if [[ -n "$failed_qa_file" ]]; then
        local task_id
        task_id=$(extract_task_id "$failed_qa_file")
        if [[ -n "$task_id" ]]; then
            echo "FIXQA:$task_id"
            return 0
        fi
    fi
    
    return 1
}

# --- Main Logic ---
main() {
    # Check each priority in order
    if check_resume_work; then
        return 0
    fi
    
    if check_pending_review; then
        return 0
    fi
    
    if check_pending_qa; then
        return 0
    fi
    
    if check_failed_review; then
        return 0
    fi
    
    if check_failed_qa; then
        return 0
    fi
    
    # No priority actions found - ready for new work
    return 1
}

# Execute main logic
main "$@"
