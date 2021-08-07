FROM alpine:20210804

RUN apk add sudo tmux neovim git openssh curl

RUN adduser -D developer developer && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/010_developer-nopasswd

USER developer

COPY --chown=developer:developer tmux.conf /home/developer/.tmux.conf
COPY --chown=developer:developer profile /home/developer/.profile
COPY --chown=developer:developer init.vim /home/developer/.config/nvim/init.vim

RUN echo source ~/.bashrc > ~/.bash_profile && \
    chown developer:developer ~/.bash_profile

RUN git config --global user.email "developer@developer" && \
    git config --global user.name "developer"

RUN curl -fLo /home/developer/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN nvim +PlugInstall +qa

ENTRYPOINT ["tmux", "-u"]

