-- phpMyAdmin SQL Dump
-- version 4.6.6deb1+deb.cihar.com~xenial.2
-- https://www.phpmyadmin.net/
--
-- Client :  localhost
-- Généré le :  Lun 19 Février 2018 à 18:48
-- Version du serveur :  10.0.33-MariaDB-0ubuntu0.16.04.1
-- Version de PHP :  7.0.25-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `mycologie`
--

-- --------------------------------------------------------

--
-- Structure de la table `biotope`
--

CREATE TABLE `biotope` (
  `id` int(10) UNSIGNED NOT NULL,
  `region` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `biotope`
--

INSERT INTO `biotope` (`id`, `region`, `updated_at`, `created_at`) VALUES
(1, 'Sous châtaigniers', '2018-02-14 14:07:41', '2018-02-14 14:07:41'),
(2, 'Sous conifère', '2018-02-14 14:07:41', '2018-02-14 14:07:41'),
(3, 'Sous peupliers tremble', '2018-02-14 14:09:10', '2018-02-14 14:09:10'),
(4, 'Sous épicéas', '2018-02-14 14:09:10', '2018-02-14 14:09:10'),
(5, 'Sous bouleaux', '2018-02-14 14:09:10', '2018-02-14 14:09:10'),
(6, 'Sous pins', '2018-02-14 14:09:10', '2018-02-14 14:09:10'),
(7, 'Sous frênes', '2018-02-14 14:09:10', '2018-02-14 14:09:10'),
(8, 'Sous chênes', '2018-02-14 14:09:10', '2018-02-14 14:09:10'),
(9, 'En sphaigne', '2018-02-14 14:09:10', '2018-02-14 14:09:10'),
(10, 'Sous érables', '2018-02-14 14:09:10', '2018-02-14 14:09:10'),
(11, 'Sous feuillus', '2018-02-14 14:10:39', '2018-02-14 14:10:39'),
(12, 'Sous mélèzes', '2018-02-14 14:10:39', '2018-02-14 14:10:39'),
(13, 'Dans les prés', '2018-02-14 14:11:01', '2018-02-14 14:11:01'),
(14, 'Milieux herbeux', '2018-02-14 14:11:01', '2018-02-14 14:11:01'),
(15, 'Autre', '2018-02-14 14:50:55', '2018-02-14 14:50:55');

-- --------------------------------------------------------

--
-- Structure de la table `edibility`
--

CREATE TABLE `edibility` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `edibility`
--

INSERT INTO `edibility` (`id`, `status`, `updated_at`, `created_at`) VALUES
(1, 'Mortel', '2018-02-14 14:06:42', '2018-02-14 14:06:42'),
(2, 'Toxique', '2018-02-14 14:06:42', '2018-02-14 14:06:42'),
(3, 'Toxique/comestible avec recommandation', '2018-02-19 16:37:43', '2018-02-14 14:06:42'),
(4, 'Comestible', '2018-02-14 14:06:42', '2018-02-14 14:06:42'),
(5, 'Sans valeur', '2018-02-14 14:06:42', '2018-02-14 14:06:42'),
(6, 'Comestible bien cuit', '2018-02-14 14:06:54', '2018-02-14 14:06:54'),
(7, 'Suspect', '2018-02-14 14:56:04', '2018-02-14 14:56:04');

-- --------------------------------------------------------

--
-- Structure de la table `specie`
--

CREATE TABLE `specie` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_latin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_french` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `edibility_id` int(10) UNSIGNED NOT NULL,
  `trophic_status_id` int(10) UNSIGNED NOT NULL,
  `biotope_id` int(10) UNSIGNED NOT NULL,
  `other_region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `specie`
--

INSERT INTO `specie` (`id`, `name_latin`, `name_french`, `edibility_id`, `trophic_status_id`, `biotope_id`, `other_region`, `updated_at`, `created_at`) VALUES
(1, 'Abortiporus biennis', 'Polypore bisannuel', 5, 3, 15, NULL, '2018-02-14 15:07:21', '2018-02-14 14:55:34'),
(2, 'Agaricus urinascens ', 'Agaric géant des prés', 7, 3, 13, NULL, '2018-02-14 15:07:22', '2018-02-14 14:57:44'),
(3, 'Agaricus arvensis', 'Agaric des jachères, Boule-de-neige', 7, 3, 15, NULL, '2018-02-14 15:07:22', '2018-02-14 14:57:44'),
(4, 'Agaricus augustus ', 'Agaric impérial', 5, 3, 15, NULL, '2018-02-14 15:07:22', '2018-02-14 15:06:45'),
(5, 'Agaricus bernardii', 'Agaric des prés salés', 2, 3, 15, NULL, '2018-02-14 15:07:22', '2018-02-14 15:06:45'),
(6, 'Agaricus bisporus', 'Champignon de Paris forme sauvage', 4, 3, 15, NULL, '2018-02-14 15:16:22', '2018-02-14 15:13:32'),
(7, 'Agaricus bitorquis', 'Agaric des trottoirs', 4, 3, 15, NULL, '2018-02-14 15:16:22', '2018-02-14 15:13:32'),
(8, 'Agaricus campestris', 'Rosé des prés, Agaric champêtre', 4, 3, 15, NULL, '2018-02-14 15:16:22', '2018-02-14 15:14:31'),
(9, 'Agaricus comtulus ', 'Agaric élégant', 4, 3, 13, NULL, '2018-02-14 15:16:22', '2018-02-14 15:14:31'),
(10, 'Hypholoma capnoides ', 'Hypholome à lames enfumées', 2, 3, 2, NULL, '2018-02-14 15:16:22', '2018-02-14 15:15:34'),
(11, 'Schizopora paradoxa', 'Polypore paradoxal', 5, 3, 11, NULL, '2018-02-14 15:16:22', '2018-02-14 15:15:34');

-- --------------------------------------------------------

--
-- Structure de la table `trophic_status`
--

CREATE TABLE `trophic_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `trophic_status`
--

INSERT INTO `trophic_status` (`id`, `status`, `updated_at`, `created_at`) VALUES
(1, 'Parasite biotrophe', '2018-02-14 14:12:02', '2018-02-14 14:12:02'),
(2, 'Parasite nécrotrophe', '2018-02-14 14:12:02', '2018-02-14 14:12:02'),
(3, 'Saprotrophe', '2018-02-14 14:12:36', '2018-02-14 14:12:36'),
(4, 'Mycorhizien', '2018-02-14 14:12:36', '2018-02-14 14:12:36');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `mail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` text COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `mail`, `password`, `last_name`, `first_name`, `role`, `updated_at`, `created_at`) VALUES
(1, 'geoffreybaier@gmail.com', '$2y$10$4chd6qUIvwbWgVRYz1DQkOegNCpVurf3eX3VwMszGNw71iivIr8uK', 'Baier', 'Geoffrey', 'user', '2018-02-14 09:07:49', '2018-02-14 09:07:49');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `biotope`
--
ALTER TABLE `biotope`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `biotope_region_unique` (`region`),
  ADD KEY `biotope_id_index` (`id`);

--
-- Index pour la table `edibility`
--
ALTER TABLE `edibility`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `edibility_status_unique` (`status`),
  ADD KEY `edibility_id_index` (`id`);

--
-- Index pour la table `specie`
--
ALTER TABLE `specie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `specie_name_latin_unique` (`name_latin`),
  ADD UNIQUE KEY `specie_name_french_unique` (`name_french`),
  ADD KEY `specie_id_index` (`id`),
  ADD KEY `specie_name_latin_index` (`name_latin`),
  ADD KEY `specie_edibility_id_index` (`edibility_id`),
  ADD KEY `specie_biotope_id_index` (`biotope_id`),
  ADD KEY `specie_trophic_status_id_index` (`trophic_status_id`);

--
-- Index pour la table `trophic_status`
--
ALTER TABLE `trophic_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trophic_status_status_unique` (`status`),
  ADD KEY `trophic_status_id_index` (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_mail_unique` (`mail`),
  ADD KEY `user_id_index` (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `biotope`
--
ALTER TABLE `biotope`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `edibility`
--
ALTER TABLE `edibility`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `specie`
--
ALTER TABLE `specie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `trophic_status`
--
ALTER TABLE `trophic_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `specie`
--
ALTER TABLE `specie`
  ADD CONSTRAINT `specie_biotope_id_foreign` FOREIGN KEY (`biotope_id`) REFERENCES `biotope` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `specie_edibility_id_foreign` FOREIGN KEY (`edibility_id`) REFERENCES `edibility` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `specie_trophic_status_id_foreign` FOREIGN KEY (`trophic_status_id`) REFERENCES `trophic_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
