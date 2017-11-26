-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2017 at 10:27 PM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ssdieventmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`id` int(10) NOT NULL,
  `category_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`) VALUES
(1, 'Sports'),
(2, 'Recreation'),
(3, 'Academic'),
(4, 'Fitness'),
(5, 'Dance'),
(6, 'Career'),
(7, 'Entertainment'),
(8, 'Cultural'),
(9, 'Special Events'),
(10, 'Religious');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
`id` int(10) NOT NULL,
  `first_name` varchar(12) NOT NULL,
  `last_name` varchar(12) DEFAULT NULL,
  `line1` varchar(25) NOT NULL,
  `line2` varchar(25) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `state` varchar(15) DEFAULT NULL,
  `zip` int(5) DEFAULT NULL,
  `reportsTo` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `first_name`, `last_name`, `line1`, `line2`, `city`, `state`, `zip`, `reportsTo`) VALUES
(1, 'Adhish', 'Thite', '9343 John Kirk', NULL, 'San Diego', 'California', 24533, NULL),
(2, 'Alisha', 'Gujarathi', '454 Palmilla', NULL, 'San Diego', 'California', 24533, 1),
(3, 'Ashwini', 'Kasbekar', '23 bulls', NULL, 'Chicago', 'Illinois', 60176, 1),
(4, 'Pranav', 'Tambvekar', '45 Snow Island', NULL, 'San Diego', 'California', 24533, 1),
(5, 'Ripal', 'Bhavsar', '13 Biscayne Boulevard', NULL, 'Miami', 'Florida', 33018, 1),
(6, 'Siddhanth', 'Gokule', 'Hollywood', NULL, 'Los Angeles', 'California', 90001, 1);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
`id` int(10) NOT NULL,
  `event_name` varchar(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `event_start` datetime NOT NULL,
  `event_end` datetime NOT NULL,
  `venue_id` int(10) DEFAULT NULL,
  `imp_flag` varchar(10) DEFAULT NULL,
  `featured_flag` varchar(11) NOT NULL,
  `host_id` int(10) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `event_name`, `description`, `category_id`, `event_start`, `event_end`, `venue_id`, `imp_flag`, `featured_flag`, `host_id`) VALUES
(1, 'FoodFest', 'Enjoy the tastes of Charlotte, watch food skills demos and pick up fresh, delicious and real local food.', 7, '2017-11-26 11:00:00', '2017-11-26 13:00:00', 4, 'imp', '0', 1),
(2, 'RecFest', 'Come kick off the school year in style!RecFest is open to the public and will feature free food from local vendors, music, games, sport club information/demonstrations, and give-aways! ', 2, '2017-11-27 14:00:00', '2017-11-27 18:00:00', 7, NULL, '0', 2),
(3, 'Career Carnival', 'Join us at the Career Carnival for food, prizes, and lots of games! Learn how your University Career Center can help you in your academic and career planning', 3, '2017-11-28 17:00:00', '2017-11-28 20:00:00', 3, 'imp', '0', 7),
(4, 'Haunted Union', 'Experience the Student Union all decked out for Halloween. The Multipurpose Room will be transformed into a haunted maze that will be sure to scare you! ', 7, '2017-11-29 08:45:00', '2017-11-29 11:00:00', 4, '', '0', 1),
(5, 'Self Therapy Project', 'Our Self-therapy Project is based on the Cognitive Behavioral Therapy (CBT) group therapy manual. Students will develop skills to manage their stress and prevent depression in the future', 4, '2017-11-29 09:00:00', '2017-11-29 16:00:00', 6, NULL, 'featured', 8),
(6, 'MathsMiracles', 'Learn helpful tips to solve math problems quickly', 3, '2017-12-06 18:00:00', '2017-12-07 12:00:00', 5, NULL, '0', 6),
(7, 'Military Appreciatio', 'The Charlotte 49ers take on Middle Tennessee Blue Raiders for the Military Appreciation Day football game.', 1, '2017-12-11 14:00:00', '2017-12-11 17:00:00', 1, NULL, 'featured', 7),
(8, 'Workshop: I''m Stress', 'Increase your awareness of stress and how to minimize stressors in your lives.', 4, '2017-12-20 10:00:00', '2017-12-20 13:00:00', 6, 'imp', '0', 5),
(9, 'Bajo La Misma Luna C', 'Bajo La Misma Luna (Under the Same Moon) Charity Ball is an event the Epsilon Phi Chapter of Lambda Theta Alpha, hosts annually.This year we will have a masquearde theme, so make sure to dress formall', 9, '2017-12-04 15:00:00', '2017-12-04 17:00:00', 1, NULL, 'featured', 2),
(10, 'African Night', 'The 2017 African Night is a cultural showcase of everything Africa. This year, our theme will be Scary Movie Africa!', 8, '2018-01-15 14:00:00', '2018-01-15 16:00:00', 3, 'imp', '0', 8);

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE IF NOT EXISTS `guest` (
`other_id` int(10) NOT NULL,
  `guest_id` varchar(9) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`other_id`, `guest_id`) VALUES
(3, 'RMike12'),
(8, 'MonGel7'),
(10, 'ThomR54'),
(12, 'MarkT67');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
`id` int(10) NOT NULL,
  `first_name` varchar(12) NOT NULL,
  `last_name` varchar(12) DEFAULT NULL,
  `line1` varchar(35) NOT NULL,
  `line2` varchar(25) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `state` varchar(15) DEFAULT NULL,
  `zip` int(5) DEFAULT NULL,
  `email_address` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `first_name`, `last_name`, `line1`, `line2`, `city`, `state`, `zip`, `email_address`) VALUES
(1, 'Andy', 'Alec', '9527 University Terrace Drive', 'Apt F', 'Charlotte', 'North Carolina', 28262, 'AndyAlec@uncc.edu'),
(2, 'Harvey', 'Specter', '9544 University Terrace Drive', 'Wallis Lane', 'Charlotte', 'North Carolina', 28262, 'HarveySpecter@uncc.edu'),
(3, 'Mike', 'Ross', '9544 University Terrace Drive', 'Apt F', 'Charlotte', 'North Carolina', 28262, 'MikeRoss@uncc.edu'),
(4, 'Rachel', 'Green', '9544 University Terrace Drive', 'Apt A', 'Charlotte', 'North Carolina', 28262, 'RachelGreen@uncc.edu'),
(5, 'Tina', 'Tisco', '926 Spring Mist Court', 'Apt K', 'Sugar Land', 'Texas', 77479, 'TinaTisco@uncc.edu'),
(6, 'Ness', 'Wadia', '10004 Graduate Ln Apt B', NULL, 'Charlotte', 'North Carolina', 28262, 'NessWadia@uncc.edu'),
(7, 'Chandler', 'Bing', '10004 Graduate Ln Apt B', '8th Street West\n', 'Charlotte', 'North Carolina', 28262, 'ChandlerBing@uncc.edu'),
(8, 'Monika', 'Geller', '10004 Graduate Ln Apt B', 'Circle Drive', 'Charlotte', 'North Carolina', 28262, 'MonikaGeller@uncc.edu'),
(9, 'Sansa', 'Stark', '10004 Graduate Ln Apt B', NULL, 'Charlotte', 'North Carolina', 28262, 'SansaStark@uncc.edu'),
(10, 'Richie', 'Thomas', '209 Barton Creek Drive ', 'Oxford Court', 'Charlotte', 'North Carolina', 28262, 'RichieThomas@uncc.edu'),
(11, 'James', 'McEntire', '345 North Jennings Street', 'Center Street', 'Alabaster', 'Albama', 35007, 'James.Mce@gmail.com'),
(12, 'Mark', 'Thompson', '947 Beach Court', 'Apartment G', 'Neenah', 'Wisconson', 54956, 'MarkAThompson@teleworm.us'),
(13, 'Lisa', 'Williams', '8 Fawn Drive ', 'Mecklenberg County', 'Baton Rouge', 'Los Angeles', 70806, 'LisaTWilliams@jourrapide.com');

-- --------------------------------------------------------

--
-- Table structure for table `personlogin`
--

CREATE TABLE IF NOT EXISTS `personlogin` (
  `id` int(10) NOT NULL DEFAULT '0',
  `pass` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personlogin`
--

INSERT INTO `personlogin` (`id`, `pass`) VALUES
(1, 'password@1'),
(2, 'password@2'),
(3, 'password@3'),
(4, 'password@4'),
(5, 'password@5'),
(6, 'password@6'),
(7, 'password@7'),
(8, 'password@8'),
(9, 'password@9'),
(10, 'password@10'),
(11, 'password@11'),
(12, 'password@12'),
(13, 'password@13');

-- --------------------------------------------------------

--
-- Table structure for table `personphone`
--

CREATE TABLE IF NOT EXISTS `personphone` (
  `person_id` int(10) NOT NULL,
  `phone_no` varchar(16) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personphone`
--

INSERT INTO `personphone` (`person_id`, `phone_no`) VALUES
(1, '2025550116'),
(2, '2025550143'),
(3, '2025550193'),
(4, '2025550182'),
(5, '2025550149'),
(6, '2025550179'),
(7, '2515469442'),
(8, '1255464478'),
(9, '9495694371'),
(10, '6304468851'),
(11, '2269062721'),
(12, '6719251352'),
(13, '2777406794');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `person_id` int(10) NOT NULL DEFAULT '0',
  `booked_event_id` int(10) NOT NULL DEFAULT '0',
  `date_booked` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`person_id`, `booked_event_id`, `date_booked`) VALUES
(1, 3, '2017-12-20'),
(2, 1, '2017-11-30'),
(3, 6, '2017-12-10'),
(4, 2, '2017-12-01'),
(5, 9, '2017-12-12'),
(6, 3, '2017-12-24'),
(7, 4, '2018-01-10'),
(8, 9, '2017-11-12'),
(9, 5, '2017-12-29'),
(10, 7, '2017-12-25'),
(11, 5, '2017-12-31'),
(12, 8, '2017-11-08'),
(13, 10, '2017-11-14');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `member_id` int(10) DEFAULT NULL,
  `category_name` varchar(20) DEFAULT NULL,
  `event_name` varchar(20) DEFAULT NULL,
  `rating` varchar(20) DEFAULT NULL,
  `comments` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `staff_id` int(10) NOT NULL,
  `employee_id` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `employee_id`) VALUES
(1, 'AA0012'),
(5, 'TT0014'),
(7, 'CB0015'),
(11, 'JM0013');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `student_id` int(10) NOT NULL,
  `university_id` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `university_id`) VALUES
(2, 'UN37281'),
(4, 'UN19365'),
(6, 'UN18760'),
(9, 'UN13784'),
(13, 'UN23671');

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE IF NOT EXISTS `venue` (
`id` int(10) NOT NULL,
  `venue_name` varchar(25) NOT NULL,
  `location_type` varchar(10) NOT NULL,
  `capacity` int(10) NOT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`id`, `venue_name`, `location_type`, `capacity`, `opening_time`, `closing_time`) VALUES
(1, 'Duke Hall', 'indoor', 10, '08:00:00', '18:00:00'),
(3, 'Student Union', 'indoor', 25, '07:00:00', '22:00:00'),
(4, 'Greg Ground', 'outdoor', 50, '08:00:00', '18:00:00'),
(5, 'SAC Center', 'outdoor', 300, '08:00:00', '20:00:00'),
(6, 'East Deck Hall', 'indoor', 100, '08:00:00', '22:00:00'),
(7, 'John Kirk Ground', 'outdoor', 100, '16:00:00', '21:00:00'),
(8, 'Gym', 'indoor', 50, '06:00:00', '23:00:00'),
(9, 'Basketball Court', 'outdoor', 100, '08:00:00', '22:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
 ADD PRIMARY KEY (`id`), ADD KEY `Venue` (`venue_id`), ADD KEY `Person` (`host_id`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
 ADD PRIMARY KEY (`other_id`,`guest_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
 ADD PRIMARY KEY (`id`,`email_address`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `personlogin`
--
ALTER TABLE `personlogin`
 ADD PRIMARY KEY (`id`,`pass`);

--
-- Indexes for table `personphone`
--
ALTER TABLE `personphone`
 ADD PRIMARY KEY (`person_id`,`phone_no`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
 ADD PRIMARY KEY (`person_id`,`booked_event_id`), ADD KEY `booked_event_id` (`booked_event_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
 ADD PRIMARY KEY (`staff_id`,`employee_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
 ADD PRIMARY KEY (`student_id`,`university_id`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
MODIFY `other_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `guest`
--
ALTER TABLE `guest`
ADD CONSTRAINT `Guest_ibfk_1` FOREIGN KEY (`other_id`) REFERENCES `person` (`id`);

--
-- Constraints for table `personphone`
--
ALTER TABLE `personphone`
ADD CONSTRAINT `PersonPhone_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
ADD CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `person` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
