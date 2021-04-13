# CLEAN: 	docker system prune -a -f
# BUILD 	docker build -t image .
# RUN		docker run -p 80:80 -p 443:443 --name cont_name image
# SHELL		docker exec -it cont_name /bin/bash

FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/private.pem -keyout /etc/nginx/ssl/public.key -subj "/C=RU/ST=Moscow/L=Moscow/O=21 school/OU=Mmonte/CN=othercrt"

# COPY /srcs/nginx.conf /etc/nginx/sites-available/nginx.conf
COPY /srcs/nginx.conf /etc/nginx/conf.d/default.conf
# COPY /srcs/nginx.conf /etc/nginx/conf.d/mynginx.conf
# RUN echo "include conf.d/mynginx.conf;" >> /etc/nginx/nginx.conf 
# include conf.d/http;
# /etc/nginx/conf.d
# RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
# RUN chown -R www-data:www-data /var/www/*
# RUN chmod -R 755 /var/www/

# chown -R www-data:www-data /var/www/

EXPOSE 80 443

COPY /srcs/start.sh ./
RUN chmod 777 /start.sh
CMD ["/start.sh"]
# CMD bash start.sh
# CMD ["nginx", "-g", "daemon off;"]


