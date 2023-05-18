# Use a base image that includes Python 3.6
FROM python:3.6-slim

# Install necessary system tools
RUN apt-get update && apt-get install -y \
    curl \
    bzip2 \
    git \
    libgomp1 \
    procps \
    && rm -rf /var/lib/apt/lists/*

# Install conda
RUN curl -Lo ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && chmod +x ~/miniconda.sh \
    && ~/miniconda.sh -b -p ~/miniconda \
    && rm ~/miniconda.sh
ENV PATH=~/miniconda/bin:${PATH}

# Install Nextflow
RUN curl -s https://get.nextflow.io | bash \
    && mv nextflow /usr/local/bin/

# Clone MPRAflow repository
RUN git clone https://github.com/shendurelab/MPRAflow.git

# Set the working directory to the cloned repository
WORKDIR MPRAflow

# Create conda environment using the yml file in the repository
RUN conda env create -f environment.yml

# Make RUN commands use the new environment
SHELL ["conda", "run", "-n", "MPRAflow", "/bin/bash", "-c"]

# Display the help message for the count.nf pipeline to verify the installation
RUN nextflow run count.nf --help
