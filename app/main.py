from fastapi import FastAPI
from app.api.v1.endpoints import example

app = FastAPI()

app.include_router(example.router, prefix="/api/v1", tags=["example"])


@app.get("/")
def read_root():
    return {"message": "Welcome to the FastAPI application"}
