-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2023 at 09:30 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realestate2`
--

-- --------------------------------------------------------

--
-- Table structure for table `annonce`
--

CREATE TABLE `annonce` (
  `N__d_annonce` int(11) NOT NULL,
  `Prix` int(11) DEFAULT NULL,
  `Date_pub` date DEFAULT NULL,
  `Date_der_modif` date DEFAULT NULL,
  `Catégorie` varchar(50) NOT NULL,
  `Ville` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Adresse` varchar(50) DEFAULT NULL,
  `Code_Pos` int(11) DEFAULT NULL,
  `Titre` varchar(50) DEFAULT NULL,
  `N__client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `N__client` int(11) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Prénom` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Mot_de_passe` varchar(255) DEFAULT NULL,
  `N__Téléphone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `galerie`
--

CREATE TABLE `galerie` (
  `ID_Image` int(11) NOT NULL,
  `Img_nom` varchar(50) DEFAULT NULL,
  `Img_Url` varchar(50) DEFAULT NULL,
  `Img_type` varchar(50) DEFAULT NULL,
  `N__d_annonce` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `annonce`
--
ALTER TABLE `annonce`
  ADD PRIMARY KEY (`N__d_annonce`),
  ADD KEY `N__client` (`N__client`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`N__client`);

--
-- Indexes for table `galerie`
--
ALTER TABLE `galerie`
  ADD PRIMARY KEY (`ID_Image`),
  ADD KEY `N__d_annonce` (`N__d_annonce`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `annonce`
--
ALTER TABLE `annonce`
  ADD CONSTRAINT `annonce_ibfk_1` FOREIGN KEY (`N__client`) REFERENCES `client` (`N__client`);

--
-- Constraints for table `galerie`
--
ALTER TABLE `galerie`
  ADD CONSTRAINT `galerie_ibfk_1` FOREIGN KEY (`N__d_annonce`) REFERENCES `annonce` (`N__d_annonce`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
