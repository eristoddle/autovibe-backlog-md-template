#!/bin/bash
#
# run_dev_loop.sh - The main automation loop for a development phase.
# It continuously calls the 'nexttask' command to keep the project moving.

set -e
set -o pipefail

echo "Starting Continuous Development Loop..."

while true; do
    echo "-----------------------------------------------------"
    echo "Executing 'claude -p \"/nexttask\"' at $(date)"
    echo "-----------------------------------------------------"

    if claude -p "/nexttask"; then
        echo "Command finished successfully. Pausing for 30 seconds."
        sleep 30
    else
        echo "Claude session likely expired. Waiting 6 hours before retry..."
        sleep 6h
    fi
done
