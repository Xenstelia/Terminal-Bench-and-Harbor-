#!/bin/bash

cd /app || exit 1

pip3 install -r requirements.txt

export SECRET_KEY=supersecret

python3 app.py