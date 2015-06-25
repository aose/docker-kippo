FROM phusion/baseimage:0.9.16
MAINTAINER aose <aose@example.com>

RUN apt-get update && \
	apt-get install -y git python-twisted

RUN useradd kippo 
RUN sudo git clone https://github.com/desaster/kippo.git && \
	cd kippo && \
	cp kippo.cfg.dist kippo.cfg && \
	chown -R kippo:kippo /kippo

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/log"]
VOLUME ["/kippo/dl"]

RUN mkdir /etc/service/kippo
# reload kippo.sh every build container
RUN true
ADD kippo.sh /etc/service/kippo/run

EXPOSE 2222

CMD ["/sbin/my_init"]
