FROM debian:12.11-slim
LABEL org.opencontainers.image.source=https://github.com/code0-tech/internal-tooling

RUN apt-get update && apt-get install curl git -y
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
RUN echo "source $HOME/.asdf/asdf.sh" >> ~/.bashrc
