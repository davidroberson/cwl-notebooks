# Use miniconda3 as base image
FROM continuumio/miniconda3:23.3.1-0

# Metadata
LABEL base.image="miniconda3"
LABEL version="1"
LABEL software="MPRAsnakeflow"
LABEL software.version="1.0.0"
LABEL description="This pipeline processes sequencing data from Massively Parallel Reporter Assays (MPRA) to create count tables for candidate sequences tested in the experiment."
LABEL website="https://github.com/kircherlab/MPRAsnakeflow"
LABEL documentation="https://mprasnakeflow.readthedocs.io"
LABEL license="https://github.com/kircherlab/MPRAsnakeflow/blob/main/LICENSE"
LABEL tags="Genomics"
LABEL MAINTAINER Max Schubach <max.schubach@bihealth.de>

#update base
RUN apt-get update && apt-get install -y zlib1g-dev zlib1g libbz2-dev liblzma-dev wget libncurses5-dev

# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH

# Update conda to latest version.
RUN conda update -n base -c defaults conda
RUN conda install -n base -c conda-forge mamba

# Install snakemake
#RUN conda install -c bioconda snakemake
RUN mamba install -c conda-forge -c bioconda snakemake

RUN mamba install -c conda-forge -c bioconda sra-tools

# Create a directory for the workflow
WORKDIR /MPRAsnakeflow

# Clone the git repo
RUN git clone https://github.com/kircherlab/MPRAsnakeflow.git .
