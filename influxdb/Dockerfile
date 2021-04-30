FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add supervisor
RUN apk add influxdb --repository http://dl-cdn.alpinelinux.org/alpine/v3.10/community/ --allow-untrusted --no-cache

ENV TELEGRAF_VERSION 1.15.4
RUN wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz.asc && \
    wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz
RUN mkdir -p /usr/src /etc/telegraf && \
    tar -C /usr/src -xzf telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz && \
    mv /usr/src/telegraf*/etc/telegraf/telegraf.conf /etc/telegraf/ && \
    mkdir /etc/telegraf/telegraf.d && \
    cp -a /usr/src/telegraf*/usr/bin/telegraf /usr/bin/ && \
    rm -rf *.tar.gz* /usr/src

COPY /srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY /srcs/supervisord.conf /etc/supervisord.conf
# COPY /srcs/start.sh /

EXPOSE 8086

CMD ["supervisord"]
# CMD ["./start.sh"]
# ENTRYPOINT sh
# ENTRYPOINT sh start.sh
