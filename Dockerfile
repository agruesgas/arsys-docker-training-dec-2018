FROM ubuntu:18.04

LABEL MAINTAINER="agruesgas@arsys.es"

RUN apt-get update
RUN apt-get install nginx -y
RUN useradd pako
RUN apt-get update && apt-get install -y libltdl7 && rm -rf /var/lib/apt/lists/*

RUN echo '<marquee>Hello from arsys!</marquee>' \
    > /var/www/html/index.html

EXPOSE 80    


COPY ./sayhello.sh /
RUN chmod o+x ./sayhello.sh

CMD ["./sayhello.sh"]