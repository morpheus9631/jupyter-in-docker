FROM quay.io/jupyter/tensorflow-notebook:cuda-python-3.11

USER root

ARG USERNAME=jovyan

ENV USER=$USERNAME
ENV TZ=Asia/Taipei
ENV DEBIAN_FRONTEND=noninteractive

# Create work directories
RUN echo "$USER:joyvan" | chpasswd
RUN bash -c 'mkdir -p /home/$USER/{data,models,output}'
RUN bash -c 'chown -R $USER:users /home/$USER'

# Setup workspace
WORKDIR /home/$USER
USER $USER

# Start Jupyterlab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
