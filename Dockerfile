FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Clone geminicli2api
RUN git clone https://github.com/gzzhongqi/geminicli2api.git . && \
    pip install --no-cache-dir -r requirements.txt

# Create credentials directory
RUN mkdir -p /root/.gemini

# Expose port (Render uses PORT env variable)
EXPOSE 8888

# Startup script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
