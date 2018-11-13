CREATE EXTENSION pglogical;
CREATE EXTENSION pglogical_origin;

SELECT pglogical.create_node(
    node_name := 'provider1',
    dsn := 'host=127.0.0.1 port=5432 dbname=poc-sharding'
);

CREATE SCHEMA sharding;

CREATE TABLE sharding.temperatures (
    at      date PRIMARY KEY,
    city    text,
    mintemp integer,
    maxtemp integer
);

SELECT pglogical.replication_set_add_all_tables('default', ARRAY['sharding']);

SELECT pg_sleep(10);
