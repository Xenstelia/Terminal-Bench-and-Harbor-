# Task: Resolve Python Dependency Conflict

You have been provided with a Python project in `/workspace` that is currently failing to run. 

### Problem Statement:
The project uses `Flask==3.0.0`, but the `requirements.txt` file specifies an outdated version of `ItsDangerous` (version 0.24). Flask 3.0+ requires `ItsDangerous >= 2.1.2`. Running `pip install -r requirements.txt` results in a version conflict, and the application `app.py` cannot start.

### Your Objectives:
1. Identify the version conflict between `Flask` and `ItsDangerous`.
2. Update `requirements.txt` with a compatible version of `ItsDangerous` (use `2.1.2`).
3. Successfully install the dependencies into the environment.
4. Verify that the application `app.py` can be imported without errors.

The task is complete when the environment is correctly configured and the app is functional.