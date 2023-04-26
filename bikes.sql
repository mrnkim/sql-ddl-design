CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

-- BIKES
-- 4 MODELS ("FLY", "HAUL", "SKIN", "BUD")
-- BASE COSTS (500, 600, 700, 800)
-- FIXME: tabel names are typically plural
CREATE TABLE model (
    code TEXT PRIMARY KEY, --TODO: VARCHAR
    full_name TEXT NOT NULL UNIQUE, --TODO: VARCHAR
    base_cost INT NOT NULL --FIXME: NUMERIC(10,2)
);

-- ORDER
-- ID
-- TIME
-- CUSTOMER

CREATE TABLE order (
    id SERIAL PRIMARY KEY,
    time_placed TIMESTAMP WITH TIME ZONE NOT NULL, --FIXME: DEFAULT CURRENT_TIMESTAMP
    customer_id INT REFERENCES customers NOT NULL
);

-- ORDER ITEM
-- ID
-- References ORDER ID
-- NOTE
-- BIKES CODE
-- COST

CREATE TABLE order_item (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES order NOT NULL,
    note TEXT DEFAULT '',
    model_code VARCHAR(5) REFERENCES model NOT NULL,
    cost NUMERIC(10,2) NOT NULL
);
