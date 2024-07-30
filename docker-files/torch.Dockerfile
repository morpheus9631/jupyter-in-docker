FROM quay.io/jupyter/pytorch-notebook:cuda12-python-3.11

ARG USERNAME=jovyan
ARG USER_UID=1000
ARG USER_GID=1000

ENV USER=$USERNAME
ENV TZ=Asia/Taipei
ENV DEBIAN_FRONTEND=noninteractive

# Change 'root' password
USER root

RUN echo "$USER:jovyan" | chpasswd
RUN bash -c 'mkdir -p /home/$USER/{data,models,output}'
RUN bash -c 'chown -R $USER:users /home/$USER'

# Setup workspace
WORKDIR /home/$USER
USER $USER

# Start Jupyterlab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]