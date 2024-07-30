FROM jupyter/datascience-notebook:x86_64-python-3.11

USER root

ENV TZ=Asia/Taipei
ENV DEBIAN_FRONTEND=noninteractive

# Install PyTorch
RUN pip3 install --pre torch torchaudio torchvision \
    -f https://download.pytorch.org/whl/cu123/torch_stable.html

# Account 'jovyan'
ARG USER=jovyan
RUN echo "$USER:jovyan" | chpasswd

# Create work directories
USER $USER
RUN bash -c 'mkdir -p /home/$USER/{data,models,output}'
WORKDIR /home/$USER

# Start Jupyterlab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root"]
