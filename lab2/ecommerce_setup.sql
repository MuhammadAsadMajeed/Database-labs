-- ============================================================
-- Lab 02: E-Commerce Dataset
-- ============================================================

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
customer_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(150) UNIQUE NOT NULL,
city VARCHAR(80),
signup_date DATE NOT NULL
);

CREATE TABLE products (
product_id SERIAL PRIMARY KEY,
product_name VARCHAR(150) NOT NULL,
category VARCHAR(60) NOT NULL,
price DECIMAL(10,2) NOT NULL CHECK (price > 0),
stock_qty INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE orders (
order_id SERIAL PRIMARY KEY,
customer_id INTEGER NOT NULL REFERENCES customers(customer_id),
order_date DATE NOT NULL,
status VARCHAR(30) NOT NULL DEFAULT 'pending',
total_amount DECIMAL(10,2) NOT NULL,
shipped_date DATE
);

CREATE TABLE order_items (
item_id SERIAL PRIMARY KEY,
order_id INTEGER NOT NULL REFERENCES orders(order_id),
product_id INTEGER NOT NULL REFERENCES products(product_id),
quantity INTEGER NOT NULL CHECK (quantity > 0),
unit_price DECIMAL(10,2) NOT NULL
);

-- INSERT CUSTOMERS
INSERT INTO customers (name,email,city,signup_date) VALUES
('Ali Hassan','ali.hassan@gmail.com','Peshawar','2023-03-12'),
('Sara Khan','sara.khan@yahoo.com','Lahore','2023-05-20'),
('Usman Tariq','usman.tariq@gmail.com','Karachi','2023-07-08'),
('Fatima Malik','fatima.malik@hotmail.com','Islamabad','2023-08-15'),
('Bilal Ahmed','bilal.ahmed@gmail.com','Peshawar','2023-09-01'),
('Ayesha Noor','ayesha.noor@gmail.com','Lahore','2023-10-10'),
('Hamza Sheikh','hamza.sheikh@outlook.com','Karachi','2023-11-22'),
('Zainab Iqbal','zainab.iqbal@gmail.com','Quetta','2024-01-05'),
('Farhan Butt','farhan.butt@yahoo.com','Lahore','2024-02-14'),
('Sana Rashid','sana.rashid@gmail.com','Islamabad','2024-03-20'),
('Omar Hussain','omar.hussain@gmail.com','Peshawar','2024-04-11'),
('Nadia Aziz','nadia.aziz@hotmail.com','Karachi','2024-05-30'),
('Tariq Mehmood','tariq.mehmood@gmail.com','Lahore','2024-06-18'),
('Hina Qureshi','hina.qureshi@yahoo.com','Islamabad','2024-07-25'),
('Kamran Javed','kamran.javed@gmail.com','Faisalabad','2024-08-09'),
('Rabia Siddiqui','rabia.siddiqui@gmail.com','Karachi','2024-09-14'),
('Imran Chaudhry','imran.chaudhry@outlook.com','Lahore','2024-10-03'),
('Maira Aslam','maira.aslam@gmail.com','Peshawar','2024-11-19'),
('Asad Nawaz','asad.nawaz@gmail.com','Multan','2024-12-01'),
('Kiran Baig','kiran.baig@yahoo.com','Karachi','2025-01-07');

-- INSERT PRODUCTS
INSERT INTO products (product_name,category,price,stock_qty) VALUES
('Wireless Mouse','Electronics',1850,45),
('USB-C Hub 7-in-1','Electronics',3200,30),
('Mechanical Keyboard','Electronics',7500,20),
('Laptop Stand Aluminium','Electronics',4200,35),
('Noise Cancelling Headset','Electronics',12500,15),
('Python Programming Book','Books',1200,60),
('Data Science Handbook','Books',1800,40),
('Machine Learning Guide','Books',2200,25),
('Database Design Patterns','Books',1600,30),
('Clean Code','Books',1400,50),
('Office Chair Ergonomic','Furniture',28000,8),
('Standing Desk Converter','Furniture',15000,12),
('Monitor Arm Dual','Furniture',8500,18),
('Webcam 1080p','Electronics',5500,22),
('LED Desk Lamp','Electronics',2800,40);

-- INSERT ORDERS
INSERT INTO orders (customer_id,order_date,status,total_amount,shipped_date) VALUES
(1,'2024-09-05','delivered',3050,'2024-09-07'),
(2,'2024-09-12','delivered',8700,'2024-09-14'),
(3,'2024-10-01','delivered',12500,'2024-10-03'),
(4,'2024-10-15','delivered',4200,'2024-10-17'),
(5,'2024-11-02','delivered',2400,'2024-11-04'),
(6,'2024-11-18','delivered',36500,'2024-11-21'),
(7,'2024-12-05','delivered',7500,'2024-12-07'),
(8,'2024-12-20','delivered',3400,'2024-12-22'),
(9,'2025-01-08','delivered',9700,'2025-01-10'),
(10,'2025-01-22','delivered',5500,'2025-01-24'),
(11,'2025-02-03','delivered',15000,'2025-02-05'),
(12,'2025-02-14','cancelled',1200,NULL),
(13,'2025-03-01','delivered',21700,'2025-03-03'),
(14,'2025-03-10','shipped',6400,'2025-03-11'),
(15,'2025-03-22','processing',2800,NULL),
(1,'2025-04-02','delivered',13700,'2025-04-04'),
(3,'2025-04-15','delivered',4400,'2025-04-17'),
(5,'2025-05-01','processing',7500,NULL),
(16,'2025-05-08','pending',1800,NULL),
(17,'2025-05-12','delivered',28000,'2025-05-14'),
(18,'2025-05-20','shipped',5500,'2025-05-21'),
(19,'2025-06-01','delivered',3600,'2025-06-03'),
(20,'2025-06-10','pending',12500,NULL),
(2,'2025-06-18','delivered',2200,'2025-06-20'),
(8,'2025-07-05','processing',8500,NULL),
(10,'2025-07-12','delivered',15000,'2025-07-14'),
(12,'2025-07-20','delivered',4600,'2025-07-22'),
(14,'2025-08-02','pending',1600,NULL),
(6,'2025-08-15','delivered',43000,'2025-08-17'),
(9,'2025-08-28','shipped',9700,'2025-08-29');

-- INSERT ORDER ITEMS
INSERT INTO order_items (order_id,product_id,quantity,unit_price) VALUES
(1,1,1,1850),(1,6,1,1200),
(2,3,1,7500),(2,7,1,1200),
(3,5,1,12500),
(4,4,1,4200),
(5,1,1,1850),(5,10,1,1400),
(6,11,1,28000),(6,4,1,4200),(6,2,1,3200),(6,13,1,1100),
(7,3,1,7500),
(8,8,1,2200),(8,10,1,1200),
(9,5,1,12500),(9,2,1,3200),(9,6,2,2000), -- rounding on total
(10,14,1,5500),
(11,12,1,15000),
(12,6,1,1200),
(13,11,1,28000),(13,2,1,3200),
(14,4,1,4200),(14,15,1,2200),
(15,15,1,2800),
(16,5,1,12500),(16,7,1,1200),
(17,4,1,4200),(17,9,1,200),
(18,3,1,7500);
