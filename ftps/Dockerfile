FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add vsftpd supervisor openssl

# RUN adduser -D mmonte
# RUN echo mmonte:12345 | chpasswd

# RUN mkdir /etc/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private.key -out /etc/ssl/sertificate.pem -subj "/C=RU/ST=Moscow/L=Moscow/O=21 school/OU=Mmonte/CN=othercrt"

COPY /srcs/vsftpd.conf /etc/vsftpd.conf

COPY /srcs/supervisord.conf /etc/supervisord.conf

EXPOSE 20 21 3020 3021

COPY /srcs/start.sh /

ENTRYPOINT sh start.sh