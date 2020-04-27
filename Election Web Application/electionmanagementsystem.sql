-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2020 at 09:33 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electionmanagementsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `events` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `events`) VALUES
(5, 'Voters are require to verify at respective places till 5/12/21');

-- --------------------------------------------------------

--
-- Table structure for table `homedata`
--

CREATE TABLE `homedata` (
  `newsid` int(11) NOT NULL,
  `image` varchar(30) NOT NULL,
  `news` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `homedata`
--

INSERT INTO `homedata` (`newsid`, `image`, `news`) VALUES
(6, '6.jpeg', 'New Delhi: Rajya Sabha Deputy Chairman Harivansh, NCP supremo Sharad Pawar, BJP\'s newest recruit Jyotiraditya Scindia and Congress veteran Digvijay Singh are among those in the fray for elections to 55 Rajya Sabha seats to be held on March 26 with a number of the contestants set to get elected unopposed.\r\n\r\nFriday was the last date of filing of nominations for the biennial polls. Fifty-one of these 55 seats from 17 states are falling vacant on different dates in April due to retirement of sitting members, while four other seats are already vacant due to resignation of members.\r\n\r\nBypoll will also be held to a Rajya Sabha seat from Haryana vacated by former Union minister Birender Singh.\r\n\r\nCounting will be held on the evening of 26 March, an hour after the conclusion of polls.');

-- --------------------------------------------------------

--
-- Table structure for table `idstatus`
--

CREATE TABLE `idstatus` (
  `userid` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `aprovdis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `idstatus`
--

INSERT INTO `idstatus` (`userid`, `status`, `aprovdis`) VALUES
('Harshit2061565', 'true', 'approve'),
('vipul2021924', 'true', 'approve'),
('Abhishek2091999', 'true', 'approve'),
('ac2031930', 'true', 'approve'),
('Vishant2083581', 'true', 'approve'),
('harshit2047240', 'true', 'approve'),
('naitik2027629', 'true', 'approve'),
('vivek2097993', 'true', 'approve'),
('harsurat2062066', 'true', 'approve'),
('harsh2082681', 'true', 'approve'),
('ranjan2042742', 'true', 'disapprove'),
('ranjan2012819', 'true', 'disapprove'),
('rajan2012818', 'true', 'approve'),
('Raj2062865', 'true', 'approve'),
('harsh2032930', 'true', 'approve'),
('har2022923', 'true', 'approve'),
('harry2063167', 'true', 'approve'),
('harsh2013219', 'true', 'approve'),
('arp2043248', 'true', 'approve'),
('darsh 2033231', 'true', 'approve'),
('dar2073270', 'true', 'approve'),
('dar2003203', 'true', 'approve');

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

CREATE TABLE `polls` (
  `pollid` int(20) NOT NULL,
  `question` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `polls`
--

INSERT INTO `polls` (`pollid`, `question`) VALUES
(16, 'Do you Know NAMO ?'),
(17, 'Who do you see face of Delhi ?'),
(18, 'Who is the best of best?'),
(19, 'Who do you see the face of India ?');

-- --------------------------------------------------------

--
-- Table structure for table `poll_options`
--

CREATE TABLE `poll_options` (
  `optionid` int(11) NOT NULL,
  `value` varchar(20) NOT NULL,
  `pollid` int(10) NOT NULL,
  `votes` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poll_options`
--

INSERT INTO `poll_options` (`optionid`, `value`, `pollid`, `votes`) VALUES
(35, 'Yes', 16, 6),
(36, 'No', 16, 1),
(37, 'Maybe', 16, 1),
(38, 'Amit', 17, 1),
(39, 'Suresh', 17, 2),
(40, 'Ramesh', 17, 0),
(41, 'onlineVoterId', 18, 1),
(42, 'offlineVoterId', 18, 1),
(43, 'BJD', 19, 1),
(44, 'IND', 19, 0),
(45, 'AAD', 19, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` varchar(20) NOT NULL,
  `firstname` varchar(10) NOT NULL,
  `lastname` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `mobileno` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `password` varchar(60) NOT NULL,
  `voterid` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `firstname`, `lastname`, `email`, `mobileno`, `gender`, `password`, `voterid`, `birthdate`, `address`) VALUES
('harry2063167', 'harry', 'bagh', 'harshittarsariya@gmail.com', '9999999999', 'female', 'f8cdb04495ded47615258f9dc6a3f4707fd2405434fefc3cbf4ef4e6', '761360254485056504951', '2004-12-07', 'A64 market road surat'),
('harsh2013219', 'harsh', 'harsh', 'harshittarsariya@gmail.com', '9999999999', 'male', 'f9e385642da72ff074359ef29ed63dd635a61c5259a7f0e9d6a55977', '912310256565548555056', '2004-11-10', 'A64 market road surat'),
('harsh2032930', 'harsh', 'tarssa', 'harshittarsariya@gmail.com', '9999999999', 'male', '7599a0a591ea14bc00904632f6b1308f72272784d610a043950cbf3a', '186280250505250515455818210248565652545549568260253505250555554039230249525356525453', '2004-12-07', 'A64 market road surat'),
('rajan2092893', 'rajan', 'raj', 'harshittarsariya@gmail.com', '9999999999', 'male', '7599a0a591ea14bc00904632f6b1308f72272784d610a043950cbf3a', 'null', '2004-12-07', 'A64 market road surat'),
('ranjan2012819', 'ranjan', 'raj', 'harshittarsariya@gmail.com', '9999999999', 'male', '7599a0a591ea14bc00904632f6b1308f72272784d610a043950cbf3a', 'null', '2004-12-07', 'A64 market road surat'),
('ranjan2042742', 'ranjan', 'rana', 'harshittarsariya@gmail.com', '1111111111', 'male', '7599a0a591ea14bc00904632f6b1308f72272784d610a043950cbf3a', 'null', '2004-12-08', 'A64 market road surat');

-- --------------------------------------------------------

--
-- Table structure for table `user_poll`
--

CREATE TABLE `user_poll` (
  `pollid` int(30) NOT NULL,
  `userid` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_poll`
--

INSERT INTO `user_poll` (`pollid`, `userid`) VALUES
(16, 'harsurat2062066'),
(16, 'Harshit2061565'),
(17, 'Harshit2061565'),
(16, 'harsh2082681'),
(17, 'harsh2082681'),
(18, 'harsh2082681'),
(16, 'har2022923'),
(17, 'har2022923'),
(18, 'har2022923'),
(19, 'har2022923'),
(16, 'harry2063167'),
(16, 'dar2003203');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homedata`
--
ALTER TABLE `homedata`
  ADD PRIMARY KEY (`newsid`);

--
-- Indexes for table `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`pollid`);

--
-- Indexes for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD PRIMARY KEY (`optionid`),
  ADD KEY `foreignkey2` (`pollid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `user_poll`
--
ALTER TABLE `user_poll`
  ADD KEY `foreignkey1` (`pollid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `polls`
--
ALTER TABLE `polls`
  MODIFY `pollid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `poll_options`
--
ALTER TABLE `poll_options`
  MODIFY `optionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD CONSTRAINT `foreignkey2` FOREIGN KEY (`pollid`) REFERENCES `polls` (`pollid`) ON DELETE CASCADE;

--
-- Constraints for table `user_poll`
--
ALTER TABLE `user_poll`
  ADD CONSTRAINT `foreignkey1` FOREIGN KEY (`pollid`) REFERENCES `polls` (`pollid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
