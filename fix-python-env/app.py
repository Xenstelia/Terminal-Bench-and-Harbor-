import os
import requests

def main():
    secret = os.environ["SECRET_KEY"]

    # Make a simple request to ensure requests is installed
    response = requests.get("https://example.com")

    if response.status_code == 200:
        print("App started successfully")
    else:
        print("Failed to reach example.com")

if __name__ == "__main__":
    main()