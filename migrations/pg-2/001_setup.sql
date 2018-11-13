CREATE EXTENSION pglogical;

SELECT pglogical.create_node(
    node_name := 'subscriber1',
    dsn := 'host=127.0.0.1 port=5432 dbname=poc-sharding'
);

SELECT pg_sleep(10);

SELECT pglogical.create_subscription(
    subscription_name := 'subscription1',
    provider_dsn := 'host=postgres-1 port=5432 dbname=poc-sharding user=poc-sharding password=password'
);

SELECT pg_sleep(10);