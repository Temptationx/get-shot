# Get Shot
#
# VERSION 0.0.1

FROM resin/raspberrypi3-node:onbuild
MAINTAINER Ning <temptationx@me.com>

WORKDIR /usr/src/app/

COPY ./ /usr/src/app/

ENV PORT 80

RUN    	usermod -aG adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input root && \
	npm install --unsafe-perm --production

EXPOSE 80

ENTRYPOINT ["/usr/src/app/index.js"]
