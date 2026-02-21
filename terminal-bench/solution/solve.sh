#!/bin/bash
# Update the requirement to a compatible version
sed -i 's/ItsDangerous==0.24/ItsDangerous==2.1.2/' /workspace/requirements.txt

# Install the updated dependencies
pip install -r /workspace/requirements.txt