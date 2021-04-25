FROM postgis/postgis

COPY init.sql /docker-entrypoint-initdb.d/init.sql

COPY population_init.sql /docker-entrypoint-initdb.d/population_init.sql

ENV POSTGRES_USER=user

ENV POSTGRES_PASSWORD=user

ENV POSTGRES_DB=gathering_detection