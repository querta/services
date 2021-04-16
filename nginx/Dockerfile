# CLEAN: 	docker system prune -a -f
# BUILD 	docker build -t image .
# RUN		docker run -p 80:80 -p 443:443 --name cont_name image
# SHELL		docker exec -it cont_name /bin/bash

FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor vim

RUN mkdir /etc/nginx/ssl
# RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/private.pem -keyout /etc/nginx/ssl/private.key -subj "/C=RU/ST=Moscow/L=Moscow/O=21 school/OU=Mmonte/CN=othercrt"
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/nginx/ssl/private.key -out /etc/nginx/ssl/sertificate.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=21 school/OU=Mmonte/CN=othercrt"

# COPY /srcs/nginx.conf /etc/nginx/sites-available/nginx.conf
COPY /srcs/nginx.conf /etc/nginx/conf.d/default.conf
# /usr/sbin/sshd -D
# ssh-keygen -A

# etc/supervisord.conf
# usr/sbin/sshd -D

# COPY /srcs/nginx.conf /etc/nginx/conf.d/mynginx.conf
# RUN echo "include conf.d/mynginx.conf;" >> /etc/nginx/nginx.conf 
# include conf.d/http;
# /etc/nginx/conf.d
# RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

# RUN adduser -D -g 'www' www
# RUN mkdir /www
# RUN chown -R www:www /var/lib/nginx
# RUN chown -R www:www /www
# RUN chown -R www-data:www-data /var/www/*
# RUN chmod -R 755 /var/www/

# chown -R www-data:www-data /var/www/
RUN mkdir -p /run/nginx

EXPOSE 80 443 

# COPY /srcs/start.sh ./
# RUN chmod 777 /start.sh
# RUN ssh-keygen -A
# CMD [""]
CMD ["nginx", "-g", "daemon off;"]
# CMD ["/start.sh"]
# CMD ["nginx -g 'daemon off;'"]
# CMD bash start.sh
# CMD ["nginx", "-g", "daemon off;"]


