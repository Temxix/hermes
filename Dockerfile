FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    build-essential \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install uv (fast Python package installer)
ADD https://astral.sh/uv/install.sh /uv-installer.sh
RUN sh /uv-installer.sh && rm /uv-installer.sh
ENV PATH="/root/.cargo/bin/:$PATH"

# Set working directory
WORKDIR /app

# Clone Hermes Agent repository
RUN git clone https://github.com/NousResearch/hermes-agent.git .

# Install dependencies using uv
RUN uv sync || pip install --no-cache-dir -e .

# Create volume mount points for persistent memory
RUN mkdir -p /root/.hermes /opt/data
VOLUME ["/root/.hermes", "/opt/data"]

# Default entrypoint
ENTRYPOINT ["hermes"]
CMD ["gateway"]
