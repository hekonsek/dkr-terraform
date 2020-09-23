FROM ubuntu:20.04

RUN apt update && \
    DEBIAN_FRONTEND="noninteractive" apt install -y curl gnupg software-properties-common git wget unzip && \
    rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-get update && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get install -y terraform unzip && \
    rm -rf /var/lib/apt/lists/*

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm awscliv2.zip

### Helm ###

RUN curl -o /usr/bin/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/v1.19.0/bin/linux/amd64/kubectl
RUN chmod +x /usr/bin/kubectl

RUN curl -o /usr/bin/aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x /usr/bin/aws-iam-authenticator

RUN curl https://get.helm.sh/helm-v3.3.4-linux-amd64.tar.gz | tar xz && \
    mv linux-amd64/helm /usr/bin

### Helm ends ###

ENTRYPOINT ["/usr/bin/terraform"]