CREATE DATABASE RestaurantDB;
USE RestaurantDB;

CREATE TABLE Menu (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    item_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (item_id) REFERENCES Menu(item_id)
);

INSERT INTO Menu VALUES
(1, 'Burger', 120),
(2, 'Pizza', 250),
(3, 'Pasta', 180),
(4, 'Sandwich', 100);

INSERT INTO Orders (item_id, quantity, order_date) VALUES
(1, 2, '2026-04-01'),
(2, 1, '2026-04-01'),
(1, 3, '2026-04-02'),
(3, 2, '2026-04-02'),
(2, 4, '2026-04-03'),
(4, 1, '2026-04-03');

SELECT * FROM Menu;
SELECT * FROM Orders;

# Most Ordered Item

SELECT m.item_name, SUM(o.quantity) AS total_orders
FROM Orders o
JOIN Menu m ON o.item_id = m.item_id
GROUP BY m.item_id
ORDER BY total_orders DESC
LIMIT 1;

# Total Revenue

SELECT SUM(o.quantity * m.price) AS total_revenue
FROM Orders o
JOIN Menu m ON o.item_id = m.item_id;

# Peak Order Day

SELECT order_date, SUM(quantity) AS total_orders
FROM Orders
GROUP BY order_date
ORDER BY total_orders DESC
LIMIT 1;