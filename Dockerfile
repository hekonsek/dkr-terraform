FROM ubuntu

RUN apt update && \
    DEBIAN_FRONTEND="noninteractive" apt install -y curl gnupg software-properties-common git wget && \
    rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-get update && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get install -y terraform && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/bin/terraform"]