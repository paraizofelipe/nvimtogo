FROM alpine:latest as install

RUN addgroup -S editor && adduser -S editor -G editor
WORKDIR /home/editor
RUN apk update && \
    apk add --no-cache neovim \
      curl \
      git \
      python2 \
      python2-dev \
      python3 \
      python3-dev \
      cmake \
      py-pip \
      gcc \
      g++ \
      make \
      musl-dev \
      go

FROM install as configGO

USER editor
ENV GOROOT /usr/lib/go
ENV GOPATH /home/editor/go
ENV PATH $GOPATH/bin:$PATH
RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

FROM configGO as buildVIM

COPY --chown=editor:editor nvim/ /home/editor/.config/nvim
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN python3 -m pip install --user --upgrade pynvim
RUN nvim +'source ~/.config/nvim/init.vim' \
    nvim +'PlugInstall --sync' +qa \
    nvim +'UpdateRemotePlugins'

RUN pip3 install --user --upgrade pynvim

CMD nvim
