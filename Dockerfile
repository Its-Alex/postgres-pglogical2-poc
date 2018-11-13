FROM postgres:11.1
MAINTAINER Alexandre Marre <me@itsalex.fr>

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y curl

# Documentation: https://dl.2ndquadrant.com/default/release/site/
RUN curl https://dl.2ndquadrant.com/default/release/get/deb | bash && \
    apt-get install postgresql-11-pglogical

RUN echo "local   replication          all                                trust" >> /usr/share/postgresql/11/pg_hba.conf && \
    echo "host    replication          all                172.18.0.0/16   trust" >> /usr/share/postgresql/11/pg_hba.conf && \
    echo "host    replication          all                samenet         trust" >> /usr/share/postgresql/11/pg_hba.conf && \
    echo "host    replication          all                192.168.0.0/16  trust" >> /usr/share/postgresql/11/pg_hba.conf && \
    echo "host    replication          all                ::1/128         trust" >> /usr/share/postgresql/11/pg_hba.conf && \
    echo "shared_preload_libraries = 'pglogical'" >> /usr/share/postgresql/postgresql.conf.sample && \
    echo "wal_level = 'logical'" >> /usr/share/postgresql/postgresql.conf.sample && \
    echo "max_wal_senders = 10" >> /usr/share/postgresql/postgresql.conf.sample && \
    echo "max_worker_processes = 10" >> /usr/share/postgresql/postgresql.conf.sample && \
    echo "max_replication_slots = 20" >> /usr/share/postgresql/postgresql.conf.sample