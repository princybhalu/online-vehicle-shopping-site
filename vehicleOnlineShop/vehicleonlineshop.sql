-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2022 at 09:03 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vehicleonlineshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_no` int(100) NOT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `roll_id` int(10) NOT NULL DEFAULT 2,
  `gender` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `password`, `phone_no`, `address`, `roll_id`, `gender`) VALUES
(1, 'nita', 'asd', 362839282, '304- Haridwar APP. , Rajkot-360004', 2, 'Female'),
(3, 'Megha Joshi', 'asd', 54788202, 'bhavanagar', 2, 'Female'),
(4, 'admin', 'admin', 123456789, 'balaji hall,Rajkot', 1, 'Female'),
(5, 'princy bhalu', 'pr', 73455, 'sagar chowk, B/H balaji Hali , rajkot', 2, 'Female'),
(6, 'Kishu', '123', 8141574, 'rajkot', 2, 'Female'),
(11, 'h', 'as', 12, NULL, 2, NULL),
(12, 'abc', 'asd', 12345678, NULL, 2, NULL),
(13, 'harshil', '123', 2222, NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `id` int(100) NOT NULL,
  `uid` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`id`, `uid`, `pid`, `Date`) VALUES
(1, 1, 1, '2022-03-27'),
(2, 1, 4, '2022-03-27'),
(3, 6, 3, '2022-03-28');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(200) NOT NULL,
  `name` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `feature` varchar(200) NOT NULL,
  `stock` int(200) NOT NULL,
  `imageurl` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `company`, `price`, `feature`, `stock`, `imageurl`) VALUES
(1, 'Bugatti Veyron', 'Bugatti', '12.00 Cr', 'Bugatti is expected to use the W16 8.0 liter engine from the Veyron that may produce more than 1500 PS and will add to the Formula1 car beating performance.', 17, 'https://www.bugatti.com/fileadmin/_processed_/sei/p471/se-image-5b1dff7be0992234880ee39d76bc7339.jpg'),
(3, 'Rolls-Royce Ghost', 'Rolls-Royce', '7.95 Cr', 'Rolls-Royce has equipped it with a digital driver display,a 1300W audio system, a head-up display, an illuminated dashboard, and an infotainment system.', 20, 'https://manofmany.com/wp-content/uploads/2021/09/3-Rolls-Royce-Ghost-Review.jpg'),
(4, 'Lamborghini Huracan EVO', 'Lamborghini', '4.99 Cr', ' Lamborghini offers six different variants of the Huracan which include an all-wheel drive coupe, a rear-wheel drive coupe, the slightly unhinged ?Performante? edition and the limited edition Avio.', 34, 'https://autonexa.com/wp-content/uploads/2020/05/lamborghini-huracan-evo-rwd.jpg'),
(5, 'BMW 3 Series Gran Limousine', 'BMW', '55.50 Lakh', 'The BMW 3 Series Gran Limousine has 1 Diesel Engine and 1 Petrol Engine on offer. The Diesel engine is 1995 cc while the Petrol engine is 1998 cc .', 2, 'https://stimg.cardekho.com/images/carexteriorimages/930x620/BMW/3-Series-Gran-Limousine/8267/1610690343895/front-left-side-47.jpg'),
(6, 'Maruti Suzuki 800', 'Maruti Suzuki', '5,000 ', 'With upgraded exteriors and interiors, the new Alto is more than a budget-car! Book Now. The new stylish look makes Maruti Suzuki Alto even more appealing from the outside', 100, 'https://www.jansatta.com/wp-content/uploads/2020/05/Maruti-800-Modification-small.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `uid` int(100) NOT NULL,
  `pid` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `uid`, `pid`) VALUES
(1, 1, 1),
(2, 5, 4),
(3, 1, 4),
(5, 1, 5),
(6, 6, 1),
(7, 6, 4),
(8, 6, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid is not found2` (`uid`),
  ADD KEY `pid is not found2` (`pid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid is not found` (`uid`),
  ADD KEY `pid is not found` (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `pid is not found2` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `uid is not found2` FOREIGN KEY (`uid`) REFERENCES `customer` (`id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `pid is not found` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `uid is not found` FOREIGN KEY (`uid`) REFERENCES `customer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
