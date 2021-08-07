FROM debian:9.13

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN apt-get update && \
    apt-get install -y x11vnc xvfb xfce4 vim sudo git openssh-client curl gradle && \
    apt-get clean

RUN groupadd -g ${GROUP_ID} developer && \
    useradd -l -u ${USER_ID} -g developer developer && \
    usermod -aG sudo developer && \
    install -d -m 0755 -o developer -g developer /home/developer && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/010_developer-nopasswd && \
    usermod --shell /bin/bash developer

# https://askubuntu.com/questions/695560/assistive-technology-not-found-awterror
RUN rm /etc/java-8-openjdk/accessibility.properties

USER developer

RUN git config --global user.email "developer@developer" && \
    git config --global user.name "developer"

RUN echo "exec startxfce4" > ~/.xinitrc && chmod +x ~/.xinitrc

CMD ["x11vnc", "-create", "-forever", "-passwd", "developer"]
