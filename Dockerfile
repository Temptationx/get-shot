# Mosca
#
# VERSION 2.5.2

FROM arm32v6/node:alpine
MAINTAINER Matteo Collina <hello@matteocollina.com>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app/

COPY ./ /usr/src/app/

RUN apk update && \
    apk add make gcc g++ python git zeromq-dev krb5-dev libunwind && \
    npm install --unsafe-perm --production && \
    apk del make gcc g++ python git

EXPOSE 80

ENTRYPOINT ["/usr/src/app/index.js"]
