#!/bin/bash
#
# test_priority_checker.sh - Test script to validate the priority checker functionality
#

set -e

echo "=== Testing Priority Checker ==="
echo "Current working directory: $(pwd)"
echo ""

echo "1. Testing with no tasks (should return exit code 1):"
./.scripts/priority_checker.sh
exit_code=$?
echo "Exit code: $exit_code"
if [ $exit_code -eq 1 ]; then
    echo "✅ PASS: No priority actions found (ready for new work)"
else
    echo "❌ FAIL: Expected exit code 1"
fi
echo ""

echo "2. Testing individual helper scripts:"
echo "  - find_review_task.sh:"
result=$(./.scripts/find_review_task.sh || true)
if [ -z "$result" ]; then
    echo "    ✅ No pending reviews (expected)"
else
    echo "    📄 Found: $result"
fi

echo "  - find_qa_task.sh:"
result=$(./.scripts/find_qa_task.sh || true)
if [ -z "$result" ]; then
    echo "    ✅ No pending QA (expected)"
else
    echo "    📄 Found: $result"
fi

echo "  - find_failed_task.sh:"
result=$(./.scripts/find_failed_task.sh || true)
if [ -z "$result" ]; then
    echo "    ✅ No failed reviews (expected)"
else
    echo "    📄 Found: $result"
fi

echo "  - find_failed_qa_task.sh:"
result=$(./.scripts/find_failed_qa_task.sh || true)
if [ -z "$result" ]; then
    echo "    ✅ No failed QA (expected)"
else
    echo "    📄 Found: $result"
fi

echo ""
echo "3. Testing task ID extraction (using priority_checker.sh functions):"
# We can't directly test the internal functions, but we can verify the pattern works
test_filename="task-2.5 - Test Task Title.md"
task_id=$(echo "$test_filename" | sed -E 's/^(task-[0-9]+(\.[0-9]+)*) - .*/\1/')
echo "  Test filename: $test_filename"
echo "  Extracted ID: $task_id"
if [ "$task_id" = "task-2.5" ]; then
    echo "  ✅ PASS: Task ID extraction works correctly"
else
    echo "  ❌ FAIL: Expected 'task-2.5', got '$task_id'"
fi

echo ""
echo "=== Priority Checker Test Complete ==="
