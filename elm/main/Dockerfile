FROM alpine:3.14.1

LABEL creator=dev-env

RUN apk add curl vim tmux sudo git make openssh

RUN cd /tmp && \
    curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz && \
    gunzip elm.gz && \
    chmod +x elm && \
    mv elm /usr/local/bin/elm

RUN cd /tmp && \
    curl -L -o elm-format.tgz https://github.com/avh4/elm-format/releases/download/0.8.5/elm-format-0.8.5-linux-x64.tgz && \
    tar -xzf elm-format.tgz && \
    chmod +x elm-format && \
    mv elm-format /usr/local/bin/elm-format

RUN adduser -D developer developer && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/010_developer-nopasswd

USER developer

COPY tmux.conf /home/developer/.tmux.conf

ENTRYPOINT ["tmux"]
