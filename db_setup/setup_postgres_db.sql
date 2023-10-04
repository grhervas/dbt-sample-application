CREATE SCHEMA IF NOT EXISTS jaffle_shop;
CREATE SCHEMA IF NOT EXISTS stripe;

-- Define tables to load from raw data
DROP TABLE IF EXISTS jaffle_shop.customers;
CREATE TABLE jaffle_shop.customers (
    id INT,
    first_name TEXT,
    last_name TEXT
);

DROP TABLE IF EXISTS jaffle_shop.orders;
CREATE TABLE jaffle_shop.orders (
    id INT,
    user_id INT,
    order_date TEXT,
    status TEXT
);

DROP TABLE IF EXISTS stripe.payments;
CREATE TABLE stripe.payments (
    id INT,
    order_id INT,
    payment_method TEXT,
    amount TEXT
);

-- Load data from .csv files
COPY jaffle_shop.customers(id, first_name, last_name)
FROM '/input_data/customers.csv' DELIMITER ',' CSV HEADER;

COPY jaffle_shop.orders(id, user_id, order_date, status)
FROM '/input_data/orders.csv' DELIMITER ',' CSV HEADER;

COPY stripe.payments(id, order_id, payment_method, amount)
FROM '/input_data/payments.csv' DELIMITER ',' CSV HEADER;