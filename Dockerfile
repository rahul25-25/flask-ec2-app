# Use official lightweight Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Expose port for Gunicorn
EXPOSE 8000

# Start with Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
