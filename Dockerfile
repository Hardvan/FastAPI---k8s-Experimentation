# Python version: 3.9
FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy requirements.txt file
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . .

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]
