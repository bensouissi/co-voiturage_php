-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 01 Novembre 2015 à 21:12
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `co_voiturage`
--

-- --------------------------------------------------------

--
-- Structure de la table `connection`
--

CREATE TABLE IF NOT EXISTS `connection` (
  `Code_cnx` int(10) NOT NULL AUTO_INCREMENT,
  `Code_usr` int(10) NOT NULL,
  `date_cnx` date NOT NULL,
  `heure_cnx` date NOT NULL,
  `resultat` varchar(10) NOT NULL,
  PRIMARY KEY (`Code_cnx`),
  KEY `Code_usr` (`Code_usr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `historique`
--

CREATE TABLE IF NOT EXISTS `historique` (
  `Code_historique` int(10) NOT NULL AUTO_INCREMENT,
  `code_usr` int(10) NOT NULL,
  `code_parcours` int(10) NOT NULL,
  PRIMARY KEY (`Code_historique`),
  KEY `code_usr` (`code_usr`),
  KEY `code_parcours` (`code_parcours`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `parcours`
--

CREATE TABLE IF NOT EXISTS `parcours` (
  `Code_parcours` int(10) NOT NULL AUTO_INCREMENT,
  `Code_usr` int(10) NOT NULL,
  `heure_depart` varchar(6) NOT NULL,
  `date_depart` date NOT NULL,
  `Code_ville_depart` int(10) NOT NULL,
  `Code_ville_arriv` int(10) NOT NULL,
  `fum` tinyint(1) NOT NULL,
  `bagage` tinyint(1) NOT NULL,
  `animal` tinyint(1) NOT NULL,
  `etat` tinyint(1) NOT NULL,
  `nbr_place` int(2) NOT NULL,
  `description` text NOT NULL,
  `tarif` double NOT NULL,
  PRIMARY KEY (`Code_parcours`),
  UNIQUE KEY `Code_usr` (`Code_usr`),
  KEY `Code_ville_depart` (`Code_ville_depart`),
  KEY `Code_ville_arriv` (`Code_ville_arriv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `Code_usr` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(10) NOT NULL,
  `date_naissance` date NOT NULL,
  `sexe` varchar(10) NOT NULL,
  `tel` int(8) NOT NULL,
  `date_inscription` date NOT NULL,
  `ville` varchar(10) NOT NULL,
  `note` int(1) NOT NULL,
  `qst_securite` varchar(40) NOT NULL,
  `reponse_securite` varchar(40) NOT NULL,
  PRIMARY KEY (`Code_usr`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE IF NOT EXISTS `ville` (
  `Code_ville` int(10) NOT NULL AUTO_INCREMENT,
  `longitude` double NOT NULL,
  `attitude` double NOT NULL,
  `nom_ville` varchar(10) NOT NULL,
  PRIMARY KEY (`Code_ville`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ville_etape`
--

CREATE TABLE IF NOT EXISTS `ville_etape` (
  `Code_ville_etape` int(10) NOT NULL AUTO_INCREMENT,
  `Code_ville` int(10) NOT NULL,
  `code_parcours` int(10) NOT NULL,
  PRIMARY KEY (`Code_ville_etape`),
  KEY `Code_ville` (`Code_ville`),
  KEY `code_parcours` (`code_parcours`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `connection`
--
ALTER TABLE `connection`
  ADD CONSTRAINT `connection_ibfk_1` FOREIGN KEY (`Code_usr`) REFERENCES `user` (`Code_usr`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `historique`
--
ALTER TABLE `historique`
  ADD CONSTRAINT `historique_ibfk_1` FOREIGN KEY (`code_parcours`) REFERENCES `parcours` (`Code_parcours`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historique_ibfk_2` FOREIGN KEY (`code_usr`) REFERENCES `user` (`Code_usr`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
