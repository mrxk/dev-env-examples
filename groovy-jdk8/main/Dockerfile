FROM alpine:3.13.5

LABEL creator=dev-env

RUN apk add curl vim tmux sudo git openssh gradle

RUN adduser -D developer developer && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/010_developer-nopasswd

USER developer

COPY tmux.conf /home/developer/.tmux.conf

ENTRYPOINT ["tmux"]
