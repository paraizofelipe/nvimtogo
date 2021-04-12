FROM ubuntu:latest as install

RUN addgroup editor && useradd editor -g editor -d /home/editor

RUN apt -y update && apt -y install git \
    build-essential \
    wget

ADD https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz /opt

RUN tar -xvzf /opt/nvim-linux64.tar.gz -C /opt && ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim

RUN wget -c https://golang.org/dl/go1.16.3.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.16.3.linux-amd64.tar.gz 

WORKDIR /home/editor

RUN chown -R editor. /home/editor

USER editor

ENV GOROOT /usr/local/go
ENV GOPATH /home/editor/go
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH
RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

CMD nvim
