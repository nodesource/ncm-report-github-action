FROM node:12

LABEL version="1.0.0"
LABEL repository="https://github.com/nodesource/ncm-github-action"
LABEL homepage="https://nodesource.com"
LABEL maintainer="NodeSource"

RUN apt-get update && apt-get install -y g++ build-essential
RUN npm install -g nodesource/ncm-cli#gio/bump

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
