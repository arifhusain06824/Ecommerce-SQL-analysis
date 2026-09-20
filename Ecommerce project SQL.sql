DROP DATABASE IF EXISTS ecommerce_db;
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- 1. Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);

-- 2. Products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

-- 3. Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. Order_Items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 5. Payments
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(30),
    payment_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers (customer_id, first_name, last_name, email, city, state, signup_date) VALUES
(1, 'Aarav', 'Sharma', 'aarav.sharma@gmail.com', 'Delhi', 'Delhi', '2023-01-15'),
(2, 'Priya', 'Verma', 'priya.verma@yahoo.com', 'Mumbai', 'Maharashtra', '2023-02-10'),
(3, 'Rohan', 'Gupta', 'rohan.gupta@gmail.com', 'Bangalore', 'Karnataka', '2023-02-20'),
(4, 'Ananya', 'Iyer', 'ananya.iyer@gmail.com', 'Chennai', 'Tamil Nadu', '2023-03-05'),
(5, 'Vikram', 'Singh', 'vikram.singh@outlook.com', 'Delhi', 'Delhi', '2023-03-12'),
(6, 'Sneha', 'Patel', 'sneha.patel@gmail.com', 'Ahmedabad', 'Gujarat', '2023-04-01'),
(7, 'Karan', 'Mehta', 'karan.mehta@gmail.com', 'Mumbai', 'Maharashtra', '2023-04-18'),
(8, 'Divya', 'Reddy', 'divya.reddy@yahoo.com', 'Hyderabad', 'Telangana', '2023-05-02'),
(9, 'Arjun', 'Nair', 'arjun.nair@gmail.com', 'Kochi', 'Kerala', '2023-05-20'),
(10, 'Pooja', 'Joshi', 'pooja.joshi@gmail.com', 'Pune', 'Maharashtra', '2023-06-01'),
(11, 'Rahul', 'Kumar', 'rahul.kumar@gmail.com', 'Delhi', 'Delhi', '2023-06-15'),
(12, 'Meera', 'Desai', 'meera.desai@gmail.com', 'Surat', 'Gujarat', '2023-07-01'),
(13, 'Aditya', 'Rao', 'aditya.rao@yahoo.com', 'Bangalore', 'Karnataka', '2023-07-12'),
(14, 'Neha', 'Kapoor', 'neha.kapoor@gmail.com', 'Mumbai', 'Maharashtra', '2023-07-25'),
(15, 'Siddharth', 'Malhotra', 'sid.malhotra@gmail.com', 'Delhi', 'Delhi', '2023-08-05'),
(16, 'Riya', 'Bose', 'riya.bose@gmail.com', 'Kolkata', 'West Bengal', '2023-08-18'),
(17, 'Amit', 'Chauhan', 'amit.chauhan@outlook.com', 'Jaipur', 'Rajasthan', '2023-09-01'),
(18, 'Kavya', 'Menon', 'kavya.menon@gmail.com', 'Kochi', 'Kerala', '2023-09-15'),
(19, 'Harsh', 'Agarwal', 'harsh.agarwal@gmail.com', 'Lucknow', 'Uttar Pradesh', '2023-10-01'),
(20, 'Tanvi', 'Shah', 'tanvi.shah@gmail.com', 'Ahmedabad', 'Gujarat', '2023-10-14'),
(21, 'Nikhil', 'Jain', 'nikhil.jain@gmail.com', 'Indore', 'Madhya Pradesh', '2023-11-01'),
(22, 'Ishita', 'Roy', 'ishita.roy@yahoo.com', 'Kolkata', 'West Bengal', '2023-11-12'),
(23, 'Varun', 'Pillai', 'varun.pillai@gmail.com', 'Chennai', 'Tamil Nadu', '2023-11-25'),
(24, 'Aditi', 'Saxena', 'aditi.saxena@gmail.com', 'Delhi', 'Delhi', '2023-12-05'),
(25, 'Manish', 'Tiwari', 'manish.tiwari@gmail.com', 'Bhopal', 'Madhya Pradesh', '2023-12-18'),
(26, 'Shreya', 'Ghosh', 'shreya.ghosh@gmail.com', 'Kolkata', 'West Bengal', '2024-01-05'),
(27, 'Akash', 'Verma', 'akash.verma@gmail.com', 'Mumbai', 'Maharashtra', '2024-01-15'),
(28, 'Deepika', 'Nair', 'deepika.nair@gmail.com', 'Bangalore', 'Karnataka', '2024-02-01'),
(29, 'Rajat', 'Khanna', 'rajat.khanna@gmail.com', 'Delhi', 'Delhi', '2024-02-14'),
(30, 'Simran', 'Kaur', 'simran.kaur@gmail.com', 'Chandigarh', 'Punjab', '2024-03-01'),
(31, 'Yash', 'Thakur', 'yash.thakur@gmail.com', 'Pune', 'Maharashtra', '2024-03-15'),
(32, 'Anjali', 'Mishra', 'anjali.mishra@gmail.com', 'Lucknow', 'Uttar Pradesh', '2024-04-01'),
(33, 'Kunal', 'Bansal', 'kunal.bansal@gmail.com', 'Jaipur', 'Rajasthan', '2024-04-12'),
(34, 'Nisha', 'Rao', 'nisha.rao@yahoo.com', 'Hyderabad', 'Telangana', '2024-05-01'),
(35, 'Gaurav', 'Sinha', 'gaurav.sinha@gmail.com', 'Patna', 'Bihar', '2024-05-18'),
(36, 'Payal', 'Gandhi', 'payal.gandhi@gmail.com', 'Ahmedabad', 'Gujarat', '2024-06-01'),
(37, 'Raj', 'Chopra', 'raj.chopra@gmail.com', 'Mumbai', 'Maharashtra', '2024-06-15'),
(38, 'Sakshi', 'Dubey', 'sakshi.dubey@gmail.com', 'Delhi', 'Delhi', '2024-07-01'),
(39, 'Mohit', 'Yadav', 'mohit.yadav@gmail.com', 'Noida', 'Uttar Pradesh', '2024-07-12'),
(40, 'Preeti', 'Bhatt', 'preeti.bhatt@gmail.com', 'Bangalore', 'Karnataka', '2024-08-01'),
(41, 'Aryan', 'Sethi', 'aryan.sethi@gmail.com', 'Delhi', 'Delhi', '2024-08-20'),
(42, 'Lakshmi', 'Krishnan', 'lakshmi.k@gmail.com', 'Chennai', 'Tamil Nadu', '2024-09-01'),
(43, 'Vivek', 'Anand', 'vivek.anand@gmail.com', 'Pune', 'Maharashtra', '2024-09-15'),
(44, 'Ritika', 'Soni', 'ritika.soni@gmail.com', 'Indore', 'Madhya Pradesh', '2024-10-01'),
(45, 'Sahil', 'Khan', 'sahil.khan@gmail.com', 'Mumbai', 'Maharashtra', '2024-10-18'),
(46, 'Ananya', 'Bhat', 'ananya.bhat@gmail.com', 'Bangalore', 'Karnataka', '2024-11-01'),
(47, 'Kabir', 'Singh', 'kabir.singh@gmail.com', 'Delhi', 'Delhi', '2024-11-15'),
(48, 'Megha', 'Pandey', 'megha.pandey@gmail.com', 'Lucknow', 'Uttar Pradesh', '2024-12-01'),
(49, 'Rishi', 'Agarwal', 'rishi.agarwal@gmail.com', 'Kolkata', 'West Bengal', '2024-12-10'),
(50, 'Tanya', 'Grover', 'tanya.grover@gmail.com', 'Chandigarh', 'Punjab', '2024-12-20');

INSERT INTO products (product_id, product_name, category, price, stock) VALUES
(1, 'iPhone 15 Pro', 'Electronics', 129999.00, 25),
(2, 'Samsung Galaxy S24', 'Electronics', 79999.00, 40),
(3, 'Sony WH-1000XM5', 'Electronics', 29999.00, 60),
(4, 'Dell XPS 13', 'Electronics', 95000.00, 15),
(5, 'MacBook Air M3', 'Electronics', 114900.00, 20),
(6, 'Boat Airdopes 141', 'Electronics', 1299.00, 200),
(7, 'Mi Power Bank 20000mAh', 'Electronics', 1999.00, 150),
(8, 'Levi\'s Denim Jacket', 'Clothing', 3499.00, 80),
(9, 'Nike Air Max', 'Footwear', 8999.00, 50),
(10, 'Adidas Ultraboost', 'Footwear', 12999.00, 45),
(11, 'Puma Running Shoes', 'Footwear', 5499.00, 70),
(12, 'Allen Solly Formal Shirt', 'Clothing', 1799.00, 120),
(13, 'H&M Cotton T-Shirt', 'Clothing', 799.00, 300),
(14, 'Zara Women Dress', 'Clothing', 2999.00, 90),
(15, 'Ray-Ban Aviator', 'Accessories', 8999.00, 35),
(16, 'Titan Analog Watch', 'Accessories', 4999.00, 60),
(17, 'Fastrack Digital Watch', 'Accessories', 2499.00, 100),
(18, 'Wildcraft Backpack', 'Accessories', 1899.00, 85),
(19, 'American Tourister Trolley', 'Accessories', 3499.00, 40),
(20, 'Prestige Pressure Cooker', 'Home & Kitchen', 2299.00, 55),
(21, 'Philips Air Fryer', 'Home & Kitchen', 8999.00, 30),
(22, 'Milton Water Bottle', 'Home & Kitchen', 599.00, 250),
(23, 'Wakefit Mattress', 'Home & Kitchen', 15999.00, 20),
(24, 'Bombay Dyeing Bedsheet', 'Home & Kitchen', 1299.00, 100),
(25, 'The Alchemist (Book)', 'Books', 399.00, 500),
(26, 'Atomic Habits (Book)', 'Books', 499.00, 450),
(27, 'Rich Dad Poor Dad (Book)', 'Books', 349.00, 400),
(28, 'L\'Oreal Face Wash', 'Beauty', 349.00, 200),
(29, 'Nivea Body Lotion', 'Beauty', 449.00, 180),
(30, 'Maybelline Lipstick', 'Beauty', 599.00, 150);

INSERT INTO orders (order_id, customer_id, order_date, status, total_amount) VALUES
(1, 1, '2024-01-05', 'Delivered', 129999.00),
(2, 2, '2024-01-08', 'Delivered', 29999.00),
(3, 3, '2024-01-12', 'Delivered', 1299.00),
(4, 4, '2024-01-15', 'Cancelled', 8999.00),
(5, 5, '2024-01-20', 'Delivered', 95000.00),
(6, 6, '2024-01-25', 'Delivered', 3499.00),
(7, 7, '2024-02-01', 'Delivered', 79999.00),
(8, 8, '2024-02-05', 'Delivered', 1799.00),
(9, 9, '2024-02-10', 'Pending', 5499.00),
(10, 10, '2024-02-14', 'Delivered', 12999.00),
(11, 11, '2024-02-18', 'Delivered', 1999.00),
(12, 12, '2024-02-22', 'Delivered', 8999.00),
(13, 13, '2024-03-01', 'Delivered', 114900.00),
(14, 14, '2024-03-05', 'Delivered', 2999.00),
(15, 15, '2024-03-10', 'Cancelled', 4999.00),
(16, 16, '2024-03-15', 'Delivered', 2499.00),
(17, 17, '2024-03-20', 'Delivered', 3499.00),
(18, 18, '2024-03-25', 'Delivered', 8999.00),
(19, 19, '2024-04-01', 'Delivered', 2299.00),
(20, 20, '2024-04-05', 'Delivered', 8999.00),
(21, 21, '2024-04-10', 'Pending', 599.00),
(22, 22, '2024-04-15', 'Delivered', 15999.00),
(23, 23, '2024-04-20', 'Delivered', 1299.00),
(24, 24, '2024-04-25', 'Delivered', 399.00),
(25, 25, '2024-05-01', 'Delivered', 499.00),
(26, 26, '2024-05-05', 'Delivered', 349.00),
(27, 27, '2024-05-10', 'Delivered', 349.00),
(28, 28, '2024-05-15', 'Delivered', 449.00),
(29, 29, '2024-05-20', 'Delivered', 599.00),
(30, 30, '2024-05-25', 'Delivered', 129999.00),
(31, 1, '2024-06-01', 'Delivered', 3499.00),
(32, 2, '2024-06-05', 'Delivered', 1299.00),
(33, 3, '2024-06-10', 'Delivered', 8999.00),
(34, 4, '2024-06-15', 'Delivered', 1999.00),
(35, 5, '2024-06-20', 'Delivered', 29999.00),
(36, 6, '2024-06-25', 'Delivered', 1299.00),
(37, 7, '2024-07-01', 'Delivered', 3499.00),
(38, 8, '2024-07-05', 'Delivered', 79999.00),
(39, 9, '2024-07-10', 'Delivered', 1799.00),
(40, 10, '2024-07-15', 'Delivered', 5499.00),
(41, 11, '2024-07-20', 'Cancelled', 8999.00),
(42, 12, '2024-07-25', 'Delivered', 12999.00),
(43, 13, '2024-08-01', 'Delivered', 8999.00),
(44, 14, '2024-08-05', 'Delivered', 2499.00),
(45, 15, '2024-08-10', 'Delivered', 3499.00),
(46, 16, '2024-08-15', 'Delivered', 599.00),
(47, 17, '2024-08-20', 'Delivered', 15999.00),
(48, 18, '2024-08-25', 'Delivered', 399.00),
(49, 19, '2024-09-01', 'Delivered', 499.00),
(50, 20, '2024-09-05', 'Delivered', 349.00),
(51, 21, '2024-09-10', 'Delivered', 349.00),
(52, 22, '2024-09-15', 'Delivered', 449.00),
(53, 23, '2024-09-20', 'Delivered', 599.00),
(54, 24, '2024-09-25', 'Delivered', 129999.00),
(55, 25, '2024-10-01', 'Delivered', 3499.00),
(56, 26, '2024-10-05', 'Delivered', 1299.00),
(57, 27, '2024-10-10', 'Delivered', 8999.00),
(58, 28, '2024-10-15', 'Delivered', 1999.00),
(59, 29, '2024-10-20', 'Delivered', 29999.00),
(60, 30, '2024-10-25', 'Delivered', 1299.00),
(61, 31, '2024-11-01', 'Delivered', 3499.00),
(62, 32, '2024-11-05', 'Delivered', 79999.00),
(63, 33, '2024-11-10', 'Delivered', 1799.00),
(64, 34, '2024-11-15', 'Delivered', 5499.00),
(65, 35, '2024-11-20', 'Pending', 8999.00),
(66, 36, '2024-11-25', 'Delivered', 12999.00),
(67, 37, '2024-12-01', 'Delivered', 8999.00),
(68, 38, '2024-12-05', 'Delivered', 2499.00),
(69, 39, '2024-12-10', 'Delivered', 3499.00),
(70, 40, '2024-12-15', 'Delivered', 599.00),
(71, 41, '2024-12-20', 'Delivered', 15999.00),
(72, 42, '2024-12-25', 'Delivered', 399.00),
(73, 43, '2025-01-05', 'Delivered', 499.00),
(74, 44, '2025-01-10', 'Delivered', 349.00),
(75, 45, '2025-01-15', 'Delivered', 349.00),
(76, 46, '2025-01-20', 'Delivered', 449.00),
(77, 47, '2025-01-25', 'Delivered', 599.00),
(78, 48, '2025-02-01', 'Delivered', 129999.00),
(79, 49, '2025-02-05', 'Delivered', 3499.00),
(80, 50, '2025-02-10', 'Delivered', 1299.00),
(81, 1, '2025-02-15', 'Delivered', 8999.00),
(82, 2, '2025-02-20', 'Delivered', 1999.00),
(83, 3, '2025-02-25', 'Delivered', 29999.00),
(84, 4, '2025-03-01', 'Delivered', 1299.00),
(85, 5, '2025-03-05', 'Delivered', 3499.00),
(86, 6, '2025-03-10', 'Delivered', 79999.00),
(87, 7, '2025-03-15', 'Delivered', 1799.00),
(88, 8, '2025-03-20', 'Delivered', 5499.00),
(89, 9, '2025-03-25', 'Delivered', 8999.00),
(90, 10, '2025-04-01', 'Delivered', 12999.00),
(91, 11, '2025-04-05', 'Delivered', 8999.00),
(92, 12, '2025-04-10', 'Delivered', 2499.00),
(93, 13, '2025-04-15', 'Delivered', 3499.00),
(94, 14, '2025-04-20', 'Delivered', 599.00),
(95, 15, '2025-04-25', 'Delivered', 15999.00),
(96, 16, '2025-05-01', 'Delivered', 399.00),
(97, 17, '2025-05-05', 'Delivered', 499.00),
(98, 18, '2025-05-10', 'Delivered', 349.00),
(99, 19, '2025-05-15', 'Delivered', 349.00),
(100, 20, '2025-05-20', 'Delivered', 449.00),
(101, 21, '2025-05-25', 'Delivered', 599.00),
(102, 22, '2025-06-01', 'Delivered', 129999.00),
(103, 23, '2025-06-05', 'Delivered', 3499.00),
(104, 24, '2025-06-10', 'Delivered', 1299.00),
(105, 25, '2025-06-15', 'Delivered', 8999.00),
(106, 26, '2025-06-20', 'Delivered', 1999.00),
(107, 27, '2025-06-25', 'Delivered', 29999.00),
(108, 28, '2025-07-01', 'Delivered', 1299.00),
(109, 29, '2025-07-05', 'Delivered', 3499.00),
(110, 30, '2025-07-10', 'Delivered', 79999.00),
(111, 31, '2025-07-15', 'Delivered', 1799.00),
(112, 32, '2025-07-20', 'Delivered', 5499.00),
(113, 33, '2025-07-25', 'Delivered', 8999.00),
(114, 34, '2025-08-01', 'Delivered', 12999.00),
(115, 35, '2025-08-05', 'Delivered', 8999.00),
(116, 36, '2025-08-10', 'Delivered', 2499.00),
(117, 37, '2025-08-15', 'Delivered', 3499.00),
(118, 38, '2025-08-20', 'Delivered', 599.00),
(119, 39, '2025-08-25', 'Delivered', 15999.00),
(120, 40, '2025-09-01', 'Delivered', 399.00);



INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1, 129999.00),
(2, 2, 3, 1, 29999.00),
(3, 3, 6, 1, 1299.00),
(4, 4, 9, 1, 8999.00),
(5, 5, 4, 1, 95000.00),
(6, 6, 8, 1, 3499.00),
(7, 7, 2, 1, 79999.00),
(8, 8, 12, 1, 1799.00),
(9, 9, 11, 1, 5499.00),
(10, 10, 10, 1, 12999.00),
(11, 11, 7, 1, 1999.00),
(12, 12, 15, 1, 8999.00),
(13, 13, 5, 1, 114900.00),
(14, 14, 14, 1, 2999.00),
(15, 15, 16, 1, 4999.00),
(16, 16, 17, 1, 2499.00),
(17, 17, 19, 1, 3499.00),
(18, 18, 15, 1, 8999.00),
(19, 19, 20, 1, 2299.00),
(20, 20, 21, 1, 8999.00),
(21, 21, 22, 1, 599.00),
(22, 22, 23, 1, 15999.00),
(23, 23, 24, 1, 1299.00),
(24, 24, 25, 1, 399.00),
(25, 25, 26, 1, 499.00),
(26, 26, 27, 1, 349.00),
(27, 27, 28, 1, 349.00),
(28, 28, 29, 1, 449.00),
(29, 29, 30, 1, 599.00),
(30, 30, 1, 1, 129999.00),
(31, 31, 8, 1, 3499.00),
(32, 32, 6, 1, 1299.00),
(33, 33, 9, 1, 8999.00),
(34, 34, 7, 1, 1999.00),
(35, 35, 3, 1, 29999.00),
(36, 36, 6, 1, 1299.00),
(37, 37, 8, 1, 3499.00),
(38, 38, 2, 1, 79999.00),
(39, 39, 12, 1, 1799.00),
(40, 40, 11, 1, 5499.00),
(41, 41, 15, 1, 8999.00),
(42, 42, 10, 1, 12999.00),
(43, 43, 15, 1, 8999.00),
(44, 44, 17, 1, 2499.00),
(45, 45, 19, 1, 3499.00),
(46, 46, 22, 1, 599.00),
(47, 47, 23, 1, 15999.00),
(48, 48, 25, 1, 399.00),
(49, 49, 26, 1, 499.00),
(50, 50, 27, 1, 349.00),
(51, 51, 28, 1, 349.00),
(52, 52, 29, 1, 449.00),
(53, 53, 30, 1, 599.00),
(54, 54, 1, 1, 129999.00),
(55, 55, 8, 1, 3499.00),
(56, 56, 6, 1, 1299.00),
(57, 57, 15, 1, 8999.00),
(58, 58, 7, 1, 1999.00),
(59, 59, 3, 1, 29999.00),
(60, 60, 6, 1, 1299.00),
(61, 61, 8, 1, 3499.00),
(62, 62, 2, 1, 79999.00),
(63, 63, 12, 1, 1799.00),
(64, 64, 11, 1, 5499.00),
(65, 65, 9, 1, 8999.00),
(66, 66, 10, 1, 12999.00),
(67, 67, 15, 1, 8999.00),
(68, 68, 17, 1, 2499.00),
(69, 69, 19, 1, 3499.00),
(70, 70, 22, 1, 599.00),
(71, 71, 23, 1, 15999.00),
(72, 72, 25, 1, 399.00),
(73, 73, 26, 1, 499.00),
(74, 74, 27, 1, 349.00),
(75, 75, 28, 1, 349.00),
(76, 76, 29, 1, 449.00),
(77, 77, 30, 1, 599.00),
(78, 78, 1, 1, 129999.00),
(79, 79, 8, 1, 3499.00),
(80, 80, 6, 1, 1299.00),
(81, 81, 9, 1, 8999.00),
(82, 82, 7, 1, 1999.00),
(83, 83, 3, 1, 29999.00),
(84, 84, 6, 1, 1299.00),
(85, 85, 8, 1, 3499.00),
(86, 86, 2, 1, 79999.00),
(87, 87, 12, 1, 1799.00),
(88, 88, 11, 1, 5499.00),
(89, 89, 15, 1, 8999.00),
(90, 90, 10, 1, 12999.00),
(91, 91, 15, 1, 8999.00),
(92, 92, 17, 1, 2499.00),
(93, 93, 19, 1, 3499.00),
(94, 94, 22, 1, 599.00),
(95, 95, 23, 1, 15999.00),
(96, 96, 25, 1, 399.00),
(97, 97, 26, 1, 499.00),
(98, 98, 27, 1, 349.00),
(99, 99, 28, 1, 349.00),
(100, 100, 29, 1, 449.00),
(101, 101, 30, 1, 599.00),
(102, 102, 1, 1, 129999.00),
(103, 103, 8, 1, 3499.00),
(104, 104, 6, 1, 1299.00),
(105, 105, 9, 1, 8999.00),
(106, 106, 7, 1, 1999.00),
(107, 107, 3, 1, 29999.00),
(108, 108, 6, 1, 1299.00),
(109, 109, 8, 1, 3499.00),
(110, 110, 2, 1, 79999.00),
(111, 111, 12, 1, 1799.00),
(112, 112, 11, 1, 5499.00),
(113, 113, 15, 1, 8999.00),
(114, 114, 10, 1, 12999.00),
(115, 115, 15, 1, 8999.00),
(116, 116, 17, 1, 2499.00),
(117, 117, 19, 1, 3499.00),
(118, 118, 22, 1, 599.00),
(119, 119, 23, 1, 15999.00),
(120, 120, 25, 1, 399.00),
-- Multiple items in single orders (cross-sell ke liye)
(121, 1, 6, 2, 1299.00),
(122, 1, 22, 3, 599.00),
(123, 2, 25, 2, 399.00),
(124, 5, 8, 1, 3499.00),
(125, 7, 6, 2, 1299.00),
(126, 10, 27, 3, 349.00),
(127, 13, 15, 1, 8999.00),
(128, 15, 30, 2, 599.00),
(129, 20, 25, 5, 399.00),
(130, 22, 26, 3, 499.00),
(131, 30, 6, 2, 1299.00),
(132, 35, 25, 4, 399.00),
(133, 38, 6, 1, 1299.00),
(134, 42, 27, 2, 349.00),
(135, 47, 25, 3, 399.00),
(136, 54, 15, 1, 8999.00),
(137, 59, 25, 2, 399.00),
(138, 62, 6, 2, 1299.00),customers
(139, 66, 27, 4, 349.00),
(140, 71, 25, 2, 399.00),
(141, 78, 6, 3, 1299.00),
(142, 83, 25, 2, 399.00),
(143, 86, 6, 1, 1299.00),
(144, 90, 27, 2, 349.00),
(145, 95, 25, 4, 399.00),
(146, 102, 15, 2, 8999.00),
(147, 107, 25, 3, 399.00),
(148, 110, 6, 2, 1299.00),
(149, 114, 27, 1, 349.00),
(150, 119, 25, 2, 399.00),
(151, 3, 25, 1, 399.00),
(152, 4, 27, 2, 349.00),
(153, 6, 22, 2, 599.00),
(154, 9, 30, 1, 599.00),
(155, 11, 25, 3, 399.00),
(156, 14, 26, 2, 499.00),
(157, 17, 27, 1, 349.00),
(158, 19, 25, 2, 399.00),
(159, 21, 28, 3, 349.00),
(160, 24, 29, 1, 449.00),
(161, 26, 30, 2, 599.00),
(162, 28, 25, 4, 399.00),
(163, 31, 26, 1, 499.00),
(164, 33, 27, 2, 349.00),
(165, 36, 25, 3, 399.00),
(166, 39, 28, 2, 349.00),
(167, 41, 29, 1, 449.00),
(168, 44, 30, 2, 599.00),
(169, 46, 25, 1, 399.00),
(170, 49, 26, 3, 499.00),
(171, 51, 27, 2, 349.00),
(172, 53, 28, 1, 349.00),
(173, 56, 29, 2, 449.00),
(174, 58, 30, 1, 599.00),
(175, 61, 25, 2, 399.00),
(176, 64, 26, 1, 499.00),
(177, 67, 27, 3, 349.00),
(178, 69, 28, 1, 349.00),
(179, 72, 29, 2, 449.00),
(180, 74, 30, 1, 599.00),
(181, 76, 25, 2, 399.00),
(182, 79, 26, 1, 499.00),
(183, 81, 27, 2, 349.00),
(184, 84, 28, 3, 349.00),
(185, 87, 29, 1, 449.00),
(186, 89, 30, 2, 599.00),
(187, 92, 25, 1, 399.00),
(188, 94, 26, 2, 499.00),
(189, 97, 27, 1, 349.00),
(190, 99, 28, 2, 349.00),
(191, 101, 29, 1, 449.00),
(192, 104, 30, 3, 599.00),
(193, 106, 25, 1, 399.00),
(194, 109, 26, 2, 499.00),
(195, 112, 27, 1, 349.00),
(196, 115, 28, 2, 349.00),
(197, 117, 29, 1, 449.00),
(198, 120, 30, 2, 599.00),
(199, 1, 26, 1, 499.00),
(200, 2, 6, 2, 1299.00);

INSERT INTO payments (payment_id, order_id, payment_method, payment_date, amount) VALUES
(1, 1, 'UPI', '2024-01-05', 132196.00),
(2, 2, 'Card', '2024-01-08', 32597.00),
(3, 3, 'COD', '2024-01-12', 1698.00),
(4, 4, 'UPI', '2024-01-15', 8999.00),
(5, 5, 'NetBanking', '2024-01-20', 98499.00),
(6, 6, 'UPI', '2024-01-25', 4697.00),
(7, 7, 'Card', '2024-02-01', 82597.00),
(8, 8, 'UPI', '2024-02-05', 1799.00),
(9, 9, 'COD', '2024-02-10', 6098.00),
(10, 10, 'Card', '2024-02-14', 14046.00),
(11, 11, 'UPI', '2024-02-18', 3196.00),
(12, 12, 'NetBanking', '2024-02-22', 8999.00),
(13, 13, 'Card', '2024-03-01', 123899.00),
(14, 14, 'UPI', '2024-03-05', 3997.00),
(15, 15, 'UPI', '2024-03-10', 6198.00),
(16, 16, 'COD', '2024-03-15', 2499.00),
(17, 17, 'UPI', '2024-03-20', 3848.00),
(18, 18, 'Card', '2024-03-25', 8999.00),
(19, 19, 'UPI', '2024-03-30', 3097.00),
(20, 20, 'NetBanking', '2024-04-05', 10994.00),
(21, 21, 'COD', '2024-04-10', 1646.00),
(22, 22, 'UPI', '2024-04-15', 17496.00),
(23, 23, 'Card', '2024-04-20', 1299.00),
(24, 24, 'UPI', '2024-04-25', 847.00),
(25, 25, 'UPI', '2024-05-01', 499.00),
(26, 26, 'COD', '2024-05-05', 949.00),
(27, 27, 'UPI', '2024-05-10', 698.00),
(28, 28, 'Card', '2024-05-15', 1247.00),
(29, 29, 'UPI', '2024-05-20', 599.00),
(30, 30, 'NetBanking', '2024-05-25', 132597.00),
(31, 31, 'UPI', '2024-06-01', 3998.00),
(32, 32, 'Card', '2024-06-05', 1299.00),
(33, 33, 'UPI', '2024-06-10', 9348.00),
(34, 34, 'COD', '2024-06-15', 1999.00),
(35, 35, 'Card', '2024-06-20', 30498.00),
(36, 36, 'UPI', '2024-06-25', 1698.00),
(37, 37, 'UPI', '2024-07-01', 3499.00),
(38, 38, 'Card', '2024-07-05', 81298.00),
(39, 39, 'UPI', '2024-07-10', 1799.00),
(40, 40, 'NetBanking', '2024-07-15', 5499.00),
(41, 41, 'UPI', '2024-07-20', 8999.00),
(42, 42, 'Card', '2024-07-25', 13697.00),
(43, 43, 'UPI', '2024-08-01', 8999.00),
(44, 44, 'COD', '2024-08-05', 2499.00),
(45, 45, 'UPI', '2024-08-10', 3499.00),
(46, 46, 'Card', '2024-08-15', 599.00),
(47, 47, 'UPI', '2024-08-20', 16398.00),
(48, 48, 'UPI', '2024-08-25', 399.00),
(49, 49, 'COD', '2024-09-01', 499.00),
(50, 50, 'UPI', '2024-09-05', 349.00),
(51, 51, 'Card', '2024-09-10', 698.00),
(52, 52, 'UPI', '2024-09-15', 449.00),
(53, 53, 'UPI', '2024-09-20', 599.00),
(54, 54, 'NetBanking', '2024-09-25', 138997.00),
(55, 55, 'UPI', '2024-10-01', 3499.00),
(56, 56, 'Card', '2024-10-05', 1798.00),
(57, 57, 'UPI', '2024-10-10', 8999.00),
(58, 58, 'COD', '2024-10-15', 1999.00),
(59, 59, 'Card', '2024-10-20', 30398.00),
(60, 60, 'UPI', '2024-10-25', 1299.00),
(61, 61, 'UPI', '2024-11-01', 3898.00),
(62, 62, 'Card', '2024-11-05', 81298.00),
(63, 63, 'UPI', '2024-11-10', 1799.00),
(64, 64, 'NetBanking', '2024-11-15', 5499.00),
(65, 65, 'COD', '2024-11-20', 8999.00),
(66, 66, 'Card', '2024-11-25', 13697.00),
(67, 67, 'UPI', '2024-12-01', 8999.00),
(68, 68, 'UPI', '2024-12-05', 2499.00),
(69, 69, 'Card', '2024-12-10', 3499.00),
(70, 70, 'COD', '2024-12-15', 599.00),
(71, 71, 'UPI', '2024-12-20', 15999.00),
(72, 72, 'UPI', '2024-12-25', 399.00),
(73, 73, 'Card', '2025-01-05', 499.00),
(74, 74, 'UPI', '2025-01-10', 349.00),
(75, 75, 'NetBanking', '2025-01-15', 698.00),
(76, 76, 'UPI', '2025-01-20', 449.00),
(77, 77, 'UPI', '2025-01-25', 599.00),
(78, 78, 'Card', '2025-02-01', 133896.00),
(79, 79, 'UPI', '2025-02-05', 3998.00),
(80, 80, 'COD', '2025-02-10', 1299.00),
(81, 81, 'Card', '2025-02-15', 8999.00),
(82, 82, 'UPI', '2025-02-20', 1999.00),
(83, 83, 'NetBanking', '2025-02-25', 30797.00),
(84, 84, 'UPI', '2025-03-01', 1299.00),
(85, 85, 'UPI', '2025-03-05', 3499.00),
(86, 86, 'Card', '2025-03-10', 81298.00),
(87, 87, 'UPI', '2025-03-15', 1799.00),
(88, 88, 'COD', '2025-03-20', 5499.00),
(89, 89, 'UPI', '2025-03-25', 9598.00),
(90, 90, 'Card', '2025-04-01', 13697.00),
(91, 91, 'UPI', '2025-04-05', 8999.00),
(92, 92, 'UPI', '2025-04-10', 2898.00),
(93, 93, 'NetBanking', '2025-04-15', 3499.00),
(94, 94, 'COD', '2025-04-20', 599.00),
(95, 95, 'UPI', '2025-04-25', 16398.00),
(96, 96, 'Card', '2025-05-01', 399.00),
(97, 97, 'UPI', '2025-05-05', 499.00),
(98, 98, 'UPI', '2025-05-10', 698.00),
(99, 99, 'COD', '2025-05-15', 349.00),
(100, 100, 'UPI', '2025-05-20', 449.00),
(101, 101, 'Card', '2025-05-25', 599.00),
(102, 102, 'NetBanking', '2025-06-01', 147997.00),
(103, 103, 'UPI', '2025-06-05', 3499.00),
(104, 104, 'UPI', '2025-06-10', 1299.00),
(105, 105, 'Card', '2025-06-15', 8999.00),
(106, 106, 'COD', '2025-06-20', 1999.00),
(107, 107, 'UPI', '2025-06-25', 30797.00),
(108, 108, 'UPI', '2025-07-01', 1299.00),
(109, 109, 'Card', '2025-07-05', 3499.00),
(110, 110, 'NetBanking', '2025-07-10', 81298.00),
(111, 111, 'UPI', '2025-07-15', 1799.00),
(112, 112, 'UPI', '2025-07-20', 5499.00),
(113, 113, 'COD', '2025-07-25', 8999.00),
(114, 114, 'Card', '2025-08-01', 13348.00),
(115, 115, 'UPI', '2025-08-05', 9698.00),
(116, 116, 'UPI', '2025-08-10', 2499.00),
(117, 117, 'NetBanking', '2025-08-15', 3499.00),
(118, 118, 'COD', '2025-08-20', 599.00),
(119, 119, 'UPI', '2025-08-25', 16798.00),
(120, 120, 'Card', '2025-09-01', 1797.00);

SELECT * FROM customers;
SELECT * FROM order_items;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM products;

-- Q1 List all customers from Delhi along with their email.

SELECT customer_id, first_name, last_name, email
FROM customers
WHERE city = 'Delhi'
ORDER BY first_name;

-- Q2. Find the top 5 most expensive products with their category.

SELECT product_name, category, price
FROM products
ORDER BY price DESC
LIMIT 5;

-- Q3. Show all orders that were cancelled or are still pending.

SELECT order_id, customer_id, order_date, status, total_amount
FROM orders
WHERE status IN ('Cancelled', 'Pending')
ORDER BY order_date;

-- Q4. Find all products with stock less than 50 units.

SELECT product_name, category, stock
FROM products
WHERE stock < 50
ORDER BY stock ASC;

-- Q5. Count total orders placed in each year.

SELECT YEAR(order_date) AS year,
       COUNT(*) AS total_orders
FROM orders
GROUP BY YEAR(order_date)
ORDER BY year;

-- Q6. List all orders with customer name and city.

SELECT o.order_id, 
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       c.city, o.order_date, o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date DESC;

-- Q7. Find customers who never placed any order.

SELECT c.customer_id, 
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       c.email, c.city
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Q8. Show each order with its product details and quantity.

SELECT o.order_id, o.order_date,
       p.product_name, p.category,
       oi.quantity, oi.price,
       (oi.quantity * oi.price) AS line_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
ORDER BY o.order_id;

-- Q9. Find products that have never been ordered.

SELECT p.product_id, p.product_name, p.category, p.price
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.order_item_id IS NULL;

-- Q10. Show order details with payment method used.

SELECT o.order_id, o.order_date, o.total_amount,
       p.payment_method, p.payment_date
FROM orders o
JOIN payments p ON o.order_id = p.order_id
ORDER BY o.order_date DESC;

-- Q11. Find the total revenue generated from delivered orders.

SELECT SUM(total_amount) AS total_revenue,
       COUNT(*) AS total_orders,
       ROUND(AVG(total_amount), 2) AS avg_order_value
FROM orders
WHERE status = 'Delivered';

-- Q12. Show category-wise total sales revenue.

SELECT p.category,
       SUM(oi.quantity * oi.price) AS total_revenue,
       SUM(oi.quantity) AS units_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Q13. Find the top 5 best-selling products by quantity sold.

SELECT p.product_name, p.category,
       SUM(oi.quantity) AS total_quantity_sold,
       SUM(oi.quantity * oi.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- Q14. Find customers who placed more than 2 orders.

SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       COUNT(o.order_id) AS total_orders,
       SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, customer_name
HAVING COUNT(o.order_id) > 2
ORDER BY total_spent DESC;

-- Q15. Show monthly revenue trend for the year 2024.

SELECT MONTH(order_date) AS month,
       MONTHNAME(order_date) AS month_name,
       COUNT(*) AS total_orders,
       SUM(total_amount) AS revenue
FROM orders
WHERE YEAR(order_date) = 2024 AND status = 'Delivered'
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY month;

-- Q16. Find customers who spent more than the average order value.

SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, customer_name
HAVING SUM(o.total_amount) > (SELECT AVG(total_amount) FROM orders)
ORDER BY total_spent DESC;

-- Q17. Find products priced higher than their category's average price.

SELECT p1.product_name, p1.category, p1.price,
       (SELECT ROUND(AVG(p2.price), 2) 
        FROM products p2 
        WHERE p2.category = p1.category) AS category_avg_price
FROM products p1
WHERE p1.price > (
    SELECT AVG(p2.price) 
    FROM products p2 
    WHERE p2.category = p1.category
)
ORDER BY p1.category, p1.price DESC;

-- Q18. Find the second highest priced product in each category.

SELECT product_name, category, price
FROM products p1
WHERE (
    SELECT COUNT(DISTINCT p2.price)
    FROM products p2
    WHERE p2.category = p1.category AND p2.price > p1.price
) = 1
ORDER BY category;

-- Q19. Find the top 3 customers by total spending using CTE.

WITH customer_spending AS (
    SELECT customer_id, 
           SUM(total_amount) AS total_spent,
           COUNT(order_id) AS total_orders
    FROM orders
    WHERE status = 'Delivered'
    GROUP BY customer_id
)
SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       c.city,
       cs.total_orders,
       cs.total_spent
FROM customer_spending cs
JOIN customers c ON cs.customer_id = c.customer_id
ORDER BY cs.total_spent DESC
LIMIT 3;




-- Q20. Find the top-selling product in each category using CTE.

WITH product_sales AS (
    SELECT p.category,
           p.product_name,
           SUM(oi.quantity) AS total_sold,
           SUM(oi.quantity * oi.price) AS revenue,
           RANK() OVER (PARTITION BY p.category 
                        ORDER BY SUM(oi.quantity * oi.price) DESC) AS rnk
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY p.category, p.product_name
)
SELECT category, product_name, total_sold, revenue
FROM product_sales
WHERE rnk = 1
ORDER BY revenue DESC;



