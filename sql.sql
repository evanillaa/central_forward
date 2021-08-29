-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2021 at 11:15 AM
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
Database: `central_forward`
--

-- --------------------------------------------------------

--
-- Table structure for table `characters_accounts`
--

CREATE TABLE `characters_accounts` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `bankid` varchar(50) DEFAULT NULL,
  `balance` int(20) DEFAULT 0,
  `authorized` varchar(500) DEFAULT NULL,
  `transactions` varchar(60000) DEFAULT '{}'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characters_accounts`
--

INSERT INTO `characters_accounts` (`id`, `citizenid`, `type`, `name`, `bankid`, `balance`, `authorized`, `transactions`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `characters_bills`
--

CREATE TABLE `characters_bills` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `invoiceid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characters_bills`
--

INSERT INTO `characters_bills` (`id`, `citizenid`, `amount`, `invoiceid`, `sender`, `type`, `date`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `characters_bindings`
--

CREATE TABLE `characters_bindings` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `key` text DEFAULT NULL,
  `command` text DEFAULT NULL,
  `argument` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `characters_contacts`
--

CREATE TABLE `characters_contacts` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characters_contacts`
--

INSERT INTO `characters_contacts` (`id`, `citizenid`, `name`, `number`, `iban`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `characters_houses`
--

CREATE TABLE `characters_houses` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT '[]',
  `name` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` int(11) DEFAULT NULL,
  `owned` varchar(50) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `hasgarage` varchar(50) DEFAULT 'false',
  `garage` varchar(200) DEFAULT '[]',
  `keyholders` text DEFAULT NULL,
  `decorations` longtext DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characters_houses`
--

INSERT INTO `characters_houses` (`id`, `citizenid`, `name`, `label`, `price`, `tier`, `owned`, `coords`, `hasgarage`, `garage`, `keyholders`, `decorations`, `stash`, `outfit`, `logout`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `characters_house_plants`
--

CREATE TABLE `characters_house_plants` (
  `id` int(11) NOT NULL,
  `houseid` varchar(50) DEFAULT '11111',
  `plants` varchar(65000) DEFAULT '[]'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `characters_inventory-stash`
--

CREATE TABLE `characters_inventory-stash` (
  `id` int(11) NOT NULL,
  `stash` varchar(50) NOT NULL,
  `items` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characters_inventory-stash`
--

INSERT INTO `characters_inventory-stash` (`id`, `stash`, `items`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `characters_inventory-vehicle`
--

CREATE TABLE `characters_inventory-vehicle` (
  `id` int(11) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `trunkitems` longtext DEFAULT NULL,
  `gloveboxitems` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characters_inventory-vehicle`
--

INSERT INTO `characters_inventory-vehicle` (`id`, `plate`, `trunkitems`, `gloveboxitems`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `characters_mails`
--

CREATE TABLE `characters_mails` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinytext DEFAULT NULL,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characters_mails`
--

INSERT INTO `characters_mails` (`id`, `citizenid`, `sender`, `subject`, `message`, `read`, `mailid`, `date`, `button`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `characters_messages`
--

CREATE TABLE `characters_messages` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characters_messages`
--

INSERT INTO `characters_messages` (`id`, `citizenid`, `number`, `messages`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `characters_metadata`
--

CREATE TABLE `characters_metadata` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `steam` varchar(50) DEFAULT NULL,
  `discord` int(11) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `money` text DEFAULT NULL,
  `charinfo` text DEFAULT NULL,
  `job` tinytext DEFAULT NULL,
  `gang` tinytext DEFAULT NULL,
  `position` text DEFAULT NULL,
  `globals` text DEFAULT NULL,
  `inventory` varchar(65000) DEFAULT '[]',
  `ammo` text DEFAULT NULL,
  `licenses` text DEFAULT NULL,
  `skill` varchar(50) DEFAULT NULL,
  `addiction` varchar(50) DEFAULT NULL,
  `last_updated` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characters_metadata`
--

INSERT INTO `characters_metadata` (`id`, `citizenid`, `cid`, `steam`, `discord`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `globals`, `inventory`, `ammo`, `licenses`, `skill`, `addiction`, `last_updated`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `characters_outfits`
--

CREATE TABLE `characters_outfits` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characters_outfits`
--

INSERT INTO `characters_outfits` (`id`, `citizenid`, `outfitname`, `model`, `skin`, `outfitId`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `characters_reputations`
--

CREATE TABLE `characters_reputations` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `job` text DEFAULT NULL,
  `dealer` text DEFAULT NULL,
  `crafting` text DEFAULT NULL,
  `handweaponcrafting` text DEFAULT NULL,
  `weaponcrafting` text DEFAULT NULL,
  `attachmentcrafting` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `characters_skins`
--

CREATE TABLE `characters_skins` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) NOT NULL DEFAULT '',
  `model` varchar(50) NOT NULL DEFAULT '0',
  `skin` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characters_skins`
--

INSERT INTO `characters_skins` (`id`, `citizenid`, `model`, `skin`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `characters_vehicles`
--

CREATE TABLE `characters_vehicles` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `metadata` mediumtext DEFAULT NULL,
  `drivingdistance` int(255) NOT NULL DEFAULT 0,
  `forSale` int(11) DEFAULT 0,
  `salePrice` int(11) DEFAULT 0,
  `finance_owed` int(255) DEFAULT NULL,
  `depotprice` int(255) DEFAULT 100,
  `status` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characters_vehicles`
--

INSERT INTO `characters_vehicles` (`id`, `citizenid`, `vehicle`, `plate`, `garage`, `state`, `mods`, `metadata`, `drivingdistance`, `forSale`, `salePrice`, `finance_owed`, `depotprice`, `status`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `characters_warns`
--

CREATE TABLE `characters_warns` (
  `#` int(11) NOT NULL,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `characters_warns`
--

INSERT INTO `characters_warns` (`#`, `senderIdentifier`, `targetIdentifier`, `reason`, `warnId`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `character_current`
--

CREATE TABLE `character_current` (
  `id` int(11) NOT NULL,
  `citizenid` longtext DEFAULT NULL,
  `model` longtext DEFAULT NULL,
  `drawables` longtext DEFAULT NULL,
  `props` longtext DEFAULT NULL,
  `drawtextures` longtext DEFAULT NULL,
  `proptextures` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `character_current`
--

INSERT INTO `character_current` (`id`, `citizenid`, `model`, `drawables`, `props`, `drawtextures`, `proptextures`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `character_face`
--

CREATE TABLE `character_face` (
  `id` int(11) NOT NULL,
  `citizenid` longtext DEFAULT NULL,
  `hairColor` longtext DEFAULT NULL,
  `headBlend` longtext DEFAULT NULL,
  `headOverlay` longtext DEFAULT NULL,
  `headStructure` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `character_face`
--

INSERT INTO `character_face` (`id`, `citizenid`, `hairColor`, `headBlend`, `headOverlay`, `headStructure`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `job` longtext DEFAULT NULL,
  `money` longtext DEFAULT NULL,
  `stash` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gangs`
--

CREATE TABLE `gangs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `grades` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gangs_members`
--

CREATE TABLE `gangs_members` (
  `index` int(11) NOT NULL,
  `gang` longtext NOT NULL DEFAULT '0',
  `grade` longtext NOT NULL DEFAULT '0',
  `cid` longtext NOT NULL DEFAULT '0',
  `char` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gangs_members`
--

INSERT INTO `gangs_members` (`index`, `gang`, `grade`, `cid`, `char`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `gangs_money`
--

CREATE TABLE `gangs_money` (
  `index` int(11) NOT NULL,
  `gang` longtext DEFAULT NULL,
  `amount` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gangs_money`
--

INSERT INTO `gangs_money` (`index`, `gang`, `amount`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `gang_territoriums`
--

CREATE TABLE `gang_territoriums` (
  `id` int(11) NOT NULL,
  `gang` varchar(50) DEFAULT NULL,
  `points` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lapraces`
--

CREATE TABLE `lapraces` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lapraces`
--

INSERT INTO `lapraces` (`id`, `name`, `checkpoints`, `records`, `creator`, `distance`, `raceid`) VALUES(5, 'Test', '[{\"offset\":{\"right\":{\"z\":42.71083450317383,\"y\":-501.18408203125,\"x\":117.00909423828125},\"left\":{\"z\":42.81503677368164,\"y\":-502.4813232421875,\"x\":122.86625671386719}},\"coords\":{\"z\":42.762935638427737,\"y\":-501.83270263671877,\"x\":119.93767547607422}},{\"offset\":{\"right\":{\"z\":42.716773986816409,\"y\":-504.54486083984377,\"x\":116.0001220703125},\"left\":{\"z\":42.808197021484378,\"y\":-506.5859375,\"x\":121.64154052734375}},\"coords\":{\"z\":42.76248550415039,\"y\":-505.5653991699219,\"x\":118.82083129882813}},{\"offset\":{\"right\":{\"z\":42.739131927490237,\"y\":-522.90283203125,\"x\":109.27655792236328},\"left\":{\"z\":42.818668365478519,\"y\":-525.1165771484375,\"x\":114.85266876220703}},\"coords\":{\"z\":42.778900146484378,\"y\":-524.0097045898438,\"x\":112.06461334228516}},{\"offset\":{\"right\":{\"z\":42.69757080078125,\"y\":-545.8194580078125,\"x\":100.03115844726563},\"left\":{\"z\":42.914764404296878,\"y\":-548.1148681640625,\"x\":105.57049560546875}},\"coords\":{\"z\":42.80616760253906,\"y\":-546.9671630859375,\"x\":102.80082702636719}},{\"offset\":{\"right\":{\"z\":43.231727600097659,\"y\":-571.6946411132813,\"x\":91.97557067871094},\"left\":{\"z\":43.349571228027347,\"y\":-573.7957153320313,\"x\":97.59443664550781}},\"coords\":{\"z\":43.2906494140625,\"y\":-572.7451782226563,\"x\":94.78500366210938}},{\"offset\":{\"right\":{\"z\":43.49308776855469,\"y\":-582.176025390625,\"x\":87.95024108886719},\"left\":{\"z\":43.63246154785156,\"y\":-584.343994140625,\"x\":93.54315185546875}},\"coords\":{\"z\":43.562774658203128,\"y\":-583.260009765625,\"x\":90.74669647216797}},{\"offset\":{\"right\":{\"z\":43.65912628173828,\"y\":-587.296630859375,\"x\":85.94231414794922},\"left\":{\"z\":43.79627227783203,\"y\":-589.479736328125,\"x\":91.52935028076172}},\"coords\":{\"z\":43.727699279785159,\"y\":-588.38818359375,\"x\":88.73583221435547}},{\"offset\":{\"right\":{\"z\":43.6994743347168,\"y\":-592.8185424804688,\"x\":83.77618408203125},\"left\":{\"z\":43.9505500793457,\"y\":-594.8016967773438,\"x\":89.43338012695313}},\"coords\":{\"z\":43.82501220703125,\"y\":-593.8101196289063,\"x\":86.60478210449219}},{\"offset\":{\"right\":{\"z\":43.76377868652344,\"y\":-592.8571166992188,\"x\":83.8193130493164},\"left\":{\"z\":43.892120361328128,\"y\":-594.7908325195313,\"x\":89.49771881103516}},\"coords\":{\"z\":43.82794952392578,\"y\":-593.823974609375,\"x\":86.65851593017578}}]', NULL, 'LUQ52801', 98, 'LR-8123');

-- --------------------------------------------------------

--
-- Table structure for table `laws`
--

CREATE TABLE `laws` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `fine` int(11) NOT NULL DEFAULT 0,
  `months` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laws`
--

INSERT INTO `laws` (`id`, `name`, `description`, `fine`, `months`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `moneysafes`
--

CREATE TABLE `moneysafes` (
  `id` int(11) NOT NULL,
  `safe` varchar(50) NOT NULL DEFAULT '0',
  `money` int(11) NOT NULL DEFAULT 0,
  `transactions` text NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `playerskins`
--

CREATE TABLE `playerskins` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `playerstattoos`
--

CREATE TABLE `playerstattoos` (
  `id` int(11) NOT NULL,
  `citizenid` longtext NOT NULL DEFAULT '0',
  `tattoos` longtext NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `playerstattoos`
--

INSERT INTO `playerstattoos` (`id`, `citizenid`, `tattoos`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'https://i.imgur.com/tdi3NGa.png',
  `fingerprint` varchar(255) DEFAULT NULL,
  `dnacode` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `lastsearch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `profileid` int(11) DEFAULT NULL,
  `report` text NOT NULL,
  `laws` text DEFAULT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `title`, `author`, `profileid`, `report`, `laws`, `created`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `server_bans`
--

CREATE TABLE `server_bans` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `steam` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `bannedby` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `server_extra`
--

CREATE TABLE `server_extra` (
  `id` int(11) NOT NULL,
  `steam` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `permission` varchar(50) DEFAULT 'user',
  `priority` int(11) DEFAULT 2
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `server_extra`
--

INSERT INTO `server_extra` (`id`, `steam`, `license`, `name`, `permission`, `priority`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL,
  `last_login` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `role`, `rank`, `last_login`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `plate` varchar(255) NOT NULL,
  `typevehicle` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'https://i.imgur.com/tdi3NGa.png',
  `note` text DEFAULT NULL,
  `lastsearch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `warrants`
--

CREATE TABLE `warrants` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `characters_accounts`
--
ALTER TABLE `characters_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters_bills`
--
ALTER TABLE `characters_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters_bindings`
--
ALTER TABLE `characters_bindings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters_contacts`
--
ALTER TABLE `characters_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters_houses`
--
ALTER TABLE `characters_houses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters_house_plants`
--
ALTER TABLE `characters_house_plants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters_inventory-stash`
--
ALTER TABLE `characters_inventory-stash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters_inventory-vehicle`
--
ALTER TABLE `characters_inventory-vehicle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters_mails`
--
ALTER TABLE `characters_mails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters_messages`
--
ALTER TABLE `characters_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters_metadata`
--
ALTER TABLE `characters_metadata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `characters_outfits`
--
ALTER TABLE `characters_outfits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters_reputations`
--
ALTER TABLE `characters_reputations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters_skins`
--
ALTER TABLE `characters_skins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters_vehicles`
--
ALTER TABLE `characters_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters_warns`
--
ALTER TABLE `characters_warns`
  ADD PRIMARY KEY (`#`);

--
-- Indexes for table `character_current`
--
ALTER TABLE `character_current`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `character_face`
--
ALTER TABLE `character_face`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gangs`
--
ALTER TABLE `gangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gangs_members`
--
ALTER TABLE `gangs_members`
  ADD PRIMARY KEY (`index`) USING BTREE;

--
-- Indexes for table `gangs_money`
--
ALTER TABLE `gangs_money`
  ADD PRIMARY KEY (`index`) USING BTREE;

--
-- Indexes for table `gang_territoriums`
--
ALTER TABLE `gang_territoriums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lapraces`
--
ALTER TABLE `lapraces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laws`
--
ALTER TABLE `laws`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moneysafes`
--
ALTER TABLE `moneysafes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playerskins`
--
ALTER TABLE `playerskins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `playerstattoos`
--
ALTER TABLE `playerstattoos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server_bans`
--
ALTER TABLE `server_bans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server_extra`
--
ALTER TABLE `server_extra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warrants`
--
ALTER TABLE `warrants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `characters_accounts`
--
ALTER TABLE `characters_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `characters_bills`
--
ALTER TABLE `characters_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `characters_bindings`
--
ALTER TABLE `characters_bindings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `characters_contacts`
--
ALTER TABLE `characters_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1123;

--
-- AUTO_INCREMENT for table `characters_houses`
--
ALTER TABLE `characters_houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `characters_house_plants`
--
ALTER TABLE `characters_house_plants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `characters_inventory-stash`
--
ALTER TABLE `characters_inventory-stash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `characters_inventory-vehicle`
--
ALTER TABLE `characters_inventory-vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `characters_mails`
--
ALTER TABLE `characters_mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT for table `characters_messages`
--
ALTER TABLE `characters_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT for table `characters_metadata`
--
ALTER TABLE `characters_metadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `characters_outfits`
--
ALTER TABLE `characters_outfits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=887;

--
-- AUTO_INCREMENT for table `characters_reputations`
--
ALTER TABLE `characters_reputations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `characters_skins`
--
ALTER TABLE `characters_skins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `characters_vehicles`
--
ALTER TABLE `characters_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `characters_warns`
--
ALTER TABLE `characters_warns`
  MODIFY `#` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `character_current`
--
ALTER TABLE `character_current`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `character_face`
--
ALTER TABLE `character_face`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `gangs`
--
ALTER TABLE `gangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gangs_members`
--
ALTER TABLE `gangs_members`
  MODIFY `index` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `gangs_money`
--
ALTER TABLE `gangs_money`
  MODIFY `index` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `gang_territoriums`
--
ALTER TABLE `gang_territoriums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lapraces`
--
ALTER TABLE `lapraces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `laws`
--
ALTER TABLE `laws`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `moneysafes`
--
ALTER TABLE `moneysafes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `playerskins`
--
ALTER TABLE `playerskins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45053;

--
-- AUTO_INCREMENT for table `playerstattoos`
--
ALTER TABLE `playerstattoos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `server_bans`
--
ALTER TABLE `server_bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `server_extra`
--
ALTER TABLE `server_extra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `warrants`
--
ALTER TABLE `warrants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
