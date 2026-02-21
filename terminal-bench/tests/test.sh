#!/bin/bash

# Test Documentation: Installs uv/pytest and runs Python test suite.
mkdir -p /logs/verifier

apt-get update && apt-get install -y curl

# Install uv for isolated test dependency management
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/env

# Run pytest through uvx to verify system state
uvx \
  --with pytest==8.4.1 \
  --with pytest-json-ctrf==0.3.5 \
  --with packaging \
  pytest --ctrf /logs/verifier/ctrf.json /tests/test_outputs.py -rA

# Generate the reward based on pytest exit code
if [ $? -eq 0 ]; then
  echo "1.0" > /logs/verifier/reward.txt
else
  echo "0.0" > /logs/verifier/reward.txt
fi