FROM alpine:3.15.0

ENV KUBE_VERSION="v1.21.2"
ENV HELM_VERSION="v3.11.1"
ENV ARCH="arm64"

RUN apk add bash wget ca-certificates nano

RUN wget --quiet https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/${ARCH}/kubectl -O /usr/bin/kubectl
RUN wget --quiet https://get.helm.sh/helm-${HELM_VERSION}-linux-${ARCH}.tar.gz 
RUN tar -xzf helm-${HELM_VERSION}-linux-${ARCH}.tar.gz
RUN mv ./linux-${ARCH}/helm /usr/bin/helm 
RUN chmod +x /usr/bin/kubectl /usr/bin/helm 
RUN rm -rf helm-${HELM_VERSION}-linux-${ARCH}.tar.gz linux-${ARCH}

CMD bash
