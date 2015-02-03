FROM iojs:1.0.4

MAINTAINER André König <andre.koenig@posteo.de>

RUN useradd edeltraud && \
    mkdir -p /home/edeltraud && \
    mkdir /home/edeltraud/logs && \
    chown -R edeltraud:edeltraud /home/edeltraud

ENV HOME /home/edeltraud/
ENV PORT 9091

WORKDIR /home/edeltraud
RUN git clone https://github.com/piscisaureus/slurp

ADD config.json /home/edeltraud/slurp/

VOLUME /home/edeltraud/logs
WORKDIR /home/edeltraud/slurp

EXPOSE 9091

USER edeltraud
CMD ["iojs", "server.js"]

