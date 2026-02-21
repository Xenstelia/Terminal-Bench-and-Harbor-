FROM python:3.12-slim

WORKDIR /workspace

# Install minimal system tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy task files into the container
COPY requirements.txt .
COPY app.py .

CMD ["/bin/bash"]