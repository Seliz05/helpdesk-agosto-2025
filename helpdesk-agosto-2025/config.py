import os
from dotenv import load_dotenv

load_dotenv()

class Config:
    SECRET_KEY = os.getenv("SECRET_KEY", "Sasfloku3")
    DB_HOST = os.getenv("DB_HOST", "127.0.0.1")
    DB_PORT = int(os.getenv("DB_PORT", 3306))
    DB_USER = os.getenv("DB_USER", "helpdesk_user")
    DB_PASSWORD = os.getenv("DB_PASSWORD", "helpdesk_password")
    DB_NAME = os.getenv("DB_NAME", "helpdesk_db")