-- Add a new product
INSERT INTO `products` (`name`, `description`, `category`, `price`, `cost`)
VALUES
('Widget A', 'High-quality widget for various uses', 'Widgets', 15.99, 8.50),
('Gadget B', 'Advanced gadget with multiple functions', 'Gadgets', 25.50, 15.00),
('Tool C', 'Durable tool for industrial applications', 'Tools', 40.00, 25.00),
('Device D', 'Compact and efficient electronic device', 'Electronics', 75.00, 55.00),
('Accessory E', 'Essential accessory for various products', 'Accessories', 10.00, 5.00);

-- Add a new supplier 
INSERT INTO `suppliers` (`name`, `contact_details`, `address`)
VALUES
('Supplier One', 'Email: contact@supplierone.com, Phone: 123-456-7890', '123 Supplier Lane, City, Country'),
('Supplier Two', 'Email: info@suppliertwo.com, Phone: 234-567-8901', '456 Distributor Road, City, Country'),
('Supplier Three', 'Email: sales@supplierthree.com, Phone: 345-678-9012', '789 Warehouse Blvd, City, Country'),
('Supplier Four', 'Email: support@supplierfour.com, Phone: 456-789-0123', '1011 Manufacturing Way, City, Country'),
('Supplier Five', 'Email: orders@supplierfive.com, Phone: 567-890-1234', '1213 Production St, City, Country');

-- Add a new customer
INSERT INTO `customers` (`name`, `contact_details`, `address`)
VALUES
('John Doe', 'Email: johndoe@example.com, Phone: 987-654-3210', '123 Customer St, Town, Country'),
('Jane Smith', 'Email: janesmith@example.com, Phone: 876-543-2109', '456 Buyer Ave, Town, Country'),
('Alice Johnson', 'Email: alicej@example.com, Phone: 765-432-1098', '789 Consumer Blvd, Town, Country'),
('Bob Brown', 'Email: bobbrown@example.com, Phone: 654-321-0987', '1011 Purchaser Rd, Town, Country'),
('Charlie Davis', 'Email: cdavis@example.com, Phone: 543-210-9876', '1213 Shopper Lane, Town, Country');

-- Add a new order 
INSERT INTO `orders` (`customer_id`, `order_date`, `status`)
VALUES
(1, '2023-07-01', 'Shipped'),
(2, '2023-07-05', 'Pending'),
(3, '2023-07-07', 'Delivered'),
(4, '2023-07-09', 'Processing'),
(5, '2023-07-10', 'Cancelled');

-- Add a new inventory 
INSERT INTO `inventory` (`product_id`, `warehouse_id`, `quantity`)
VALUES
(1, 1, 150),
(2, 2, 80),
(3, 1, 200),
(4, 3, 50),
(5, 2, 120);

-- Add a new warehouse 
INSERT INTO `warehouses` (`name`, `location`, `capacity`)
VALUES
('Central Warehouse', '123 Main St, Central City, Country', 5000),
('East Warehouse', '456 East Ave, East Town, Country', 3000),
('West Warehouse', '789 West Blvd, West City, Country', 4000),
('North Warehouse', '101 North Rd, North City, Country', 3500),
('South Warehouse', '202 South St, South Town, Country', 2500);

-- Retrieve all products along with their categories and prices 
SELECT `id`, `name`, `category`, `price` 
FROM `products`; 

-- Find all products in a specific warehouse 
SELECT p.`id`, p.`name`, i.`quantity`
FROM `products` p 
JOIN `inventory` i ON p.`id` = i.`product_id`
WHERE i.`warehouse_id` = 1; 

-- List all suppliers for a specific product 
SELECT s.`supplier_id`, s.`name`
FROM `suppliers` s 
JOIN `ProductSuppliers` ps ON s.`supplier_id` = ps.`supplier_id`
WHERE ps.`product_id` = 5; 

-- List all products provided by a specific supplier 
SELECT p.`id`, p.`name`, p.`category`
FROM `products` p 
JOIN `ProductSuppliers` ps ON p.`id` = ps.`product_id`
WHERE ps.`supplier_id` = 200; 

-- Find all products whose cost is below 10
SELECT `name`, `price`
FROM `products`
WHERE `cost` < 10;

-- Finding customers whose name starts with 'A'
SELECT `customer_id`, `name` FROM `customers`
WHERE `name` LIKE 'A%';

-- Calculate the total quantity of a specific product across all warehouses 
SELECT p.`id`, p.`name`, SUM(i.`quantity`) AS `total_quantity`
FROM `products` p
JOIN `inventory` i ON p.`id` = i.`product_id`
GROUP BY p.`id`, p.`name`; 

-- Retrieve all orders placed by a specific customer 
SELECT o.`order_id`, o.`order_date`, o.`status`
FROM `orders` o 
WHERE o.`customer_id` = 100; 

-- Create stored procedure that deletes a product from the `products`
delimiter //
CREATE PROCEDURE `DeleteProduct`(
    IN `prod_id` INT
)
BEGIN
    DELETE FROM `inventory` WHERE `product_id` = `prod_id`;
    DELETE FROM `ProductSuppliers` WHERE `product_id` = `prod_id`;
    DELETE FROM `products` WHERE id = `prod_id`;
END//
delimiter; 

-- Create trigger for reducing quantity of ordered product
CREATE TRIGGER `after_order`
AFTER INSERT ON `OrderDetails`
FOR EACH ROW
BEGIN
    UPDATE `inventory`
    SET `quantity` = `quantity` - New.`quantity`
    WHERE `product_id` = New.`product_id`;
END;

-- Create trigger for order cancellation
CREATE TRIGGER `after_order_cancel`
AFTER DELETE ON `OrderDetails`
FOR EACH ROW
BEGIN
    UPDATE `inventory`
    SET `quantity` = `quantity` + OLD.`quantity`
    WHERE `product_id` = OLD.`product_id`;
END;