-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2022 at 05:37 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be15_cr9_famazon_katek`
--
CREATE DATABASE IF NOT EXISTS `be15_cr9_famazon_katek` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `be15_cr9_famazon_katek`;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `fk_region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `name`, `fk_region_id`) VALUES
(1, 'Stonks&Co', 1),
(2, 'Balalaika&Medved', 2),
(3, 'Trump&Ford', 3),
(4, 'Sushi&Rolls', 4);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `username` varchar(80) NOT NULL,
  `address` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `fk_discount_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `username`, `address`, `email`, `fk_discount_id`) VALUES
(1, 'Harold Krumpen', 'hkrump', 'Musterstraße 1, Musterstadt', 'hkrumpen@email.de', 2),
(2, 'Ivan Ivanov', 'iivan', 'Primernaya ul, Primer', 'iivan@email.ru', 1),
(3, 'Kim Chi', 'kchi', 'Citystreet 2, City', 'kchi@email.ch', 2),
(4, 'Kevin McDonalds', 'mckey', 'Street 5, BigCity', 'mckey@email.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `discount_id` int(11) NOT NULL,
  `special_offer_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`discount_id`, `special_offer_name`) VALUES
(1, 'Spring Sale'),
(2, 'Favourite Customer Sale');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_date` datetime NOT NULL,
  `fk_customer_id` int(11) NOT NULL,
  `fk_payment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `invoice_date`, `fk_customer_id`, `fk_payment_id`) VALUES
(1, '2022-03-10 15:36:52', 1, 2),
(2, '2022-03-01 15:36:52', 4, 4),
(3, '2022-02-13 15:37:43', 3, 1),
(4, '2022-02-20 15:37:43', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `product_amount` int(11) NOT NULL,
  `fk_invoice_id` int(11) NOT NULL,
  `fk_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`product_amount`, `fk_invoice_id`, `fk_product_id`) VALUES
(3, 1, 1),
(2, 2, 3),
(5, 3, 2),
(1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `fk_invoice_id` int(11) NOT NULL,
  `fk_payment_form` int(11) NOT NULL,
  `payment_date` datetime NOT NULL,
  `fk_shipment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `fk_invoice_id`, `fk_payment_form`, `payment_date`, `fk_shipment_id`) VALUES
(1, 3, 3, '2022-03-12 15:59:04', 1),
(2, 1, 1, '2022-03-13 15:59:04', 2),
(3, 4, 4, '2022-03-11 15:59:45', 4),
(4, 3, 1, '2022-03-12 15:59:45', 3);

-- --------------------------------------------------------

--
-- Table structure for table `payment_form`
--

CREATE TABLE `payment_form` (
  `payment_form_id` int(11) NOT NULL,
  `payment_form_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_form`
--

INSERT INTO `payment_form` (`payment_form_id`, `payment_form_name`) VALUES
(1, 'BirneZahl'),
(3, 'EasternUnion'),
(4, 'FastMon'),
(2, 'GunglPay');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `price` int(11) NOT NULL,
  `fk_company_id` int(11) NOT NULL,
  `fk_stock_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `price`, `fk_company_id`, `fk_stock_id`) VALUES
(1, 'Apple Stonks', 2000, 1, 1),
(2, 'Vodka', 80, 2, 2),
(3, 'Nori', 3, 4, 1),
(4, 'Ford Engine', 5000, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `region_id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`region_id`, `name`) VALUES
(3, 'America'),
(4, 'China'),
(1, 'EU'),
(2, 'Russia');

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

CREATE TABLE `shipment` (
  `shipment_id` int(11) NOT NULL,
  `fk_payment_id` int(11) NOT NULL,
  `fk_shipment_company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipment`
--

INSERT INTO `shipment` (`shipment_id`, `fk_payment_id`, `fk_shipment_company_id`) VALUES
(1, 2, 4),
(2, 1, 3),
(3, 3, 1),
(4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shipment_company`
--

CREATE TABLE `shipment_company` (
  `shipment_company_id` int(11) NOT NULL,
  `sc_name` varchar(80) NOT NULL,
  `sc_country` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipment_company`
--

INSERT INTO `shipment_company` (`shipment_company_id`, `sc_name`, `sc_country`) VALUES
(1, 'FastAF', 'USA'),
(2, 'Schnell&Einfach', 'Germany'),
(3, 'Segodnya', 'Russia'),
(4, 'ChiExpress', 'China');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `stock_id` int(11) NOT NULL,
  `instock` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_id`, `instock`) VALUES
(1, 1),
(2, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `fk_region_id` (`fk_region_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `name` (`name`,`username`,`address`,`email`),
  ADD KEY `fk_discount_id` (`fk_discount_id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discount_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_payment_id` (`fk_payment_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`fk_invoice_id`,`fk_product_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`),
  ADD KEY `fk_payment_form` (`fk_payment_form`),
  ADD KEY `fk_shipment_id` (`fk_shipment_id`);

--
-- Indexes for table `payment_form`
--
ALTER TABLE `payment_form`
  ADD PRIMARY KEY (`payment_form_id`),
  ADD UNIQUE KEY `payment_form_name` (`payment_form_name`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `fk_company_id` (`fk_company_id`),
  ADD KEY `fk_stock_id` (`fk_stock_id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`region_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`shipment_id`),
  ADD KEY `fk_shipment_company_id` (`fk_shipment_company_id`),
  ADD KEY `fk_payment_id` (`fk_payment_id`);

--
-- Indexes for table `shipment_company`
--
ALTER TABLE `shipment_company`
  ADD PRIMARY KEY (`shipment_company_id`),
  ADD UNIQUE KEY `sc_name` (`sc_name`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_form`
--
ALTER TABLE `payment_form`
  MODIFY `payment_form_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `region_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shipment_company`
--
ALTER TABLE `shipment_company`
  MODIFY `shipment_company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`fk_region_id`) REFERENCES `region` (`region_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_discount_id`) REFERENCES `discount` (`discount_id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_payment_id`) REFERENCES `payment` (`payment_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`fk_payment_form`) REFERENCES `payment_form` (`payment_form_id`),
  ADD CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`fk_shipment_id`) REFERENCES `shipment` (`shipment_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`fk_company_id`) REFERENCES `company` (`company_id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`fk_stock_id`) REFERENCES `stock` (`stock_id`);

--
-- Constraints for table `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`fk_shipment_company_id`) REFERENCES `shipment_company` (`shipment_company_id`),
  ADD CONSTRAINT `shipment_ibfk_2` FOREIGN KEY (`fk_payment_id`) REFERENCES `payment` (`payment_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
