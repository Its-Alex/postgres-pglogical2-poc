-- CREATE EXTENSION pglogical;

-- SELECT pglogical.create_node(
--     node_name := 'subscriber2',
--     dsn := 'host=127.0.0.1 port=5432 dbname=poc-sharding'
-- );

-- SELECT pglogical.create_subscription(
--     subscription_name := 'subscription2',
--     provider_dsn := 'host=postgres-1 port=5432 dbname=poc-sharding',
--     synchronize_structure := true
-- );