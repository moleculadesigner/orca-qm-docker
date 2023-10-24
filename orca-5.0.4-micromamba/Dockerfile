FROM --platform=linux/amd64 debian:bookworm-slim
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
USER root

# Debian Packages Installation
RUN apt-get update -q && \
    apt-get install -q -y --no-install-recommends \
        git \
        zsh \
        sudo \
        curl \
        bzip2 \
        openmpi-bin \
        openmpi-doc \
        openmpi-common \
        ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Micromamba Installation
## The original Micromamba way
## https://mamba.readthedocs.io/en/latest/micromamba-installation.html
## with
## RUN curl -Ls \
##     https://micro.mamba.pm/api/micromamba/linux-64/latest \
##     | tar -xvj /bin/micromamba
## did not work, so the binary provided directly:
COPY micromamba /bin/micromamba

# Set user and group
ARG USER=orcauser
ARG GROUP=orca
ARG UID=1000
ARG GID=1000
RUN groupadd -g ${GID} ${GROUP}
RUN useradd -l -u ${UID} -g ${GROUP} -s /bin/zsh -m ${USER}
RUN passwd -d ${USER}
RUN usermod -a -G sudo ${USER}
USER ${UID}:${GID}
WORKDIR /home/${USER}

# Install Python Environment
ADD --chown=${USER}:${GROUP} .zshrc ./
ADD --chown=${USER}:${GROUP} environment-slim.yml ./
RUN micromamba shell init --shell zsh --root-prefix=~/micromamba
RUN micromamba create -f environment-slim.yml

# Install Orca
ADD --chown=${USER}:${GROUP} orca.tar.xz ./

CMD ["zsh"]