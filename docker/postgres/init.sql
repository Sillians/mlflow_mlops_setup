-- Create application database
CREATE DATABASE application_db;


-- Create application user and grant privileges
CREATE USER "sillians" WITH ENCRYPTED PASSWORD 'mlflow_password_123';
GRANT ALL PRIVILEGES ON DATABASE application_db TO "sillians";