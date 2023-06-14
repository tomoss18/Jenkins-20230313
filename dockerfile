FROM jenkins/jenkins:latest

USER root

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    software-properties-common \
    wget \
    docker.io

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Set Python as the default interpreter
RUN ln -sf /usr/bin/python3 /usr/bin/python
