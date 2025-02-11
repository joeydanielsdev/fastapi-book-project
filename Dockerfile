# Use an official lightweight Python image as the base.
FROM python:3.9-slim

# Set the working directory in the container.
WORKDIR /app

# Copy the dependency file and install dependencies.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code.
COPY . .

# Expose port 8000 for the FastAPI app.
EXPOSE 8000

# Set the entry point for the FastAPI application using uvicorn.
# Since main.py is in the root, change "app.main:app" to "main:app"
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
