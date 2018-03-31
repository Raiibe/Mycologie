-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 30 Mars 2018 à 21:07
-- Version du serveur :  10.0.34-MariaDB-0ubuntu0.16.04.1
-- Version de PHP :  7.0.28-0ubuntu0.16.04.1

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
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `biotope`
--

INSERT INTO `biotope` (`id`, `region`, `updated_at`, `created_at`) VALUES
(1, 'Sous châtaigniers', '2018-02-14 13:07:41', '2018-02-14 13:07:41'),
(2, 'Sous conifère', '2018-02-14 13:07:41', '2018-02-14 13:07:41'),
(3, 'Sous peupliers tremble', '2018-02-14 13:09:10', '2018-02-14 13:09:10'),
(4, 'Sous épicéas', '2018-02-14 13:09:10', '2018-02-14 13:09:10'),
(5, 'Sous bouleaux', '2018-02-14 13:09:10', '2018-02-14 13:09:10'),
(6, 'Sous pins', '2018-02-14 13:09:10', '2018-02-14 13:09:10'),
(7, 'Sous frênes', '2018-02-14 13:09:10', '2018-02-14 13:09:10'),
(8, 'Sous chênes', '2018-02-14 13:09:10', '2018-02-14 13:09:10'),
(9, 'En sphaigne', '2018-02-14 13:09:10', '2018-02-14 13:09:10'),
(10, 'Sous érables', '2018-02-14 13:09:10', '2018-02-14 13:09:10'),
(11, 'Sous feuillus', '2018-02-14 13:10:39', '2018-02-14 13:10:39'),
(12, 'Sous mélèzes', '2018-02-14 13:10:39', '2018-02-14 13:10:39'),
(13, 'Dans les prés', '2018-02-14 13:11:01', '2018-02-14 13:11:01'),
(14, 'Milieux herbeux', '2018-02-14 13:11:01', '2018-02-14 13:11:01'),
(15, 'Autre', '2018-02-14 13:50:55', '2018-02-14 13:50:55'),
(16, 'Sous hêtres', '2018-03-13 14:23:22', '2018-03-13 14:23:22'),
(17, 'Forêts', '2018-03-13 14:25:02', '2018-03-13 14:25:02');

-- --------------------------------------------------------

--
-- Structure de la table `edibility`
--

CREATE TABLE `edibility` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `name_latin` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name_french` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `edibility_id` int(10) UNSIGNED NOT NULL,
  `trophic_status_id` int(10) UNSIGNED NOT NULL,
  `biotope_id` int(10) UNSIGNED NOT NULL,
  `other_region` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `confusion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `specie`
--

INSERT INTO `specie` (`id`, `name_latin`, `name_french`, `edibility_id`, `trophic_status_id`, `biotope_id`, `other_region`, `confusion`, `creator_id`, `updated_at`, `created_at`) VALUES
(1, 'Abortiporus biennis \r\n', 'Polypore bisannuel\r\n', 5, 3, 15, 'Surtout sur bois enterré\r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:43'),
(2, 'Agaricus urinascens \r\n', 'Agaric géant des prés\r\n', 7, 1, 13, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:43'),
(3, 'Agaricus arvensis \r\n', 'Agaric des jachères, Boule-de-neige\r\n', 7, 3, 15, 'Pâturages, lieux clairs\r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:43'),
(4, 'Agaricus augustus \r\n', 'Agaric impérial\r\n', 7, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:43'),
(5, 'Agaricus bernardii \r\n', 'Agaric des prés salés\r\n', 2, 1, 13, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:43'),
(6, 'Agaricus bisporus \r\n', 'Champignon de Paris forme sauvage\r\n', 4, 3, 15, 'Lieux fumés\r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:43'),
(7, 'Agaricus bitorquis \r\n', 'Agaric des trottoirs\r\n', 4, 3, 15, 'Surtout sur sols tassés\r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:43'),
(8, 'Agaricus campestris \r\n', 'Rosé des prés, Agaric champêtre\r\n', 4, 3, 15, 'Pâturages\r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:43'),
(9, 'Agaricus comtulus \r\n', 'Agaric élégant\r\n', 4, 1, 13, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:43'),
(10, 'Hypholoma capnoides \r\n', 'Hypholome à lames enfumées\r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:43'),
(11, 'Schizopora paradoxa \r\n', 'Polypore paradoxal\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:43'),
(12, 'Hymenochaete rubiginosa \r\n', 'Hyménochaete rouille\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:43'),
(13, 'Hygrophorus russula \r\n', 'Hygrophore russule\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:43'),
(14, 'Agaricus langei \r\n', 'Agaricus rougissant\r\n', 4, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:43'),
(15, 'Agaricus macrocarpus \r\n', 'Agaric géant des bois\r\n', 7, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:43'),
(16, 'Agaricus porphyrizon \r\n', 'Agaric porphyre\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:43'),
(17, 'Agaricus moelleri \r\n', 'Agaric pintade\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(18, 'Agaricus dulcidulus \r\n', 'Agaric douceâtre\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(19, 'Agaricus sylvaticus \r\n', 'Agaric des forêts\r\n', 4, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(20, 'Agaricus sylvicola \r\n', 'Agaric anisé des bois\r\n', 7, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(21, 'Agaricus benesii \r\n', 'Agaric blanc sanguinolent\r\n', 4, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(22, 'Agaricus subperonatus \r\n', 'Agaric guêtré\r\n', 4, 3, 15, 'Sur sols fumés\r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(23, 'Agaricus xanthodermus \r\n', 'Agaric jaunissant\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(24, 'Agrocybe erebia \r\n', 'Agrocybe ténébreuse\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(25, 'Agrocybe praecox \r\n', 'Agrocybe précoce\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(26, 'Aleuria aurantia \r\n', 'Pezize orangée\r\n', 4, 3, 15, 'Surtout sur sol sableux. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(27, 'Amanita excelsa \r\n', 'Amanite élevée\r\n', 6, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(28, 'Amanita battarrae \r\n', 'Amanite à cocarde\r\n', 6, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(29, 'Amanita crocea \r\n', 'Amanite safran\r\n', 6, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(30, 'Amanita echinocephala \r\n', 'Amanite épineuse\r\n', 2, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(31, 'Amanita francheti \r\n', 'Amanite à voile jaune\r\n', 6, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(32, 'Amanita fulva \r\n', 'Amanite fauve\r\n', 6, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(33, 'Amanita gemmata \r\n', 'Amanite jonquille\r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(34, 'Amanita lividopallescens \r\n', 'Amanite livide\r\n', 2, 4, 15, 'Bois, lieux clairs. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(35, 'Amanita oblongospora \r\n', 'Amanite à spores allongées\r\n', 2, 4, 15, 'Bois, lieux clairs. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(36, 'Amanita muscaria \r\n', 'Amanite tue-mouches\r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(37, 'Amanita ceciliae \r\n', 'Amanite impériale\r\n', 6, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(38, 'Amanita ovoidea \r\n', 'Amanite ovoïde\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(39, 'Amanita phalloides \r\n', 'Amanite phalloïde\r\n', 1, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(40, 'Amanita pantherina \r\n', 'Amanite panthère\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(41, 'Amanita porphyria \r\n', 'Amanite porphyre\r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(42, 'Amanita rubescens \r\n', 'Amanite rougissante\r\n', 6, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(43, 'Amanita phalloides var. alba\r\n', 'Amanite phalloïde blanche\r\n', 1, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(44, 'Amanita rubescens var. annulosulfurea\r\n', 'Amanite rougissante à anneau jaune\r\n', 6, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(45, 'Cystolepiota seminuda \r\n', 'Lépiote demi-nue\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(46, 'Amanita strobiliformis \r\n', 'Amanite solitaire\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(47, 'Amanita submembranacea \r\n', 'Amanite à volve grise\r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(48, 'Hygrophorus pustulatus \r\n', 'Hygrophore pustuleux\r\n', 4, 1, 4, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(49, 'Amanita vaginata \r\n', 'Amanite vaginée\r\n', 6, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:44'),
(50, 'Amanita virosa \r\n', 'Amanite vireuse\r\n', 1, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:45'),
(51, 'Amanita verna \r\n', 'Amanite printanière\r\n', 1, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:45'),
(52, 'Armillaria mellea \r\n', 'Armillaire couleur de miel\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:45'),
(53, 'Armillaria tabescens \r\n', 'Armillaire sans anneau\r\n', 2, 1, 8, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:45'),
(54, 'Ascocoryne sarcoides \r\n', 'Pezize gélatineuse pourpre\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:45'),
(55, 'Astraeus hygrometricus \r\n', 'Astrée hygrométrique\r\n', 5, 4, 15, 'Sol sableux. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:45'),
(56, 'Armillaria ostoyae \r\n', 'Armillaire obscure\r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:45'),
(57, 'Aureoboletus gentilis \r\n', 'Bolet cramoisi\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:45'),
(58, 'Auricularia auricula-judae \r\n', 'Oreille-de-Judas\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:45'),
(59, 'Auricularia mesenterica \r\n', 'Oreille poilue\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:45'),
(60, 'Auriscalpium vulgare \r\n', 'Hydne cure-oreilles\r\n', 5, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:45'),
(61, 'Bertia moriformis \r\n', 'Bertia en forme de mûre\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:45'),
(62, 'Bisporella citrina \r\n', 'Micro pezize citrine\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(63, 'Bjerkandera adusta \r\n', 'Tramète brûlée\r\n', 5, 5, 15, 'Sur bois.\r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(64, 'Suillus cavipes \r\n', 'Bolet à pied creux\r\n', 4, 1, 12, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(65, 'Boletopsis leucomelaena \r\n', 'Faux bolet rougissant\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(66, 'Boletus aereus \r\n', 'Cèpe bronzé\r\n', 4, 1, 8, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(67, 'Boletus reticulatus \r\n', 'Cèpe d’été\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(68, 'Butyriboletus appendiculatus \r\n', 'Bolet appendiculé\r\n', 6, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(69, 'Caloboletus calopus \r\n', 'Bolet à beau pied\r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(70, 'Boletus depilatus \r\n', 'Bolet chauve\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(71, 'Boletus edulis \r\n', 'Cèpe de Bordeaux\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(72, 'Boletus erythropus \r\n', 'Bolet à pied rouge\r\n', 6, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(73, 'Boletus impolitus \r\n', 'Bolet dépoli\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(74, 'Suillelus luridus \r\n', 'Bolet blafard\r\n', 6, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(75, 'Boletus pinophilus \r\n', 'Cèpe des pins\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(76, 'Butyriboletus pseudoregius \r\n', 'Bolet faux royal\r\n', 6, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(77, 'Suillelus queletii \r\n', 'Bolet de Quélet\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(78, 'Caloboletus radicans \r\n', 'Bolet radicant\r\n', 7, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(79, 'Butyriboletus regius \r\n', 'Bolet royal\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(80, 'Rubroboletus satanas \r\n', 'Bolet Satan\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(81, 'Bondarzewia mesenterica \r\n', 'Polypore mésentérique\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(82, 'Bovista plumbea \r\n', 'Vesse-de-loup plombée\r\n', 5, 1, 13, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(83, 'Bulgaria inquinans \r\n', 'Bulgarie salissante\r\n', 5, 1, 8, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(84, 'Calocera cornea \r\n', 'Calocère en forme de corne\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(85, 'Calocera viscosa \r\n', 'Calocère visqueuse\r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(86, 'Rugosomyces carneus \r\n', 'Collybie carnée\r\n', 5, 1, 13, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(87, 'Rugosomyces chrysenteron \r\n', 'Collybie à chair jaune\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(88, 'Tricholomella constricta \r\n', 'Faux avrillot d’automne\r\n', 4, 1, 13, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(89, 'Tricholomella leucocephala \r\n', 'Calocybe à tête blanche\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(90, 'Calocybe gambosa \r\n', 'Avrillot\r\n', 6, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(91, 'Polyporus umbellatus \r\n', 'Polypore en ombelle\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(92, 'Cystolepiota bucknalli \r\n', 'Lépiote à odeur sulfureuse\r\n', 7, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(93, 'Crucibulum laeve \r\n', 'Crucibule lisse\r\n', 5, 3, 15, 'Sur bois mort. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(94, 'Cantharellus cibarius \r\n', 'Girole\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(95, 'Cantharellus amethysteus \r\n', 'Chanterelle améthyste\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:46'),
(96, 'Cortinarius rubellus \r\n', 'Cortinaire très élégant\r\n', 1, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(97, 'Cantharellus friesii \r\n', 'Chanterelle abricot\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(98, 'Cortinarius spilomeus \r\n', 'Cortinaire tacheté\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(99, 'Cortinarius meinhardii \r\n', 'Cortinaire splendide\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(100, 'Chalciporus piperatus \r\n', 'Bolet poivré\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(101, 'Chamaemyces fracidus \r\n', 'Lépiote à pied tavelé\r\n', 5, 1, 14, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(102, 'Cheimonophyllum candidissimum \r\n', 'Faux crépidote blanc de neige\r\n', 5, 3, 15, 'Sur bois. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(103, 'Chlorociboria aeruginascens \r\n', 'Pezize turquoise\r\n', 5, 3, 15, 'Sur bois. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(104, 'Choiromyces venosus \r\n', 'Truffe des porçins\r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(105, 'Chondrostereum purpureum \r\n', 'Stérée pourpre\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(106, 'Chroogomphus rutilus \r\n', 'Gomphide rutilant\r\n', 4, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(107, 'Hypoxylon fragiforme \r\n', 'Hypoxylon petite fraise\r\n', 5, 3, 15, 'Sur bois. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(108, 'Clathrus archeri \r\n', 'Clathre étoilé\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(109, 'Clavaria fragilis \r\n', 'Clavaire fragile\r\n', 5, 1, 14, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(110, 'Clavariadelphus pistillaris \r\n', 'Clavaire en pilon\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(111, 'Clavulina cinerea \r\n', 'Clavaire cendrée\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(112, 'Clavulina cristata \r\n', 'Clavaire dentelée\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(113, 'Clavulina rugosa \r\n', 'Clavaire ridée\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(114, 'Clavulinopsis fusiformis \r\n', 'Clavaire en fuseau\r\n', 5, 1, 14, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(115, 'Clitocybe alexandri \r\n', 'Clitocybe plombé\r\n', 4, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(116, 'Cortinarius bulbosus \r\n', 'Cortinaire bulbeux\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(117, 'Ampulloclitocybe clavipes \r\n', 'Clitocybe à pied en  massue\r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(118, 'Clitocybe costata \r\n', 'Clitocybe côtelé\r\n', 4, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(119, 'Hygrophorus pudorinus \r\n', 'Hygrophore pudibond\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(120, 'Amanita citrina \r\n', 'Amanite citrine\r\n', 7, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(121, 'Hygrophorus poetarum \r\n', 'Hygrophore des poètes\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(122, 'Clitocybe ditopa \r\n', 'Clitocybe à odeur de  farine\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(123, 'Clitocybe fragrans \r\n', 'Clitocybe anisé strié\r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(124, 'Hygrophorus persoonii \r\n', 'Hygrophore de Persoon\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(125, 'Clitocybe gibba \r\n', 'Clitocybe en entonnoir\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(126, 'Clitocybe inornata \r\n', 'Clitocybe à odeur de  poisson\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(127, 'Infundibulicybe geotropa \r\n', 'Clitocybe géotrope\r\n', 7, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(128, 'Clitocybe metachroa \r\n', 'Clitocybe à centre brun\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(129, 'Clitocybe nebularis\r\n', 'Clitocybe nébuleux, Saint-Martin\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(130, 'Cortinarius privignus \r\n', 'Cortinaire apparenté à Cortinarius malachius\r\n', 5, 1, 4, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:47'),
(131, 'Clitocybe odora \r\n', 'Clitocybe odorant\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(132, 'Clitocybe phaeophthalma \r\n', 'Clitocybe à odeur de  poulailler\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(133, 'Clitocybe phyllophila \r\n', 'Clitocybe des feuilles\r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(134, 'Clitocybe rivulosa \r\n', 'Clitocybe dit du bord des  routes\r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(135, 'Clitocybe umbilicata \r\n', 'Clitocybe ombiliqué\r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(136, 'Clitocybe vibecina \r\n', 'Clitocybe moisi\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(137, 'Clitopilus prunulus \r\n', 'Meunier\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(138, 'Connopus acervatus \r\n', 'Collybie à pied rouge des  conifères\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(139, 'Cantharellus cinereus \r\n', 'Chanterelle cendrée\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(140, 'Gymnopus ocior \r\n', 'Collybie ambrée\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(141, 'Gymnopus confluens \r\n', 'Collybie en touffes\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(142, 'Craterellus sinuosus \r\n', 'Craterelle sinueuse\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(143, 'Gymnopus dryophilus \r\n', 'Collybie des chênes\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(144, 'Gymnopus fusipes \r\n', 'Collybie à pied en  fuseau\r\n', 7, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(145, 'Gymnopus erythropus \r\n', 'Collybie à pied rouge\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(146, 'Hypholoma radicosum \r\n', 'Hypholome radicant\r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(147, 'Hypholoma marginatum \r\n', 'Hypholome marginé\r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(148, 'Gymnopus peronatus \r\n', 'Collybie guêtrée\r\n', 7, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(149, 'Coltricia perennis \r\n', 'Polypore durable\r\n', 5, 3, 15, 'Surtout sur charbonnières. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(150, 'Coprinopsis atramentaria \r\n', 'Coprin noir d’encre\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(151, 'Coprinus comatus \r\n', 'Coprin chevelu\r\n', 4, 3, 15, 'Terrains gras. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(152, 'Coprinellus disseminatus \r\n', 'Coprin grégaire\r\n', 5, 3, 15, 'Sur bois. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(153, 'Coprinopsis lagopus \r\n', 'Coprin pied-de-lièvre\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(154, 'Coprinellus micaceus \r\n', 'Coprin micacé\r\n', 7, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(155, 'Coprinopsis picacea \r\n', 'Coprin pie\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(156, 'Parasola plicatilis \r\n', 'Coprin parasol\r\n', 5, 1, 14, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(157, 'Elaphocordyceps capitata \r\n', 'Cordyceps à tête renflée\r\n', 5, 5, 15, 'Sur truffes des cerfs. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(158, 'Elaphocordyceps ophioglossoides \r\n', 'Cordyceps langue-de-serpent\r\n', 5, 5, 15, 'Sur truffes des cerfs. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(159, 'Cortinarius acutus \r\n', 'Cortinaire à mamelon pointu\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(160, 'Cortinarius alboviolaceus \r\n', 'Cortinaire blanc violacé\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(161, 'Cortinarius allutus \r\n', 'Cortinaire lavé\r\n', 4, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(162, 'Cortinarius prasinus \r\n', 'Cortinaire vert poireau\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(163, 'Cortinarius amoenolens \r\n', 'Cortinaire à odeur agréable\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(164, 'Cortinarius anomalus \r\n', 'Cortinaire irrégulier\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(165, 'Cortinarius arcuatorum \r\n', 'Cortinaire des Arcuati\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(166, 'Cortinarius argutus \r\n', 'Cortinaire à pied pointu\r\n', 5, 1, 3, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(167, 'Cortinarius armillatus \r\n', 'Cortinaire à bracelets\r\n', 4, 1, 5, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(168, 'Cortinarius azureus \r\n', 'Cortinaire azur\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:48'),
(169, 'Cortinarius balteatocumatilis \r\n', 'Cortinaire entre C. balteatus et C.  cumatilis\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(170, 'Cortinarius balteatus \r\n', 'Cortinaire à marge zonée\r\n', 5, 4, 15, 'Epicéas ou bois mêlés. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(171, 'Cortinarius bataillei \r\n', 'Cortinaire de Bataille\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(172, 'Cortinarius cagei \r\n', 'Cortinaire de Cage\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(173, 'Cortinarius bivelus \r\n', 'Cortinaire à deux voiles\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(174, 'Cortinarius bolaris \r\n', 'Cortinaire ocre rouge\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(175, 'Cortinarius boudieri \r\n', 'Cortinaire de Boudier\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(176, 'Cortinarius brunneus \r\n', 'Cortinaire brun\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(177, 'Cortinarius bulliardii \r\n', 'Cortinaire de Bulliard\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(178, 'Cortinarius caerulescens \r\n', 'Cortinaire bleu outremer\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(179, 'Cortinarius caesiocanescens \r\n', 'Cortinaire gris bleu blanchissant\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(180, 'Cortinarius coerulescentium \r\n', 'Cortinaire devenant bleu\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(181, 'Cortinarius callochrous \r\n', 'Cortinaire aux belles couleurs\r\n', 5, 4, 15, 'Dans les hêtraies sur sol calcaire. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(182, 'Ramaria flaccida \r\n', 'Ramaire flasque\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(183, 'Inocybe agardhii \r\n', 'Inocybe d Agardh\r\n', 2, 1, 5, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(184, 'Inocybe asterospora \r\n', 'Inocybe à spores étoilées\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(185, 'Inocybe bongardii \r\n', 'Inocybe de Bongard Inocybe à odeur de bergamote\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(186, 'Inocybe calamistrata \r\n', 'Inocybe à base verte\r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(187, 'Inocybe cervicolor \r\n', 'Inocybe couleur de cerf\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(188, 'Inocybe cincinnata \r\n', 'Inocybe à mèches bouclées\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(189, 'Inocybe cookei \r\n', 'Inocybe de Cooke\r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(190, 'Inocybe corydalina \r\n', 'Inocybe à odeur de corydale\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(191, 'Inocybe dulcamara \r\n', 'Inocybe doux-amer\r\n', 2, 4, 15, 'Lieux ouverts + sablonneux. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(192, 'Inocybe adaequata \r\n', 'Inocybe du Jura\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(193, 'Inocybe pyriodora \r\n', 'Inocybe à odeur de poire\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(194, 'Inocybe geophylla \r\n', 'Inocybe à lames terreuses\r\n', 2, 4, 15, 'Bois mêlés, sol argilo-calcaire. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(195, 'Inocybe geophylla var. lilacina \r\n', 'Inocybe à lames terreuses, variété lilacine\r\n', 2, 4, 15, 'Bois mêlés, sol argilo-calcaire. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(196, 'Inocybe godeyi \r\n', 'Inocybe de Godey\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(197, 'Inocybe erubescens \r\n', 'Inocybe de Patouillard\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(198, 'Inocybe lanuginosa \r\n', 'Inocybe laineux\r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(199, 'Inocybe maculata \r\n', 'Inocybe maculé\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(200, 'Inocybe napipes \r\n', 'Inocybe à pied en navet\r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(201, 'Inocybe whitei \r\n', 'Inocybe pudique\r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(202, 'Inocybe rimosa \r\n', 'Inocybe fastigié\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(203, 'Inocybe terrigena \r\n', 'Inocybe annelé\r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(204, 'Inocybe hypophaea \r\n', 'Inocybe brun ochracé\r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(205, 'Pseudoinonotus dryadeus \r\n', 'Polypore larmoyant\r\n', 5, 1, 8, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:49'),
(206, 'Inonotus hispidus \r\n', 'Polypore hérissé\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(207, 'Xanthoporia radiata \r\n', 'Polypore de l aulne\r\n', 5, 5, 15, 'Surtout sous aulnes. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(208, 'Ischnoderma benzoinum \r\n', 'Polypore balsamique\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(209, 'Kuehneromyces mutabilis \r\n', 'Pholiote changeante\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(210, 'Laccaria amethystina \r\n', 'Laccaire améthyste\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(211, 'Laccaria bicolor \r\n', 'Laccaire bicolore\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(212, 'Laccaria laccata \r\n', 'Laccaire laqué\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(213, 'Laccaria proxima \r\n', 'Laccaire très proche du Laccaire  laqué\r\n', 4, 1, 9, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(214, 'Laccaria tortilis \r\n', 'Laccaire tortillé\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(215, 'Lactarius acerrimus \r\n', 'Lactaire à lames interveinées\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(216, 'Lactarius acris \r\n', 'Lactaire âcre\r\n', 5, 1, 16, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(217, 'Lactarius albocarneus \r\n', 'Lactaire glutineux\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(218, 'Lactarius aurantiacus \r\n', 'Lactaire orangé\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(219, 'Ramaria flava \r\n', 'Ramaire jaune\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(220, 'Lactarius azonites \r\n', 'Lactaire à pied blanc\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(221, 'Lactarius badiosanguineus \r\n', 'Lactaire rouge sombre\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(222, 'Lactarius blennius \r\n', 'Lactaire muqueux\r\n', 2, 1, 16, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(223, 'Lactarius blennius var. viridis \r\n', 'Lactaire muqueux, variété verte\r\n', 2, 1, 16, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(224, 'Lactarius camphoratus \r\n', 'Lactaire à odeur de chicorée\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(225, 'Lactarius chrysorrheus \r\n', 'Lactaire à lait jaunissant\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(226, 'Lactarius circellatus \r\n', 'Lactaire cerclé\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(227, 'Lactarius controversus \r\n', 'Lactaire des peupliers\r\n', 5, 1, 3, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(228, 'Lactarius cremor \r\n', 'Lactaire cannelé\r\n', 5, 1, 16, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(229, 'Lactarius decipiens \r\n', 'Lactaire trompeur\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(230, 'Lactarius deliciosus \r\n', 'Lactaire délicieux\r\n', 4, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(231, 'Lactarius deterrimus \r\n', 'Lactaire des épicéas\r\n', 4, 1, 4, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(232, 'Lactarius evosmus \r\n', 'Lactaire à odeur de pomme\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(233, 'Lactarius flavidus \r\n', 'Lactaire jaunâtre\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(234, 'Lactarius fluens \r\n', 'Lactaire pisse-lait\r\n', 5, 1, 16, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(235, 'Lactarius fuliginosus \r\n', 'Lactaire fuligineux\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(236, 'Lactarius fulvissimus \r\n', 'Lactaire fauve\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(237, 'Lactarius glyciosmus \r\n', 'Lactaire à odeur de noix de  coco\r\n', 5, 1, 5, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(238, 'Lactarius helvus \r\n', 'Lactaire à odeur de céleri\r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(239, 'Lactarius hepaticus \r\n', 'Lactaire hépatique\r\n', 5, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(240, 'Lactarius hysginus \r\n', 'Lactaire cireux\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(241, 'Lactarius lacunarum \r\n', 'Lactaire des bourbiers\r\n', 5, 4, 15, 'Lieux humides. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(242, 'Lactarius lignyotus \r\n', 'Lactaire velours\r\n', 4, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(243, 'Lactarius mammosus \r\n', 'Lactaire mamelonné\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(244, 'Lactarius pallidus \r\n', 'Lactaire pâle\r\n', 5, 1, 16, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:50'),
(245, 'Lactarius pergamenus \r\n', 'Lactaire parcheminé\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(246, 'Lactarius picinus \r\n', 'Lactaire enfumé\r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(247, 'Lactarius piperatus \r\n', 'Lactaire poivré\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(248, 'Psathyrella piluliformis \r\n', 'Psathyrelle hydrophile\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(249, 'Lactarius pterosporus \r\n', 'Lactaire ridulé\r\n', 5, 4, 15, 'Surtout sous charmes et noisetiers. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(250, 'Lactarius pubescens \r\n', 'Lactaire pubescent\r\n', 2, 1, 5, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(251, 'Lactarius pyrogalus \r\n', 'Lactaire à lait brûlant\r\n', 2, 4, 15, 'Surtout sous noisetiers. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(252, 'Lactarius quieticolor \r\n', 'Lactaire orangé gris\r\n', 4, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(253, 'Lactarius quietus \r\n', 'Lactaire à odeur de punaise\r\n', 5, 1, 8, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(254, 'Lactarius romagnesii \r\n', 'Lactaire très sombre\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(255, 'Lactarius rufus \r\n', 'Lactaire roux\r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(256, 'Lactarius ruginosus \r\n', 'Lactaire festonné\r\n', 5, 1, 16, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(257, 'Lactarius salmonicolor \r\n', 'Lactaire saumon\r\n', 4, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(258, 'Lactarius sanguifluus \r\n', 'Lactaire sanguin\r\n', 4, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(259, 'Lactarius scrobiculatus \r\n', 'Lactaire à fossettes\r\n', 2, 1, 4, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(260, 'Lactarius semisanguifluus \r\n', 'Lactaire semi-sanguin\r\n', 4, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(261, 'Lactarius serifluus \r\n', 'Lactaire petit lait \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(262, 'Lactarius subdulcis \r\n', 'Lactaire caoutchouc \r\n', 5, 1, 16, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(263, 'Lactarius turpis \r\n', 'Lactaire plombé \r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(264, 'Lactarius subumbonatus \r\n', 'Lactaire chagriné \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(265, 'Lactarius tabidus \r\n', 'Lactaire chiffonné \r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(266, 'Lactarius torminosus \r\n', 'Lactaire à toison \r\n', 2, 1, 5, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(267, 'Lactarius trivialis \r\n', 'Lactaire trivial \r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(268, 'Lactarius uvidus \r\n', 'Lactaire humide \r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(269, 'Lactarius vellereus \r\n', 'Lactaire velouté \r\n', 2, 1, 8, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(270, 'Lactarius vietus \r\n', 'Lactaire fané \r\n', 5, 1, 5, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(271, 'Lactarius vellereus var. hometii \r\n', 'Lactaire velouté à lait rosissant\r\n', 2, 1, 8, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(272, 'Lactarius violascens \r\n', 'Lactaire violascent \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(273, 'Lactarius volemus \r\n', 'Lactaire à lait abondant \r\n', 4, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(274, 'Lactarius zonarius \r\n', 'Lactaire zoné \r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(275, 'Laetiporus sulphureus \r\n', 'Polypore soufré \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(276, 'Leccinum albostipitatum \r\n', 'Bolet orangé à pied blanc \r\n', 4, 1, 3, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(277, 'Leccinum aurantiacum \r\n', 'Bolet orangé des chênes \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(278, 'Leccinum crocipodium \r\n', 'Bolet craquelé \r\n', 4, 1, 8, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(279, 'Leccinum cyaneobasileucum \r\n', 'Bolet rude à base bleue \r\n', 4, 1, 5, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(280, 'Leccinum duriusculum \r\n', 'Bolet rude des trembles \r\n', 4, 1, 3, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(281, 'Leccinum holopus \r\n', 'Bolet blanc des marais \r\n', 4, 1, 5, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(282, 'Leccinum melaneum \r\n', 'Bolet rude noirâtre \r\n', 4, 1, 5, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:51'),
(283, 'Boletus piceinus \r\n', 'Bolet rude des épicéas \r\n', 4, 1, 4, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(284, 'Leccinum pseudoscabrum \r\n', 'Bolet rude des charmes \r\n', 4, 4, 15, 'Surtout sous charmes. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(285, 'Leccinum scabrum \r\n', 'Bolet rude \r\n', 4, 1, 5, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(286, 'Leccinum variicolor \r\n', 'Bolet ramoneur \r\n', 4, 1, 5, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(287, 'Leccinum versipelle \r\n', 'Bolet à revêtement changeant \r\n', 4, 1, 5, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(288, 'Lentinellus cochleatus \r\n', 'Lentin en colimaçon \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(289, 'Lentinellus cochleatus var. inolens \r\n', 'Lentin en colimaçon, variété inodore\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(290, 'Lentinellus micheneri \r\n', 'Lentin en forme d’omphale \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(291, 'Lentinus tigrinus \r\n', 'Lentin tigré \r\n', 4, 1, 3, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(292, 'Panus conchatus \r\n', 'Lentin en forme de coquillage \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(293, 'Lenzites betulina \r\n', 'Lenzite du bouleau \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(294, 'Leotia lubrica \r\n', 'Léotie visqueuse \r\n', 2, 3, 15, 'Endroits humides. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(295, 'Lepiota brunneoincarnata \r\n', 'Lépiote brun-rose \r\n', 1, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(296, 'Lepiota castanea \r\n', 'Lépiote châtain \r\n', 1, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(297, 'Lepiota clypeolaria \r\n', 'Lépiote en bouclier \r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(298, 'Lepiota cristata \r\n', 'Lépiote à crêtes\r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(299, 'Lepiota felina \r\n', 'Lépiote féline \r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(300, 'Lepiota ignivolvata \r\n', 'Lépiote à base rouge \r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(301, 'Lepiota subincarnata \r\n', 'Lépiote de Josserand \r\n', 1, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(302, 'Lepiota magnispora \r\n', 'Lépiote à voile jaune \r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(303, 'Lepista flaccida \r\n', 'Clitocybe flasque \r\n', 7, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(304, 'Rhodocollybia maculata \r\n', 'Collybie maculée \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(305, 'Lepista glaucocana \r\n', 'Tricholome gris glauque \r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(306, 'Psathyrella multipedata\r\n', 'Psathyrelle à pieds multiples \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(307, 'Lepista irina \r\n', 'Tricholome à odeur d’iris \r\n', 7, 1, 13, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(308, 'Lepista nuda \r\n', 'Pied-bleu\r\n', 6, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(309, 'Lepista panaeolus \r\n', 'Argouane des prés \r\n', 4, 1, 14, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(310, 'Lepista personata \r\n', 'Pied-violet \r\n', 6, 1, 13, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(311, 'Lepista sordida \r\n', 'Petit pied-bleu  \r\n', 4, 1, 13, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(312, 'Leucocoprinus badhamii \r\n', 'Lépiote de Badham \r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(313, 'Leucoagaricus leucothites \r\n', 'Lépiote pudique \r\n', 4, 1, 14, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(314, 'Leucocoprinus cretaceus \r\n', 'Lépiote blanc de craie \r\n', 1, 3, 15, 'Sur terre fumée. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(315, 'Leucocoprinus birnbaumii \r\n', 'Lépiote jaune \r\n', 2, 3, 15, 'Sur terreau. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(316, 'Leucocortinarius bulbiger \r\n', 'Faux cortinaire bulbeux \r\n', 4, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(317, 'Leucopaxillus giganteus \r\n', 'Leucopaxille géant \r\n', 2, 1, 14, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(318, 'Limacella guttata \r\n', 'Limacelle tachée \r\n', 4, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(319, 'Lycoperdon echinatum \r\n', 'Vesse-de-loup hérisson \r\n', 7, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(320, 'Lycoperdon mammiforme \r\n', 'Vesse-de-loup voilée \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(321, 'Lycoperdon perlatum \r\n', 'Vesse-de-loup perlée \r\n', 7, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(322, 'Lycoperdon pyriforme \r\n', 'Vesse-de-loup en forme de poire\r\n', 7, 3, 15, 'Sur bois pourri. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:52'),
(323, 'Lycoperdon umbrinum \r\n', 'Vesse-de-loup brun d’ombre \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(324, 'Lyophyllum connatum \r\n', 'Clitocybe en touffes \r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(325, 'Lyophyllum decastes \r\n', 'Tricholome en touffes \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(326, 'Lyophyllum fumosum \r\n', 'Tricholome enfumé \r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(327, 'Macrocystidia cucumis \r\n', 'Fausse collybie à odeur de concombre \r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(328, 'Macrolepiota excoriata \r\n', 'Lépiote excoriée \r\n', 4, 1, 13, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(329, 'Macrolepiota fuliginosa \r\n', 'Lépiote gris fumé \r\n', 4, 1, 13, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(330, 'Macrolepiota mastoidea \r\n', 'Lépiote mamelonnée \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(331, 'Macrolepiota procera \r\n', 'Coulemelle, Lépiote élevée\r\n', 6, 1, 13, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(332, 'Chlorophyllum rachodes \r\n', 'Lépiote déguenillée \r\n', 6, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(333, 'Chlorophyllum brunneum \r\n', 'Lépiote déguenillée, variété dite de  Bohême \r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(334, 'Psathyrella maculata \r\n', 'Psathyrelle tachée \r\n', 5, 3, 15, 'Sur les souches. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(335, 'Pluteus phlebophorus \r\n', 'Plutée veiné \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(336, 'Typhula filiformis \r\n', 'Clavaire filiforme \r\n', 5, 3, 15, 'En colonies sur feuilles mortes. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(337, 'Gymnopus foetidus \r\n', 'Marasme fétide \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(338, 'Gymnopus perforans \r\n', 'Marasme perforant \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(339, 'Marasmiellus ramealis \r\n', 'Marasme des ramilles \r\n', 5, 3, 15, 'Sur rameaux de feuilles et brindilles. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(340, 'Mycetinis alliaceus \r\n', 'Marasme à odeur d’ail \r\n', 5, 1, 16, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(341, 'Agaricus cappellianus \r\n', 'Agaric des bords de route \r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(342, 'Marasmius cohaerens \r\n', 'Marasme à pied corné \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(343, 'Mycena epipterygia var. viscosa \r\n', 'Mycène visqueuse \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(344, 'Marasmius epiphyllus \r\n', 'Marasme des feuilles \r\n', 5, 3, 15, 'Surtout sur nervures et pétioles de feuilles. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(345, 'Marasmius oreades \r\n', 'Marasme des Oréades \r\n', 4, 1, 14, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(346, 'Marasmius rotula \r\n', 'Marasme petite roue \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(347, 'Marasmius wyneae \r\n', 'Marasme globuleux \r\n', 5, 3, 15, 'Sur feuilles et débris de bois. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(348, 'Megacollybia platyphylla \r\n', 'Collybie à lames larges\r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(349, 'Melanoleuca grammopodia \r\n', 'Tricholome à pied rayé \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(350, 'Melanoleuca melaleuca \r\n', 'Tricholome noir et blanc \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(351, 'Melanoleuca polioleuca \r\n', 'Tricholome à chair brune \r\n', 4, 3, 15, 'Parcs et jardins. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(352, 'Meripilus giganteus \r\n', 'Polypore géant \r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(353, 'Mitrophora semilibera \r\n', 'Morillon \r\n', 6, 3, 15, 'Lieux humides. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(354, 'Tylopilus porphyrosporus \r\n', 'Bolet à sporée pourprée \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(355, 'Morchella esculenta \r\n', 'Morille blonde \r\n', 6, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(356, 'Psathyrella candolleana \r\n', 'Psathyrelle de De Candolle \r\n', 7, 3, 15, 'Lieux clairs. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(357, 'Mutinus caninus \r\n', 'Satyre du chien \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(358, 'Mycena epipterygia \r\n', 'Mycène à pied jaune \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:53'),
(359, 'Mycena galericulata \r\n', 'Mycène en casque \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(360, 'Mycena galopus \r\n', 'Mycène à lait blanc\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(361, 'Mycena haematopus \r\n', 'Mycène à lait rouge \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(362, 'Mycena inclinata \r\n', 'Mycène inclinée \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(363, 'Mycena maculata \r\n', 'Mycène tachée \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(364, 'Mycena pelianthina \r\n', 'Mycène à arête violette \r\n', 2, 1, 16, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(365, 'Mycena polygramma \r\n', 'Mycène à pied strié \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(366, 'Mycena pura\r\n', 'Mycène pure\r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(367, 'Mycena rosea \r\n', 'Mycène vieux rose \r\n', 2, 1, 16, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(368, 'Mycena rosella \r\n', 'Mycène rosâtre \r\n', 5, 3, 15, 'En troupes parmi les aiguilles. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(369, 'Mycena stipata \r\n', 'Mycène alcaline \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(370, 'Myxomphalia maura \r\n', 'Omphale des charbonnières \r\n', 5, 3, 15, 'Sur charbonnières. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54');
INSERT INTO `specie` (`id`, `name_latin`, `name_french`, `edibility_id`, `trophic_status_id`, `biotope_id`, `other_region`, `confusion`, `creator_id`, `updated_at`, `created_at`) VALUES
(371, 'Neolentinus adhaerens \r\n', 'Lentin collant \r\n', 5, 3, 15, 'Sur bois de résineux. Espèce montagnarde. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(372, 'Postia caesia \r\n', 'Polypore bleuté des conifères \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(373, 'Postia stiptica \r\n', 'Polypore astringent \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(374, 'Omphalotus illudens \r\n', 'Faux clitocybe lumineux \r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(375, 'Otidea onotica \r\n', 'Oreille d’âne \r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(376, 'Oudemansiella mucida \r\n', 'Collybie visqueuse \r\n', 5, 1, 16, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(377, 'Otidea alutacea \r\n', 'Oreille couleur cuir \r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(378, 'Otidea cochleata \r\n', 'Oreille brun d’ombre \r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(379, 'Panaeolus semiovatus \r\n', 'Panéole semi-ovoïde \r\n', 2, 3, 15, 'Sur excréments.\r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(380, 'Panaeolina foenisecii \r\n', 'Panéole des foins \r\n', 2, 1, 13, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(381, 'Panaeolus papilionaceus \r\n', 'Panéole à lames papilionacées \r\n', 2, 1, 13, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(382, 'Psathyrella cotonea \r\n', 'Psathyrelle cotonneuse \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(383, 'Panellus mitis \r\n', 'Panelle doux  \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(384, 'Panellus serotinus \r\n', 'Faux pleurote à lames abricot \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(385, 'Panellus stipticus \r\n', 'Panelle astringent \r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(386, 'Tapinella atrotomentosa \r\n', 'Paxille à pied noir \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(387, 'Psathyrella caput-medusae \r\n', 'Psathyrelle tête-de-méduse \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(388, 'Paxillus involutus \r\n', 'Paxille enroulé \r\n', 1, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(389, 'Tapinella panuoides \r\n', 'Paxille en forme de Panus \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(390, 'Paxillus rubicundulus \r\n', 'Paxille rougeâtre \r\n', 1, 4, 15, 'Surtout sous aulnes. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(391, 'Peniophora quercina \r\n', 'Peniophore du chêne \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(392, 'Peniophora incarnata \r\n', 'Peniophore rose saumon\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(393, 'Peziza badia \r\n', 'Pezize baie \r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(394, 'Peziza cerea \r\n', 'Pezize cireuse \r\n', 5, 3, 15, 'Sur débris humides. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(395, 'Peziza succosa \r\n', 'Pezize à suc jaune \r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(396, 'Peziza vesiculosa \r\n', 'Pezize vésiculeuse \r\n', 4, 3, 15, 'Sur paille, compost, etc. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(397, 'Phaeolus schweinitzii \r\n', 'Polypore de Schweinitz \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(398, 'Phaeomarasmius erinaceus \r\n', 'Phaéomarasme hérisson \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:54'),
(399, 'Phallus impudicus \r\n', 'Satyre puant, Phallus impudique\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(400, 'Phellinus hartigii \r\n', 'Polypore du sapin \r\n', 5, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(401, 'Phellinus igniarius \r\n', 'Polypore faux amadouvier \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(402, 'Fomitiporia robusta \r\n', 'Phellin du chêne \r\n', 5, 1, 8, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(403, 'Phellodon confluens \r\n', 'Hydne confluent \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(404, 'Phellodon melaleucus \r\n', 'Hydne noir et blanc\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(405, 'Phellodon niger \r\n', 'Hydne noir \r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(406, 'Mycoacia uda \r\n', 'Phlebia humide\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(407, 'Pholiota adiposa \r\n', 'Pholiote graisseuse \r\n', 7, 1, 16, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(408, 'Pholiota alnicola \r\n', 'Pholiote des aulnes \r\n', 7, 5, 15, 'Surtout sur aulnes et saules.\r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(409, 'Pholiota astragalina \r\n', 'Pholiote orange feu \r\n', 7, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(410, 'Pholiota aurivella \r\n', 'Pholiote toison d’or \r\n', 7, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(411, 'Polyporus varius \r\n', 'Polypore variable \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(412, 'Pholiota flammans \r\n', 'Pholiote flamboyante \r\n', 7, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(413, 'Pholiota flavida \r\n', 'Pholiote jaunâtre \r\n', 7, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(414, 'Pholiota gummosa \r\n', 'Pholiote gommeuse \r\n', 7, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(415, 'Pholiota highlandensis \r\n', 'Pholiote des charbonnières \r\n', 7, 3, 15, 'Sur charbonnières. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(416, 'Pholiota jahnii \r\n', 'Pholiote de Jahn \r\n', 7, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(417, 'Pholiota lenta \r\n', 'Pholiote glutineuse \r\n', 7, 5, 15, 'Sur bois.\r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(418, 'Pholiota lucifera \r\n', 'Pholiote lumineuse \r\n', 7, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(419, 'Hemipholiota populnea \r\n', 'Pholiote destructrice \r\n', 5, 1, 3, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(420, 'Pholiota scamba \r\n', 'Pholiote soyeuse \r\n', 7, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(421, 'Pholiota spumosa \r\n', 'Pholiote baveuse \r\n', 7, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(422, 'Pholiota squarrosa \r\n', 'Pholiote écailleuse \r\n', 2, 5, 15, 'Sur bois.\r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(423, 'Pholiota tuberculosa \r\n', 'Pholiote à pied renflé \r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(424, 'Phyllotopsis nidulans \r\n', 'Pleurote nicheur \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(425, 'Rigidoporus sanguinolentus \r\n', 'Polypore sanguinolent \r\n', 5, 1, 5, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(426, 'Xenasmatella sulphurea \r\n', 'Phlebiella soufré \r\n', 5, 3, 15, 'Sur bois mort. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(427, 'Piptoporus betulinus \r\n', 'Polypore du bouleau \r\n', 5, 1, 5, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(428, 'Pisolithus arrhizos \r\n', 'Pisolithe dit sans racine \r\n', 5, 4, 15, 'Sols sableux dans les bois. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(429, 'Pleurotus cornucopiae \r\n', 'Pleurote corne d’abondance \r\n', 6, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(430, 'Pleurotus dryinus \r\n', 'Pleurote du chêne \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(431, 'Pleurotus eryngii \r\n', 'Pleurote du panicaut \r\n', 6, 3, 15, 'Sur racines de panicauts \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(432, 'Pleurotus ostreatus \r\n', 'Pleurote en huitre \r\n', 6, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(433, 'Pleurotus pulmonarius \r\n', 'Pleurote en poumon \r\n', 6, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:55'),
(434, 'Plicaturopsis crispa \r\n', 'Plicature à lames crispées \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(435, 'Pluteus cervinus \r\n', 'Plutée couleur de cerf \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(436, 'Pluteus leoninus \r\n', 'Plutée jaune lion \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(437, 'Pluteus petasatus \r\n', 'Plutée en parasol \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(438, 'Pluteus salicinus \r\n', 'Plutée du saule \r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(439, 'Pluteus umbrosus \r\n', 'Plutée brun d’ombre \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(440, 'Pleurocybella porrigens \r\n', 'Oreille-de-St-Pierre \r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(441, 'Polyporus brumalis \r\n', 'Polypore d’hiver \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(442, 'Polyporus ciliatus \r\n', 'Polypore cilié \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(443, 'Polyporus squamosus \r\n', 'Polypore écailleux \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(444, 'Polyporus tuberaster \r\n', 'Polypore à sclérote  \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(445, 'Ramaria formosa \r\n', 'Ramaire jolie \r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(446, 'Ramaria fumigata \r\n', 'Ramaire enfumée \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(447, 'Ramaria gracilis \r\n', 'Ramaire gracile \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(448, 'Ramaria pallida \r\n', 'Ramaire pâle \r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(449, 'Ramaria stricta \r\n', 'Ramaire serrée \r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(450, 'Rhizina undulata \r\n', 'Rhizine ondulée \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(451, 'Rhizopogon roseolus \r\n', 'Rhizopogon rosé \r\n', 5, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(452, 'Rhodocybe gemina \r\n', 'Rhodocybe tronqué \r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(456, 'Rickenella fibula \r\n', 'Omphale épingle \r\n', 5, 3, 15, 'Dans les mousses. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(457, 'Ripartites metrodii \r\n', 'Ripartite de Métrod \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(458, 'Ripartites tricholoma \r\n', 'Ripartite à marge barbue \r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(459, 'Cortinarius caperatus \r\n', 'Pholiote ridée \r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(463, 'Russula acrifolia \r\n', 'Russule à lames âcres \r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(464, 'Russula adusta \r\n', 'Russule brûlée \r\n', 5, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(465, 'Russula aeruginea \r\n', 'Russule vert-de-gris \r\n', 6, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(466, 'Russula albonigra \r\n', 'Russule blanche et noire \r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(467, 'Russula alutacea \r\n', 'Russule alutacée \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(468, 'Russula caerulea \r\n', 'Russule mamelonnée \r\n', 5, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(469, 'Russula amethystina \r\n', 'Russule améthyste \r\n', 4, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:56'),
(470, 'Russula amoena \r\n', 'Russule veloutée \r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(474, 'Russula anthracina \r\n', 'Russule anthracite \r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(475, 'Russula aquosa \r\n', 'Russule aqueuse \r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(476, 'Russula atropurpurea \r\n', 'Russule noire et pourpre \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(477, 'Russula aurea \r\n', 'Russule dorée \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(481, 'Russula integra \r\n', 'Russule des épicéas \r\n', 4, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(482, 'Russula badia \r\n', 'Russule perfide \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(483, 'Russula betularum \r\n', 'Russule émétique des bouleaux \r\n', 2, 1, 5, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(484, 'Russula carpini \r\n', 'Russule des charmes \r\n', 4, 4, 15, 'Surtout sous charmes. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(489, 'Russula cavipes \r\n', 'Russule à pied creux \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(490, 'Russula chloroides \r\n', 'Russule à lames glauques \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(491, 'Russula cuprea \r\n', 'Russule cuivrée \r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(492, 'Russula cyanoxantha \r\n', 'Russule charbonnière \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(497, 'Russula cyanoxantha fo. cutefracta \r\n', 'Russule charbonnière craquelée \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(498, 'Russula cyanoxantha fo. peltereaui \r\n', 'Russule charbonnière verte \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(499, 'Russula decipiens \r\n', 'Russule trompeuse \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(500, 'Russula decolorans \r\n', 'Russule orangée grisonnante \r\n', 4, 4, 15, 'Surtout hauts marais. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(503, 'Russula delica \r\n', 'Russule faux-lactaire \r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(504, 'Russula densifolia \r\n', 'Russule à lames serrées \r\n', 5, 4, 15, 'Dans les bois siliceux. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(505, 'Russula sardonia \r\n', 'Russule sardoine\r\n', 2, 4, 15, 'Dans les pinèdes sablonneuses. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:57'),
(506, 'Russula emetica \r\n', 'Russule émétique \r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:58'),
(511, 'Russula silvestris \r\n', 'Russule émétique des chênes \r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:58'),
(512, 'Russula exalbicans \r\n', 'Russule pâlissante \r\n', 5, 1, 5, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:58'),
(513, 'Russula faginea \r\n', 'Russule écrevisse des hêtres\r\n', 4, 1, 16, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:58'),
(514, 'Russula farinipes \r\n', 'Russule à pied farineux \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:58'),
(519, 'Russula fellea \r\n', 'Russule fiel \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:58'),
(520, 'Russula foetens \r\n', 'Russule fétide \r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:58'),
(521, 'Russula fragilis \r\n', 'Russule fragile \r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:58'),
(522, 'Russula fuscorubroides \r\n', 'Russule fausse rouge sombre \r\n', 5, 1, 4, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:58'),
(527, 'Russula graveolens \r\n', 'Russule écrevisse des chênes \r\n', 4, 1, 8, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:58'),
(528, 'Russula grisea \r\n', 'Russule grise \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:58'),
(529, 'Russula heterophylla \r\n', 'Russule à lames fourchues\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:58'),
(530, 'Russula illota \r\n', 'Russule mal lavée \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:58'),
(535, 'Russula langei \r\n', 'Russule charbonnière à pied dur \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:58'),
(536, 'Russula grata \r\n', 'Russule frangipane \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:58'),
(537, 'Russula rosea \r\n', 'Russule rose \r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:58'),
(538, 'Russula lilacea \r\n', 'Russule lilas \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:58'),
(543, 'Russula aurora \r\n', 'Russule aurore \r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:59'),
(544, 'Russula luteotacta \r\n', 'Russule jaunissante \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:59'),
(545, 'Russula maculata \r\n', 'Russule maculée\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:59'),
(546, 'Russula nobilis \r\n', 'Russule émétique compacte \r\n', 2, 1, 16, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:59'),
(551, 'Russula mustelina \r\n', 'Russule belette \r\n', 4, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:59'),
(552, 'Russula nauseosa \r\n', 'Russule précoce \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:59'),
(553, 'Russula nigricans \r\n', 'Russule noircissante\r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:59'),
(554, 'Russula ochroleuca \r\n', 'Russule ocre et blanche \r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:59'),
(559, 'Russula olivacea \r\n', 'Russule olivacée \r\n', 6, 1, 4, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:59'),
(560, 'Russula paludosa \r\n', 'Russule des marais \r\n', 4, 4, 15, 'Hauts marais. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:59'),
(561, 'Russula parazurea \r\n', 'Russule bleu-vert\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:59'),
(562, 'Russula pelargonia \r\n', 'Russule à odeur de geranium \r\n', 5, 1, 3, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:59'),
(567, 'Russula persicina \r\n', 'Russule couleur de pêche \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:59'),
(568, 'Russula pseudointegra \r\n', 'Russule coccinée \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:59'),
(569, 'Russula puellaris \r\n', 'Russule jeune fille \r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:59'),
(570, 'Russula queletii \r\n', 'Russule de Quélet \r\n', 5, 1, 4, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:59'),
(575, 'Russula raoultii \r\n', 'Russule jaune pâle \r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:45:59'),
(576, 'Russula risigallina \r\n', 'Russule caméléon \r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:00'),
(577, 'Russula romellii \r\n', 'Russule à lames fragiles\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:00'),
(578, 'Russula sanguinaria \r\n', 'Russule sanguine \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:00'),
(583, 'Russula subfoetens \r\n', 'Russule fausse-fétide \r\n', 5, 1, 5, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:00'),
(584, 'Russula turci \r\n', 'Russule coquardée \r\n', 4, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:00'),
(585, 'Russula velenovskyi \r\n', 'Russule rouge cuivre\r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:00'),
(586, 'Russula vesca \r\n', 'Russule vieux-rose \r\n', 4, 1, 8, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:00'),
(591, 'Russula violacea \r\n', 'Russule violacée \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:00'),
(592, 'Russula violeipes \r\n', 'Russule à pied violet \r\n', 4, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:00'),
(593, 'Russula virescens \r\n', 'Russule verdoyante\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:00'),
(594, 'Russula xerampelina \r\n', 'Russule écrevisse \r\n', 4, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:00'),
(599, 'Sarcodon imbricatus \r\n', 'Hydne imbriqué \r\n', 7, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(600, 'Sarcodon scabrosus \r\n', 'Hydne rugueux \r\n', 5, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(603, 'Sarcoscypha coccinea \r\n', 'Pezize écarlate\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(604, 'Sarcosphaera coronaria \r\n', 'Pezize couronnée \r\n', 1, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(605, 'Schizophyllum commune \r\n', 'Schizophylle commun \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(606, 'Scleroderma areolatum \r\n', 'Scléroderme aréolé \r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(607, 'Scleroderma bovista \r\n', 'Scléroderme boviste \r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(608, 'Scleroderma citrinum \r\n', 'Scléroderme commun \r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(609, 'Scleroderma verrucosum \r\n', 'Scléroderme verruqueux \r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(610, 'Scutellinia scutellata \r\n', 'Pezize en bouclier \r\n', 5, 3, 15, 'Sur bois mort ou terre humide. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(611, 'Scytinostroma hemidichophyticum \r\n', 'Cortice à odeur de naphtaline\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(612, 'Sebacina incrustans \r\n', 'Sébacine incrustante \r\n', 5, 3, 15, 'Sur le sol ou les végétaux. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(617, 'Sparassis laminosa \r\n', 'Sparassis lamelleux \r\n', 4, 1, 8, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(618, 'Sparassis crispa \r\n', 'Sparassis crêpu \r\n', 4, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(619, 'Spathularia flavida \r\n', 'Spathulaire jaune\r\n', 7, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(620, 'Steccherinum fimbriatum \r\n', 'Stécchérine frangé \r\n', 5, 3, 15, 'Surtout sous bois mort. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(625, 'Steccherinum ochraceum \r\n', 'Stécchérine ochracé \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(626, 'Stereum hirsutum \r\n', 'Stérée hirsute \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(627, 'Stereum ochraceoflavum \r\n', 'Stérée ochracé jaune\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(628, 'Stereum subtomentosum \r\n', 'Stérée presque tomenteux \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:01'),
(633, 'Strobilomyces strobilaceus \r\n', 'Bolet pomme de pin \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(634, 'Stropharia aeruginosa \r\n', 'Strophaire vert-de-gris \r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(635, 'Stropharia caerulea \r\n', 'Strophaire bleue \r\n', 7, 3, 15, 'Lieux clairs. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(639, 'Stropharia coronilla \r\n', 'Strophaire coronille \r\n', 7, 1, 14, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(640, 'Protostropharia semiglobata \r\n', 'Strophaire hémisphérique \r\n', 7, 3, 15, 'Sur fumier, crottins et bouses. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(641, 'Leratiomyces squamosus \r\n', 'Strophaire écailleuse\r\n', 2, 1, 17, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(642, 'Suillus bovinus \r\n', 'Bolet des bouviers \r\n', 4, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(647, 'Suillus collinitus \r\n', 'Bolet à base rose \r\n', 7, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(648, 'Suillus granulatus \r\n', 'Bolet granulé \r\n', 7, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(649, 'Suillus grevillei \r\n', 'Bolet élégant\r\n', 4, 1, 12, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(650, 'Suillus luteus \r\n', 'Nonette voilée \r\n', 7, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(655, 'Suillus placidus \r\n', 'Bolet ivoire \r\n', 4, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(656, 'Suillus tridentinus \r\n', 'Bolet du Trentin \r\n', 4, 1, 12, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(657, 'Suillus variegatus \r\n', 'Bolet moucheté \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(658, 'Suillus viscidus \r\n', 'Bolet gris des mélèzes \r\n', 5, 1, 12, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(663, 'Tephrocybe rancida \r\n', 'Téphrocybe rance \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(664, 'Thelephora anthocephala \r\n', 'Théléphore en forme de fleur \r\n', 5, 4, 15, 'A terre, dans les bois. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(665, 'Thelephora anthocephala var. clavularis \r\n', 'Théléphore en fleur, variété petite massue \r\n', 5, 4, 15, 'A terre, dans les bois. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(666, 'Thelephora palmata \r\n', 'Théléphore palmé \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:02'),
(671, 'Thelephora penicillata \r\n', 'Théléphore en pinceau \r\n', 5, 4, 15, 'A terre, dans les bois. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:03'),
(672, 'Thelephora terrestris \r\n', 'Théléphore terrestre \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:03'),
(673, 'Trametes gibbosa \r\n', 'Tramète bossue\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:03'),
(674, 'Trametes hirsuta \r\n', 'Tramète hirsute \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:03'),
(679, 'Trametes suaveolens \r\n', 'Tramète à odeur agréable \r\n', 5, 3, 15, 'Surtout sur arbres riverains. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:03'),
(680, 'Trametes versicolor \r\n', 'Tramète versicolore \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:03'),
(681, 'Tremella aurantia \r\n', 'Trémelle orangée \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:03'),
(682, 'Tremella foliacea \r\n', 'Trémelle foliacée \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:03'),
(687, 'Tremella mesenterica \r\n', 'Trémelle mésentérique \r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:03'),
(688, 'Trichaptum abietinum \r\n', 'Tramète lilas \r\n', 5, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:03'),
(689, 'Tricholoma acerbum \r\n', 'Tricholome âpre\r\n', 5, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:03'),
(690, 'Tricholoma aestuans \r\n', 'Tricholome brûlant \r\n', 5, 4, 15, 'Pessières acides. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:03'),
(695, 'Tricholoma album \r\n', 'Tricholome blanc \r\n', 2, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:03'),
(696, 'Tricholoma atrosquamosum \r\n', 'Tricholome à squames noires \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:03'),
(697, 'Tricholoma aurantium \r\n', 'Tricholome orangé\r\n', 7, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:03'),
(698, 'Tricholoma caligatum \r\n', 'Tricholome chaussé \r\n', 5, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:03'),
(703, 'Tricholoma basirubens \r\n', 'Tricholome à base rouge \r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:04'),
(704, 'Tricholoma batschii \r\n', 'Tricholome à pied bicolore \r\n', 7, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:04'),
(705, 'Tricholoma bresadolanum \r\n', 'Tricholome vergeté des feuillus \r\n', 7, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:04'),
(706, 'Tricholoma bufonium \r\n', 'Tricholome pourpré \r\n', 2, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:04'),
(711, 'Tricholoma cingulatum \r\n', 'Tricholome ceinturé \r\n', 4, 4, 15, 'Surtout sous saules. \r\n', NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:04'),
(712, 'Tricholoma colossus \r\n', 'Tricholome colosse \r\n', 4, 1, 6, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:04'),
(713, 'Tricholoma columbetta \r\n', 'Tricholome colombette\r\n', 4, 1, 11, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:04'),
(714, 'Tricholoma equestre \r\n', 'Tricholome équestre \r\n', 1, 1, 2, NULL, NULL, 3, '2018-03-15 11:04:52', '2018-03-13 14:46:04');

-- --------------------------------------------------------

--
-- Structure de la table `trophic_status`
--

CREATE TABLE `trophic_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `trophic_status`
--

INSERT INTO `trophic_status` (`id`, `status`, `updated_at`, `created_at`) VALUES
(1, 'Parasite biotrophe', '2018-02-14 14:12:02', '2018-02-14 14:12:02'),
(2, 'Parasite nécrotrophe', '2018-02-14 14:12:02', '2018-02-14 14:12:02'),
(3, 'Saprotrophe', '2018-02-14 14:12:36', '2018-02-14 14:12:36'),
(4, 'Mycorhizien', '2018-02-14 14:12:36', '2018-02-14 14:12:36'),
(5, 'Parasite', '2018-03-13 14:44:08', '2018-03-13 14:44:08');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `mail`, `password`, `last_name`, `first_name`, `role`, `updated_at`, `created_at`) VALUES
(1, 'admin@admin.fr', '$2y$10$zp3mxcM.CEY2Uhr01LeAzuhfkX41U3giAXF/0a1QIEvLo14QimI/.', 'admin', 'admin', 'admin', '2018-03-18 17:46:19', '2018-03-15 11:07:47'),
(2, 'renouard.q@gmail.com', '$2y$10$uKgxVXGCowZorD/EAthqpOFLmkaSUusptjpSEfy1..OBV.RhwrqPi', 'RENOUARD', 'Quentin', 'user', '2018-02-21 13:40:08', '2018-02-21 13:40:08'),
(3, 'geoffreybaier@gmail.com', '$2y$10$4chd6qUIvwbWgVRYz1DQkOegNCpVurf3eX3VwMszGNw71iivIr8uK', 'Baier', 'Geoffrey', 'user', '2018-03-15 11:08:07', '2018-02-14 09:07:49');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `biotope`
--
ALTER TABLE `biotope`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `region` (`region`);

--
-- Index pour la table `edibility`
--
ALTER TABLE `edibility`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `status` (`status`);

--
-- Index pour la table `specie`
--
ALTER TABLE `specie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_latin_2` (`name_latin`),
  ADD KEY `id` (`id`),
  ADD KEY `name_latin` (`name_latin`(191)),
  ADD KEY `edibility_id` (`edibility_id`),
  ADD KEY `trophic_status_id` (`trophic_status_id`),
  ADD KEY `biotope_id` (`biotope_id`),
  ADD KEY `creator_id` (`creator_id`);

--
-- Index pour la table `trophic_status`
--
ALTER TABLE `trophic_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `status` (`status`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `mail` (`mail`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `biotope`
--
ALTER TABLE `biotope`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT pour la table `edibility`
--
ALTER TABLE `edibility`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `specie`
--
ALTER TABLE `specie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=717;
--
-- AUTO_INCREMENT pour la table `trophic_status`
--
ALTER TABLE `trophic_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `specie`
--
ALTER TABLE `specie`
  ADD CONSTRAINT `foreign_biotope_id` FOREIGN KEY (`biotope_id`) REFERENCES `biotope` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_edibility_id` FOREIGN KEY (`edibility_id`) REFERENCES `edibility` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_trophic_status_id` FOREIGN KEY (`trophic_status_id`) REFERENCES `trophic_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
