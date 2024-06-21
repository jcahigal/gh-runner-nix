# IMAGE:jcahigal/runner-nix:2.317.0

FROM ubuntu:22.04

RUN apt-get update \
  && apt-get -y install git curl xz-utils \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /nix && mkdir /app

WORKDIR /app/actions-runner
USER root
ENV USER=root

RUN curl -L https://nixos.org/nix/install | sh -s -- --daemon --yes

ENV PATH="/home/runner/.nix-profile/bin:${PATH}"
ENV RUNNER_ALLOW_RUNASROOT=true

RUN mkdir -p /app/actions-runner \
  && cd /app/actions-runner \
  && curl -o actions-runner-linux-x64-2.317.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.317.0/actions-runner-linux-x64-2.317.0.tar.gz \
  && tar xzf ./actions-runner-linux-x64-2.317.0.tar.gz

# COPY entrypoint.sh /app/actions-runner/entrypoint.sh
COPY shell.nix /app/actions-runner/shell.nix
COPY set_up_runner.sh /app/actions-runner/set_up_runner.sh

# ENTRYPOINT ["nix-shell", "--run ", "./set_up_runner.sh"]