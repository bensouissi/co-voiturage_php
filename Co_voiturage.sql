-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 30 Octobre 2015 à 12:47
-- Version du serveur :  10.0.17-MariaDB
-- Version de PHP :  5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--

-- Base de données :  `co_voiturage`
--
CREATE DATABASE IF NOT EXISTS `co_voiturage` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `co_voiturage`;

-- --------------------------------------------------------

--
-- Structure de la table `connection`
--

CREATE TABLE `connection` (
  `Code_cnx` int(10) NOT NULL,
  `Code_usr` int(10) NOT NULL,
  `date_cnx` date NOT NULL,
  `heure_cnx` date NOT NULL,
  `resultat` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `historique`
--

CREATE TABLE `historique` (
  `Code_historique` int(10) NOT NULL,
  `code_usr` int(10) NOT NULL,
  `code_parcours` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `parcours`
--

CREATE TABLE `parcours` (
  `Code_parcours` int(10) NOT NULL,
  `Code_usr` int(10) NOT NULL,
  `heure_depart` varchar(6) NOT NULL,
  `date_depart` date NOT NULL,
  `Code_ville_depart` int(10) NOT NULL,
  `Code_ville_arrivé` int(10) NOT NULL,
  `fumé` tinyint(1) NOT NULL,
  `bagage` tinyint(1) NOT NULL,
  `animal` tinyint(1) NOT NULL,
  `etat` tinyint(1) NOT NULL,
  `nbr_place` int(2) NOT NULL,
  `description` text NOT NULL,
  `tarif` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `Code_usr` int(10) NOT NULL,
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
  `reponse_securite` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `Code_ville` int(10) NOT NULL,
  `longitude` double NOT NULL,
  `attitude` double NOT NULL,
  `nom_ville` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ville_etape`
--

CREATE TABLE `ville_etape` (
  `Code_ville_etape` int(10) NOT NULL,
  `Code_ville` int(10) NOT NULL,
  `code_parcours` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `connection`
--
ALTER TABLE `connection`
  ADD PRIMARY KEY (`Code_cnx`),
  ADD KEY `Code_usr` (`Code_usr`);

--
-- Index pour la table `historique`
--
ALTER TABLE `historique`
  ADD PRIMARY KEY (`Code_historique`),
  ADD KEY `code_usr` (`code_usr`),
  ADD KEY `code_parcours` (`code_parcours`);

--
-- Index pour la table `parcours`
--
ALTER TABLE `parcours`
  ADD PRIMARY KEY (`Code_parcours`),
  ADD UNIQUE KEY `Code_usr` (`Code_usr`),
  ADD KEY `Code_ville_depart` (`Code_ville_depart`),
  ADD KEY `Code_ville_arrivé` (`Code_ville_arrivé`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Code_usr`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`Code_ville`);

--
-- Index pour la table `ville_etape`
--
ALTER TABLE `ville_etape`
  ADD PRIMARY KEY (`Code_ville_etape`),
  ADD KEY `Code_ville` (`Code_ville`),
  ADD KEY `code_parcours` (`code_parcours`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `connection`
--
ALTER TABLE `connection`
  MODIFY `Code_cnx` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `historique`
--
ALTER TABLE `historique`
  MODIFY `Code_historique` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `parcours`
--
ALTER TABLE `parcours`
  MODIFY `Code_parcours` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `Code_usr` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `Code_ville` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `ville_etape`
--
ALTER TABLE `ville_etape`
  MODIFY `Code_ville_etape` int(10) NOT NULL AUTO_INCREMENT;
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

--
-- Contraintes pour la table `parcours`
--
ALTER TABLE `parcours`
  ADD CONSTRAINT `parcours_ibfk_1` FOREIGN KEY (`Code_ville_depart`) REFERENCES `ville` (`Code_ville`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `parcours_ibfk_2` FOREIGN KEY (`Code_ville_arrivé`) REFERENCES `ville` (`Code_ville`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `parcours_ibfk_3` FOREIGN KEY (`Code_usr`) REFERENCES `user` (`Code_usr`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ville_etape`
--
ALTER TABLE `ville_etape`
  ADD CONSTRAINT `ville_etape_ibfk_1` FOREIGN KEY (`Code_ville`) REFERENCES `ville` (`Code_ville`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ville_etape_ibfk_2` FOREIGN KEY (`code_parcours`) REFERENCES `parcours` (`Code_parcours`) ON DELETE CASCADE ON UPDATE CASCADE;
--

--

