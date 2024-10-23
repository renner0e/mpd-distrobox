FROM ghcr.io/ublue-os/fedora-distrobox:latest
# From https://github.com/ublue-os/fedora-distrobox

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="A cloud-native terminal experience powered by Fedora"

COPY extra-packages /
RUN dnf -y upgrade && \
    dnf -y install $(<extra-packages) && \
    dnf clean all

RUN rm /extra-packages
