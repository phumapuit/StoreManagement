drop database w2solution;
create database w2solution;
use w2solution;

CREATE TABLE Orders (
    order_id int NOT NULL,
    order_amount int,
    PRIMARY KEY (order_id)
);

CREATE TABLE OrderItem (
    order_id int NOT NULL,
    product_id int,
	quantity int,
	price int,
    PRIMARY KEY (order_id, product_id),
	FOREIGN KEY(order_id) REFERENCES dbo.Orders(order_id)
);