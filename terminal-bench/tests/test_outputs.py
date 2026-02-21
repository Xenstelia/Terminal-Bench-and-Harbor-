"""
Use this file to define pytest tests that verify the outputs of the task.
This file will be copied to /tests/test_outputs.py and run by the /tests/test.sh file.
"""
import pytest
import flask
import itsdangerous
from packaging import version
import sys

def test_dependency_versions():
    """
    Test that the agent identified the version conflict and installed 
    compatible versions of Flask and ItsDangerous.
    """
    # Flask 3.0.0+ requires a modern version of ItsDangerous (>= 2.1.2)
    current_version = itsdangerous.__version__
    required_version = "2.1.2"
    
    assert version.parse(current_version) >= version.parse(required_version), \
        f"Conflict not resolved: ItsDangerous version {current_version} is incompatible with Flask."

def test_app_import():
    """
    Test that the application can be imported and initialized within the
    resolved environment.
    """
    # Ensure the workspace is in the path so we can import the agent's files
    sys.path.append('/workspace')
    try:
        import app
        # Verify the Flask app object exists within app.py
        assert hasattr(app, 'app'), "The Flask application object 'app' was not found in app.py."
    except ImportError as e:
        pytest.fail(f"Application failed to import after dependency fix: {e}")