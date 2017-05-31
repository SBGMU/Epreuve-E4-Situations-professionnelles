-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 23 Mai 2017 à 05:20
-- Version du serveur :  5.6.17-log
-- Version de PHP :  5.5.12
create database locationski;
use locationski;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `locationski`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `verifDateAcompte`(num int)
begin 

declare dateDe date ;
declare datefin date;
declare datedebut date;
declare id_location int;

select dateDemande, location_id,dateD,dateF into dateDe, id_location,datedebut,datefin
from demande
where id = num ; 

if datediff(curdate(), dateDe) > 8
then 
update demande set confirme = 'rejeter'
where id = num ;

update datelocation set libre = 'libre'
where dateJour between datedebut and datefin
and id_location = id_location;
      end if;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE IF NOT EXISTS `activite` (
  `idA` int(11) NOT NULL AUTO_INCREMENT,
  `nomA` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `photoA` longtext COLLATE latin1_general_ci NOT NULL,
  `detailA` longtext COLLATE latin1_general_ci NOT NULL,
  `lienA` varchar(70) COLLATE latin1_general_ci DEFAULT NULL,
  `valleeA` varchar(30) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`idA`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=17 ;

--
-- Contenu de la table `activite`
--

INSERT INTO `activite` (`idA`, `nomA`, `photoA`, `detailA`, `lienA`, `valleeA`) VALUES
(2, 'Ski pour Enfants', 'ski-enfants.jpg', 'Hac ex causa conlaticia stipe Valerius humatur ille Publicola et subsidiis amicorum mariti inops cum liberis uxor alitur Reguli et dotatur ex aerario filia Scipionis', 'pierreetvacances.com/fr-fr/guide-ski_ms', '1'),
(3, 'Magsin de location de ski', 'magasin_location.jpg', 'Hac ex causa conlaticia stipe Valerius humatur ille Publicola et subsidiis amicorum mariti inops cum liberis uxor alitur Reguli et dotatur ex aerario filia ', 'achat-ski.com/fr/2-ski-alpin', '1'),
(4, 'Le Flocon', 'le_flocon.jpg', 'Hac ex causa conlaticia stipe Valerius humatur ille Publicola et subsidiis amicorum mariti inops cum liberis uxor alitur Reguli et dotatur', 'restaurant-serre-chevalier.com', '1'),
(5, 'Les baladins', 'le_flocon.jpg', 'Hac ex causa conlaticia stipe Valerius humatur ille Publicola et subsidiis amicorum mariti inops cum liberis uxor alitur Reguli et dotatur', 'lesbaladins.com', '1'),
(6, 'La Cime', 'la_cime.jpg', 'Hac ex causa conlaticia stipe Valerius humatur ille Publicola et subsidiis amicorum mariti inops cum liberis uxor alitur Reguli et dotatur', 'refugeceillac.com', '2'),
(7, 'Le Chamois', 'le_chamois.jpg', 'Hac ex causa conlaticia stipe Valerius humatur ille Publicola et subsidiis amicorum mariti inops cum liberis uxor alitur Reguli et dotatur', 'hotel-lechamois.com', '2'),
(8, 'Les Olivades', 'les_olivades.jpg', 'Hac ex causa conlaticia stipe Valerius humatur ille Publicola et subsidiis amicorum mariti inops cum liberis uxor alitur Reguli et dotatur', 'v2.hotel-restaurant-gap-les-olivades.com', '2'),
(9, 'La Cigale', 'la_cigale.jpg', 'Hac ex causa conlaticia stipe Valerius humatur ille Publicola et subsidiis amicorum mariti inops cum liberis uxor alitur Reguli et dotatur', 'la-cigale-restaurant.fr', '2'),
(10, 'Le beau Soleil', 'le_beau_soleil.jpg', 'Hac ex causa conlaticia stipe Valerius humatur ille Publicola et subsidiis amicorum mariti inops cum liberis uxor alitur Reguli et dotatur', 'lebeausoleil.net', '3'),
(11, 'L Araignée gourmande', 'laraignee_gourmande.jpg', 'Hac ex causa conlaticia stipe Valerius humatur ille Publicola et subsidiis amicorum mariti inops cum liberis uxor alitur Reguli et dotatur', 'laraignee-gourmande.fr', '3'),
(13, 'Les Chenets', 'les_chenets.jpg', 'Hac ex causa conlaticia stipe Valerius humatur ille Publicola et subsidiis amicorum mariti inops cum liberis uxor alitur Reguli et dotatur', 'les-chenets.com', '3'),
(14, 'Animation festive', 'animation_festive.jpg', 'Hac ex causa conlaticia stipe Valerius humatur ille Publicola et subsidiis amicorum mariti inops cum liberis uxor alitur', 'altitudejazz.com', '4'),
(16, 'zerty', '27baac57-5780-4025-8cfd-77f0017aa132uijxh.jpg', ' dfhgvjhbk', 'fghjk', '1');

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `idC` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `prenom` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(150) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`idC`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=50 ;

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`idC`, `nom`, `prenom`, `password`, `email`) VALUES
(1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'debailleul@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `idC` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `prenom` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `ville` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `adresse` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `codeP` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `tel` varchar(14) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`idC`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`idC`, `nom`, `password`, `prenom`, `email`, `ville`, `adresse`, `codeP`, `tel`) VALUES
(1, 'louis', '944739f90ee61a39753803c1b3fbb535', 'debailleul', 'louis@gmail', 'fontenay st pere', '12 rue de l ancienne mairie', '78440', '0134791955'),
(3, 'louisfyjgj', 'd41d8cd98f00b204e9800998ecf8427e', 'debailleul', 'louis@gmail', 'fontenay st pere', '12 rue de l ancienne mairie', '78440', '0134791955'),
(7, 'azer', 'd41d8cd98f00b204e9800998ecf8427e', 'azer', 'azera@gmai.fr', '', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

CREATE TABLE IF NOT EXISTS `contrat` (
  `id` int(11) NOT NULL,
  `dateD` date NOT NULL,
  `dateF` date NOT NULL,
  `location_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `etat` varchar(70) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contratproprio`
--

CREATE TABLE IF NOT EXISTS `contratproprio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `proprietair_id` int(11) NOT NULL,
  `dateD` date NOT NULL,
  `etat` varchar(70) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `datelocation`
--

CREATE TABLE IF NOT EXISTS `datelocation` (
  `idD` int(11) NOT NULL AUTO_INCREMENT,
  `dateJour` date NOT NULL,
  `libre` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'libre ',
  `id_location` int(11) NOT NULL,
  `id_saison` int(11) NOT NULL,
  KEY `idD` (`idD`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=336 ;

--
-- Contenu de la table `datelocation`
--

INSERT INTO `datelocation` (`idD`, `dateJour`, `libre`, `id_location`, `id_saison`) VALUES
(1, '2017-09-02', 'reserver', 1, 6),
(2, '2017-09-03', 'reserver', 1, 6),
(3, '2017-09-04', 'reserver', 1, 6),
(4, '2017-09-05', 'reserver', 1, 6),
(5, '2017-09-06', 'reserver', 1, 6),
(6, '2017-09-07', 'reserver', 1, 6),
(7, '2017-09-08', 'reserver', 1, 6),
(8, '2017-09-09', 'reserver', 1, 6),
(9, '2017-09-10', 'reserver', 1, 6),
(10, '2017-09-11', 'reserver', 1, 6),
(11, '2017-09-12', 'reserver', 1, 6),
(12, '2017-09-13', 'reserver', 1, 6),
(13, '2017-09-14', 'libre', 1, 6),
(14, '2017-09-15', 'libre', 1, 6),
(15, '2017-09-16', 'libre', 1, 6),
(16, '2017-09-17', 'libre', 1, 6),
(17, '2017-09-18', 'libre', 1, 6),
(18, '2017-09-19', 'libre', 1, 6),
(19, '2017-09-20', 'libre', 1, 6),
(20, '2017-09-21', 'libre', 1, 6),
(21, '2017-09-22', 'libre', 1, 6),
(22, '2017-09-23', 'libre', 1, 6),
(23, '2017-09-24', 'libre', 1, 6),
(24, '2017-09-25', 'libre', 1, 6),
(25, '2017-09-26', 'libre', 1, 6),
(26, '2017-09-27', 'libre', 1, 6),
(27, '2017-09-28', 'libre', 1, 6),
(28, '2017-09-29', 'libre', 1, 6),
(29, '2017-09-30', 'libre', 1, 6),
(30, '2017-10-01', 'libre', 1, 6),
(31, '2017-10-02', 'libre', 1, 6),
(32, '2017-10-03', 'libre', 1, 6),
(33, '2017-10-04', 'libre', 1, 6),
(34, '2017-10-05', 'libre', 1, 6),
(35, '2017-10-06', 'libre', 1, 6),
(36, '2017-10-07', 'libre', 1, 6),
(37, '2017-10-08', 'libre', 1, 6),
(38, '2017-10-09', 'libre', 1, 6),
(39, '2017-10-10', 'libre', 1, 6),
(40, '2017-10-11', 'libre', 1, 6),
(41, '2017-10-12', 'libre', 1, 6),
(42, '2017-10-13', 'libre', 1, 6),
(43, '2017-10-14', 'libre', 1, 6),
(44, '2017-10-15', 'libre', 1, 6),
(45, '2017-10-16', 'libre', 1, 6),
(46, '2017-10-17', 'libre', 1, 6),
(47, '2017-10-18', 'libre', 1, 6),
(48, '2017-10-19', 'libre', 1, 6),
(49, '2017-10-20', 'libre', 1, 6),
(50, '2017-10-21', 'libre', 1, 6),
(51, '2017-10-22', 'libre', 1, 6),
(52, '2017-10-23', 'libre', 1, 6),
(53, '2017-10-24', 'libre', 1, 6),
(54, '2017-10-25', 'libre', 1, 6),
(55, '2017-10-26', 'libre', 1, 6),
(56, '2017-10-27', 'libre', 1, 6),
(57, '2017-10-28', 'libre', 1, 6),
(58, '2017-10-29', 'libre', 1, 6),
(59, '2017-10-29', 'libre', 1, 6),
(60, '2017-10-30', 'libre', 1, 6),
(61, '2017-10-31', 'libre', 1, 6),
(62, '2017-11-01', 'libre', 1, 6),
(63, '2017-11-02', 'libre', 1, 6),
(64, '2017-11-03', 'libre', 1, 6),
(65, '2017-11-04', 'libre', 1, 6),
(66, '2017-11-05', 'libre', 1, 6),
(67, '2017-11-06', 'libre', 1, 6),
(68, '2017-11-07', 'libre', 1, 6),
(69, '2017-11-08', 'libre', 1, 6),
(70, '2017-11-09', 'libre', 1, 6),
(71, '2017-11-10', 'libre', 1, 6),
(72, '2017-11-11', 'libre', 1, 6),
(73, '2017-11-12', 'libre', 1, 6),
(74, '2017-11-13', 'libre', 1, 6),
(75, '2017-11-14', 'libre', 1, 6),
(76, '2017-11-15', 'libre', 1, 6),
(77, '2017-11-16', 'libre', 1, 6),
(78, '2017-11-17', 'libre', 1, 6),
(79, '2017-11-18', 'libre', 1, 6),
(80, '2017-11-19', 'libre', 1, 6),
(81, '2017-11-20', 'libre', 1, 6),
(82, '2017-11-21', 'libre', 1, 6),
(83, '2017-11-22', 'libre', 1, 6),
(84, '2017-11-23', 'libre', 1, 6),
(85, '2017-11-24', 'libre', 1, 6),
(86, '2017-11-25', 'libre', 1, 6),
(87, '2017-11-26', 'libre', 1, 6),
(88, '2017-11-27', 'libre', 1, 6),
(89, '2017-11-28', 'libre', 1, 6),
(90, '2017-11-29', 'libre', 1, 6),
(91, '2017-11-30', 'libre', 1, 6),
(92, '2017-12-01', 'libre', 1, 6),
(93, '2017-12-02', 'libre', 1, 6),
(94, '2017-12-03', 'libre', 1, 6),
(95, '2017-12-04', 'libre', 1, 6),
(96, '2017-12-05', 'libre', 1, 6),
(97, '2017-12-06', 'libre', 1, 6),
(98, '2017-12-07', 'libre', 1, 6),
(99, '2017-12-08', 'libre', 1, 6),
(100, '2017-12-09', 'libre', 1, 6),
(101, '2017-12-10', 'libre', 1, 6),
(102, '2017-12-11', 'libre', 1, 6),
(103, '2017-12-12', 'libre', 1, 6),
(104, '2017-12-13', 'libre', 1, 6),
(105, '2017-12-14', 'libre', 1, 6),
(106, '2017-12-15', 'libre', 1, 6),
(107, '2017-12-16', 'libre', 1, 6),
(108, '2017-12-17', 'libre', 1, 6),
(109, '2017-12-18', 'libre', 1, 6),
(110, '2017-12-19', 'libre', 1, 6),
(111, '2017-12-20', 'libre', 1, 6),
(112, '2017-12-21', 'libre', 1, 6),
(113, '2017-12-22', 'libre', 1, 6),
(114, '2017-12-23', 'libre', 1, 6),
(115, '2017-12-24', 'libre', 1, 6),
(116, '2017-12-25', 'libre', 1, 6),
(117, '2017-12-26', 'libre', 1, 6),
(118, '2017-12-27', 'libre', 1, 6),
(119, '2017-12-28', 'libre', 1, 6),
(120, '2017-12-29', 'libre', 1, 6),
(121, '2017-12-30', 'libre', 1, 6),
(122, '2017-12-31', 'libre', 1, 6),
(123, '2018-01-01', 'libre', 1, 6),
(124, '2018-01-02', 'libre', 1, 6),
(125, '2018-01-03', 'libre', 1, 6),
(126, '2018-01-04', 'libre', 1, 6),
(127, '2018-01-05', 'libre', 1, 6),
(128, '2018-01-06', 'libre', 1, 6),
(129, '2018-01-07', 'libre', 1, 6),
(130, '2018-01-08', 'libre', 1, 6),
(131, '2018-01-09', 'libre', 1, 6),
(132, '2018-01-10', 'libre', 1, 6),
(133, '2018-01-11', 'libre', 1, 6),
(134, '2018-01-12', 'libre', 1, 6),
(135, '2018-01-13', 'libre', 1, 6),
(136, '2018-01-14', 'libre', 1, 6),
(137, '2018-01-15', 'libre', 1, 6),
(138, '2018-01-16', 'libre', 1, 6),
(139, '2018-01-17', 'libre', 1, 6),
(140, '2018-01-18', 'libre', 1, 6),
(141, '2018-01-19', 'libre', 1, 6),
(142, '2018-01-20', 'libre', 1, 6),
(143, '2018-01-21', 'libre', 1, 6),
(144, '2018-01-22', 'libre', 1, 6),
(145, '2018-01-23', 'libre', 1, 6),
(146, '2018-01-24', 'libre', 1, 6),
(147, '2018-01-25', 'libre', 1, 6),
(148, '2018-01-26', 'libre', 1, 6),
(149, '2018-01-27', 'libre', 1, 6),
(150, '2018-01-28', 'libre', 1, 6),
(151, '2018-01-29', 'libre', 1, 6),
(152, '2018-01-30', 'libre', 1, 6),
(153, '2018-01-31', 'libre', 1, 6),
(154, '2018-02-01', 'libre', 1, 6),
(155, '2018-02-02', 'libre', 1, 6),
(156, '2018-02-03', 'libre', 1, 6),
(157, '2018-02-04', 'libre', 1, 6),
(158, '2018-02-05', 'libre', 1, 6),
(159, '2018-02-06', 'libre', 1, 6),
(160, '2018-02-07', 'libre', 1, 6),
(161, '2018-02-08', 'libre', 1, 6),
(162, '2018-02-09', 'libre', 1, 6),
(163, '2018-02-10', 'libre', 1, 6),
(164, '2018-02-11', 'libre', 1, 6),
(165, '2018-02-12', 'libre', 1, 6),
(166, '2018-02-13', 'libre', 1, 6),
(167, '2018-02-14', 'libre', 1, 6),
(168, '2018-02-15', 'libre', 1, 6),
(169, '2018-02-16', 'libre', 1, 6),
(170, '2018-02-17', 'libre', 1, 6),
(171, '2018-02-18', 'libre', 1, 6),
(172, '2018-02-19', 'libre', 1, 6),
(173, '2018-02-20', 'libre', 1, 6),
(174, '2018-02-21', 'libre', 1, 6),
(175, '2018-02-22', 'libre', 1, 6),
(176, '2018-02-23', 'libre', 1, 6),
(177, '2018-02-24', 'libre', 1, 6),
(178, '2018-02-25', 'libre', 1, 6),
(179, '2018-02-26', 'libre', 1, 6),
(180, '2018-02-27', 'libre', 1, 6),
(181, '2018-02-28', 'libre', 1, 6),
(182, '2018-03-01', 'libre', 1, 6),
(183, '2018-03-02', 'libre', 1, 6),
(184, '2018-03-03', 'libre', 1, 6),
(185, '2018-03-04', 'libre', 1, 6),
(186, '2018-03-05', 'libre', 1, 6),
(187, '2018-03-06', 'libre', 1, 6),
(188, '2018-03-07', 'libre', 1, 6),
(189, '2018-03-08', 'libre', 1, 6),
(190, '2018-03-09', 'libre', 1, 6),
(191, '2018-03-10', 'libre', 1, 6),
(192, '2018-03-11', 'libre', 1, 6),
(193, '2018-03-12', 'libre', 1, 6),
(194, '2018-03-13', 'libre', 1, 6),
(195, '2018-03-14', 'libre', 1, 6),
(196, '2018-03-15', 'libre', 1, 6),
(197, '2018-03-16', 'libre', 1, 6),
(198, '2018-03-17', 'libre', 1, 6),
(199, '2018-03-18', 'libre', 1, 6),
(200, '2018-03-19', 'libre', 1, 6),
(201, '2018-03-20', 'libre', 1, 6),
(202, '2018-03-21', 'libre', 1, 6),
(203, '2018-03-22', 'libre', 1, 6),
(204, '2018-03-23', 'libre', 1, 6),
(205, '2018-03-24', 'libre', 1, 6),
(206, '2018-03-26', 'libre', 1, 6),
(207, '2018-03-27', 'libre', 1, 6),
(208, '2018-03-28', 'libre', 1, 6),
(209, '2018-03-29', 'libre', 1, 6),
(210, '2018-03-30', 'libre', 1, 6),
(211, '2018-03-31', 'libre', 1, 6),
(212, '2018-04-01', 'libre', 1, 6),
(213, '2018-04-02', 'libre', 1, 6),
(214, '2018-04-03', 'libre', 1, 6),
(215, '2018-04-04', 'libre', 1, 6),
(216, '2018-04-05', 'libre', 1, 6),
(217, '2018-04-06', 'libre', 1, 6),
(218, '2018-04-07', 'libre', 1, 6),
(219, '2018-04-08', 'libre', 1, 6),
(220, '2018-04-09', 'libre', 1, 6),
(221, '2018-04-10', 'libre', 1, 6),
(222, '2018-04-11', 'libre', 1, 6),
(223, '2018-04-12', 'libre', 1, 6),
(224, '2018-04-13', 'libre', 1, 6),
(225, '2018-04-14', 'libre', 1, 6),
(226, '2018-04-15', 'libre', 1, 6),
(227, '2018-04-16', 'libre', 1, 6),
(228, '2018-04-17', 'libre', 1, 6),
(229, '2018-04-18', 'libre', 1, 6),
(230, '2018-04-19', 'libre', 1, 6),
(231, '2018-04-20', 'libre', 1, 6),
(232, '2018-04-21', 'libre', 1, 6),
(233, '2018-04-22', 'libre', 1, 6),
(234, '2018-04-23', 'libre', 1, 6),
(235, '2018-04-24', 'libre', 1, 6),
(236, '2018-04-25', 'libre', 1, 6),
(237, '2018-04-26', 'libre', 1, 6),
(238, '2018-04-27', 'libre', 1, 6),
(239, '2018-04-28', 'libre', 1, 6),
(240, '2018-04-29', 'libre', 1, 6),
(241, '2018-04-30', 'libre', 1, 6),
(242, '2018-05-01', 'libre', 1, 6),
(243, '2018-05-02', 'libre', 1, 6),
(244, '2018-05-03', 'libre', 1, 6),
(245, '2018-05-04', 'libre', 1, 6),
(246, '2018-05-05', 'libre', 1, 6),
(247, '2018-05-06', 'libre', 1, 6),
(248, '2018-05-07', 'libre', 1, 6),
(249, '2018-05-08', 'libre', 1, 6),
(250, '2018-05-09', 'libre', 1, 6),
(251, '2018-05-10', 'libre', 1, 6),
(252, '2018-05-11', 'libre', 1, 6),
(253, '2018-05-12', 'libre', 1, 6),
(254, '2018-05-13', 'libre', 1, 6),
(255, '2018-05-14', 'libre', 1, 6),
(256, '2018-05-15', 'libre', 1, 6),
(257, '2018-05-16', 'libre', 1, 6),
(258, '2018-05-17', 'libre', 1, 6),
(259, '2018-05-18', 'libre', 1, 6),
(260, '2018-05-19', 'libre', 1, 6),
(261, '2018-05-20', 'libre', 1, 6),
(262, '2018-05-21', 'libre', 1, 6),
(263, '2018-05-22', 'libre', 1, 6),
(264, '2018-05-23', 'libre', 1, 6),
(265, '2018-05-24', 'libre', 1, 6),
(266, '2018-05-25', 'libre', 1, 6),
(267, '2018-05-26', 'libre', 1, 6),
(268, '2018-05-27', 'libre', 1, 6),
(269, '2018-05-28', 'libre', 1, 6),
(270, '2018-05-29', 'libre', 1, 6),
(271, '2018-05-30', 'libre', 1, 6),
(272, '2018-05-31', 'libre', 1, 6),
(273, '2018-06-01', 'libre', 1, 6),
(274, '2018-06-02', 'libre', 1, 6),
(275, '2018-06-03', 'libre', 1, 6),
(276, '2018-06-04', 'libre', 1, 6),
(277, '2018-06-05', 'libre', 1, 6),
(278, '2018-06-06', 'libre', 1, 6),
(279, '2018-06-07', 'libre', 1, 6),
(280, '2018-06-08', 'libre', 1, 6),
(281, '2018-06-09', 'libre', 1, 6),
(282, '2018-06-10', 'libre', 1, 6),
(283, '2018-06-11', 'libre', 1, 6),
(284, '2018-06-12', 'libre', 1, 6),
(285, '2018-06-13', 'libre', 1, 6),
(286, '2018-06-14', 'libre', 1, 6),
(287, '2018-06-15', 'libre', 1, 6),
(288, '2018-06-16', 'libre', 1, 6),
(289, '2018-06-17', 'libre', 1, 6),
(290, '2018-06-18', 'libre', 1, 6),
(291, '2018-06-19', 'libre', 1, 6),
(292, '2018-06-20', 'libre', 1, 6),
(293, '2018-06-21', 'libre', 1, 6),
(294, '2018-06-22', 'libre', 1, 6),
(295, '2018-06-23', 'libre', 1, 6),
(296, '2018-06-24', 'libre', 1, 6),
(297, '2018-06-25', 'libre', 1, 6),
(298, '2018-06-26', 'libre', 1, 6),
(299, '2018-06-27', 'libre', 1, 6),
(300, '2018-06-28', 'libre', 1, 6),
(301, '2018-06-29', 'libre', 1, 6),
(302, '2018-06-30', 'libre', 1, 6),
(303, '2018-07-01', 'libre', 1, 6),
(304, '2018-07-02', 'libre', 1, 6),
(305, '2018-07-03', 'libre', 1, 6),
(306, '2018-07-04', 'libre', 1, 6),
(307, '2018-07-05', 'libre', 1, 6),
(308, '2018-07-06', 'libre', 1, 6),
(309, '2018-07-07', 'libre', 1, 6),
(310, '2018-07-08', 'libre', 1, 6),
(311, '2018-07-09', 'libre', 1, 6),
(312, '2018-07-10', 'libre', 1, 6),
(313, '2018-07-11', 'libre', 1, 6),
(314, '2018-07-12', 'libre', 1, 6),
(315, '2018-07-13', 'libre', 1, 6),
(316, '2018-07-14', 'libre', 1, 6),
(317, '2018-07-15', 'libre', 1, 6),
(318, '2018-07-16', 'libre', 1, 6),
(319, '2018-07-17', 'libre', 1, 6),
(320, '2018-07-18', 'libre', 1, 6),
(321, '2018-07-19', 'libre', 1, 6),
(322, '2018-07-20', 'libre', 1, 6),
(323, '2018-07-21', 'libre', 1, 6),
(324, '2018-07-22', 'libre', 1, 6),
(325, '2018-07-23', 'libre', 1, 6),
(326, '2018-07-24', 'libre', 1, 6),
(327, '2018-07-25', 'libre', 1, 6),
(328, '2018-07-26', 'libre', 1, 6),
(329, '2018-07-27', 'libre', 1, 6),
(330, '2018-07-28', 'libre', 1, 6),
(331, '2018-07-29', 'libre', 1, 6),
(332, '2018-07-30', 'libre', 1, 6),
(333, '2018-07-31', 'libre', 1, 6),
(334, '2018-08-01', 'libre', 1, 6),
(335, '2018-08-02', 'libre', 1, 6),
(1, '2017-01-02', 'reserver', 2, 1),
(2, '2017-01-03', 'reserver', 2, 4),
(3, '2017-01-04', 'reserver', 2, 4),
(4, '2017-01-05', 'reserver', 2, 4),
(5, '2017-01-06', 'reserver', 2, 4),
(6, '2017-01-07', 'reserver', 2, 4),
(7, '2017-01-08', 'reserver', 2, 4),
(8, '2017-01-09', 'reserver', 2, 4),
(9, '2017-01-10', 'reserver', 2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `demande`
--

CREATE TABLE IF NOT EXISTS `demande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE latin1_general_ci NOT NULL,
  `dateD` date NOT NULL,
  `dateF` date NOT NULL,
  `confirme` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `location_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `dateDemande` date NOT NULL,
  `acompte` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `demandeproprio`
--

CREATE TABLE IF NOT EXISTS `demandeproprio` (
  `idD` int(11) NOT NULL AUTO_INCREMENT,
  `proprietair_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `etat` varchar(70) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`idD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `info`
--

CREATE TABLE IF NOT EXISTS `info` (
  `mentionLegale` longtext COLLATE latin1_general_ci NOT NULL,
  `conditionVente` longtext COLLATE latin1_general_ci NOT NULL,
  `descriptif` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `ville` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `tel` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `codeP` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entreprise` varchar(70) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `info`
--

INSERT INTO `info` (`mentionLegale`, `conditionVente`, `descriptif`, `adresse`, `ville`, `tel`, `codeP`, `id`, `entreprise`) VALUES
('', '', 'Duplexque isdem diebus acciderat malum, quod et Theophilum insontem atrox interceperat casus, et Serenianus dignus exsecratione cunctorum, innoxius, modo non reclamante publico vigore, discessit.\r\n\r\nExcitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens, nunc globis confertos, aliquotiens et dispersos multitudine superabatur ingenti, quae nata et educata inter editos recurvosque ambitus montium eos ut loca plana persultat et mollia, missilibus obvios eminus lacessens et ululatu truci perterrens.', 'Maison du Tourisme', 'Chateau Ville Vieille', '04 92 46 76 18', '05350', 1, 'NeigeetSoleil');

-- --------------------------------------------------------

--
-- Structure de la table `infosaison`
--

CREATE TABLE IF NOT EXISTS `infosaison` (
  `idI` int(11) NOT NULL AUTO_INCREMENT,
  `annee` year(4) NOT NULL,
  `prixS` float NOT NULL,
  `prixJ` float NOT NULL,
  `nbPiste` int(11) NOT NULL,
  `clients` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  PRIMARY KEY (`idI`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=12 ;

--
-- Contenu de la table `infosaison`
--

INSERT INTO `infosaison` (`idI`, `annee`, `prixS`, `prixJ`, `nbPiste`, `clients`, `station_id`) VALUES
(1, 2017, 26.2, 140.5, 51, 0, 1),
(2, 2017, 20.2, 120, 32, 2000, 1),
(3, 2017, 24.3, 130.32, 40, 0, 3),
(4, 2017, 22.3, 125.3, 25, 0, 4),
(5, 2017, 28, 150.3, 55, 0, 5),
(6, 2017, 50, 250.3, 24, 0, 6),
(7, 2017, 21.2, 120, 35, 0, 7),
(8, 2016, 25.6, 132.2, 48, 125000, 1),
(11, 2017, 20.2, 120, 32, 74, 1);

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `idL` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `chambre` int(2) NOT NULL,
  `place` int(2) NOT NULL,
  `ville` varchar(120) COLLATE latin1_general_ci NOT NULL,
  `adresse` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `codeP` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `vallee` varchar(70) CHARACTER SET utf8 NOT NULL,
  `prixJ` float NOT NULL,
  `prixS` float NOT NULL,
  `photos` longtext COLLATE latin1_general_ci NOT NULL,
  `detail` longtext COLLATE latin1_general_ci NOT NULL,
  `douche` int(11) NOT NULL,
  `locataire_id` int(11) NOT NULL,
  `statut` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`idL`),
  KEY `idL` (`idL`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `location`
--

INSERT INTO `location` (`idL`, `Nom`, `chambre`, `place`, `ville`, `adresse`, `codeP`, `vallee`, `prixJ`, `prixS`, `photos`, `detail`, `douche`, `locataire_id`, `statut`) VALUES
(1, 'le petit chalet', 1, 1, 'limay', '12 rue de ', '78440', 'valle des aigues', 1500, 200, '148089gqenk.jpg,541644gqenk.jpg,541646gqenk.jpg,541649gqenk.jpg,148089gqenk.jpg,541644gqenk.jpg,541646gqenk.jpg,541649gqenk.jpg', 'Illud tamen te esse admonitum volo, primum ut qualis es talem te esse omnes existiment ut, quantum a rerum turpitudine abes, tantum te a verborum libertate seiungas; deinde ut ea in alterum ne dicas, quae cum tibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit petulanter, etiamsi sine ulla suspicione, at non sine argumento male dicere? Sed istarum partium culpa est eorum, qui te agere voluerunt; laus pudoris tui, quod ea te invitum dicere videbamus, ingenii, quod ornate politeque dixisti.Illud tamen te esse admonitum volo, primum ut qualis es talem te esse omnes existiment ut, quantum a rerum turpitudine abes, tantum te a verborum libertate seiungas; deinde ut ea in alterum ne dicas, quae cum tibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit Illud tamen te esse admonitum volo, primum ut qualis es talem te esse omnes existiment ut, quantum a rerum turpitudine abes, tantum te a verborum libertate seiungas; deinde ut ea in alterum ne dicas, quae cum tibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit Illud tamen te esse admonitum volo, primum ut qualis es talem te esse omnes existiment ut, quantum a rerum turpitudine abes, tantum te a verborum libertate seiungas; deinde ut ea in alterum ne dicas, quae cum tibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit Illud tamen te esse admonitum volo, primum ut qualis es talem te esse omnes existiment ut, quantum a rerum turpitudine abes, tantum te a verborum libertate seiungas; deinde ut ea in alterum ne dicas, quae cum tibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit ', 1, 1, ''),
(2, 'le chalet 2 ', 2, 2, 'limay', '12 rue de ', '', 'valle des aigues', 150, 1200, '148089gqenk.jpg,541644gqenk.jpg,541646gqenk.jpg,541649gqenk.jpg,148089gqenk.jpg,541644gqenk.jpg,541646gqenk.jpg,541649gqenk.jpg', 'Illud tamen te esse admonitum volo, primum ut qualis es talem te esse omnes existiment ut, quantum a rerum turpitudine abes, tantum te a verborum libertate seiungas; deinde ut ea in alterum ne dicas, quae cum tibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit petulanter, etiamsi sine ulla suspicione, at non sine argumento male dicere? Sed istarum partium culpa est eorum, qui te agere voluerunt; laus pudoris tui, quod ea te invitum dicere videbamus, ingenii, quod ornate politeque dixisti.Illud tamen te esse admonitum volo, primum ut qualis es talem te esse omnes existiment ut, quantum a rerum turpitudine abes, tantum te a verborum libertate seiungas; deinde ut ea in alterum ne dicas, quae cum tibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit Illud tamen te esse admonitum volo, primum ut qualis es talem te esse omnes existiment ut, quantum a rerum turpitudine abes, tantum te a verborum libertate seiungas; deinde ut ea in alterum ne dicas, quae cum tibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit Illud tamen te esse admonitum volo, primum ut qualis es talem te esse omnes existiment ut, quantum a rerum turpitudine abes, tantum te a verborum libertate seiungas; deinde ut ea in alterum ne dicas, quae cum tibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit Illud tamen te esse admonitum volo, primum ut qualis es talem te esse omnes existiment ut, quantum a rerum turpitudine abes, tantum te a verborum libertate seiungas; deinde ut ea in alterum ne dicas, quae cum tibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit ', 1, 1, '');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `location_louer`
--
CREATE TABLE IF NOT EXISTS `location_louer` (
`id_location` int(11)
,`annee` int(4)
,`mois` int(2)
,`nbJours` bigint(21)
);
-- --------------------------------------------------------

--
-- Structure de la table `presentation`
--

CREATE TABLE IF NOT EXISTS `presentation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `text` longtext COLLATE latin1_general_ci NOT NULL,
  `intitule` varchar(70) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=7 ;

--
-- Contenu de la table `presentation`
--

INSERT INTO `presentation` (`id`, `titre`, `text`, `intitule`) VALUES
(1, 'présentation', 'Illud tamen clausos vehementer angebat quod captis navigiis, quae frumenta vehebant per flumen, Isauri quidem alimentorum copiis adfluebant, ipsi vero solitarum rerum cibos iam consumendo inediae propinquantis aerumnas exitialis horrebant.\r\n\r\nHacque adfabilitate confisus cum eadem postridie feceris, ut incognitus haerebis et repentinus, hortatore illo hesterno clientes numerando, qui sis vel unde venias diutius ambigente agnitus vero tandem et adscitus in amicitiam si te salutandi adsiduitati dederis triennio indiscretus et per tot dierum defueris tempus, reverteris ad paria perferenda, nec ubi esses interrogatus et quo tandem miser discesseris, aetatem omnem frustra in stipite conteres summittendo.', 'home'),
(2, 'Location', 'Quae dum ita struuntur, indicatum est apud Tyrum indumentum regale textum occulte, incertum quo locante vel cuius usibus apparatum. ideoque rector provinciae tunc pater Apollinaris eiusdem nominis ut conscius ductus est aliique congregati sunt ex diversis civitatibus multi, qui atrocium criminum ponderibus urgebantur.', 'location'),
(3, 'Inscription ', 'Quae dum ita struuntur, indicatum est apud Tyrum indumentum regale textum occulte, incertum quo locante vel cuius usibus apparatum. ideoque rector provinciae tunc ', 'inscription'),
(4, 'Activités', 'Quae dum ita struuntur, indicatum est apud Tyrum indumentum regale textum occulte, incertum quo locante vel cuius usibus apparatum. ideoque rector provinciae tunc pater Apollinaris eiusdem nominis ut conscius ductus est aliique congregati sunt ex diversis civitatibus multi, qui atrocium criminum ponderibus urgebantur.\r\n\r\nater Apollinaris eiusdem nominis ut conscius ductus est aliique congregati sunt ex diversis civitatibus multi, qui atrocium criminum ponderibus urgebantur.', 'activite'),
(5, 'Les stations ', 'Quae dum ita struuntur, indicatum est apud Tyrum indumentum regale textum occulte, incertum quo locante vel cuius usibus apparatum. ideoque rector provinciae tunc pater Apollinaris eiusdem nominis ut conscius ductus est aliique congregati sunt ex diversis civitatibus multi, qui atrocium criminum ponderibus urgebantur.\r\n\r\nQuae dum ita struuntur, indicatum est apud Tyrum indumentum regale textum occulte, incertum quo locante vel cuius usibus apparatum. ideoque rector provinciae tunc pater Apollinaris eiusdem nominis ut conscius ductus est aliique congregati sunt ex diversis civitatibus multi, qui atrocium criminum ponderibus urgebantur.', 'station'),
(6, 'Les détails', 'Quae dum ita struuntur, indicatum est apud Tyrum indumentum regale textum occulte, incertum quo locante vel cuius usibus apparatum. ideoque rector provinciae tunc pater Apollinaris eiusdem nominis ut conscius ductus est aliique congregati sunt ex diversis civitatibus multi, qui atrocium criminum ponderibus urgebantur.', 'detail');

-- --------------------------------------------------------

--
-- Structure de la table `proprietair`
--

CREATE TABLE IF NOT EXISTS `proprietair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `prenom` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `ville` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `adresse` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `codeP` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `tel` varchar(14) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(250) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=7 ;

--
-- Contenu de la table `proprietair`
--

INSERT INTO `proprietair` (`id`, `nom`, `prenom`, `email`, `ville`, `adresse`, `codeP`, `tel`, `password`) VALUES
(3, 'louis25', 'louis', 'paule@gmail.com', '', '', '', '', 'd41d8cd98f00b204e9800998ecf8427e'),
(5, 'azert', '', '', '', '', '', '', 'd41d8cd98f00b204e9800998ecf8427e'),
(6, '', '', 'tst@gmail.com', '', '', '', '', 'd41d8cd98f00b204e9800998ecf8427e');

-- --------------------------------------------------------

--
-- Structure de la table `saison`
--

CREATE TABLE IF NOT EXISTS `saison` (
  `idS` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `coef` float NOT NULL,
  PRIMARY KEY (`idS`),
  KEY `idS` (`idS`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=7 ;

--
-- Contenu de la table `saison`
--

INSERT INTO `saison` (`idS`, `type`, `dateDebut`, `dateFin`, `coef`) VALUES
(1, 'hauts saison', '2016-12-18', '2017-01-02', 1),
(2, 'hauts saison', '2017-02-05', '2017-03-04', 1.2),
(3, 'basse saison', '2016-12-03', '2016-12-17', 0.8),
(4, 'basse saison', '2017-01-03', '2017-02-04', 0.8),
(5, 'basse saison', '2017-03-05', '2017-04-09', 0.8),
(6, 'normal', '0000-00-00', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Structure de la table `station`
--

CREATE TABLE IF NOT EXISTS `station` (
  `ids` int(11) NOT NULL AUTO_INCREMENT,
  `ville` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `codeP` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `vallee` int(11) NOT NULL,
  `nom` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `photo` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `text` longtext COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=9 ;

--
-- Contenu de la table `station`
--

INSERT INTO `station` (`ids`, `ville`, `codeP`, `vallee`, `nom`, `photo`, `text`) VALUES
(1, 'CHATEAU VILLE VIEILLE ', '63512', 1, 'CHATE', 'imagesdasgq1.jpg', 'Eodem tempore Serenianus ex duce, cuius ignavia populatam in Phoenice Celsen ante rettulimus, pulsatae maiestatis imperii reus iure postulatus ac lege, incertum qua potuit suffragatione absolvi, aperte convictus familiarem suum cum pileo, quo caput operiebat, incantato vetitis artibus ad templum misisse fatidicum, quaeritatum expresse an ei firmum portenderetur imperium, ut cupiebat, et cunctum.          '),
(2, 'Vallée du Cristillan Ceillac', '63512', 4, 'Vallée du Cristillan Ceillac', 'aiguilles_photo1.jpg', 'Eodem tempore Serenianus ex duce, cuius ignavia populatam in Phoenice Celsen ante rettulimus, pulsatae maiestatis imperii reus iure postulatus ac lege, incertum qua potuit suffragatione absolvi, aperte convictus familiarem suum cum pileo, quo caput operiebat, incantato vetitis artibus ad templum misisse fatidicum, quaeritatum expresse an ei firmum portenderetur imperium, ut cupiebat, et cunctum.          '),
(3, 'Vallée du Cristillan Ceillac', '63512', 3, 'Vallée du Cristillan Ceillac', '541649ntlij.jpg', 'Eodem tempore Serenianus ex duce, cuius ignavia populatam in Phoenice Celsen ante rettulimus, pulsatae maiestatis imperii reus iure postulatus ac lege, incertum qua potuit suffragatione absolvi, aperte convictus familiarem suum cum pileo, quo caput operiebat, incantato vetitis artibus ad templum misisse fatidicum, quaeritatum expresse an ei firmum portenderetur imperium, ut cupiebat, et cunctum.                                                          '),
(4, 'Vallée de l''izoard arvieux', '63512', 2, 'Vallée de l''izoard arvieux', 'arvieux_photo1.jpg', 'Eodem tempore Serenianus ex duce, cuius ignavia populatam in Phoenice Celsen ante rettulimus, pulsatae maiestatis imperii reus iure postulatus ac lege, incertum qua potuit suffragatione absolvi, aperte convictus familiarem suum cum pileo, quo caput operiebat, incantato vetitis artibus ad templum misisse fatidicum, quaeritatum expresse an ei firmum portenderetur imperium, ut cupiebat, et cunctum.          '),
(5, 'Vallée de l''izoard arvieux', '63512', 1, 'Vallée de l''izoard arvieux', 'molines_photo1.jpg', 'Eodem tempore Serenianus ex duce, cuius ignavia populatam in Phoenice Celsen ante rettulimus, pulsatae maiestatis imperii reus iure postulatus ac lege, incertum qua potuit suffragatione absolvi, aperte convictus familiarem suum cum pileo, quo caput operiebat, incantato vetitis artibus ad templum misisse fatidicum, quaeritatum expresse an ei firmum portenderetur imperium, ut cupiebat, et cunctum.          '),
(6, 'CHATEAU VILLE VIEILLE ', '63512', 2, 'CHATE', 'saintveran_photo1.jpg', 'Eodem tempore Serenianus ex duce, cuius ignavia populatam in Phoenice Celsen ante rettulimus, pulsatae maiestatis imperii reus iure postulatus ac lege, incertum qua potuit suffragatione absolvi, aperte convictus familiarem suum cum pileo, quo caput operiebat, incantato vetitis artibus ad templum misisse fatidicum, quaeritatum expresse an ei firmum portenderetur imperium, ut cupiebat, et cunctum.          '),
(8, 'CHATEAU VILLE VIEILLE ', '63512', 3, 'CHATE', 'testbphew.jpg', 'Eodem tempore Serenianus ex duce, cuius ignavia populatam in Phoenice Celsen ante rettulimus, pulsatae maiestatis imperii reus iure postulatus ac lege, incertum qua potuit suffragatione absolvi, aperte convictus familiarem suum cum pileo, quo caput operiebat, incantato vetitis artibus ad templum misisse fatidicum, quaeritatum expresse an ei firmum portenderetur imperium, ut cupiebat, et cunctum.          ');

-- --------------------------------------------------------

--
-- Structure de la vue `location_louer`
--
DROP TABLE IF EXISTS `location_louer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `location_louer` AS select distinct `datelocation`.`id_location` AS `id_location`,extract(year from `datelocation`.`dateJour`) AS `annee`,extract(month from `datelocation`.`dateJour`) AS `mois`,count(`datelocation`.`id_location`) AS `nbJours` from `datelocation` where (`datelocation`.`libre` = 'reserver') group by `annee`,`mois`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
