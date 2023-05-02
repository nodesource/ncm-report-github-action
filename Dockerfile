FROM node:12

LABEL version="1.0.0"
LABEL repository="https://github.com/nodesource/ncm-github-action"
LABEL homepage="https://nodesource.com"
LABEL maintainer="NodeSource"

RUN echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" > /etc/apt/sources.list
RUN apt-get update && apt-get install -y g++ 
RUN npm install -g https://github.com/nodesource/ncm-cli.git#gate

COPY . /
ENTRYPOINT ["/entrypoint.sh"]
