FROM alpine:3.12
RUN apk update && apk upgrade
RUN mkdir ./dashboards
COPY ./srcs/dashboard.json /dashboards/dashboard.json

RUN apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community/
ADD https://dl.grafana.com/oss/release/grafana-7.5.4.linux-amd64.tar.gz .
RUN tar -zxvf grafana-7.5.4.linux-amd64.tar.gz && rm grafana-7.5.4.linux-amd64.tar.gz

COPY ./srcs/sample.yaml /grafana-7.5.4/conf/provisioning/dashboards/sample.yaml
COPY ./srcs/datasource.yaml ./grafana-7.5.4/conf/provisioning/datasources/datasource.yaml
COPY ./srcs/grafana.ini ./grafana-7.5.4/conf/grafana.ini

EXPOSE 3000
ENTRYPOINT ["grafana-server", "--homepath", "/grafana-7.5.4", "--config", "/grafana-7.5.4/conf/grafana.ini"]