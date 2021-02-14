FROM ubuntu:20.04

RUN apt-get update
RUN apt-get -y install curl

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup default stable

RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt install -y make libsodium-dev libclang-dev pkg-config libssl-dev libxxhash-dev libzstd-dev clang
RUN cargo install pijul --version "~1.0.0-alpha"
RUN export PATH="$PATH:HOME/.cargo/bin/"
WORKDIR /home/root

RUN apt-get install -y vim

