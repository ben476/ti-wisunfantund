FROM ubuntu:latest

RUN apt-get update && apt-get install -y build-essential dbus libreadline-dev gcc g++ libdbus-1-dev libboost-dev libreadline-dev libtool autoconf autoconf-archive

COPY . /app

WORKDIR /app

RUN ./bootstrap.sh && ./configure && make

RUN make install

WORKDIR /app/ti-wisun-webapp/server

RUN apt-get install -y nodejs npm

RUN npm install

WORKDIR /app/ti-wisun-webapp/client

RUN npm install




ENTRYPOINT [ "/app/start.sh" ]