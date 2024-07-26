INSERT INTO `products` (`name`, `description`, `category`, `price`, `cost`)
VALUES
('Widget A', 'High-quality widget for various uses', 'Widgets', 15.99, 8.50),
('Gadget B', 'Advanced gadget with multiple functions', 'Gadgets', 25.50, 15.00),
('Tool C', 'Durable tool for industrial applications', 'Tools', 40.00, 25.00),
('Device D', 'Compact and efficient electronic device', 'Electronics', 75.00, 55.00),
('Accessory E', 'Essential accessory for various products', 'Accessories', 10.00, 5.00);

INSERT INTO `suppliers` (`name`, `contact_details`, `address`)
VALUES
('Supplier One', 'Email: contact@supplierone.com, Phone: 123-456-7890', '123 Supplier Lane, City, Country'),
('Supplier Two', 'Email: info@suppliertwo.com, Phone: 234-567-8901', '456 Distributor Road, City, Country'),
('Supplier Three', 'Email: sales@supplierthree.com, Phone: 345-678-9012', '789 Warehouse Blvd, City, Country'),
('Supplier Four', 'Email: support@supplierfour.com, Phone: 456-789-0123', '1011 Manufacturing Way, City, Country'),
('Supplier Five', 'Email: orders@supplierfive.com, Phone: 567-890-1234', '1213 Production St, City, Country');


INSERT INTO `customers` (`name`, `contact_details`, `address`)
VALUES
('John Doe', 'Email: johndoe@example.com, Phone: 987-654-3210', '123 Customer St, Town, Country'),
('Jane Smith', 'Email: janesmith@example.com, Phone: 876-543-2109', '456 Buyer Ave, Town, Country'),
('Alice Johnson', 'Email: alicej@example.com, Phone: 765-432-1098', '789 Consumer Blvd, Town, Country'),
('Bob Brown', 'Email: bobbrown@example.com, Phone: 654-321-0987', '1011 Purchaser Rd, Town, Country'),
('Charlie Davis', 'Email: cdavis@example.com, Phone: 543-210-9876', '1213 Shopper Lane, Town, Country');

INSERT INTO `orders` (`customer_id`, `order_date`, `status`)
VALUES
(1, '2023-07-01', 'Shipped'),
(2, '2023-07-05', 'Pending'),
(3, '2023-07-07', 'Delivered'),
(4, '2023-07-09', 'Processing'),
(5, '2023-07-10', 'Cancelled');

INSERT INTO `inventory` (`product_id`, `warehouse_id`, `quantity`)
VALUES
(1, 1, 150),
(2, 2, 80),
(3, 1, 200),
(4, 3, 50),
(5, 2, 120);

