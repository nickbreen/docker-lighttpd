FROM debian

MAINTAINER Nick Breen <nick@foobar.net.nz>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install lighttpd && apt-get clean

COPY php.conf /etc/lighttpd/conf-available/40-php.conf

RUN lighttpd-enable-mod fastcgi php

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]

EXPOSE 80

