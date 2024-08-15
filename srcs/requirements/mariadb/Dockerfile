FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server vim

COPY ./conf/mdb_conf.sh /mdb_conf.sh

RUN chmod +x /mdb_conf.sh

CMD ["./mdb_conf.sh"]
