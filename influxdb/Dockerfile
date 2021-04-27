FROM alpine:3.12

# ENV TELEGRAF_VERSION 1.15.4
RUN apk update && apk upgrade
RUN apk add supervisor
RUN apk add influxdb --repository http://dl-cdn.alpinelinux.org/alpine/v3.10/community/ --allow-untrusted --no-cache

RUN wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz.asc && \
    wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz
RUN mkdir -p /usr/src /etc/telegraf && \
    tar -C /usr/src -xzf telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz && \
    mv /usr/src/telegraf*/etc/telegraf/telegraf.conf /etc/telegraf/ && \
    mkdir /etc/telegraf/telegraf.d && \
    cp -a /usr/src/telegraf*/usr/bin/telegraf /usr/bin/ && \
    rm -rf *.tar.gz* /usr/src && rm /etc/telegraf/telegraf.conf
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf


# RUN apk add vsftpd supervisor openssl

# RUN adduser -D mmonte
# RUN echo mmonte:12345 | chpasswd

# RUN mkdir /etc/ssl
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private.key -out /etc/ssl/sertificate.pem -subj "/C=RU/ST=Moscow/L=Moscow/O=21 school/OU=Mmonte/CN=othercrt"

COPY /srcs/supervisord.conf /etc/supervisord.conf

EXPOSE 8086

# ENTRYPOINT sh
CMD ["supervisord"]
# COPY /srcs/start.sh /

# ENTRYPOINT sh start.sh