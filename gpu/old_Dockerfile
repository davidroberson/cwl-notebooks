ARG UBUNTU_VERSION=18.04
ARG CUDA_VERSION=10.2
FROM nvidia/cuda:${CUDA_VERSION}-base-ubuntu${UBUNTU_VERSION}
# An ARG declared before a FROM is outside of a build stage,
# so it can’t be used in any instruction after a FROM

ARG PY_VER=3.8.11
#ARG TF_VER=2.5.0
ARG CUDA_VERSION

# Install ubuntu packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        git \
        curl \
        ca-certificates \
        sudo \
        locales \
        openssh-server \
        vim && \
    # Remove the effect of `apt-get update`
    rm -rf /var/lib/apt/lists/* && \
    # Make the "en_US.UTF-8" locale
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Install miniconda (python)
# Referenced PyTorch's Dockerfile:
#   https://github.com/pytorch/pytorch/blob/master/docker/pytorch/Dockerfile

ARG UBUNTU_VER=18.04
ARG CONDA_VER=latest
ARG OS_TYPE=x86_64
ARG PY_VER=3.8.11
