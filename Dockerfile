FROM iojs:1.0.4

MAINTAINER André König <andre.koenig@posteo.de>

RUN useradd edeltraud && mkdir -p /home/edeltraud && chown -R edeltraud:edeltraud /home/edeltraud

RUN git clone https://github.com/piscisaureus/slurp

ENV HOME /home/edeltraud/logs
ENV PORT 9091

ADD config.json /home/edeltraud/slurp

WORKDIR /home/edeltraud/slurp

EXPOSE 9091

USER edeltraud
CMD "iojs server.js"
