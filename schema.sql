CREATE TABLE `products` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `category` VARCHAR(50) NULL,
    `Quantity` INT,
    `price` DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(`id`)
)

CREATE TABLE `suppliers` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(100),
    `contact` VARCHAR(100),
    PRIMARY KEY(`id`)
)

CREATE TABLE `customer` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(30),
    `contact` VARCHAR(100),
    PRIMARY KEY(`id`)
)

CREATE TABLE `orders` (
    `id` INT AUTO_INCREMENT,
    `date` DATE,
    `customer_id` INT,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`customer_id`) REFERENCES `customers`(`customer_id`)
)

CREATE TABLE `transactions` (
    `id` INT,
    `product_id` INT,
    `quantity` INT,
    `date` DATE,
    `type` VARCHAR(50),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`product_id`) REFERENCES `products`(`id`)
)