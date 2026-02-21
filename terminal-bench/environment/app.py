from flask import Flask
import itsdangerous

app = Flask(__name__)

if __name__ == "__main__":
    print("App Import Successful")