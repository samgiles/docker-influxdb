FROM ubuntu
RUN sudo apt-get update
RUN sudo apt-get install -y wget
RUN wget http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb
RUN sudo dpkg -i influxdb_latest_amd64.deb || sudo apt-get -f install

# Admin server
EXPOSE 8083

# HTTP API
EXPOSE 8086

# HTTPS API
EXPOSE 8084

ADD config.toml /config/config.toml

VOLUME ["/volumes/influxdb"]

CMD /usr/bin/influxdb -config=/config/config.toml
