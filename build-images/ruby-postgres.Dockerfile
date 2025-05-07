FROM ghcr.io/code0-tech/build-images/mise:131.1

RUN apt-get update && apt-get install \
    build-essential \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    libcurl4-openssl-dev \
    uuid-dev \
    icu-devtools \
    libicu-dev \
    libyaml-dev \
    -y

ARG POSTGRES_VERSION
ARG RUBY_VERSION
ADD build-images/mise/mise.ruby-postgres.toml ./mise.toml
RUN mise trust &&  \
    mise config set tools.postgres.version $POSTGRES_VERSION -t string && \
    mise config set tools.ruby.version $RUBY_VERSION -t string && \
    mise install && \
    rm mise.toml
