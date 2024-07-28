# Jupyter in Docker

Comparison of Different Jupyter Image Building Methods

  - jupyter datascience 
    https://hub.docker.com/r/jupyter/datascience-notebook
  - Nvidai CUDA
    https://hub.docker.com/r/nvidia/cuda
  - jupyter tensorflow
    https://quay.io/repository/jupyter/tensorflow-notebook
  - jupyter pytorch
    https://quay.io/repository/jupyter/pytorch-notebook

---
## Build Result

|REPOSITORY     |TAG                |SIZE    |
|:---------------:|:-------------------:|-------:|
|jupyter-datasci  |cuda12.3-python3.11  |11GB    |
|jupyter-nvidia   |cuda12.3-python3.11  |15.6GB  |
|jupyter-tensor   |cuda12.3-python3.11  |8.49GB  |
|jupyter-torch    |cuda12.3-python3.11  |8.72GB  |

---
## Recommendation
&emsp;jupyter-tensor or jupyter-torch
