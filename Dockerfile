# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set working directory in the container
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the script into the container
COPY qr_generator.py .

# Create a directory for QR codes
RUN mkdir -p /app/qr_codes
# Create directories for QR codes and logs
RUN mkdir -p /app/qr_codes /app/logs



# Set default environment variables
ENV QR_DATA_URL="https://github.com/sarvaniyl"
ENV QR_CODE_DIR="qr_codes"
ENV LOG_DIR="logs"
ENV LOG_FILE="info.log"
ENV QR_CODE_FILENAME="github_qr.png"
ENV FILL_COLOR="black"
ENV BACK_COLOR="white"

# Set the entrypoint
ENTRYPOINT ["python", "qr_generator.py"]
