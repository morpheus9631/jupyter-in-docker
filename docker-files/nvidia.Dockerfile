FROM nvidia/cuda:12.3.2-devel-ubuntu22.04

ENV TZ=Asia/Taipei
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
    curl build-essential software-properties-common tzdata && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Python 3.11
RUN add-apt-repository ppa:deadsnakes/ppa -y && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    python3.11 python3.11-venv python3.11-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Instal pip for Python 3.11
RUN curl -sS https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py && \
    python3.11 /tmp/get-pip.py && \
    rm /tmp/get-pip.py

# Install PyTorch
RUN pip3 install --pre torch torchaudio torchvision \
    -f https://download.pytorch.org/whl/cu123/torch_stable.html

# Install Jupyterlab
RUN pip3 install jupyterlab

# Install python requirement packages
# COPY requirements.txt /tmp/requirements.txt
# RUN  pip3 install -r /tmp/requirements.txt

# Change 'root' password
USER root

ARG USERNAME=user
ARG USER_UID=1000
ARG USER_GID=1000
RUN groupadd --gid $USER_GID $USERNAME && \
    useradd  --uid $USER_UID --gid $USER_GID -m $USERNAME -s /bin/bash
RUN echo "$USERNAME:1234" | chpasswd

# Create work directories
ENV USER=$USERNAME
RUN bash -c 'mkdir -p /home/$USER/{work,data,models,output}'
RUN bash -c 'chown -R $USER:$USER /home/$USER'

# Setup workspace
WORKDIR /home/$USER
USER $USER

# Start Jupyterlab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root"]
