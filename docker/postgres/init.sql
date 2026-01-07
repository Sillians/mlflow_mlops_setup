-- Create application database
CREATE DATABASE "${POSTGRES_DB:-application_db}";


-- Create application user and grant privileges
CREATE USER "${POSTGRES_USER:-application_user}" WITH ENCRYPTED PASSWORD '${POSTGRES_PASSWORD:-application_password}';
GRANT ALL PRIVILEGES ON DATABASE "${POSTGRES_DB:-application_db}" TO "${POSTGRES_USER:-application_user}";