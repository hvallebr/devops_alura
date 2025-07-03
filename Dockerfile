# Use an official Python runtime as a parent image
# FROM python:3.14.0b3-alpine3.22
FROM python:3.13.5-alpine3.22

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY ./requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the content of the current directory to the working directory
COPY . .

# Expose the port that the app will be running on
EXPOSE 8000

# Define the command to run the application
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]