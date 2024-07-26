-- Table for product information 
CREATE TABLE `products` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `description` TEXT,
    `category` VARCHAR(50),
    `price` DECIMAL(10, 2) NOT NULL,
    `cost` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY(`id`)
);

-- Table for supplier information 
CREATE TABLE `suppliers` (
    `supplier_id` INT AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `contact_details` TEXT,
    `address` TEXT,
    PRIMARY KEY(`supplier_id`)
);

-- M-M relationship between products and suppliers table 
CREATE TABLE `ProductSuppliers` (
        `product_id` INT, 
        `supplier_id` INT,
        PRIMARY KEY(`product_id`, `supplier_id`),
        FOREIGN KEY(`product_id`) REFERENCES `products`(`id`),
        FOREIGN KEY(`supplier_id`) REFERENCES `suppliers`(`supplier_id`)
);

-- Table for customer information 
CREATE TABLE `customers` (
    `customer_id` INT AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `contact_details` TEXT,
    `address` TEXT,
    PRIMARY KEY(`customer_id`)
);

-- Table for order information 
CREATE TABLE `orders` (
    `order_id` INT AUTO_INCREMENT,
    `customer_id` INT,
    `order_date` DATE,
    `status` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`order_id`),
    FOREIGN KEY(`customer_id`) REFERENCES `customers`(`customer_id`)
);

-- M-M relationship between orders and products table 
CREATE TABLE `OrderDetails` (
    `order_id` INT, 
    `product_id` INT, 
    `quantity` INT NOT NULL,
    PRIMARY KEY(`order_id`, `product_id`),
    FOREIGN KEY(`order_id`) REFERENCES `orders`(`order_id`),
    FOREIGN KEY(`product_id`) REFERENCES `products`(`id`)
);

-- Table for warehouse information 
CREATE TABLE `warehouses` (
    `id` INT,
    `name` TEXT NOT NULL,
    `location` TEXT, 
    `capacity` INTEGER,
    PRIMARY KEY(`id`)
);

-- Table for managing inventory, linking products and warehouses 
CREATE TABLE `inventory` (
    `id` INT,
    `product_id` INT,
    `warehouse_id` INT,
    `quantity` INT NOT NULL,
    FOREIGN KEY(`product_id`) REFERENCES `products`(`id`),
    FOREIGN KEY(`warehouse_id`) REFERENCES `warehouses`(`id`)
);