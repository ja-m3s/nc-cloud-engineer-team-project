-- Create a database called db_customer
CREATE DATABASE db_customer;

\connect db_customer;

-- Create a user called usr_backend with password 'secret'
CREATE USER usr_backend WITH PASSWORD 'secret';

-- Grant all privileges to the database db_customer to the user usr_backend
GRANT ALL PRIVILEGES ON DATABASE db_customer TO usr_backend;

GRANT USAGE, CREATE ON SCHEMA public TO usr_backend;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO usr_backend;

COMMIT;