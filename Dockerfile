FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      bash \
      curl \
      git \
      ca-certificates \
      unzip \
      build-essential \
      zlib1g-dev \
      ruby-full \
      nodejs \
      npm \
      openjdk-21-jre-headless && \
    rm -rf /var/lib/apt/lists/*

# Installation globale des outils
RUN npm install -g fsh-sushi@3.18.0 && \
    gem install jekyll bundler

RUN echo '#!/usr/bin/env bash\n\
set -e\n\
echo "Correction des scripts (CRLF -> LF)..."\n\
find . -name "*.sh" -exec sed -i "s/\\r$//" {} \\;\n\
find . -name "*.sh" -exec chmod +x {} \\;\n\
echo "OK : scripts corrigés."' > /usr/local/bin/fix-sh && \
chmod +x /usr/local/bin/fix-sh

WORKDIR /workspace

CMD ["/bin/bash"]