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
-- Base de données :  `c`
--
CREATE DATABASE IF NOT EXISTS `c` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `c`;
--
-- Base de données :  `cdcol`
--
CREATE DATABASE IF NOT EXISTS `cdcol` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;
USE `cdcol`;
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
  `note` int(1) NOT NULL
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
-- Base de données :  `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Structure de la table `pma_bookmark`
--

CREATE TABLE `pma_bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Structure de la table `pma_column_info`
--

CREATE TABLE `pma_column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma_designer_coords`
--

CREATE TABLE `pma_designer_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `v` tinyint(4) DEFAULT NULL,
  `h` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for Designer';

-- --------------------------------------------------------

--
-- Structure de la table `pma_history`
--

CREATE TABLE `pma_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma_navigationhiding`
--

CREATE TABLE `pma_navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Structure de la table `pma_pdf_pages`
--

CREATE TABLE `pma_pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma_recent`
--

CREATE TABLE `pma_recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Contenu de la table `pma_recent`
--

INSERT INTO `pma_recent` (`username`, `tables`) VALUES
('root', '[{"db":"co_voiturage","table":"parcours"},{"db":"co_voiturage","table":"connection"},{"db":"co_voiturage","table":"ville_etape"},{"db":"co_voiturage","table":"ville"},{"db":"co_voiturage","table":"user"},{"db":"co_voiturage","table":"historique"},{"db":"co_voiturage","table":"ville_Etape"},{"db":"co_voiturage","table":"Connection"},{"db":"Co_Voiturage","table":"User"},{"db":"co_voiturage","table":"utilisateur"}]');

-- --------------------------------------------------------

--
-- Structure de la table `pma_relation`
--

CREATE TABLE `pma_relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Structure de la table `pma_savedsearches`
--

CREATE TABLE `pma_savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Structure de la table `pma_table_coords`
--

CREATE TABLE `pma_table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Structure de la table `pma_table_info`
--

CREATE TABLE `pma_table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma_table_uiprefs`
--

CREATE TABLE `pma_table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Structure de la table `pma_tracking`
--

CREATE TABLE `pma_tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Structure de la table `pma_userconfig`
--

CREATE TABLE `pma_userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Contenu de la table `pma_userconfig`
--

INSERT INTO `pma_userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2015-10-30 11:47:21', '{"lang":"fr","collation_connection":"utf8mb4_unicode_ci","ThemeDefault":"pmahomme"}');

-- --------------------------------------------------------

--
-- Structure de la table `pma_usergroups`
--

CREATE TABLE `pma_usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Structure de la table `pma_users`
--

CREATE TABLE `pma_users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Index pour les tables exportées
--

--
-- Index pour la table `pma_bookmark`
--
ALTER TABLE `pma_bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pma_column_info`
--
ALTER TABLE `pma_column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Index pour la table `pma_designer_coords`
--
ALTER TABLE `pma_designer_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Index pour la table `pma_history`
--
ALTER TABLE `pma_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Index pour la table `pma_navigationhiding`
--
ALTER TABLE `pma_navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Index pour la table `pma_pdf_pages`
--
ALTER TABLE `pma_pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Index pour la table `pma_recent`
--
ALTER TABLE `pma_recent`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma_relation`
--
ALTER TABLE `pma_relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Index pour la table `pma_savedsearches`
--
ALTER TABLE `pma_savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Index pour la table `pma_table_coords`
--
ALTER TABLE `pma_table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Index pour la table `pma_table_info`
--
ALTER TABLE `pma_table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Index pour la table `pma_table_uiprefs`
--
ALTER TABLE `pma_table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Index pour la table `pma_tracking`
--
ALTER TABLE `pma_tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Index pour la table `pma_userconfig`
--
ALTER TABLE `pma_userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma_usergroups`
--
ALTER TABLE `pma_usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Index pour la table `pma_users`
--
ALTER TABLE `pma_users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `pma_bookmark`
--
ALTER TABLE `pma_bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pma_column_info`
--
ALTER TABLE `pma_column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pma_history`
--
ALTER TABLE `pma_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pma_pdf_pages`
--
ALTER TABLE `pma_pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pma_savedsearches`
--
ALTER TABLE `pma_savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Base de données :  `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Base de données :  `utilisateurs`
--
CREATE DATABASE IF NOT EXISTS `utilisateurs` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `utilisateurs`;
--
-- Base de données :  `webauth`
--
CREATE DATABASE IF NOT EXISTS `webauth` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;
USE `webauth`;

-- --------------------------------------------------------

--
-- Structure de la table `user_pwd`
--

CREATE TABLE `user_pwd` (
  `name` char(30) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `pass` char(32) COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `user_pwd`
--

INSERT INTO `user_pwd` (`name`, `pass`) VALUES
('xampp', 'wampp');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `user_pwd`
--
ALTER TABLE `user_pwd`
  ADD PRIMARY KEY (`name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
