FROM kylemanna/openvpn:latest
MAINTAINER lpenaud@carlipa.com

RUN apk update && \
  apk add openssh

ADD ./bin /usr/local/bin
ENV SSH_AUTHORIZED_KEYS ""
ENV SSH_PORT 2222

CMD ["sshnc_run"]
