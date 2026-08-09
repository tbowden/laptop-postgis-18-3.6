--
-- 001-users.sql
--
-- Creates the standard roles for local development.
-- Safe to run only during initial database creation.
--

-- Personal login for administration and development.
CREATE ROLE tim
WITH
    LOGIN
    CREATEDB
    CREATEROLE
    PASSWORD 'change-me';

-- Application login.
CREATE ROLE app
WITH
    LOGIN
    PASSWORD 'change-me-too';

COMMENT ON ROLE tim IS 'Development user';
COMMENT ON ROLE app IS 'Application user';
