CREATE DATABASE shopping_list;

\c shopping_list

CREATE TABLE items (id SERIAL PRIMARY KEY, name TEXT, quantity INTEGER);

CREATE TABLE accounts (id SERIAL PRIMARY KEY, user_name VARCHAR(255), user_email VARCHAR(255), password_digest VARCHAR(255), is_admin BOOLEAN);
