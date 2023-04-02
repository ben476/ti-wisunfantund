FROM ubuntu:latest

RUN apt-get update && apt-get install -y build-essential dbus libreadline-dev gcc g++ libdbus-1-dev libboost-dev libreadline-dev libtool autoconf autoconf-archive

COPY . /app

WORKDIR /app

RUN ./bootstrap.sh && ./configure && make

RUN make install

ENTRYPOINT [ "/usr/local/sbin/wfantund" ]