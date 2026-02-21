#!/bin/bash
# Test Documentation: Verifies environment state after Oracle fix.
mkdir -p /logs/verifier

# Install pytest and packaging in the system env so it can see the new Flask/ItsDangerous
pip install pytest==8.4.1 packaging==24.0

# Run pytest directly on the workspace
# We use -v to see exactly which test fails in the harbor logs
pytest -v /tests/test_outputs.py > /logs/verifier/pytest_log.txt 2>&1

if [ $? -eq 0 ]; then
  echo "1.0" > /logs/verifier/reward.txt
else
  # Debugging: if it fails, the log will be in the harbor job folder
  echo "0.0" > /logs/verifier/reward.txt
fi