DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;


CREATE TABLE merchants
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null
);

CREATE TABLE tags
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null
);

CREATE TABLE transactions(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  amount INT8,
  merchant_id INT8 REFERENCES merchants(id),
  tag_id INT8 REFERENCES tags(id)

);
