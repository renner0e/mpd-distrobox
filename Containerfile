FROM docker.io/library/alpine:edge

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="An easy way to get mpd running on Fedora Atomic and friends"

# also add mpdris2 for troubleshooting
RUN apk add mpdris2 --update-cache --repository https://dl-cdn.alpinelinux.org/alpine/edge/testing/

COPY extra-packages /
RUN apk --update upgrade && \
    grep -v '^#' /extra-packages | xargs apk add --no-cache --no-progress
RUN rm /extra-packages


RUN   ln -fs /bin/sh /usr/bin/sh && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/transactional-update
