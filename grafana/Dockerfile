FROM alpine:3.12
RUN apk update
RUN apk add vim
RUN apk add supervisor

EXPOSE 3000

RUN mkdir ./dashboards
COPY dashboard.json /dashboards/dashboard.json
RUN apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community/
COPY grafana.ini ./
COPY datasource.yaml ./
RUN wget https://dl.grafana.com/oss/release/grafana-7.5.4.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.5.4.linux-amd64.tar.gz
COPY sample.yaml /grafana-7.5.4/conf/provisioning/dashboards/sample.yaml
COPY ./grafana.ini ./grafana-7.5.4/conf/grafana.ini
COPY ./datasource.yaml ./grafana-7.5.4/conf/provisioning/datasources/datasource.yaml
COPY ./supervisord.conf ./etc/
COPY ./start.sh ./
RUN chmod 777 ./start.sh
CMD ["/start.sh"]