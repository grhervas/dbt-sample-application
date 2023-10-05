CREATE SCHEMA IF NOT EXISTS raw;

-- Define tables to load from raw data
DROP TABLE IF EXISTS raw.jaffle_shop_customers;
CREATE TABLE raw.jaffle_shop_customers (
    id INT,
    first_name TEXT,
    last_name TEXT
);

DROP TABLE IF EXISTS raw.jaffle_shop_orders;
CREATE TABLE raw.jaffle_shop_orders (
    id INT,
    user_id INT,
    order_date TEXT,
    status TEXT
);

DROP TABLE IF EXISTS raw.stripe_payments;
CREATE TABLE raw.stripe_payments (
    id INT,
    order_id INT,
    payment_method TEXT,
    amount TEXT
);

-- Load data from .csv files
COPY raw.jaffle_shop_customers(id, first_name, last_name)
FROM '/input_data/customers.csv' DELIMITER ',' CSV HEADER;

COPY raw.jaffle_shop_orders(id, user_id, order_date, status)
FROM '/input_data/orders.csv' DELIMITER ',' CSV HEADER;

COPY raw.stripe_payments(id, order_id, payment_method, amount)
FROM '/input_data/payments.csv' DELIMITER ',' CSV HEADER;