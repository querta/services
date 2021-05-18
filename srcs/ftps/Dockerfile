FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add vsftpd openssl supervisor

# RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private.key -out /etc/ssl/sertificate.pem -subj "/C=RU/ST=Moscow/L=Moscow/O=21 school/OU=Mmonte/CN=othercrt"
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/sertificate.pem -keyout /etc/ssl/private.key -subj "/C=RU/ST=Moscow/L=Moscow/O=21 school/OU=Mmonte/CN=othercrt"

COPY /srcs/vsftpd.conf /etc/vsftpd.conf
COPY ./srcs/start.sh ./
RUN chmod +x ./start.sh

EXPOSE 21 20
EXPOSE 30020-30021
ENTRYPOINT ["./start.sh"]