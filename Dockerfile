FROM debian

MAINTAINER Nick Breen <nick@foobar.net.nz>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install lighttpd && apt-get clean

COPY *.conf /etc/lighttpd/conf-available/

RUN lighttpd-enable-mod fastcgi php expire

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]

EXPOSE 80
