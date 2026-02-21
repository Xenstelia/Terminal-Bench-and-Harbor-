#!/bin/bash

cd /app || exit 1

# Install dependencies
pip3 install -r requirements.txt > /dev/null 2>&1 || exit 1

# Set required environment variable
export SECRET_KEY=supersecret

# Run application
output=$(python3 app.py 2>&1)

echo "$output" | grep "App started successfully" > /dev/null 2>&1

if [ $? -eq 0 ]; then
    exit 0
else
    exit 1
fi