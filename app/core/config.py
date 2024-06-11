import os
from pydantic import BaseSettings


class Settings(BaseSettings):
    APP_NAME: str = "FastAPI Template"
    DEBUG: bool = True
    DATABASE_URL: str = os.getenv("DATABASE_URL")


settings = Settings()
