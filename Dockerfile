FROM python:3.10-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Install python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY . .

# Train and generate model artifact during build
RUN python train.py

EXPOSE 5000

# Run using Gunicorn production WSGI server
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]