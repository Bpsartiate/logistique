-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 30, 2025 at 08:15 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `c1743910c_aurorardc`
--

-- --------------------------------------------------------

--
-- Table structure for table `bons_commande`
--

CREATE TABLE `bons_commande` (
  `id` int(11) NOT NULL,
  `date_commande` date NOT NULL,
  `numero_commande` varchar(255) NOT NULL,
  `nom_expediteur` varchar(255) NOT NULL,
  `telephone_expediteur` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `adresse_physique` varchar(255) NOT NULL,
  `num_tva` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `nom_client` varchar(255) NOT NULL,
  `telephone_client` varchar(255) NOT NULL,
  `code_postal` varchar(255) NOT NULL,
  `adresse_livraison` varchar(255) NOT NULL,
  `personne_a_contacter` varchar(255) NOT NULL,
  `quantite` bigint(20) NOT NULL,
  `prix_unitaire` bigint(20) NOT NULL,
  `taux_tva` decimal(10,2) NOT NULL,
  `frais_livraison` decimal(10,0) NOT NULL,
  `prix_total` decimal(10,2) NOT NULL,
  `moyen_paiement` varchar(255) NOT NULL,
  `statut` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bons_commande`
--

INSERT INTO `bons_commande` (`id`, `date_commande`, `numero_commande`, `nom_expediteur`, `telephone_expediteur`, `email`, `adresse_physique`, `num_tva`, `designation`, `nom_client`, `telephone_client`, `code_postal`, `adresse_livraison`, `personne_a_contacter`, `quantite`, `prix_unitaire`, `taux_tva`, `frais_livraison`, `prix_total`, `moyen_paiement`, `statut`) VALUES
(1, '2025-06-10', '2501742', 'Zebra Electronics', '0971307673', 'zebraelectronics@gmail.com', 'Bujumbura', '28756', 'Ordinateurs', 'Aurora RDC', '0975418687', 'B.P 360 Goma', 'Q. Ishango, Avenue La Frontière N°49', 'Kevin Kena', 5, 800, '3.50', '5', '4145.00', 'Carte bancaire', 'En attente');

-- --------------------------------------------------------

--
-- Table structure for table `plan_approvisionnement`
--

CREATE TABLE `plan_approvisionnement` (
  `id` int(11) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `date_debut_approvisionnement` date NOT NULL,
  `date_fin_approvisionnement` date NOT NULL,
  `responsable` varchar(255) NOT NULL,
  `quantite` bigint(20) NOT NULL,
  `prix_unitaire` bigint(20) NOT NULL,
  `budget_estime` bigint(20) NOT NULL,
  `prix_sur_terrain` bigint(20) NOT NULL,
  `etat` varchar(255) NOT NULL,
  `type_besoin` varchar(255) NOT NULL,
  `priorite` varchar(255) NOT NULL,
  `type_procedure` varchar(2555) NOT NULL,
  `observation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plan_approvisionnement`
--

INSERT INTO `plan_approvisionnement` (`id`, `designation`, `date_debut_approvisionnement`, `date_fin_approvisionnement`, `responsable`, `quantite`, `prix_unitaire`, `budget_estime`, `prix_sur_terrain`, `etat`, `type_besoin`, `priorite`, `type_procedure`, `observation`) VALUES
(2, 'Ordinateurs', '2025-07-01', '2025-07-31', 'Medias', 100, 800, 800000, 750000, 'En cours', 'Biens', 'Moyenne', 'Appel d\'offre ouvert international', 'Ok'),
(3, 'Chaises de bureau', '2025-07-01', '2025-07-31', 'Logistique', 5, 100, 500, 600, 'En cours', 'Biens', 'Moyenne', 'Procédure d\'une seule quotation (pro forma)', 'Ok'),
(4, 'asdsadasd', '2025-07-12', '2025-07-07', 'hank', 12213, 6, 101, 10, 'Terminé', 'Biens', 'Moyenne', 'Procédure d\'une seule quotation (pro forma)', ''),
(5, '123213', '2025-07-04', '2025-07-22', '213', 213213, 3123, 213321, 213132, 'En cours', 'Travaux', 'Moyenne', 'Appel d\'offre ouvert international', '213321'),
(6, '1223', '2025-07-04', '2025-07-09', '123213', 12332, 231231, 213321, 123123, 'En cours', 'Biens', 'Haute', 'Appel d\'offre ouvert international', 'aqwqwewq');

-- --------------------------------------------------------

--
-- Table structure for table `type_procedure`
--

CREATE TABLE `type_procedure` (
  `id` int(11) NOT NULL,
  `nom_procedure` varchar(255) NOT NULL,
  `type_produit` varchar(255) NOT NULL,
  `montant_min` bigint(20) NOT NULL,
  `montant_max` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type_procedure`
--

INSERT INTO `type_procedure` (`id`, `nom_procedure`, `type_produit`, `montant_min`, `montant_max`) VALUES
(1, 'Procédure d\'une seule quotation (pro forma)', 'Biens', 101, 1000),
(2, 'Procédure d\'une seule quotation (pro forma)', 'Services', 101, 1000),
(3, 'Procédure d\'une seule quotation (pro forma)', 'Travaux', 101, 1000),
(4, 'Procédure négociée - minimum 3 pro forma', 'Biens', 1001, 60000),
(5, 'Procédure négociée - minimum 3 pro forma', 'Services', 1001, 60000),
(6, 'Procédure négociée - minimum 3 pro forma', 'Travaux', 1001, 60000),
(7, 'Appel d\'offre ouvert local', 'Biens', 60001, 150000),
(8, 'Appel d\'offre ouvert local', 'Services', 60001, 150000),
(9, 'Appel d\'offre ouvert local', 'Travaux', 60001, 150000),
(10, 'Appel d\'offre ouvert international', 'Biens', 150001, 2500000),
(11, 'Appel d\'offre ouvert local', 'Travaux', 150001, 2500000),
(12, 'Appel d\'offre ouvert international', 'Biens', 2500000, 5000000),
(13, 'Appel d\'offre ouvert international', 'Services', 2500000, 5000000),
(14, 'Appel d\'offre ouvert international', 'Travaux', 2500000, 5000000);

-- --------------------------------------------------------

--
-- Table structure for table `t_about`
--

CREATE TABLE `t_about` (
  `id_about` int(11) NOT NULL,
  `about` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_about`
--

INSERT INTO `t_about` (`id_about`, `about`, `id_user`) VALUES
(1, '<h1 style=\"text-align: justify;\">Fonctionnement de l&rsquo;entreprise&nbsp;</h1>\r\n<h2 style=\"text-align: justify;\">Description de l&rsquo;activit&eacute; de l&rsquo;entreprise</h2>\r\n<p style=\"text-align: justify;\"><strong>Aurora</strong> est une start-up de Tech bas&eacute;e dans la ville de Goma en RDC.</p>\r\n<p style=\"text-align: justify;\">R&eacute;f&eacute;rence en conception de solutions num&eacute;rique, digitales intelligentes interactives.</p>\r\n<p style=\"text-align: justify;\">Cr&eacute;&eacute;e le <strong>21/07/2018</strong>, <strong>Aurora </strong>s&rsquo;est d&eacute;velopp&eacute;e gr&acirc;ce aux potentialit&eacute;s et &agrave; la passion des diff&eacute;rents membres fondateurs qui, gr&acirc;ce &agrave; la r&eacute;volution technologique voudraient d&eacute;velopper le secteur entrepreneurial et participer au d&eacute;veloppement du pays et de l&rsquo;Afrique en g&eacute;n&eacute;ral.</p>\r\n<h2 style=\"text-align: justify;\">Vision et mission</h2>\r\n<h3 style=\"text-align: justify;\"><strong>a.<span style=\"white-space: pre;\"> </span>MISSION</strong></h3>\r\n<p style=\"text-align: justify;\">Nous vous accompagnons tout au long de vos projets IT afin de trouver les solutions optimales qui r&eacute;pondent &agrave; vos besoins et ambitions.</p>\r\n<p style=\"text-align: justify;\">Que nous travaillions avec une <strong>multinationale</strong>, un <strong>organisme public</strong>, des <strong>priv&eacute;s </strong>ou une <strong>PME</strong>, notre <strong>objectif </strong>reste le m&ecirc;me : <strong>mettre &agrave; profit le meilleur de notre expertise et de notre exp&eacute;rience pour arriver &agrave; une solution ad&eacute;quate, tout en d&eacute;veloppant une r&eacute;elle relation de partenariat et de confiance avec nos clients</strong>.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Nous vous aidons &agrave; vous adapter aux transformations digitales et &agrave; augmenter votre comp&eacute;titivit&eacute;. Nous sommes une soci&eacute;t&eacute; tr&egrave;s &laquo; <strong>ing&eacute;nieure </strong>&raquo; et &laquo; <strong>technique </strong>&raquo;, mais nous ne faisons pas des projets IT pour le plaisir de tester telle ou telle technologie.</p>\r\n<p style=\"text-align: justify;\">De fait, nous mettons la <strong>technologie &agrave; votre service</strong> pour <strong>r&eacute;soudre vos probl&egrave;mes</strong> et <strong>simplifier votre travail.&nbsp;</strong></p>\r\n<p style=\"text-align: justify;\">La relation de partenariat est un aspect fondamental de notre travail.</p>\r\n<p style=\"text-align: justify;\">Nous cr&eacute;ons une \"<strong>dream team</strong>\" pour chaque projet qui nous est confi&eacute;.</p>\r\n<p style=\"text-align: justify;\">Elle peut s&rsquo;int&eacute;grer &agrave; votre &eacute;quipe afin de faciliter les &eacute;changes et de garantir une plus grande efficacit&eacute;. Les m&eacute;thodes agiles que nous utilisons favorisent &eacute;galement notre collaboration car elles permettent un suivi instantan&eacute; du projet.</p>\r\n<p style=\"text-align: justify;\">Port&eacute;s par la volont&eacute; d\'utiliser nos comp&eacute;tences IT pour des projets de plus en plus \"<strong>challenging</strong>\", nous maintenons notre croissance en fournissant des services de haute qualit&eacute; et en gardant l\'objectif de toujours nous am&eacute;liorer.</p>\r\n<h3 style=\"text-align: justify;\">b.<span style=\"white-space: pre;\"> </span>Vision</h3>\r\n<p style=\"text-align: justify;\">Nous visons <strong>l\'excellence </strong>et aspirons &agrave; devenir la r&eacute;f&eacute;rence en mati&egrave;re de d&eacute;veloppement informatique, de gestion de projets et de conseils IT.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Nous misons sur nos <strong>collaborateurs </strong>pour atteindre notre <strong>objectif commun</strong> : <strong>la satisfaction totale de nos clients gr&acirc;ce &agrave; des services de haute qualit&eacute;</strong>, car c&rsquo;est gr&acirc;ce &agrave; leur implication que le succ&egrave;s de vos projets peut &ecirc;tre garanti.</p>\r\n<p style=\"text-align: justify;\">Nous avons &agrave; c&oelig;ur d&rsquo;analyser ensemble, avec vous, vos besoins et de mettre tout en &oelig;uvre pour d&eacute;velopper une solution qui r&eacute;ponde en tout point &agrave; ceux-ci. Et tout cela avec une force tranquille, n&eacute;cessaire pour l\'&eacute;panouissement de chacun et l\'aboutissement de chaque projet.&nbsp;</p>\r\n<h3 style=\"text-align: justify;\">c.<span style=\"white-space: pre;\"> </span>Valeurs&nbsp;</h3>\r\n<p style=\"text-align: justify;\">Nous respectons et sommes &agrave; l\'&eacute;coute de chaque personne avec qui nous travaillons, que ce soit entre coll&egrave;gues ou avec nos clients et partenaires. Cela permet l\'&eacute;panouissement de chacun dans un climat serein, et une meilleure efficacit&eacute;. Nous veillons donc &agrave; instaurer une relation de confiance avec toutes les personnes avec qui nous travaillons.</p>\r\n<h2 style=\"text-align: justify;\">Description des produits</h2>\r\n<p style=\"text-align: justify;\"><strong>Aurora </strong>offre des produits essentiellement Tech, participe au d&eacute;veloppement digital des entreprises et organisations, tout en produisant des outils pouvant am&eacute;liorer certains secteurs tels que l&rsquo;agriculture et autres, vente des outils informatiques...</p>\r\n<h2 style=\"text-align: justify;\">Description des services</h2>\r\n<p style=\"text-align: justify;\">Accompagner les Startups &agrave; passer de l&rsquo;informel au formel, proposition et conception des documents de gestion et administration d&rsquo;entreprise, conception des outils de communication, conception d&rsquo;identit&eacute; visuelle,...</p>\r\n<h2 style=\"text-align: justify;\">Histoire, &eacute;volution et croissance</h2>\r\n<p style=\"text-align: justify;\"><strong>Aurora </strong>a initialement &eacute;t&eacute; cr&eacute;&eacute;e en <strong>2018 </strong>dans le salon de l&rsquo;un des fondateurs par <strong>12 personnes</strong> qui, avec le temps se sont retir&eacute;es vu la divergence d&rsquo;id&eacute;es, de vision et d&rsquo;objectifs.</p>\r\n<p style=\"text-align: justify;\">En 2020, toute pr&eacute;par&eacute;e face &agrave; la pand&eacute;mie &agrave; covid 19 nous avons perdu notre premier bureau pay&eacute; et inexploit&eacute;, tout ce qu&rsquo;il nous fallait pour tomber en faillite, braves, nous avons &eacute;t&eacute; et avons travaill&eacute; depuis pour aboutir &agrave; un professionnalisme que nous offrons aujourd&rsquo;hui sans rel&acirc;cher l&rsquo;id&eacute;e de rester proactif et perfectible &agrave; chaque fois&nbsp;</p>\r\n<h2 style=\"text-align: justify;\">Relations publiques</h2>\r\n<p style=\"text-align: justify;\">Dans le cadre du d&eacute;veloppement de la communaut&eacute;, nous mettons &agrave; jour des sessions de formation journali&egrave;res afin de partager de connaissances pratiques pour les jeunes.</p>\r\n<h2 style=\"text-align: justify;\">Publicit&eacute;&nbsp;</h2>\r\n<p style=\"text-align: justify;\">Notre <strong>strat&eacute;gie marketing</strong> est ax&eacute;e sur le <strong>web </strong>et le <strong>traditionnel</strong>, nous utilisons <strong>plus </strong>le <strong>web </strong>afin de ne pas participer de mani&egrave;re directe &agrave; la consommation de papiers et participer &agrave; la protection de la nature.</p>\r\n<h2 style=\"text-align: justify;\">Objectif atteints et objectifs &agrave; venir&nbsp;</h2>\r\n<ol>\r\n<li style=\"text-align: justify;\">Mise en place d&rsquo;un syst&egrave;me de gestion interactif et transparent de la soci&eacute;t&eacute;,</li>\r\n<li style=\"text-align: justify;\">Mise en place d&rsquo;un syst&egrave;me administratif,</li>\r\n<li style=\"text-align: justify;\">Etc.&nbsp;&nbsp;</li>\r\n</ol>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Pour plus d\'informations, veuillez nous &eacute;crire sur<em><strong> infos@aurorardc.com</strong></em></p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>', '1');

-- --------------------------------------------------------

--
-- Table structure for table `t_activites_prog`
--

CREATE TABLE `t_activites_prog` (
  `Id` int(11) NOT NULL,
  `Rubriques` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `SRubriques` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descriptions` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdP` int(11) NOT NULL,
  `TitreP` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateDebutP` date NOT NULL,
  `DateFinP` date NOT NULL,
  `BLine` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActivitesP` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Quantites` float NOT NULL,
  `Pu` float NOT NULL,
  `Un` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `CoutTotal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_activites_prog`
--

INSERT INTO `t_activites_prog` (`Id`, `Rubriques`, `SRubriques`, `Descriptions`, `IdP`, `TitreP`, `DateDebutP`, `DateFinP`, `BLine`, `ActivitesP`, `Quantites`, `Pu`, `Un`, `CoutTotal`) VALUES
(1, 'Vente des articles', 'Ventes', 'Then wrap your value with column name as a class. For example, if your column name is name then the value will be look like this. ', 3, 'Mise en place systeme vente en ligne', '2001-01-23', '2031-12-23', '1.1.1', 'Ventes', 12, 50, 'Articles', 600),
(2, 'Ventes', 'ventes articles', 'Then wrap your value with column name as a class. For example, if your column name is name then the value will be look like this.', 3, 'Mise en place systeme vente en ligne', '2001-01-23', '2031-12-23', '1.1.2', 'Achat 1', 20, 100, 'articles', 2000),
(3, 'Ventes', 'ventes articles', 'Then wrap your value with column name as a class. For example, if your column name is name then the value will be look like this.', 3, 'Mise en place systeme vente en ligne', '2001-01-23', '2031-12-23', '1.1.3', 'Achat 2', 5, 25, 'articles', 125),
(5, 'ACHATS JUS', 'DIVERS', 'JUS POUR LES PARTICIPANTS', 6, 'Reunion du 15 OCTOBRE 2023', '2023-10-15', '2023-10-15', '1.1', 'Jus Afia', 100, 3.5, '10', 350),
(6, 'I. Ressources Humaines', 'Personnel de mÃ©dia', 'Mediatisation du lancement du projet ', 7, 'Lancement de Genesys', '2024-04-01', '2024-04-30', 'I.1', 'Caravane motorisÃ©', 5, 30, 'Caravane', 150),
(7, 'I. Ressources Humaines', 'Personnel de mÃ©dia', 'Mediatisation du lancement du projet ', 7, 'Lancement de Genesys', '2024-04-01', '2024-04-30', 'I.2', 'Caravane piÃ©tons', 2, 15, 'Personnes', 30);

-- --------------------------------------------------------

--
-- Table structure for table `t_agendaevents`
--

CREATE TABLE `t_agendaevents` (
  `IdEvent` bigint(20) NOT NULL,
  `NomEvent` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'hote',
  `TypeEvent` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organisateur` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'visiteur',
  `etiquette` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DebutEvent` datetime NOT NULL,
  `FinEvent` datetime NOT NULL,
  `DescriptionEvent` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CouleurEvent` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `StatutEvent` int(11) NOT NULL DEFAULT '1',
  `DateEnreg` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_agendaevents`
--

INSERT INTO `t_agendaevents` (`IdEvent`, `NomEvent`, `TypeEvent`, `organisateur`, `etiquette`, `DebutEvent`, `FinEvent`, `DescriptionEvent`, `CouleurEvent`, `StatutEvent`, `DateEnreg`) VALUES
(2, 'Trie des modules', 'Task', '', '', '2022-04-19 12:00:00', '2022-04-19 13:00:00', 'Trier les modules, pour la finalisation du projet', '#e4edff', 2, '2023-02-03 12:04:15'),
(8, 'test 1', 'Task', '', '', '2022-04-28 18:10:00', '2022-04-28 18:11:00', 'DEMO', '#3cbcdd', 2, '2023-02-03 12:04:15'),
(9, 'Valerien TEST', 'Task', '', '', '2022-04-28 18:14:00', '2022-04-28 18:14:00', 'DEMO EQ', '#b7ffa3', 2, '2023-02-03 12:04:15'),
(10, 'TEST 2', 'Rdv', '', '', '2022-04-28 18:11:00', '2022-04-28 18:13:00', 'DEMO RDV', '#ffdda3', 1, '2023-02-03 12:04:15'),
(14, 'test 6', 'Task', '', '', '2022-04-28 20:54:00', '2022-04-28 20:55:00', 'hir', '#00a7d1', 2, '2023-02-03 12:04:15'),
(15, 'test', 'Task', '', '', '2023-02-14 00:52:00', '2023-02-16 00:52:00', '1234', '#1ebee6', 2, '2023-02-03 12:04:15'),
(16, 'test des events', 'Task', '', '', '2023-02-02 01:25:00', '2023-02-02 01:26:00', 'Boston Harbor Now in partnership with the Friends ', '#14994e', 2, '2023-02-03 12:04:15'),
(17, 'test des events2', 'Task', '', '', '2023-02-02 02:20:00', '2023-02-02 02:30:00', 'Join us as we ring in the New Year with a dazzling', '#32bee2', 2, '2023-02-03 12:04:15'),
(18, 'test des rdv', 'Rdv', '', '', '2023-02-02 01:28:00', '2023-02-02 01:29:00', 'sas', '#2396b3', 1, '2023-02-03 12:04:15'),
(21, 'TEST 2', 'Event', 'Aurora', 'Urgent', '2023-02-04 13:00:00', '2023-02-04 14:00:00', 'test 2', '', 1, '2023-02-03 16:21:11'),
(22, 'reunion', 'Event', 'Aurora Aurora Aurora Aurora', 'Affaire', '2023-02-03 20:00:00', '2023-02-05 12:00:00', 'dddLorem ipsum dolor sit amet, consectetur adipisi', '', 1, '2023-02-03 16:50:16'),
(23, 'Aurora Aurora Aurora', 'Event', 'Aurora Aurora Aurora', 'Urgent', '2023-02-11 12:00:00', '2023-02-11 12:00:00', 'AuroraAuroraAurorau', '', 1, '2023-02-03 16:51:37'),
(24, 'tests cccsss', 'Event', 'Aurora Aurora Aurora', 'Urgent', '2023-02-11 12:00:00', '2023-02-11 12:00:00', 'Using the card component, you can extend the ', '', 1, '2023-02-03 16:52:19'),
(25, 'tests cccsss', 'Event', 'Aurora Aurora Aurora', 'Urgent', '2023-02-04 12:00:00', '2023-02-11 12:00:00', 'To properly achieve the accordion style, be sure t', '', 1, '2023-02-03 16:54:53'),
(26, 'foire galat', 'Event', 'Aurora', 'Affaire', '2023-02-04 12:00:00', '2023-02-17 12:00:00', 'Galat de fin de  cycle de societe de transfert', '', 1, '2023-02-03 17:02:21'),
(28, 'test memo', 'rappel', '', '', '2023-02-04 01:23:00', '2023-02-04 01:23:00', 'Using the card component, you can extend the defau', '', 1, '2023-02-03 23:29:29'),
(29, 'test memo', 'rappel', '', '', '2023-02-04 01:24:00', '2023-02-04 01:24:00', 'Using the card component, you can extend the defau', '', 1, '2023-02-03 23:30:04'),
(30, 'test des events', 'task', '', '', '2023-02-04 00:00:00', '2023-02-04 00:00:00', '', '', 2, '2023-02-04 00:31:51'),
(31, 'test task1', 'task', '', '', '2023-02-04 00:00:00', '2023-02-04 00:00:00', '', '', 2, '2023-02-04 00:32:27'),
(33, 'Aurora', 'Rdv', 'stranger', '', '2023-02-04 12:00:00', '2023-02-04 12:00:00', '', '', 1, '2023-02-04 01:14:25'),
(36, 'hir', 'task', '', '', '2023-02-04 00:00:00', '2023-02-04 00:00:00', '', '', 2, '2023-02-04 01:18:06'),
(37, 'test', 'test', '', '', '2023-02-04 12:00:00', '2023-02-04 12:00:00', 'Petite descriptions', '', 1, '2023-02-04 01:19:18'),
(38, 'forum d\'accueil', 'Event', 'Aurora', 'Interne', '2023-02-06 12:00:00', '2023-02-06 12:00:00', 'Convey meaning through color with a handful of col', '', 1, '2023-02-04 01:51:09'),
(40, 'RÃ©union Ã©valuation', 'Event', 'Aurora', 'Interne', '2023-02-05 12:00:00', '2023-02-05 14:00:00', 'Evaluation et planning de l\'annÃ©e 2023', '', 1, '2023-02-05 11:00:20'),
(41, 'Landry kena', 'task', '', '', '2023-02-05 00:00:00', '2023-02-05 00:00:00', '', '', 2, '2023-02-05 13:45:47'),
(42, 'Test', 'Event', 'Kena', 'Urgent', '2023-02-06 14:57:00', '2023-02-08 14:57:00', 'Pour apaiser nos attentes', '', 1, '2023-02-05 13:58:09'),
(43, 'Kena', 'task', '', '', '2023-02-05 00:00:00', '2023-02-05 00:00:00', '', '', 2, '2023-02-05 13:58:56'),
(44, 'Aurora test', 'Rappel', '', '', '2023-02-07 14:59:00', '2023-02-07 14:59:00', 'Nos travaux travaux', '', 1, '2023-02-05 13:59:58'),
(46, 'Reunion 26', 'task', '', '', '2023-02-05 00:00:00', '2023-02-05 00:00:00', '', '', 2, '2023-02-05 19:21:45'),
(47, 'Reunion', 'task', '', '', '2023-02-05 00:00:00', '2023-02-05 00:00:00', '', '', 2, '2023-02-05 19:22:04'),
(48, 'Faire le test du sys', 'task', '', '', '2023-02-07 00:00:00', '2023-02-07 00:00:00', '', '', 2, '2023-02-07 09:21:34'),
(49, 'Reunion', 'task', '', '', '2023-03-14 00:00:00', '2023-03-14 00:00:00', '', '', 2, '2023-03-14 22:43:38'),
(50, 'Avocat', 'task', '', '', '2023-03-14 00:00:00', '2023-03-14 00:00:00', '', '', 2, '2023-03-14 22:44:00'),
(51, 'Faire Ã§a', 'task', '', '', '2023-03-14 00:00:00', '2023-03-14 00:00:00', '', '', 2, '2023-03-14 22:44:10'),
(52, 'Hey', 'task', '', '', '2023-03-14 00:00:00', '2023-03-14 00:00:00', '', '', 2, '2023-03-14 22:57:46'),
(53, 'Salut', 'task', '', '', '2023-03-14 00:00:00', '2023-03-14 00:00:00', '', '', 2, '2023-03-14 22:57:51'),
(54, 'Ggdthvcg', 'task', '', '', '2023-03-15 00:00:00', '2023-03-15 00:00:00', '', '', 2, '2023-03-15 14:14:32'),
(55, 'Reunion', 'task', '', '', '2023-03-19 00:00:00', '2023-03-19 00:00:00', '', '', 2, '2023-03-19 16:54:17'),
(56, 'Reunion 26', 'task', '', '', '2023-03-19 00:00:00', '2023-03-19 00:00:00', '', '', 2, '2023-03-19 16:54:30'),
(57, 'Faire Ã§a', 'task', '', '', '2023-03-19 00:00:00', '2023-03-19 00:00:00', '', '', 2, '2023-03-19 16:54:41'),
(58, 'checking', 'task', '', '', '2023-03-28 00:00:00', '2023-03-28 00:00:00', '', '', 2, '2023-03-28 17:34:02'),
(59, 'Hey', 'task', '', '', '2023-03-30 00:00:00', '2023-03-30 00:00:00', '', '', 2, '2023-03-30 09:44:02'),
(60, 'SALUTA', 'task', '', '', '2023-03-30 00:00:00', '2023-03-30 00:00:00', '', '', 2, '2023-03-30 09:44:22'),
(61, 'test task', 'task', '', '', '2023-04-07 00:00:00', '2023-04-07 00:00:00', '', '', 2, '2023-04-07 00:10:09'),
(62, 'test des events', 'task', '', '', '2023-04-07 00:00:00', '2023-04-07 00:00:00', '', '', 2, '2023-04-07 10:39:00'),
(63, 'Reunion', 'task', '', '', '2023-04-09 00:00:00', '2023-04-09 00:00:00', '', '', 2, '2023-04-09 10:47:13'),
(64, 'Hey', 'task', '', '', '2023-04-26 00:00:00', '2023-04-26 00:00:00', '', '', 2, '2023-04-26 18:36:25'),
(65, 'Lol', 'task', '', '', '2023-04-26 00:00:00', '2023-04-26 00:00:00', '', '', 2, '2023-04-26 18:36:33'),
(66, 'marketing strategy', 'task', '', '', '2023-05-11 00:00:00', '2023-05-11 00:00:00', '', '', 2, '2023-05-11 12:14:29'),
(67, 'Reunion', 'Event', 'Aurora', 'Affaire', '2023-06-04 12:00:00', '2023-06-06 12:00:00', 'test module agenda', '', 1, '2023-06-03 15:40:08'),
(68, 'test2', 'Event', 'Aurora', 'Aucune', '2023-06-03 17:00:00', '2023-06-03 17:30:00', 'Testing', '', 1, '2023-06-03 15:44:23'),
(69, 'Kevin Kena', 'Rdv', 'orange', '', '2023-06-03 17:00:00', '2023-06-03 17:00:00', '', '', 1, '2023-06-03 15:45:22'),
(70, 'test', 'task', '', '', '2023-06-03 00:00:00', '2023-06-03 00:00:00', '', '', 2, '2023-06-03 15:48:34'),
(71, 'test 2', 'task', '', '', '2023-06-03 00:00:00', '2023-06-03 00:00:00', '', '', 2, '2023-06-03 15:48:41'),
(72, 'test autres', 'Autres', '', '', '2023-06-03 17:00:00', '2023-06-03 17:00:00', 'Test autres', '', 1, '2023-06-03 15:49:46'),
(73, 'Vanessa', 'Rdv', 'Harley', '', '2023-07-28 12:00:00', '2023-07-28 12:00:00', '', '', 1, '2023-07-21 21:51:55'),
(74, 'Reunion', 'Event', 'Aurora', 'Important', '2023-07-22 09:00:00', '2023-07-22 13:30:00', 'PrÃ©sentation de l\'avancement du systÃ¨me Genesys', '', 1, '2023-07-21 23:54:38'),
(75, 'Tech', 'Rappel', '', '', '2023-08-07 12:00:00', '2023-08-07 12:00:00', 'Debut test et mise en commun', '', 1, '2023-08-03 11:21:58'),
(76, 'task', 'task', '', '', '2023-12-17 00:00:00', '2023-12-17 00:00:00', '', '', 2, '2023-12-17 06:57:25'),
(77, 'RÃ©union hedbo', 'Event', 'Aurora', 'Aucune', '2023-12-17 10:00:00', '2023-12-17 14:00:00', 'PrÃ©sentation module administration', '', 1, '2023-12-17 07:00:07'),
(78, 'Valerien HIRWA', 'Rdv', 'KMLa', '', '2023-12-17 12:00:00', '2023-12-17 12:00:00', '', '', 1, '2023-12-17 07:00:51'),
(80, 'event', 'Event', 'aurora', 'Aucune', '2023-12-17 10:00:00', '2023-12-17 12:00:00', 'event test', '', 1, '2023-12-17 07:45:24'),
(81, 'Landry KENA', 'Rdv', 'hIRWA', '', '2023-12-17 11:00:00', '2023-12-17 11:00:00', '', '', 1, '2023-12-17 07:48:38'),
(82, 'Task 2', 'task', '', '', '2023-12-17 00:00:00', '2023-12-17 00:00:00', '', '', 2, '2023-12-17 08:06:07'),
(83, 'Valerien Hirwa', 'Rdv', 'Kena', '', '2023-12-18 12:00:00', '2023-12-18 12:00:00', '', '', 1, '2023-12-17 08:07:37'),
(85, 'Aurora', 'Rdv', 'mcf', '', '2023-12-18 12:00:00', '2023-12-18 12:00:00', '', '', 1, '2023-12-17 08:13:57'),
(86, 'Kevin Kena', 'Rdv', 'aaa', '', '2023-12-19 12:00:00', '2023-12-19 12:00:00', '', '', 1, '2023-12-17 08:16:02'),
(87, 'task3', 'task', '', '', '2023-12-17 00:00:00', '2023-12-17 00:00:00', '', '', 2, '2023-12-17 08:30:26'),
(88, 'aaa', 'Event', 'aurora', 'Interne', '2023-12-18 12:00:00', '2023-12-18 12:00:00', 'desc', '', 1, '2023-12-17 08:31:04'),
(89, 'Jonathan Dufina', 'Rdv', 'caa', '', '2023-12-18 12:00:00', '2023-12-18 12:00:00', '', '', 1, '2023-12-17 08:31:21'),
(91, 'xyz', 'task', '', '', '2023-12-19 00:00:00', '2023-12-19 00:00:00', '', '', 2, '2023-12-19 12:22:04'),
(92, 'Ajustage de mes modi', 'task', '', '', '2024-02-12 00:00:00', '2024-02-12 00:00:00', '', '', 2, '2024-02-12 15:13:07'),
(93, 'Publication des ajou', 'task', '', '', '2024-02-12 00:00:00', '2024-02-12 00:00:00', '', '', 2, '2024-02-12 15:13:25'),
(94, 'Ajouts des different', 'task', '', '', '2024-02-12 00:00:00', '2024-02-12 00:00:00', '', '', 2, '2024-02-12 15:14:10'),
(95, 'Landry KENA', 'Rdv', 'KENA Andrey', '', '2024-02-13 12:00:00', '2024-02-13 12:00:00', '', '', 1, '2024-02-12 15:16:18'),
(96, 'Finalisation systÃ¨m', 'task', '', '', '2024-06-14 00:00:00', '2024-06-14 00:00:00', '', '', 2, '2024-06-14 17:11:03'),
(97, 'Lancement hackathon', 'task', '', '', '2024-06-14 00:00:00', '2024-06-14 00:00:00', '', '', 2, '2024-06-14 17:11:20');

-- --------------------------------------------------------

--
-- Table structure for table `t_agents`
--

CREATE TABLE `t_agents` (
  `Id_Agent` int(11) NOT NULL,
  `Noms` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Photo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Departement` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `niveauAcces` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Provenance` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Etat_civil` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nombre_Enfants` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Genre` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Integrer` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NON',
  `numero_Telephone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mentor` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AUCUN',
  `mentor_temp` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `souhait` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NON',
  `placer` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateNaissance` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lieuNaissance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nationalite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomEpoux` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateDeMariage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomDuPere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomDeLaMere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carteIdentite` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lieudeDelivrance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateDeDelivrance` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lieuDuTravail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateDebutTravail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateFinTravail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Grade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noINSS` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Poste` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_mentor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_entreprise` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '66b9d43cd032f'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_agents`
--

INSERT INTO `t_agents` (`Id_Agent`, `Noms`, `Photo`, `Departement`, `niveauAcces`, `Provenance`, `Etat_civil`, `Nombre_Enfants`, `Genre`, `Integrer`, `numero_Telephone`, `mentor`, `mentor_temp`, `email`, `souhait`, `placer`, `dateNaissance`, `lieuNaissance`, `Nationalite`, `nomEpoux`, `dateDeMariage`, `nomDuPere`, `nomDeLaMere`, `Adresse`, `carteIdentite`, `lieudeDelivrance`, `dateDeDelivrance`, `lieuDuTravail`, `dateDebutTravail`, `dateFinTravail`, `Grade`, `noINSS`, `Poste`, `id_mentor`, `id_entreprise`) VALUES
(1, 'Yannick', 'Auction sheet.png', 'Finances', 'Agent', 'Goma', '1', '0', 'M', 'NON', '998669995', '', NULL, 'yanglo@gmail.com', 'OUI', '0', '2000-03-01', 'Bukavu', 'congolaise', '', '', 'Mamba', 'Marie', 'Goma, Nord-Kivu', '224355466', 'Goma', '2020-09-30', 'Goma', '2024-03-31', '2025-08-01', '2', '35433537738383', 'Chauffeur', '', '66b9d43cd032f'),
(2, 'Adolphe Munga', 'Maman Sylvie (2).jpg', 'Programmes', 'Associe', 'Kinshasa', '2', '3', 'M', 'NON', '9879887698', '', NULL, 'munga@gmail.com', 'NON', '0', '2000-04-03', 'Bukavu', 'congolaise', 'Marie Ange Lushi', '2010-09-30', 'AndrÃ©', 'Marcelline', 'Goma, Nord-Kivu', '324647556869707', 'Goma', '2016-08-01', 'Goma', '2024-04-16', '2025-04-30', '6', '263645475857', 'Protection  Officer', '', '66b9d43cd032f'),
(3, 'Landry KENA', '112.jpg', 'Technique', 'Associe', 'Goma', '1', '0', 'M', 'NON', '998712548', '', NULL, 'landrykena@aurorardc.com', 'NON', '0', '2000-04-15', 'Kinshasa', 'Congolaise', '', '', 'KENA MULUMBA Kennedy', 'MUHEMEDI NGONDJE Marie', 'Goma', '3312122232', 'Goma', '2022-08-10', 'Goma', '2024-08-12', '2026-08-12', '7', '1331344', 'DÃ©veloppeur full stack', '', '66b9d43cd032f');

-- --------------------------------------------------------

--
-- Table structure for table `t_agentsintegres`
--

CREATE TABLE `t_agentsintegres` (
  `Id_Agent` int(11) NOT NULL,
  `Noms` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Departement` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `niveauAcces` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Provenance` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Etat_civil` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nombre_Enfants` int(11) NOT NULL,
  `Genre` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_Telephone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mentor` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AUCUN',
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateNaissance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lieuNaissance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nationalite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomEpoux` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateDeMariage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomDuPere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomDeLaMere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carteIdentite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lieudeDelivrance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateDeDelivrance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lieuDuTravail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateDebutTravail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateFinTravail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Grade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noINSS` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Poste` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qrcode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateIntegration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_agentsintegres`
--

INSERT INTO `t_agentsintegres` (`Id_Agent`, `Noms`, `Photo`, `Departement`, `niveauAcces`, `Provenance`, `Etat_civil`, `Nombre_Enfants`, `Genre`, `numero_Telephone`, `mentor`, `email`, `dateNaissance`, `lieuNaissance`, `Nationalite`, `nomEpoux`, `dateDeMariage`, `nomDuPere`, `nomDeLaMere`, `Adresse`, `carteIdentite`, `lieudeDelivrance`, `dateDeDelivrance`, `lieuDuTravail`, `dateDebutTravail`, `dateFinTravail`, `Grade`, `noINSS`, `Poste`, `qrcode`, `dateIntegration`) VALUES
(1, 'Landry Kena Mpiana', '', 'Technologie', 'Associe', 'Goma', 'Celibataire', 0, 'M', ' 243', 'Landry', 'landrykena2018@gmail.com', '2022-02-17', 'Kinshasa', 'Congolaise', '', '', 'KENA MULUMBA', 'Muhemedi NGONDJE', 'Goma/Kyeshero/Du Lac 05', '123548', 'Goma', '2022-02-16', 'Goma', '2022-02-18', '2022-03-02', 'Niveau IX', '2345', 'Developpeur', '../qr_img/Landry Kena Mpiana_7.png', '22-02-22 14:01:00 pm'),
(2, 'Rodrigue WABO', '', 'Finances', 'Associe', 'Goma', 'Marie', 7, 'M', ' 24399866999', 'Landry', 'rodwabo@aurorardc.com', '2022-03-10', 'Goma', 'Congolaise', 'Maman Sylvie', '2022-03-09', 'Rodrigue Wabo', 'Maman Sylvie', 'Goma/Kyeshero/Du Lac 05', '145478', 'Goma', '2022-03-09', 'Goma', '2022-03-16', '2022-03-25', 'Niveau VIII', '2346', 'Directeur gerant', '../qr_img/Rodrigue WABO_1.png', '22-03-10 15:18:57 pm'),
(3, 'Audace Mbula', '', 'Finances', 'Associe', 'Goma', 'Marie', 5, 'M', ' 24397000190', 'Landry', 'audacem@aurorardc.com', '2022-03-10', 'Kinshasa', 'Congolaise', 'Mme', '2022-03-10', 'Audace ', 'Maman', 'Goma/Kyeshero/Du Lac 05', '2134868', 'Goma', '2022-03-10', 'Goma', '2022-03-10', '2022-03-11', 'Niveau IX', '2350', 'Associe', '../qr_img/Audace Mbula_2.png', '22-03-10 15:22:59 pm'),
(4, 'Kevin Kena', '', 'Technologie', 'Associe', 'Goma', 'Celibataire', 0, 'M', ' 24397541868', 'Landry', 'kkena@aurorardc.com', '1996-06-22', 'Kinshasa', 'Congolaise', '', '', 'KENA MULUMBA', 'Muhemedi NGONDJE', 'Goma/Kyeshero/Du Lac 05', '22458', 'Goma', '2022-03-10', 'Goma', '2022-03-10', '2022-03-10', 'Niveau IX', '2387', 'Chef de departement', '../qr_img/Kevin Kena_3.png', '22-03-10 15:26:26 pm'),
(5, 'Jonathan Dufina', '', 'Services', 'Associe', 'Goma', 'Celibataire', 0, 'M', ' 24375832390', 'Landry', 'joeduf@aurorardc.com', '2022-03-10', 'Goma', 'Congolaise', '', '', 'Dufina', 'Muhemedi', 'Goma/Kyeshero/Du Lac 05', '134568', 'Goma', '2022-03-10', 'Goma', '2022-03-10', '2022-03-11', 'Niveau VIII', '2456', 'Chef de departement', '../qr_img/Jonathan Dufina_4.png', '22-03-10 15:29:53 pm'),
(7, 'Vanessa Amisi', '', 'All', 'Associe', 'Goma', 'Celibataire', 0, 'F', ' 24399999999', 'Landry', 'avanessa@aurorardc.com', '2022-03-10', 'Goma', 'Congolaise', '', '', 'Papa', 'Maman', 'Goma/Kyeshero/Du Lac 10', '4589', 'Goma', '2022-03-10', 'Goma', '2022-03-10', '2022-03-11', 'Niveau IV', '2489', 'Secretaire', '../qr_img/Vanessa_6.png', '22-03-10 15:37:40 pm'),
(8, 'Valerien Hirwa', '', 'Technologie', 'Associe', 'Goma', 'Celibataire', 0, 'M', ' 24397191226', 'Landry', 'valerienhir@gmail.com', '2001-12-15', 'Goma', 'Congolaise', '', '', 'Emmanuel', 'Viviane', 'Goma/Kyeshero/Du Lac 05', '5689', 'Goma', '2022-03-11', 'Goma', '2022-03-11', '2022-03-11', 'Niveau IX', '4039', 'Developpeur', '../qr_img/Valerien Hirwa_7.png', '22-03-10 15:40:55 pm');

-- --------------------------------------------------------

--
-- Table structure for table `t_agent_org`
--

CREATE TABLE `t_agent_org` (
  `Id` int(11) NOT NULL,
  `IdOrg` int(11) NOT NULL,
  `Noms` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `PCharge` int(11) NOT NULL,
  `Anciennete` date NOT NULL,
  `Fonction` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `SalaireBase` float NOT NULL,
  `No_CNSS` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Departement` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Localisation` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Genre` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Compte_Banque` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nom_Banque` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Etat_Civil` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nbre_Enfant` int(11) NOT NULL,
  `Telephone` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `No_Matricule` int(11) NOT NULL,
  `Noms_Urgence` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Telephone_Urgence` int(11) NOT NULL,
  `Enfant_Nbre` int(11) NOT NULL,
  `Aff_Urgence` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_agent_org`
--

INSERT INTO `t_agent_org` (`Id`, `IdOrg`, `Noms`, `PCharge`, `Anciennete`, `Fonction`, `SalaireBase`, `No_CNSS`, `Departement`, `Localisation`, `Genre`, `Compte_Banque`, `Nom_Banque`, `Etat_Civil`, `Nbre_Enfant`, `Telephone`, `No_Matricule`, `Noms_Urgence`, `Telephone_Urgence`, `Enfant_Nbre`, `Aff_Urgence`) VALUES
(1, 1, 'VALERIEN HIRWA', 3, '2024-06-05', 'Financier', 587.55, '2345', 'Finances', 'Goma', 'M', '0292837', 'TMB', 'MariÃ©', 3, '0975418687', 16161, 'VANESSA AMISI', 975418687, 3, 'Parent'),
(2, 1, 'ZAWADI SIMISI', 9, '2019-05-02', 'Directeur', 250, '2252552', 'Informatiques', 'Goma', 'F', '6633535', 'Equity BCDB', 'MariÃ©', 9, 'ZAWADI SIMISI', 25252, 'PAPA RODRIGUE', 0, 0, 'Epoux(se)'),
(3, 1, 'Betuma Liyeye Jean Paul', 3, '2010-04-25', 'Financier', 910.7, '764383448484', 'Services', 'Bukavu', 'M', '0000112354565', 'TMB', 'MariÃ©', 3, '+243977688776', 2345, 'BETUMA Alphonse', 2147483647, 0, 'Parent'),
(4, 2, 'Betuma Liyeye Jean Paul', 4, '2011-06-01', 'Secretaire', 1888.31, '4368565875', 'Services', 'Bunia', 'M', '98798089787', 'TMB', 'MariÃ©', 4, '+243977688776', 3746, 'BETUMA Alphonse', 2147483647, 3, 'Autre'),
(5, 1, 'KEVIN KENA', 0, '2022-01-01', 'Directeur', 250, 'UUJUHY', 'Finances', 'Goma', 'M', '8888-8888-8888', 'Equity BCDB', 'CÃ©libataire', 0, '+243975418687', 34509, 'KENA KENA', 2147483647, 0, 'Parent'),
(6, 1, 'KEVIN KENA FF', 0, '2022-01-01', 'Directeur', 250, 'UUJUHY', 'Finances', 'Goma', 'M', '8888-8888-8888', 'Equity BCDB', 'CÃ©libataire', 0, '+243975418687', 34509, 'KENA KENA', 2147483647, 0, 'Parent'),
(7, 2, 'KENA KEVIN', 0, '2024-05-01', 'Secretaire', 250, 'ASGSGS99', 'Finances', 'Goma', 'M', 'XXXX-XXXX-XXXX', 'Equity BCDB', 'CÃ©libataire', 0, '987645678', 9876789, 'KENA KENA', 848, 0, 'Parent'),
(8, 2, 'KENA KEVIN', 0, '2024-05-01', 'Secretaire', 250, 'ASGSGS99', 'Finances', 'Goma', 'M', 'XXXX-XXXX-XXXX', 'Equity BCDB', 'CÃ©libataire', 0, '987645678', 9876789, 'KENA KENA', 848, 0, 'Parent'),
(9, 2, 'HIRWA VALERIEN', 0, '2024-05-31', 'Directeur', 250, 'OIUUIO8', 'Finances', 'Goma', 'M', 'NNNN-NNNN-NNNN', 'TMB', 'CÃ©libataire', 0, '0877890', 876789, 'HIRWA ', 9876789, 0, 'Parent');

-- --------------------------------------------------------

--
-- Table structure for table `t_alldeloc`
--

CREATE TABLE `t_alldeloc` (
  `Id` int(11) NOT NULL,
  `Taux` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_alldeloc`
--

INSERT INTO `t_alldeloc` (`Id`, `Taux`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_allfam`
--

CREATE TABLE `t_allfam` (
  `Id` int(11) NOT NULL,
  `Taux` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_allfam`
--

INSERT INTO `t_allfam` (`Id`, `Taux`) VALUES
(1, 7.6);

-- --------------------------------------------------------

--
-- Table structure for table `t_allloge`
--

CREATE TABLE `t_allloge` (
  `Id` int(11) NOT NULL,
  `Taux` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_allloge`
--

INSERT INTO `t_allloge` (`Id`, `Taux`) VALUES
(1, 30);

-- --------------------------------------------------------

--
-- Table structure for table `t_alltrans`
--

CREATE TABLE `t_alltrans` (
  `Id` int(11) NOT NULL,
  `Taux` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_alltrans`
--

INSERT INTO `t_alltrans` (`Id`, `Taux`) VALUES
(1, 1.25);

-- --------------------------------------------------------

--
-- Table structure for table `t_annonces`
--

CREATE TABLE `t_annonces` (
  `id` int(11) NOT NULL,
  `titreAnnonce` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objectifsAnnonce` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datePublication` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomMentor` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailMentor` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomAgent` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_answers`
--

CREATE TABLE `t_answers` (
  `Id` int(11) NOT NULL,
  `idPasseur` int(11) NOT NULL,
  `IdQuestionnaire` int(11) NOT NULL,
  `idQuestion` int(11) NOT NULL,
  `reponse` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cotation` int(11) NOT NULL,
  `cotationsur` int(11) NOT NULL,
  `coter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_answers`
--

INSERT INTO `t_answers` (`Id`, `idPasseur`, `IdQuestionnaire`, `idQuestion`, `reponse`, `Email`, `cotation`, `cotationsur`, `coter`) VALUES
(1, 1, 1, 2, 'Une journÃ©e parfaite est celle que tu as passÃ© en rÃ©solvant le reste de tes problÃ¨mes', 'rodwabo@gmail.com', 3, 5, 1),
(2, 1, 1, 3, '2', 'rodwabo@gmail.com', 5, 5, 1),
(3, 1, 1, 4, 'Parce que le poste est identique Ã  mes expÃ©riences et mes connaissances.', 'rodwabo@gmail.com', 3, 5, 1),
(4, 1, 1, 5, '5', 'rodwabo@gmail.com', 0, 5, 1),
(5, 1, 1, 6, '12', 'rodwabo@gmail.com', 5, 5, 1),
(6, 1, 1, 7, 'Salaire de base, allocations familiales, les avantages, le transport et le logement. il y  a aussi les retenus pour le compte de l\'Etat, notamment l\'IPR, la CNSS', 'rodwabo@gmail.com', 4, 5, 1),
(7, 1, 1, 8, '15', 'rodwabo@gmail.com', 5, 5, 1),
(8, 2, 1, 2, 'Une journÃ©e parfaite est une journÃ©e passÃ©e avec les personnes qui comptent Ã©normÃ©ment pour nous, mais aussi une journÃ©e passÃ©e Ã©tant au service des autres. ', 'Kenakevin9@gmail.com', 3, 5, 1),
(9, 2, 1, 3, '2', 'Kenakevin9@gmail.com', 5, 5, 1),
(10, 2, 1, 4, 'Je crois que j\'ai les compÃ©tences nÃ©cessaires pour le Job demandÃ©. Et je crois m\'adapter au travail demandÃ© en me formant pour donner le meilleur de moi. ', 'Kenakevin9@gmail.com', 3, 5, 1),
(11, 2, 1, 5, '6', 'Kenakevin9@gmail.com', 5, 5, 1),
(12, 2, 1, 6, '12', 'Kenakevin9@gmail.com', 5, 5, 1),
(13, 2, 1, 7, 'Les elements faisant partie de la remuneration sont : Le salaire de base, les avantages. \r\nLes Ã©lÃ©ments ne faisant pas partie de la rÃ©munÃ©ration sont : La TVAâ€¦\r\n', 'Kenakevin9@gmail.com', 1, 5, 1),
(14, 2, 1, 8, '15', 'Kenakevin9@gmail.com', 5, 5, 1),
(15, 3, 1, 2, 'Une journÃ©e au cours de laquelle je fais ce qui me plait.', 'landrykena2018@gmail.com', 3, 5, 1),
(16, 3, 1, 3, '2', 'landrykena2018@gmail.com', 5, 5, 1),
(17, 3, 1, 4, 'De par mes compÃ©tences, je crois que ma connaissance des diffÃ©rents langages de programmation est un atout majeure pour la boite.', 'landrykena2018@gmail.com', 3, 5, 1),
(18, 3, 1, 5, '6', 'landrykena2018@gmail.com', 5, 5, 1),
(19, 3, 1, 6, '12', 'landrykena2018@gmail.com', 5, 5, 1),
(20, 3, 1, 7, 'Le salaire, les heures passÃ©es au travail, les heures supplÃ©mentaires, etc.', 'landrykena2018@gmail.com', 1, 5, 1),
(21, 3, 1, 8, '15', 'landrykena2018@gmail.com', 5, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_answerskill`
--

CREATE TABLE `t_answerskill` (
  `Id` int(11) NOT NULL,
  `Idoffrepub` int(11) NOT NULL,
  `idQuestion` int(11) NOT NULL,
  `reponse` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `etatRep` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_answerskill`
--

INSERT INTO `t_answerskill` (`Id`, `Idoffrepub`, `idQuestion`, `reponse`, `Email`, `etatRep`) VALUES
(1, 1717846822, 6, '11', 'landrykena2018@gmail.com', 1),
(2, 1717846822, 7, '16', 'landrykena2018@gmail.com', 1),
(3, 1717846822, 8, '18', 'landrykena2018@gmail.com', 1),
(4, 1717846822, 9, '17', 'landrykena2018@gmail.com', 0),
(5, 1717846822, 10, '20', 'landrykena2018@gmail.com', 1),
(6, 1717846822, 6, '12', 'Kenakevin9@gmail.com', 0),
(7, 1717846822, 7, '16', 'Kenakevin9@gmail.com', 1),
(8, 1717846822, 8, '18', 'Kenakevin9@gmail.com', 1),
(9, 1717846822, 9, '19', 'Kenakevin9@gmail.com', 1),
(10, 1717846822, 10, '20', 'Kenakevin9@gmail.com', 1),
(11, 1717846822, 6, '11', 'rodwabo@gmail.com', 1),
(12, 1717846822, 7, '16', 'rodwabo@gmail.com', 1),
(13, 1717846822, 8, '18', 'rodwabo@gmail.com', 1),
(14, 1717846822, 9, '19', 'rodwabo@gmail.com', 1),
(15, 1717846822, 10, '20', 'rodwabo@gmail.com', 1),
(16, 1717846822, 6, '12', 'landrykena2030@gmail.com', 0),
(17, 1717846822, 7, '15', 'landrykena2030@gmail.com', 0),
(18, 1717846822, 8, '13', 'landrykena2030@gmail.com', 0),
(19, 1717846822, 9, '17', 'landrykena2030@gmail.com', 0),
(20, 1717846822, 10, '21', 'landrykena2030@gmail.com', 0),
(21, 1717846822, 6, '11', 'aurorardc76@gmail.com', 1),
(22, 1717846822, 7, '16', 'aurorardc76@gmail.com', 1),
(23, 1717846822, 8, '18', 'aurorardc76@gmail.com', 1),
(24, 1717846822, 9, '19', 'aurorardc76@gmail.com', 1),
(25, 1717846822, 10, '20', 'aurorardc76@gmail.com', 1),
(26, 1717846822, 6, '11', 'landrykena2030@gmail.com', 1),
(27, 1717846822, 7, '16', 'landrykena2030@gmail.com', 1),
(28, 1717846822, 8, '18', 'landrykena2030@gmail.com', 1),
(29, 1717846822, 9, '19', 'landrykena2030@gmail.com', 1),
(30, 1717846822, 10, '20', 'landrykena2030@gmail.com', 1),
(31, 1717846822, 6, '11', 'landrykena2030@gmail.com', 1),
(32, 1717846822, 7, '16', 'landrykena2030@gmail.com', 1),
(33, 1717846822, 8, '18', 'landrykena2030@gmail.com', 1),
(34, 1717846822, 9, '19', 'landrykena2030@gmail.com', 1),
(35, 1717846822, 10, '20', 'landrykena2030@gmail.com', 1),
(36, 1717846822, 6, '11', 'landrykena2030@gmail.com', 1),
(37, 1717846822, 7, '16', 'landrykena2030@gmail.com', 1),
(38, 1717846822, 8, '18', 'landrykena2030@gmail.com', 1),
(39, 1717846822, 9, '19', 'landrykena2030@gmail.com', 1),
(40, 1717846822, 10, '20', 'landrykena2030@gmail.com', 1),
(41, 1717846822, 6, '11', 'landrykena2030@gmail.com', 1),
(42, 1717846822, 7, '16', 'landrykena2030@gmail.com', 1),
(43, 1717846822, 8, '18', 'landrykena2030@gmail.com', 1),
(44, 1717846822, 9, '19', 'landrykena2030@gmail.com', 1),
(45, 1717846822, 10, '20', 'landrykena2030@gmail.com', 1),
(46, 1717846822, 6, '11', 'vanessavanamy@gmail.com', 1),
(47, 1717846822, 7, '16', 'vanessavanamy@gmail.com', 1),
(48, 1717846822, 8, '18', 'vanessavanamy@gmail.com', 1),
(49, 1717846822, 9, '19', 'vanessavanamy@gmail.com', 1),
(50, 1717846822, 10, '20', 'vanessavanamy@gmail.com', 1),
(51, 1719827029, 11, '23', 'test@test.com', 0),
(52, 1719827029, 12, '27', 'test@test.com', 1),
(53, 1719827029, 13, '29', 'test@test.com', 0),
(54, 1719827029, 14, '33', 'test@test.com', 1),
(55, 1719827029, 15, '36', 'test@test.com', 0),
(56, 1719827029, 16, '39', 'test@test.com', 1),
(57, 1719827029, 17, '41', 'test@test.com', 0),
(58, 1719827029, 18, '44', 'test@test.com', 0),
(59, 1719827029, 19, '47', 'test@test.com', 0),
(60, 1719827029, 20, '50', 'test@test.com', 1),
(61, 1719827029, 11, '22', 'landrykena2018@gmail.com', 1),
(62, 1719827029, 12, '27', 'landrykena2018@gmail.com', 1),
(63, 1719827029, 13, '28', 'landrykena2018@gmail.com', 1),
(64, 1719827029, 14, '33', 'landrykena2018@gmail.com', 1),
(65, 1719827029, 15, '34', 'landrykena2018@gmail.com', 1),
(66, 1719827029, 16, '39', 'landrykena2018@gmail.com', 1),
(67, 1719827029, 17, '40', 'landrykena2018@gmail.com', 1),
(68, 1719827029, 18, '45', 'landrykena2018@gmail.com', 1),
(69, 1719827029, 19, '48', 'landrykena2018@gmail.com', 1),
(70, 1719827029, 20, '50', 'landrykena2018@gmail.com', 1),
(71, 1719827029, 11, '22', 'Kenakevin9@gmail.com', 1),
(72, 1719827029, 12, '26', 'Kenakevin9@gmail.com', 0),
(73, 1719827029, 13, '29', 'Kenakevin9@gmail.com', 0),
(74, 1719827029, 14, '33', 'Kenakevin9@gmail.com', 1),
(75, 1719827029, 15, '34', 'Kenakevin9@gmail.com', 1),
(76, 1719827029, 16, '37', 'Kenakevin9@gmail.com', 0),
(77, 1719827029, 17, '41', 'Kenakevin9@gmail.com', 0),
(78, 1719827029, 18, '45', 'Kenakevin9@gmail.com', 1),
(79, 1719827029, 19, '47', 'Kenakevin9@gmail.com', 0),
(80, 1719827029, 20, '50', 'Kenakevin9@gmail.com', 1),
(81, 1719827029, 11, '22', 'rodwabo@aurorardc.com', 1),
(82, 1719827029, 12, '26', 'rodwabo@aurorardc.com', 0),
(83, 1719827029, 13, '29', 'rodwabo@aurorardc.com', 0),
(84, 1719827029, 14, '33', 'rodwabo@aurorardc.com', 1),
(85, 1719827029, 15, '34', 'rodwabo@aurorardc.com', 1),
(86, 1719827029, 16, '39', 'rodwabo@aurorardc.com', 1),
(87, 1719827029, 17, '41', 'rodwabo@aurorardc.com', 0),
(88, 1719827029, 18, '44', 'rodwabo@aurorardc.com', 0),
(89, 1719827029, 19, '47', 'rodwabo@aurorardc.com', 0),
(90, 1719827029, 20, '50', 'rodwabo@aurorardc.com', 1),
(91, 1719827029, 11, '22', 'isharamudahama7@gmail.com', 1),
(92, 1719827029, 12, '25', 'isharamudahama7@gmail.com', 0),
(93, 1719827029, 13, '28', 'isharamudahama7@gmail.com', 1),
(94, 1719827029, 14, '33', 'isharamudahama7@gmail.com', 1),
(95, 1719827029, 15, '34', 'isharamudahama7@gmail.com', 1),
(96, 1719827029, 16, '39', 'isharamudahama7@gmail.com', 1),
(97, 1719827029, 17, '40', 'isharamudahama7@gmail.com', 1),
(98, 1719827029, 18, '45', 'isharamudahama7@gmail.com', 1),
(99, 1719827029, 19, '48', 'isharamudahama7@gmail.com', 1),
(100, 1719827029, 20, '50', 'isharamudahama7@gmail.com', 1),
(101, 1719827029, 11, '22', 'Tite.bosembo@gmail.com', 1),
(102, 1719827029, 12, '27', 'Tite.bosembo@gmail.com', 1),
(103, 1719827029, 13, '28', 'Tite.bosembo@gmail.com', 1),
(104, 1719827029, 14, '33', 'Tite.bosembo@gmail.com', 1),
(105, 1719827029, 15, '36', 'Tite.bosembo@gmail.com', 0),
(106, 1719827029, 16, '38', 'Tite.bosembo@gmail.com', 0),
(107, 1719827029, 17, '40', 'Tite.bosembo@gmail.com', 1),
(108, 1719827029, 18, '45', 'Tite.bosembo@gmail.com', 1),
(109, 1719827029, 19, '48', 'Tite.bosembo@gmail.com', 1),
(110, 1719827029, 20, '50', 'Tite.bosembo@gmail.com', 1),
(111, 1719827029, 11, '22', 'infos@aurorardc.com', 1),
(112, 1719827029, 12, '27', 'infos@aurorardc.com', 1),
(113, 1719827029, 13, '28', 'infos@aurorardc.com', 1),
(114, 1719827029, 14, '33', 'infos@aurorardc.com', 1),
(115, 1719827029, 15, '36', 'infos@aurorardc.com', 0),
(116, 1719827029, 16, '38', 'infos@aurorardc.com', 0),
(117, 1719827029, 17, '40', 'infos@aurorardc.com', 1),
(118, 1719827029, 18, '45', 'infos@aurorardc.com', 1),
(119, 1719827029, 19, '48', 'infos@aurorardc.com', 1),
(120, 1719827029, 20, '50', 'infos@aurorardc.com', 1),
(121, 1719827029, 11, '22', 'landrykena2018@gmail.com', 1),
(122, 1719827029, 12, '27', 'landrykena2018@gmail.com', 1),
(123, 1719827029, 13, '28', 'landrykena2018@gmail.com', 1),
(124, 1719827029, 14, '33', 'landrykena2018@gmail.com', 1),
(125, 1719827029, 15, '34', 'landrykena2018@gmail.com', 1),
(126, 1719827029, 16, '39', 'landrykena2018@gmail.com', 1),
(127, 1719827029, 17, '40', 'landrykena2018@gmail.com', 1),
(128, 1719827029, 18, '45', 'landrykena2018@gmail.com', 1),
(129, 1719827029, 19, '48', 'landrykena2018@gmail.com', 1),
(130, 1719827029, 20, '50', 'landrykena2018@gmail.com', 1),
(131, 1719827029, 11, '24', 'rodwabo@gmail.com', 0),
(132, 1719827029, 12, '26', 'rodwabo@gmail.com', 0),
(133, 1719827029, 13, '29', 'rodwabo@gmail.com', 0),
(134, 1719827029, 14, '31', 'rodwabo@gmail.com', 0),
(135, 1719827029, 15, '35', 'rodwabo@gmail.com', 0),
(136, 1719827029, 16, '38', 'rodwabo@gmail.com', 0),
(137, 1719827029, 17, '42', 'rodwabo@gmail.com', 0),
(138, 1719827029, 18, '44', 'rodwabo@gmail.com', 0),
(139, 1719827029, 19, '48', 'rodwabo@gmail.com', 1),
(140, 1719827029, 20, '51', 'rodwabo@gmail.com', 0),
(141, 1719827029, 11, '22', 'landrykena@aurorardc.com', 1),
(142, 1719827029, 12, '27', 'landrykena@aurorardc.com', 1),
(143, 1719827029, 13, '28', 'landrykena@aurorardc.com', 1),
(144, 1719827029, 14, '33', 'landrykena@aurorardc.com', 1),
(145, 1719827029, 15, '34', 'landrykena@aurorardc.com', 1),
(146, 1719827029, 16, '39', 'landrykena@aurorardc.com', 1),
(147, 1719827029, 17, '40', 'landrykena@aurorardc.com', 1),
(148, 1719827029, 18, '45', 'landrykena@aurorardc.com', 1),
(149, 1719827029, 19, '48', 'landrykena@aurorardc.com', 1),
(150, 1719827029, 20, '50', 'landrykena@aurorardc.com', 1),
(151, 1719827029, 11, '22', 'mulendelwadestin@gmail.com', 1),
(152, 1719827029, 12, '27', 'mulendelwadestin@gmail.com', 1),
(153, 1719827029, 13, '28', 'mulendelwadestin@gmail.com', 1),
(154, 1719827029, 14, '33', 'mulendelwadestin@gmail.com', 1),
(155, 1719827029, 15, '34', 'mulendelwadestin@gmail.com', 1),
(156, 1719827029, 16, '39', 'mulendelwadestin@gmail.com', 1),
(157, 1719827029, 17, '41', 'mulendelwadestin@gmail.com', 0),
(158, 1719827029, 18, '45', 'mulendelwadestin@gmail.com', 1),
(159, 1719827029, 19, '48', 'mulendelwadestin@gmail.com', 1),
(160, 1719827029, 20, '50', 'mulendelwadestin@gmail.com', 1),
(161, 1719827029, 11, '22', 'joeliyush.273@gmail.com', 1),
(162, 1719827029, 12, '25', 'joeliyush.273@gmail.com', 0),
(163, 1719827029, 13, '28', 'joeliyush.273@gmail.com', 1),
(164, 1719827029, 14, '33', 'joeliyush.273@gmail.com', 1),
(165, 1719827029, 15, '36', 'joeliyush.273@gmail.com', 0),
(166, 1719827029, 16, '39', 'joeliyush.273@gmail.com', 1),
(167, 1719827029, 17, '40', 'joeliyush.273@gmail.com', 1),
(168, 1719827029, 18, '45', 'joeliyush.273@gmail.com', 1),
(169, 1719827029, 19, '48', 'joeliyush.273@gmail.com', 1),
(170, 1719827029, 20, '50', 'joeliyush.273@gmail.com', 1),
(171, 1719827029, 11, '22', 'joshkabene@gmail.com', 1),
(172, 1719827029, 12, '27', 'joshkabene@gmail.com', 1),
(173, 1719827029, 13, '28', 'joshkabene@gmail.com', 1),
(174, 1719827029, 14, '33', 'joshkabene@gmail.com', 1),
(175, 1719827029, 15, '34', 'joshkabene@gmail.com', 1),
(176, 1719827029, 16, '39', 'joshkabene@gmail.com', 1),
(177, 1719827029, 17, '42', 'joshkabene@gmail.com', 0),
(178, 1719827029, 18, '45', 'joshkabene@gmail.com', 1),
(179, 1719827029, 19, '48', 'joshkabene@gmail.com', 1),
(180, 1719827029, 20, '50', 'joshkabene@gmail.com', 1),
(181, 1719827029, 11, '22', 'evlukoobauma@gmail.com', 1),
(182, 1719827029, 12, '27', 'evlukoobauma@gmail.com', 1),
(183, 1719827029, 13, '29', 'evlukoobauma@gmail.com', 0),
(184, 1719827029, 14, '33', 'evlukoobauma@gmail.com', 1),
(185, 1719827029, 15, '34', 'evlukoobauma@gmail.com', 1),
(186, 1719827029, 16, '39', 'evlukoobauma@gmail.com', 1),
(187, 1719827029, 17, '41', 'evlukoobauma@gmail.com', 0),
(188, 1719827029, 18, '45', 'evlukoobauma@gmail.com', 1),
(189, 1719827029, 19, '48', 'evlukoobauma@gmail.com', 1),
(190, 1719827029, 20, '50', 'evlukoobauma@gmail.com', 1),
(191, 1728719239, 21, '53', 'alanjonse2@gmail.com', 1),
(192, 1728719239, 21, '53', 'danielbashonga88@gmail.com', 1),
(193, 1731402600, 22, '58', 'kenakevin9@gmail.com', 1),
(194, 1731402600, 22, '58', 'rodwabo@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_archiveclasseur`
--

CREATE TABLE `t_archiveclasseur` (
  `id` int(11) NOT NULL,
  `uniqueId` char(38) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `design` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `annee` int(11) NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `description` text CHARACTER SET utf8mb4 NOT NULL,
  `creationdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_archiveclasseur`
--

INSERT INTO `t_archiveclasseur` (`id`, `uniqueId`, `design`, `annee`, `type`, `description`, `creationdate`, `idUser`) VALUES
(1, '753880e8-2823-11ee-af09-66614150f2ed', 'Test01', 2023, 'ComptabilitÃ©', 'Test annee 2023', '2023-07-22 02:05:01', 23),
(2, '933cc9f0-2823-11ee-af09-66614150f2ed', 'Test01', 2022, 'ComptabilitÃ©', 'Test 02', '2023-07-22 02:05:51', 23),
(3, '2a879f94-2824-11ee-af09-66614150f2ed', 'Test10', 2023, 'Finance', 'test 03', '2023-07-22 02:10:05', 23),
(4, '5057fd23-2824-11ee-af09-66614150f2ed', 'Test01', 2021, 'Finance', 'Test 2021', '2023-07-22 02:11:08', 23),
(5, '6f3f8921-2824-11ee-af09-66614150f2ed', 'Test02', 2021, 'Technologie', 'wqw', '2023-07-22 02:12:00', 23),
(6, 'c48d0ad0-2835-11ee-af09-66614150f2ed', 'Test02', 2023, 'Finance', 'ok ok ok', '2023-07-22 04:16:05', 23),
(7, '000c369d-9cc4-11ee-86f2-66614150f2ed', 'classeur1', 2023, 'comptabilitÃ©', 'test', '2023-12-17 11:06:24', 23),
(8, 'd41eba6b-9e60-11ee-86f2-66614150f2ed', 'dec', 2023, 'ok', '1234', '2023-12-19 12:21:31', 23),
(9, 'a16279bb-9e62-11ee-86f2-66614150f2ed', 'Essaie', 2016, 'Documents', 'Documents importants', '2023-12-19 12:34:25', 1),
(10, 'ff46d7fe-2a60-11ef-b8db-66614150f2ed', 'AURORA_Hackathon', 2024, 'Normal', 'Classeur AURORA 2024', '2024-06-14 17:15:53', 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_archivedossier`
--

CREATE TABLE `t_archivedossier` (
  `id` int(11) NOT NULL,
  `uniqueId` char(38) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `idClasseur` char(38) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `designation` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `datedoc` datetime NOT NULL,
  `datecreation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_archivedossier`
--

INSERT INTO `t_archivedossier` (`id`, `uniqueId`, `idClasseur`, `designation`, `datedoc`, `datecreation`, `idUser`) VALUES
(1, 'e4a4712a-2837-11ee-af09-66614150f2ed', '933cc9f0-2823-11ee-af09-66614150f2ed', 'Testdoss1', '2023-06-26 00:00:00', '2023-07-22 02:31:17', 23),
(2, '09fee4d7-2838-11ee-af09-66614150f2ed', '2a879f94-2824-11ee-af09-66614150f2ed', 'Oga police', '2023-07-05 00:00:00', '2023-07-22 02:32:20', 23),
(3, '06a8ba37-9ccc-11ee-86f2-66614150f2ed', '000c369d-9cc4-11ee-86f2-66614150f2ed', 'new', '2023-12-07 00:00:00', '2023-12-17 11:03:51', 23),
(4, '8256c43d-9e62-11ee-86f2-66614150f2ed', 'c48d0ad0-2835-11ee-af09-66614150f2ed', 'Kmla', '2023-12-19 00:00:00', '2023-12-19 11:33:33', 1),
(5, 'b12cc8a0-9e62-11ee-86f2-66614150f2ed', 'a16279bb-9e62-11ee-86f2-66614150f2ed', 'Attestation', '2023-12-19 00:00:00', '2023-12-19 11:34:52', 1),
(6, 'ce9fcfc0-9e62-11ee-86f2-66614150f2ed', 'a16279bb-9e62-11ee-86f2-66614150f2ed', 'Essaie', '2023-12-31 00:00:00', '2023-12-19 11:35:41', 1),
(7, 'dfdd29dc-2a60-11ef-b8db-66614150f2ed', 'c48d0ad0-2835-11ee-af09-66614150f2ed', 'KENA MPIANA Landry', '2024-06-14 00:00:00', '2024-06-14 15:15:01', 1),
(8, '11bd8f55-2a61-11ef-b8db-66614150f2ed', 'a16279bb-9e62-11ee-86f2-66614150f2ed', 'Test', '2024-06-14 00:00:00', '2024-06-14 15:16:24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_archivefichier`
--

CREATE TABLE `t_archivefichier` (
  `Id` int(11) NOT NULL,
  `UniqueId` char(38) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `idDossier` char(38) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Nom` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `Size` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `Legende` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `dateDoc` datetime NOT NULL,
  `userID` int(11) NOT NULL,
  `DateEnreg` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_articles`
--

CREATE TABLE `t_articles` (
  `id_article` varchar(50) CHARACTER SET latin1 NOT NULL,
  `intitule_article` varchar(255) CHARACTER SET latin1 NOT NULL,
  `photo_article` varchar(50) CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  `date_ajout` varchar(50) CHARACTER SET latin1 NOT NULL,
  `id_user` varchar(50) CHARACTER SET latin1 NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `vues` int(11) NOT NULL DEFAULT '0',
  `article_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_articles`
--

INSERT INTO `t_articles` (`id_article`, `intitule_article`, `photo_article`, `description`, `date_ajout`, `id_user`, `id_categorie`, `vues`, `article_num`) VALUES
('64f3217cb04e2', 'European Football transfers: PSG sign Randal Kolo Muani in Â£76.4m deal from Eintracht', '_130966336_gettyimages-1500257916.jpg', '<p style=\"text-align: justify;\">Paris St-Germain have signed forward Randal Kolo Muani from Eintracht Frankfurt for &pound;64.2m (75m euros) plus &pound;12.2m (15m euros) in add-ons.</p>\r\n<p style=\"text-align: justify;\">The France striker refused to train for the Bundesliga club in an attempt to force through the move to PSG.</p>\r\n<p style=\"text-align: justify;\">The 24-year-old grew up on the outskirts of Paris and began his career at Nantes before moving to Germany.</p>\r\n<p style=\"text-align: justify;\">\"<strong>It\'s great to be back where it all began</strong>,\" said Muani, who has signed a five-year deal.</p>\r\n<p style=\"text-align: justify;\">\"<strong>I was attracted by the club\'s project. Now I can\'t wait to get to work and finally play in these colours</strong>.\"</p>\r\n<p style=\"text-align: justify;\">PSG president Nasser Al-Khelaifi added: \"We are delighted to welcome Randal Kolo Muani - a proud Parisien and Frenchman - to Paris St-Germain; to his city and his home.</p>\r\n<p style=\"text-align: justify;\">\"<strong>We have worked incredibly hard to get this transfer over the line. Randal is a fantastic French international player and is committed to PSG and our project</strong>.\"</p>\r\n<p style=\"text-align: justify;\">Meanwhile, Inter Milan have signed midfielder Davy Klaassen on a free transfer from Ajax.</p>\r\n<p style=\"text-align: justify;\">The Dutch international, 30, has signed a two-year contract with the Serie A club and leaves Ajax after making 317 appearances in two spells.</p>\r\n<p style=\"text-align: justify;\">\"<strong>I am a complete player who can help the team, both in the offensive and defensive phases. I am here because I want to win many trophies,</strong>\" he said.</p>\r\n<p style=\"text-align: justify;\">AC Milan have signed Serbia striker Luka Jovic, 25, from Fiorentina on a free transfer.</p>\r\n<p style=\"text-align: justify;\">Former Newcastle striker Andy Carroll moves to Ligue 2 side Amiens</p>\r\n<p style=\"text-align: justify;\">International spending record broken as clubs hit new high</p>\r\n<p style=\"text-align: justify;\">Saudi Pro League \'<strong>not a threat</strong>\' and \'<strong>similar to China</strong>\'</p>\r\n<p style=\"text-align: justify;\">Jovic, who joined Real Madrid from Eintracht Frankfurt for &pound;51.3m (63m euros) in 2019, has signed a one-year deal with the Rossoneri.</p>\r\n<p style=\"text-align: justify;\">Union Berlin have the completed the signing of Italy captain Leonardo Bonucci from Juventus on a free transfer.</p>\r\n<p style=\"text-align: justify;\">The 36-year-old defender, who made 502 appearances for the Turin club across two stints, has signed a one-year deal with the Bundesliga outfit.</p>\r\n<p style=\"text-align: justify;\">Atalanta\'s Colombian forward Duvan Zapata, 32, has joined Torino on an initial season-long loan with the option to buy.</p>', 'September 2,2023 13:50 ', '1', 1, 255, 1),
('64f3297d1b3a2', 'Apple vient de publier la bÃªta 8 dâ€™iOS 17 pour les dÃ©veloppeurs.', 'hero-image.fill.size_1248x702.v1685567607.jpg', '<p style=\"text-align: justify;\"><strong>Apple a pr&eacute;sent&eacute; iOS 17 lors de sa conf&eacute;rence annuelle des d&eacute;veloppeurs le 5 juin dernier, montrant les nouvelles fonctionnalit&eacute;s qui arriveront sur l&rsquo;iPhone, comme StandBy, Live Voicemail, les mises &agrave; jour d&rsquo;AirDrop, et bien plus encore. Le nouvel OS arrivera bient&ocirc;t aux c&ocirc;t&eacute;s de l&rsquo;iPhone 15.</strong></p>\r\n<p style=\"text-align: justify;\">Aujourd&rsquo;hui, Apple a publi&eacute; la b&ecirc;ta 8 d&rsquo;iOS 17 pour les d&eacute;veloppeurs. La firme de Cupertino a &eacute;galement publi&eacute; la b&ecirc;ta 8 de watchOS 10, tvOS 17, HomePod (OS) 17 et la troisi&egrave;me b&ecirc;ta de visionOS. On r&eacute;sume les nouveaut&eacute;s.</p>\r\n<p style=\"text-align: justify;\">iOS 17 : la b&ecirc;ta 8 est lanc&eacute;e pour les d&eacute;veloppeurs, avec des centaines de corrections de bugs</p>\r\n<p style=\"text-align: justify;\">La b&ecirc;ta 8 d&rsquo;iOS 17 apporte de tr&egrave;s nombreuses corrections de bugs et des am&eacute;liorations de performance pour les d&eacute;veloppeurs qui testent la derni&egrave;re version du syst&egrave;me d&rsquo;exploitation pour iPhone et iPad. La liste est longue, esp&eacute;rons qu&rsquo;iOS 17 soit stable &agrave; sa sortie.</p>\r\n<p style=\"text-align: justify;\">En plus des multiples corrections, voici les principales nouveaut&eacute;s d&rsquo;iOS 17 qui viennent d&rsquo;&ecirc;tre am&eacute;lior&eacute;es par la b&ecirc;ta 8 :</p>\r\n<ul style=\"text-align: justify;\">\r\n<li>T&eacute;l&eacute;phone : personnalisation de l&rsquo;image d&rsquo;appel, message vid&eacute;o ou audio si appel FaceTime manqu&eacute;.</li>\r\n<li>Messages : acc&egrave;s aux applications iMessage, partage et demande de position, transcription des messages audio, autocollants personnalis&eacute;s, rattrapage des messages manqu&eacute;s.</li>\r\n<li>FaceTime : effets 3D, iPhone comme cam&eacute;ra, appel depuis Apple TV ou transfert vers t&eacute;l&eacute;viseur.</li>\r\n<li>StandBy : iPhone comme centre de contr&ocirc;le et stand, activit&eacute;s en direct en plein &eacute;cran.</li>\r\n<li>Widgets : interaction avec les widgets, actions sans ouvrir les applications.</li>\r\n<li>AirDrop : partage facile de fichiers et de contacts, compatibilit&eacute; avec Mac, session SharePlay avec deux iPhone.</li>\r\n<li>SharePlay : partage de musique avec CarPlay.</li>\r\n<li>Journalisation : application de journal personnel avec PDF et documents num&eacute;ris&eacute;s.</li>\r\n<li>AirPlay : diffusion de contenu dans les chambres d&rsquo;h&ocirc;tel.</li>\r\n<li>AirPods Pro 2 : fonctionnalit&eacute; Audio Adaptatif.</li>\r\n<li>Plans : navigation hors ligne.</li>\r\n<li>Siri : activation sans &ldquo;Hey&rdquo;, bouton lat&eacute;ral.</li>\r\n<li>Recherche et Spotlight : suggestions, r&eacute;sultats et int&eacute;gration am&eacute;lior&eacute;s.</li>\r\n<li>Pour tester iOS 17, vous devez disposer d&rsquo;un identifiant Apple associ&eacute; &agrave; un compte d&eacute;veloppeur, et t&eacute;l&eacute;charger la b&ecirc;ta 8 d&rsquo;iOS 17 depuis le site web d&rsquo;Apple. Vous pouvez trouver l&rsquo;ensemble des nouveaut&eacute;s de la b&ecirc;ta 8 d&rsquo;iOS 17 ici.</li>\r\n</ul>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><strong>Comment installer la b&ecirc;ta 8 d&rsquo;iOS 17 ?</strong></p>\r\n<p style=\"text-align: justify;\">Pour installer la b&ecirc;ta 8 d&rsquo;iOS 17, vous devez d&rsquo;abord vous inscrire au programme Apple Developer. Ensuite, vous devez suivre ces &eacute;tapes :</p>\r\n<ol style=\"text-align: justify;\">\r\n<li>Ouvrez l&rsquo;application R&eacute;glages sur votre iPhone.</li>\r\n<li>Allez dans G&eacute;n&eacute;ral -&gt; Mise &agrave; jour logicielle -&gt; Beta.</li>\r\n<li>Choisissez iOS 17 Developer Beta.</li>\r\n<li>Appuyez sur Retour et appuyez sur T&eacute;l&eacute;charger et installer.</li>\r\n<li>Votre iPhone va red&eacute;marrer et installer la b&ecirc;ta 8 d&rsquo;iOS 17. Vous pourrez alors profiter des nouvelles fonctionnalit&eacute;s de cette version, comme les widgets interactifs, le mode StandBy, le Live Voicemail, et bien plus encore.</li>\r\n</ol>\r\n<p style=\"text-align: justify;\">&nbsp;</p>', 'September 2,2023 14:24 ', '1', 2, 226, 2),
('64f3401869aa3', 'PSG : Hugo Ekitike encore sous le choc de cette fin de mercato', 'ekitike-psg.jpg', '<p style=\"text-align: justify;\">Arriv&eacute; l&rsquo;&eacute;t&eacute; dernier en provenance du Stade de Reims, l&rsquo;attaquant fran&ccedil;ais a &eacute;t&eacute; l&rsquo;une des nombreuses attractions du mercato parisien.</p>\r\n<p style=\"text-align: justify;\">La derni&egrave;re journ&eacute;e du mercato d&rsquo;&eacute;t&eacute; a &eacute;t&eacute; plut&ocirc;t anim&eacute;e sur la sc&egrave;ne europ&eacute;enne avec de nombreuses arriv&eacute;es verrouill&eacute;es dans les ultimes heures du march&eacute;. Et s&rsquo;il y a bien un gros club qui n&rsquo;a pas ch&ocirc;m&eacute; dans le dernier virage de la fen&ecirc;tre estivale, c&rsquo;est bien le Paris Saint-Germain. D&eacute;j&agrave; aur&eacute;ol&eacute; de costauds renforts avec Milan Skriniar, Marco Asensio, Lucas Hernandez, Kang-In Lee, Manuel Ugarte, Cher Ndour, Gon&ccedil;alo Ramos, Ousmane Demb&eacute;l&eacute; ou encore Arnau Tenas, la direction parisienne a r&eacute;alis&eacute; deux gros coups finaux avec les arriv&eacute;es de Bradley Barcola et de Randal Kolo Muani &agrave; Paris. Mais dans le sens des d&eacute;parts, un joueur n&rsquo;a finalement pas pli&eacute; bagages malgr&eacute; de bruyantes rumeurs : l&rsquo;attaquant fran&ccedil;ais Hugo Ekitike reste donc dans la capitale.</p>\r\n<p style=\"text-align: justify;\">En effet, comme nous vous l&rsquo;avions r&eacute;v&eacute;l&eacute; en exclusivit&eacute; sur notre site, plusieurs clubs dont West Ham, Crystal Palace et l&rsquo;Eintracht Francfort ont tout tent&eacute; pour d&eacute;loger Hugo Ekitike du Paris Saint-Germain. Et malgr&eacute; les accords trouv&eacute;s avec la direction parisienne, le joueur n&rsquo;a jamais donn&eacute; son feu vert pour quitter les pensionnaires du Parc des Princes. Comme cela a &eacute;t&eacute; confirm&eacute; par nos confr&egrave;res de L&rsquo;&Eacute;quipe, une solution a tout de m&ecirc;me essay&eacute; d&rsquo;&ecirc;tre trouv&eacute;e pour faire venir Ekitike &agrave; l&rsquo;Eintracht Francfort durant toute la journ&eacute;e de vendredi, avant la deadline du mercato d&rsquo;&eacute;t&eacute;. Mais l&rsquo;ex-attaquant du Stade de Reims aurait bien refus&eacute; d&rsquo;aller en Bundesliga, ce qui a d&rsquo;ailleurs provoqu&eacute; la rage de Paris en raison du retard pris dans la signature de Randal Kolo Muani, qui a bien failli capoter.</p>\r\n<p style=\"text-align: justify;\"><strong>Quiproquo en interne</strong></p>\r\n<p style=\"text-align: justify;\">Dans le r&eacute;cit de cette folle derni&egrave;re journ&eacute;e de mercato parisien, L&rsquo;Equipe explique, de plus, que le pr&eacute;sident du PSG, Nasser al-Khela&iuml;fi est rentr&eacute; dans une col&egrave;re noire contre Hugo Ekitike et l&rsquo;entourage du joueur. Le dirigeant sportif qatari pensait alors qu&rsquo;Ekitike, longtemps mentionn&eacute; dans un possible &eacute;change avec Francfort pour la signature de Randal Kolo Muani &agrave; Paris, bloquait toutes avanc&eacute;es possibles dans les n&eacute;gociations. Les discussions entre le club parisien et les agents d&rsquo;Hugo Ekitike sont donc tr&egrave;s rapidement devenues assez houleuses pour plusieurs raisons. Totalement sous le choc, le num&eacute;ro 44 du PSG ne comprenait pas pourquoi la direction parisienne le pointait du doigt, en faisant de lui le bouc &eacute;missaire principal dans les difficult&eacute;s du deal concernant RKM.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Selon l&rsquo;entourage du joueur, l&rsquo;int&eacute;r&ecirc;t de l&rsquo;Eintracht Francfort n&rsquo;a jamais &eacute;t&eacute; r&eacute;ellement concret, du moins n&rsquo;est pas apparu clairement. Apr&egrave;s quelques brouilles en interne, le Paris Saint-Germain a pu reprendre les n&eacute;gociations pour boucler l&rsquo;arriv&eacute;e, non sans mal, de Randal Kolo Muani &agrave; Paris. Pendant ce temps, Hugo Ekitike pr&eacute;parait son maintien dans l&rsquo;effectif parisien puisqu&rsquo;il n&rsquo;avait pas l&rsquo;intention de r&eacute;ellement plier bagages cet &eacute;t&eacute;. Dans l&rsquo;esprit de l&rsquo;attaquant fran&ccedil;ais, tout est clair : respecter son contrat et tenter de s&rsquo;imposer au PSG. A voir d&eacute;sormais si ces bras de fer internes entre le joueur, ses agents et le club entacheront le moral d&rsquo;Ekitike qui devra combattre une lourde concurrence sur les lignes offensives avec les arriv&eacute;es tardives de Bradley Barcola mais surtout de Randal Kolo Muani.</p>', 'September 2,2023 16:00 ', '1', 1, 213, 3),
('64f3416b649b3', 'La colÃ¨re du prÃ©sident Tshisekedi aprÃ¨s la tragÃ©die de Goma : &quot;Ce drame ne demeurera pas impuni&quot;', 'felix-tshisekedi-696x392.jpg', '<p style=\"text-align: justify;\">Dans le sillage des violences tragiques qui ont ensanglant&eacute; les rues de Goma, le pr&eacute;sident F&eacute;lix Tshisekedi a exprim&eacute; vendredi sa vive col&egrave;re et son effroi devant le conseil des ministres &agrave; Kinshasa. Un sentiment qui trouve &eacute;cho dans une nation en deuil apr&egrave;s la perte brutale de plus de 40 de ses citoyens, fauch&eacute;s par l&rsquo;intervention des forces de l&rsquo;ordre lors d\'une manifestation.</p>\r\n<blockquote>\r\n<p>Ces &eacute;v&eacute;nements sont incompatibles &agrave; la vie en d&eacute;mocratie et &agrave; la mission des forces arm&eacute;es &raquo;, a d&eacute;clar&eacute; le pr&eacute;sident avec v&eacute;h&eacute;mence, soulignant l\'urgence d\'une justice &eacute;clair&eacute;e. Insistant sur le fait que ce drame &laquo; ne peut et ne demeurera pas impuni &raquo;, Tshisekedi a vivement appel&eacute; la justice &agrave; &eacute;tablir les responsabilit&eacute;s de cette trag&eacute;die.</p>\r\n</blockquote>\r\n<p style=\"text-align: justify;\">L&rsquo;appel du pr&eacute;sident aux forces de l&rsquo;ordre a &eacute;t&eacute; clair : leurs efforts doivent &ecirc;tre davantage ax&eacute;s sur la pr&eacute;vention et le dialogue avec les populations qu\'elles sont cens&eacute;es prot&eacute;ger. En demandant un rapport imm&eacute;diat sur les circonstances de ce drame, Tshisekedi entend marquer sa d&eacute;termination &agrave; voir des sanctions s&eacute;v&egrave;res prises contre les responsables.</p>\r\n<p style=\"text-align: justify;\">Parall&egrave;lement, la justice se met en marche. Vendredi 1er septembre, le tribunal militaire de Goma a ouvert le proc&egrave;s des pr&eacute;sum&eacute;s instigateurs de ces violences. Tous membres du mouvement religieux &agrave; l\'origine de la manifestation, ces individus ont &eacute;t&eacute; pr&eacute;sent&eacute;s dans un climat de tension palpable.</p>\r\n<p style=\"text-align: justify;\">Au Stade de l\'Unit&eacute;, des fid&egrave;les ont exprim&eacute; leur d&eacute;tresse et leur soif de justice, pointant notamment la mort de quatre animateurs de leur radio lors d\'une intervention au si&egrave;ge de leur mouvement. Leur d&eacute;sarroi se cristallise autour d\'un cri de ralliement : &laquo; Wazalendo, tu sortiras vainqueur &raquo;.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Alors que Goma, ville &agrave; l\'histoire d&eacute;j&agrave; lourde, est plong&eacute;e dans une nouvelle tourmente, des responsables de l\'&eacute;glise envisagent de porter plainte contre les autorit&eacute;s militaires, accus&eacute;es d\'exc&egrave;s de z&egrave;le.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>', 'September 2,2023 16:06 ', '1', 3, 227, 4),
('64f41edf09d35', 'Programmation : pourquoi le &quot;green coding&quot; pourrait rÃ©volutionner le secteur technologique', 'clavier-backspace-a_54.jpg', '<p style=\"text-align: justify;\">Qu&rsquo;est-ce qui est le plus nocif pour le climat ? Regarder une s&eacute;rie sur Netflix, Amazon Prime ou Disney+ le soir, ou prendre l&rsquo;avion ?</p>\r\n<p style=\"text-align: justify;\">Malgr&eacute; la banalit&eacute; apparente de cette question, la r&eacute;ponse n&rsquo;est pas aussi &eacute;vidente qu&rsquo;il n&rsquo;y parait. Les vols commerciaux repr&eacute;sentent 2,4 % des &eacute;missions totales de CO2, et arrivent en deuxi&egrave;me position. Avec une part totale allant de 2,5 % &agrave; 3,7 %, les centres de donn&eacute;es arrivent en t&ecirc;te. Et Netflix et les autres plateformes en ont besoin pour fournir leurs services.</p>\r\n<p style=\"text-align: justify;\">En toute honn&ecirc;tet&eacute;, m&ecirc;me les avions sont d&eacute;pendants des services des hyperscalers et les centres de donn&eacute;es prennent &agrave; leur compte une partie de leurs &eacute;missions. Fondamentalement, aujourd&rsquo;hui, presque tout n&eacute;cessite un centre de donn&eacute;es d&rsquo;une mani&egrave;re ou d&rsquo;une autre en raison de la num&eacute;risation globale. Et la consommation d&rsquo;&eacute;nergie pour les op&eacute;rations et le refroidissement est &eacute;norme. La logique est de faire preuve de plus de durabilit&eacute; &eacute;galement dans ce domaine, et de commencer par l&rsquo;&eacute;l&eacute;ment le plus petit : le code des applications est ex&eacute;cut&eacute; sur les centres de donn&eacute;es.</p>\r\n<p style=\"text-align: justify;\">Plus petit, plus rapide, plus efficace</p>\r\n<p style=\"text-align: justify;\">La philosophie derri&egrave;re le green coding consiste &agrave; optimiser le code de mani&egrave;re efficace pour qu&rsquo;il devienne durable. Apr&egrave;s tout,un code efficace n&rsquo;a pas besoin de beaucoup d&rsquo;&eacute;nergie. Trois crit&egrave;res doivent &ecirc;tre ajust&eacute;s pour obtenir un green code :</p>\r\n<p style=\"text-align: justify;\">Taille : un &laquo; petit &raquo; code prend moins d&rsquo;espace lors du d&eacute;ploiement, et plus important encore, lors du transfert entre les points de terminaison.&nbsp;&nbsp;</p>\r\n<p style=\"text-align: justify;\">Rapidit&eacute; : si un code est ex&eacute;cut&eacute; rapidement, la p&eacute;riode pendant laquelle l&rsquo;&eacute;nergie est n&eacute;cessaire est plus courte. Des &eacute;conomies d&rsquo;&eacute;nergie sont &eacute;galement r&eacute;alis&eacute;es.</p>\r\n<p style=\"text-align: justify;\">Efficacit&eacute; des ressources : d&egrave;s le d&eacute;but, les codes peuvent &ecirc;tre &eacute;crits de mani&egrave;re &agrave; ce qu&rsquo;ils utilisent moins de ressources pendant leur ex&eacute;cution.</p>\r\n<p style=\"text-align: justify;\">De plus, m&ecirc;me des changements minimaux apport&eacute;s au code peuvent avoir un impact important. Par exemple, si vous r&eacute;duisez la r&eacute;solution des images dans une application, l&rsquo;impact sur la consommation d&rsquo;&eacute;nergie des appareils sera minime. Mais lorsque vous consid&eacute;rez que des centaines de milliers d&rsquo;utilisateurs ouvrent cette application chaque jour, cela repr&eacute;sente de r&eacute;elles &eacute;conomies. Il est peu probable que les utilisateurs remarquent la diff&eacute;rence en raison des petits &eacute;crans.</p>\r\n<p style=\"text-align: justify;\">L&rsquo;utilisation des fournisseurs de r&eacute;seaux de diffusion de contenu (CDN) peut repr&eacute;senter une autre approche de la rapidit&eacute;. En r&egrave;gle g&eacute;n&eacute;rale, les applications web de toutes sortes doivent &ecirc;tre h&eacute;berg&eacute;es dans des centres de donn&eacute;es. Ils sont rattach&eacute;s localement et peuvent &ecirc;tre in&eacute;galement r&eacute;partis. Lorsqu&rsquo;un utilisateur acc&egrave;de &agrave; une application web, il le fait sur le centre de donn&eacute;es le plus proche de lui. Pour un utilisateur allemand, cela implique d&rsquo;acc&eacute;der peut-&ecirc;tre &agrave; un centre en Espagne simplement parce qu&rsquo;il n&rsquo;y en a aucun en Allemagne et que les autres se trouvent encore plus loin. Les fournisseurs CDN utilisent un r&eacute;seau de serveurs proxy r&eacute;parti g&eacute;ographiquement ainsi que leurs centres de donn&eacute;es pour que l&rsquo;utilisateur acc&egrave;de &agrave; l&rsquo;application plus efficacement et rapidement. Plus de rapidit&eacute; &eacute;quivaut &agrave; moins d&rsquo;&eacute;nergie consomm&eacute;e. Encore une fois, les &eacute;conomies par individu peuvent sembler minimes mais dans l&rsquo;exemple de Netflix, qui utilise un CDN avec Open Connect, cela peut faire une r&eacute;elle diff&eacute;rence au bout du compte.</p>\r\n<p style=\"text-align: justify;\">Courir un marathon pour cr&eacute;er un logiciel durable</p>\r\n<p style=\"text-align: justify;\">Les d&eacute;veloppeurs de logiciels sont souvent soumis &agrave; des budgets restreints. En g&eacute;n&eacute;ral, ils &eacute;crivent du code, qui passe ensuite par l&rsquo;&eacute;tape de l&rsquo;assurance qualit&eacute; (QA). Si tout fonctionne, ils proc&egrave;dent au d&eacute;ploiement. Ce n&rsquo;est pas le processus le plus efficace, mais c&rsquo;est le plus rentable. Dans le secteur, la r&eacute;alisation d&rsquo;une telle t&acirc;che aussi rapidement que possible dans un d&eacute;lai imparti est appel&eacute;e un sprint.</p>\r\n<p style=\"text-align: justify;\">Avec le green code, la situation diff&eacute;rente. Avant que le code ne soit soumis &agrave; l&rsquo;&eacute;tape de QA, il est d&eacute;ploy&eacute; plusieurs fois dans un environnement de test, puis il est test&eacute;, mesur&eacute; et modifi&eacute;. Au cours du processus, vous devez modifier le code jusqu&rsquo;&agrave; ce que vous obteniez la version la plus efficace mais &eacute;galement la plus &eacute;conomique. Elle passe ensuite par l&rsquo;&eacute;tape de QA, puis elle est d&eacute;ploy&eacute;e. Par exemple, vous testez les performances des bases de donn&eacute;es lorsque vous modifiez le code, ce qui est un indicateur de son efficacit&eacute;. Ou vous utilisez des outils de surveillance des performances des applications pour v&eacute;rifier la rapidit&eacute; et l&rsquo;efficacit&eacute; de l&rsquo;ex&eacute;cution du code. Il existe d&eacute;sormais des applications qui allient de telles fonctions pour une optimisation continue, comme SolarWinds Observability.</p>\r\n<p style=\"text-align: justify;\">D&egrave;s lors, un sprint n&rsquo;est plus un sprint, mais un marathon co&ucirc;teux et long, ce qui est moins rentable pour les entreprises. En principe, la possibilit&eacute; d&rsquo;optimiser efficacement le code existait d&eacute;j&agrave; avant les solutions de surveillance et d&rsquo;observabilit&eacute; de grande envergure, mais personne n&rsquo;a encore essay&eacute;. Toutefois, compte tenu de l&rsquo;&eacute;norme part des &eacute;missions mondiales de CO2 que repr&eacute;sentent les centres de donn&eacute;es, le green code offre un potentiel inexploit&eacute; pour une plus grande durabilit&eacute;. Il est temps d&rsquo;en tirer profit.</p>', 'September 3,2023 7:51 ', '1', 2, 214, 5),
('64f41fa000e1a', 'Microsoft va dissocier Teams d\'Office 365 et de Microsoft 365 en Europe', 'microsoft-teams.jpg', '<p style=\"text-align: justify;\">Microsoft va dissocier Teams de ses suites Microsoft 365 et Office 365 en Europe &agrave; partir du mois d\'octobre de cette ann&eacute;e. Cette d&eacute;cision veut &eacute;viter &agrave; l\'entreprise de Redmond des sanctions antitrust. En effet, le mois dernier, la Commission europ&eacute;enne a ouvert une enqu&ecirc;te sur le regroupement de Teams avec Office 365.</p>\r\n<p style=\"text-align: justify;\">Probablement, cette enqu&ecirc;te de la Commission europ&eacute;enne s\'est d&eacute;clench&eacute;e &agrave; la suite d\'une plainte d&eacute;pos&eacute;e aupr&egrave;s d\'elle par Slack en 2020. Slack reprochant &agrave; Microsoft de forcer l\'installation de Teams, de bloquer sa suppression et de cacher son co&ucirc;t aux entreprises.</p>\r\n<p style=\"text-align: justify;\">Le corollaire de cette d&eacute;cision de Microsoft est que ses clients pourront acheter des abonnements sans Teams, donc &agrave; un prix inf&eacute;rieur. Microsoft a publi&eacute; sa nouvelle grille tarifaire <a title=\"New subscription structure for Microsoft 365 in Europe\" href=\"https://www.microsoft.com/en-us/licensing/news/Microsoft365-Teams-EEA\" target=\"_blank\" rel=\"noopener\">ici</a></p>', 'September 3,2023 7:54 ', '1', 2, 215, 6),
('64f4205acdcd9', 'Caricature : Des tirs sur des civils Ã  Goma!', 'WhatsApp Image 2023-08-31 at 19.22.28.jpeg', '<p>La ville de Goma, situ&eacute;e dans la province du Nord-Kivu, a &eacute;t&eacute; le th&eacute;&acirc;tre d\'une violence in&eacute;dite le mercredi 30 ao&ucirc;t 2023. Tout a commenc&eacute; par une manifestation contre la MONUSCO et la force de la Communaut&eacute; des &Eacute;tats de l&rsquo;Afrique de l&rsquo;Est. Cette protestation a &eacute;t&eacute; orchestr&eacute;e par la secte mystico-religieuse &laquo; La Foi Naturelle Juda&iuml;que Messianique vers les Nations &raquo;. Selon les rapports, l\'&eacute;v&eacute;nement a fait plus de 40 victimes et 56 bless&eacute;s.</p>\r\n<p>Cette trag&eacute;die a suscit&eacute; de vives r&eacute;actions de la part de la classe politique, de la soci&eacute;t&eacute; civile et des partenaires diplomatiques de la RDC. La condamnation de cette violence a &eacute;t&eacute; unanime. Suite &agrave; ces &eacute;v&eacute;nements, un proc&egrave;s en flagrance a &eacute;t&eacute; ouvert au tribunal militaire de Goma le vendredi 1er septembre pour juger les individus soup&ccedil;onn&eacute;s d\'&ecirc;tre &agrave; l\'origine de ces troubles.</p>\r\n<p>Le Premier ministre, Sama Lukonde, a d&eacute;clar&eacute; qu\'une d&eacute;l&eacute;gation gouvernementale de haut niveau sera envoy&eacute;e &agrave; Goma. Leur mission essentielle est d\'enqu&ecirc;ter et de faire la lumi&egrave;re sur ces &eacute;v&eacute;nements tragiques. La d&eacute;l&eacute;gation aura pour principale responsabilit&eacute; d\'examiner en d&eacute;tail tous les &eacute;l&eacute;ments et proc&eacute;dures qui permettront de d&eacute;terminer les faits exacts entourant les troubles lors de la manifestation.</p>', 'September 3,2023 7:57 ', '1', 3, 212, 7),
('64f4215ab52c0', 'Ã‰lections en RDC : MoÃ¯se Katumbi dÃ©voile le point faible de la CENI et plaide pour une surveillance renforcÃ©e', 'Katumbi Mazembe.png', '<p style=\"text-align: justify;\">La formation politique Ensemble pour la R&eacute;publique de Mo&iuml;se Katumbi, ancien gouverneur du Katanga, monte au cr&eacute;neau. Bien qu&rsquo;elle fasse partie de celles engag&eacute;es dans le processus &eacute;lectoral orchestr&eacute; par D&eacute;nis Kadima &agrave; la t&ecirc;te de la Commission &eacute;lectorale nationale ind&eacute;pendante (CENI), l\'ombre du doute plane toujours, principalement concernant l\'audit du fichier &eacute;lectoral.</p>\r\n<p style=\"text-align: justify;\">Suite &agrave; la convocation officielle de l\'&eacute;lectorat pour la pr&eacute;sidentielle de d&eacute;cembre, Dieudonn&eacute; Bolengetenge Balea, secr&eacute;taire g&eacute;n&eacute;ral de la formation, a mis en lumi&egrave;re cette pr&eacute;occupation. Pour lui, certaines des garanties requises pour des &eacute;lections paisibles ne rel&egrave;vent pas uniquement de la responsabilit&eacute; de la CENI, mais du gouvernement lui-m&ecirc;me.</p>\r\n<h3 style=\"text-align: justify;\"><strong>\"La vraie pierre d\'achoppement pour la CENI reste cet audit du fichier. La CENI refuse tous les types d\'audits propos&eacute;s, qu\'ils soient internationaux ou citoyens, ce qui suscite de r&eacute;elles inqui&eacute;tudes.\"</strong> a-t-il affirm&eacute; lors d\'une conf&eacute;rence de presse post-c&eacute;r&eacute;monie.</h3>\r\n<p style=\"text-align: justify;\">L&rsquo;opposition, bien qu\'elle n\'envisage pas un dialogue imminent, souhaite cependant mettre en &oelig;uvre des strat&eacute;gies conjointes avec la population pour s&eacute;curiser leurs votes apr&egrave;s les &eacute;lections. \"Il s\'agit avant tout d\'un processus pour le peuple congolais\", insiste-t-il, appelant &agrave; l\'importance de la surveillance des votes et de la protection du choix des citoyens.</p>\r\n<p style=\"text-align: justify;\">Avec une p&eacute;riode d\'op&eacute;ration pr&eacute;vue du 9 septembre au 8 octobre, le Bureau de r&eacute;ception et de traitement des candidatures (BRTC) est d&eacute;j&agrave; en place &agrave; la CENI, pr&ecirc;t &agrave; recevoir les dossiers des candidats &agrave; la pr&eacute;sidentielle.</p>\r\n<p style=\"text-align: justify;\">N&eacute;anmoins, les pr&eacute;occupations sur l\'int&eacute;grit&eacute; du processus &eacute;lectoral ne sont pas exclusives &agrave; Ensemble pour la R&eacute;publique. D\'autres poids lourds de l\'opposition comme Delly Sesanga, Augustin Matata Ponyo ont &eacute;galement leurs r&eacute;serves. Pendant ce temps, Martin Fayulu ne semble pas pr&ecirc;t &agrave; pr&eacute;senter les dossiers de ses candidats et persiste dans sa demande d\'audit externe du fichier. De son c&ocirc;t&eacute;, le FCC de Joseph Kabila croit que tout doit &ecirc;tre repris de z&eacute;ro, en commen&ccedil;ant par la CENI.</p>\r\n<h3 style=\"text-align: justify;\"><strong><em>Dans cette m&ecirc;l&eacute;e politique, une chose est s&ucirc;re : le chemin vers des &eacute;lections pacifiques et transparentes en RDC sera sem&eacute; d\'emb&ucirc;ches et d\'obstacles &agrave; surmonter.</em></strong></h3>', 'September 3,2023 8:02 ', '1', 3, 205, 8),
('64f421f8e1463', 'Ligue 1 : le Tout Puissant Mazembe domine largement la Jeunesse sportive Groupe Bazano', 'Mazembe vs Pyramids FC Ã  Lubumbashi.jpg', '<div style=\"text-align: justify;\"><strong>Le Tout Puissant Mazembe a encha&icirc;n&eacute;, ce mercredi 30 ao&ucirc;t 2023, avec la s&eacute;rie des victoires, une deuxi&egrave;me de suite pour le compte de la deuxi&egrave;me journ&eacute;e de la 29&egrave;me &eacute;dition la ligue nationale de football (LINAFOOT) dans sa zone Sud centre. Les Corbeaux l\'ont emport&eacute; face &agrave; la Jeunesse sportive Groupe Bazano (4-0).</strong></div>\r\n<p style=\"text-align: justify;\">Les Corbeaux qui ont &eacute;volu&eacute; dans l\'enceinte de leur stade de Kamalondo ont ouvert le score en deuxi&egrave;me p&eacute;riode (50\') gr&acirc;ce &agrave; Jo&euml;l Beya dans un cafouillage. Le corner de la nouvelle recrue de Mazembe, Keita, &eacute;tait difficile &agrave; man&oelig;uvrer par la d&eacute;fense de Bazano au premier poteau. Le ballon qui a tra&icirc;n&eacute; devant le but est gliss&eacute; au fond de filet par l\'avant-centre de Mazembe form&eacute; &agrave; la KFA, Jo&euml;l Beya.</p>\r\n<p style=\"text-align: justify;\">A la 61&egrave;me minute, Ibrahim Keita, passeur au premier but, va d&eacute;poser un ballon venu du corner sur la t&ecirc;te de Magloire Ntambwe, en pleine lucarne pour la deuxi&egrave;me r&eacute;alisation des Corbeaux.</p>\r\n<p style=\"text-align: justify;\">Haininkoy va marquer son premier but avec les corbeaux (84\'). Il sera imit&eacute; par Kevine Mondeko, nouveau capitaine de Mazembe en toute fin de rencontre pour le 4 &egrave;me but.</p>\r\n<p style=\"text-align: justify;\">En deux sorties, le Tout Puissant Mazembe totalise 6 points avec 4 buts marqu&eacute;s.</p>', 'September 3,2023 8:04 ', '1', 1, 197, 9),
('64f422b481126', '114 Films SÃ©lectionnÃ©s pour la 10Ã¨me Ã‰dition du Festival International de CinÃ©ma de Kinshasa', 'FICKIN.jpg', '<p style=\"text-align: justify;\">La 10&egrave;me &eacute;dition du Festival International de Cin&eacute;ma de Kinshasa (Fickin) se pr&eacute;pare &agrave; ouvrir ses portes du 14 au 21 octobre 2023. En une d&eacute;cennie, ce festival, n&eacute; de la volont&eacute; de pr&eacute;senter au public congolais des films rares et in&eacute;dits, s\'est impos&eacute; comme un rendez-vous incontournable du septi&egrave;me art en R&eacute;publique d&eacute;mocratique du Congo. Cette ann&eacute;e, ce sont 114 films, issus de divers horizons, qui prendront place &agrave; l\'Acad&eacute;mie des Beaux-Arts et &agrave; l\'Institut Fran&ccedil;ais de Kinshasa.</p>\r\n<p style=\"text-align: justify;\">Lors de la pr&eacute;sentation des films s&eacute;lectionn&eacute;s, ce lundi 28 ao&ucirc;t &agrave; Bruxelles, Kevin Mavakala, directeur de cette 10&egrave;me &eacute;dition du Fickin, a r&eacute;v&eacute;l&eacute; que cette s&eacute;lection de 114 films a &eacute;t&eacute; op&eacute;r&eacute;e parmi un total de 517 &oelig;uvres re&ccedil;ues. Le festival s\'engage &agrave; offrir un voyage cin&eacute;matographique &agrave; travers le monde, avec des productions en provenance des cinq continents, repr&eacute;sentant 36 pays, dont la RDC, la France, la Belgique, le Kenya, la Zambie, la Suisse, le Canada, l\'Allemagne, la R&eacute;publique Tch&egrave;que, le Kazakhstan, le Japon, la R&eacute;union, le Nigeria, le Togo, l\'Iran, le Maroc, l\'Ouganda, la Serbie, le S&eacute;n&eacute;gal, les &Eacute;tats-Unis, Isra&euml;l, le Mexique, la Malaisie, le Rwanda, l\'Italie, la Turquie, la Pologne, la Mac&eacute;doine, le Congo, le Botswana, la RCA, l\'Alg&eacute;rie, l\'Afrique du Sud, le Cameroun et la Colombie.</p>\r\n<p style=\"text-align: justify;\">Parmi les films pr&eacute;sent&eacute;s figurent 19 courts m&eacute;trages documentaires, 54 courts m&eacute;trages de fiction, 14 longs m&eacute;trages documentaires, 16 longs m&eacute;trages de fiction et 11 courts m&eacute;trages d\'animation. Une s&eacute;lection sp&eacute;ciale de 6 courts m&eacute;trages de fiction r&eacute;alis&eacute;s par des &eacute;tudiants de l\'INA sera &eacute;galement pr&eacute;sent&eacute;e. Parmi les films congolais, le court m&eacute;trage documentaire \"Kin ma belle\" de Junior Mozes a &eacute;t&eacute; retenu dans la s&eacute;lection officielle, de m&ecirc;me que les courts m&eacute;trages de fiction \"Butu\" de Kevin Mayamba, \"Atroce\" de Junior Kapinga, \"Bombe\" de Justin Nyembo et \"Mulika\" de Maisha Maene. Le long m&eacute;trage de fiction \"A deux reprise\" de Christian Nzonga sera &eacute;galement &agrave; l\'affiche.</p>\r\n<p style=\"text-align: justify;\">La pr&eacute;c&eacute;dente &eacute;dition du Fickin, qui s\'est tenue en juillet 2022, avait retenu 74 films sur plus de 270 soumissions initiales. Ces &oelig;uvres avaient &eacute;t&eacute; projet&eacute;es &agrave; l\'Acad&eacute;mie des Beaux-Arts, &agrave; l\'Institut Fran&ccedil;ais de Kinshasa et &agrave; la Plateforme Contemporaine. Les films pr&eacute;sent&eacute;s provenaient de 34 pays, dont 15 de la RDC. En plus des projections, des ateliers et des colloques, des prix avaient &eacute;t&eacute; d&eacute;cern&eacute;s aux meilleurs films, acteurs, r&eacute;alisateurs et directeurs de la photographie, pour un total de 20 prix attribu&eacute;s.</p>\r\n<p style=\"text-align: justify;\">Le Festival International de Cin&eacute;ma de Kinshasa, organis&eacute; par l\'Association Cin&eacute; na Biso, vise &agrave; mettre en avant la cr&eacute;ation cin&eacute;matographique locale et internationale &agrave; travers des projections, des ateliers de formation, des Masterclass, des rencontres professionnelles et des opportunit&eacute;s de r&eacute;seautage.</p>\r\n<p style=\"text-align: justify;\">Les Masterclass de cette dixi&egrave;me &eacute;dition ont pour objectif de r&eacute;unir des talents qui excellent dans leur domaine et savent captiver l\'attention du public. Les cin&eacute;astes congolais Dieudo Hamadi et Petna Ndaliko, ainsi que la Franco-Malgache Marie Cl&eacute;mence, prendront part aux Masterclass sur le storytelling et la narration au cin&eacute;ma.</p>', 'September 3,2023 8:07 ', '1', 4, 211, 10),
('64f4240f271d2', 'Transferts : Surprise, Haaland va plomber les plans de MbappÃ© ?', 'Mbappe.jpg', '<h3 style=\"text-align: justify;\"><strong>En fin de contrat avec le PSG en juin 2024, Kylian Mbapp&eacute; a fait parler de lui cet &eacute;t&eacute;. La star de 24 ans n\'a pas encore prolong&eacute;, m&ecirc;me si une prolongation semble envisageable. Mais l\'hypoth&egrave;se d\'une arriv&eacute;e libre au Real Madrid n\'est pas &agrave; &eacute;carter non plus. Cependant, le club madril&egrave;ne pourrait finalement choisir de se tourner vers Erling Haaland.</strong></h3>\r\n<p style=\"text-align: justify;\">Une fois de plus, <strong>Kylian Mbapp&eacute;</strong> a fait parler de lui sur le mercato. Alors que son contrat expire en juin 2024, la star de 24 ans n&rsquo;a pas encore prolong&eacute; avec le PSG. Cette question avait d&rsquo;ailleurs &eacute;t&eacute; au coeur d&rsquo;une guerre entre l&rsquo;international fran&ccedil;ais et le club de la capitale, mais les tensions sont retomb&eacute;es depuis quelques jours d&eacute;j&agrave;. Si Kylian Mbapp&eacute; serait d&eacute;sormais ouvert &agrave; une prolongation au PSG, l&rsquo;hypoth&egrave;se d&rsquo;une arriv&eacute;e au Real Madrid l&rsquo;&eacute;t&eacute; prochain n&rsquo;est pas &agrave; &eacute;carter.</p>\r\n<p style=\"text-align: justify;\">Les Merengue misent justement sur un transfert libre en juin 2024 pour le champion du monde 2018. Mais dans le m&ecirc;me temps, le feuilleton Erling Haaland commence &agrave; refaire surface. Le buteur de 23 ans disposerait d&rsquo;une clause dans son contrat avec Manchester City permettant aux clubs &eacute;trangers de profiter d&rsquo;une clause lib&eacute;ratoire de 200M&euro; &agrave; partir de l&rsquo;&eacute;t&eacute; 2024. Le Real Madrid pourrait donc d&eacute;cider de parier sur le Norv&eacute;gien plut&ocirc;t que sur Kylian Mbapp&eacute;. En tout cas, la communaut&eacute; madril&egrave;ne aurait fait son choix.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Les supporters du Real Madrid pr&eacute;f&egrave;rent Haaland</p>\r\n<p style=\"text-align: justify;\">D&rsquo;apr&egrave;s les informations de Mundo Deportivo, les supporters du Real Madrid commenceraient &agrave; prendre parti entre Erling Haaland et Kylian Mbapp&eacute;. Les fans madril&egrave;nes auraient d&eacute;sormais une pr&eacute;f&eacute;rence pour le Norv&eacute;gien, puisque ces derniers en auraient assez de voir le Fran&ccedil;ais jouer avec la Casa Blanca sur le mercato. Les dirigeants merengue pourraient ainsi &eacute;couter le public du Real Madrid et se tourner vers Erling Haaland lors du prochain mercato estival. &Agrave; suivre...</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>', 'September 3,2023 8:13 ', '1', 1, 205, 11),
('64f425d347079', 'Surprise, le PSG a recalÃ© une star sur le mercato !', 'tÃ©lÃ©chargement.jpg', '<h3 style=\"text-align: justify;\"><strong>Cet &eacute;t&eacute;, le PSG a totalement enflamm&eacute; le mercato. Le club de la capitale s\'est attach&eacute; les services d\'une bonne dizaine de joueurs afin de se renforcer. La formation parisienne a cl&ocirc;tur&eacute; son recrutement avec Randal Kolo Muani dans les ultimes heures du mercato. Mais le PSG a &eacute;galement rat&eacute; quelques jolis coups sur le march&eacute;.</strong></h3>\r\n<p style=\"text-align: justify;\">Le mercato a &eacute;t&eacute; plut&ocirc;t agit&eacute; au PSG cet &eacute;t&eacute;. D&eacute;sireux de se renforcer, le club de la capitale a boucl&eacute; une bonne dizaine d&rsquo;arriv&eacute;es. Afin d&rsquo;agrandir sa profondeur de banc, la formation parisienne s&rsquo;est attach&eacute;e les services de joueurs comme Marco Asensio, Arnau Tenas ou encore Kang-In Lee. Mais les Rouge-et-Bleu ont &eacute;galement boucl&eacute; plusieurs transferts notables.</p>\r\n<p style=\"text-align: justify;\">Le PSG a arrach&eacute; Ousmane Demb&eacute;l&eacute; au FC Barcelone contre un ch&egrave;que de 50M&euro;. Manuel Ugarte, lui, est arriv&eacute; pour 60M&euro;. Lucas Hernandez et Milan Skriniar sont venus consolider le secteur d&eacute;fensif de Luis Enrique. Et enfin, Nasser Al-Khela&iuml;fi a fini par finaliser le transfert de Randal Kolo Muani apr&egrave;s de multiples rebondissements ce vendredi. Mais le PSG a n&eacute;anmoins rat&eacute; d&rsquo;autres jolis coups sur le mercato.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<h3 style=\"text-align: justify;\"><span style=\"text-decoration: underline;\"><strong>Luis Campos a recal&eacute;... Riyad Mahrez ?</strong></span></h3>\r\n<p style=\"text-align: justify;\">D&rsquo;apr&egrave;s les informations de Foot Mercato, Riyad Mahrez figurait parmi les cibles potentielles du PSG cet &eacute;t&eacute;. Mais finalement, Luis Campos a jug&eacute; que le dossier du joueur de Manchester City &eacute;tait bien trop on&eacute;reux. L&rsquo;international alg&eacute;rien c&rsquo;est donc engag&eacute; en Arabie Saoudite. Al-Ahli a r&eacute;ussi &agrave; convaincre les Cityzens gr&acirc;ce &agrave; une offre de 35M&euro;.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>', 'September 3,2023 8:21 ', '1', 1, 199, 12),
('64f4294d512f5', 'Dossier Â« Contrat Vivendi Â» : Fally Ipupa poursuit en justice un chroniqueur pour des propos diffamatoires et outrageux', 'fally_ipupa_justice_23_jpeg_711_473_1.jpeg', '<p style=\"text-align: justify;\"><iframe title=\"YouTube video player\" src=\"https://www.youtube.com/embed/O4oal1XcHX4?si=7t7_sbgYpMWN0p0j\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe></p>\r\n<p style=\"text-align: justify;\">Le chroniqueur Gauthier Sey doit s&rsquo;expliquer le 5 septembre prochain devant le Tribunal de Paix de Kinshasa, sur ses propos &laquo; diffamatoires &raquo; &agrave; l&rsquo;endroit de l&rsquo;artiste musicien Fally Ipupa.</p>\r\n<p style=\"text-align: justify;\">L&rsquo;artiste a engag&eacute; des poursuites judiciaires contre ce professionnel de m&eacute;dia, apr&egrave;s avoir tenu des propos &laquo; diffamants et outrageux &raquo;, r&eacute;v&egrave;le Me Th&eacute;o Baya, avocat de Fally Ipupa, qui mart&egrave;lent que Gauthier Sey a tenu ses propos de mani&egrave;re r&eacute;p&eacute;t&eacute;e et t&eacute;m&eacute;raire &raquo;.</p>\r\n<p style=\"text-align: justify;\">Par ailleurs, lors d&rsquo;un d&eacute;bat t&eacute;l&eacute;vis&eacute;, le chroniqueur avait accus&eacute; l&rsquo;artiste d&rsquo;avoir menti concernant son contrat avec Vivendi pour la c&eacute;r&eacute;monie d&rsquo;ouverture des Jeux de la Francophonie.</p>\r\n<p style=\"text-align: justify;\">L&rsquo;objectif poursuivi par Fally Ipupa est celui d&rsquo;obtenir r&eacute;paration pour de tels propos tenus &agrave; son encontre.</p>', 'September 3,2023 8:35 ', '1', 5, 225, 13),
('64f5c4a7cebf7', 'Manifestation Ã  Goma : Mukwege condamne le Â« massacre Â» des manifestants et Â« exhorte Â» lâ€™Etat Ã  dÃ©crÃ©ter un deuil national', 'greve.jpg', '<p style=\"text-align: justify;\">Dans un communiqu&eacute; de presse publi&eacute; ce samedi dans la soir&eacute;e, le prix Nobel de la paix Denis Mukwege se dit &laquo; profond&eacute;ment indign&eacute; par les images choquantes du massacre dont ont &eacute;t&eacute; victimes &raquo; les manifestants du mouvement politico-religieux &laquo; La Foi Naturelle Juda&iuml;que Messianique vers les Nations &raquo; (FNJMN) &agrave; Goma le mercredi 30/08/2023.</p>\r\n<p style=\"text-align: justify;\">Dans un communiqu&eacute; de presse publi&eacute; ce samedi dans la soir&eacute;e, le prix Nobel de la paix Denis Mukwege se dit &laquo; profond&eacute;ment indign&eacute; par les images choquantes du massacre dont ont &eacute;t&eacute; victimes &raquo; les manifestants du mouvement politico-religieux &laquo; La Foi Naturelle Juda&iuml;que Messianique vers les Nations &raquo; (FNJMN) &agrave; Goma le mercredi 30/08/2023.</p>\r\n<p style=\"text-align: justify;\">Toujours dans son communiqu&eacute;, il fait observer que le &laquo; bilan est tr&egrave;s lourd : le gouvernement congolais fait &eacute;tat de 43 d&eacute;c&egrave;s et 56 bless&eacute;s. Des organisations de la soci&eacute;t&eacute; civile avancent un bilan bien plus &eacute;lev&eacute; &raquo;.</p>\r\n<p style=\"text-align: justify;\">Denis Mukwege qui condamne &laquo; fermement &raquo; la r&eacute;action meurtri&egrave;re de l&rsquo;arm&eacute;e, &eacute;voque l&rsquo;usage &laquo; disproportionn&eacute; &raquo; de la force par les FARDC.</p>\r\n<p style=\"text-align: justify;\">&laquo; <em><strong>Je condamne fermement cette barbarie perp&eacute;tr&eacute;e par des &eacute;l&eacute;ments de l&rsquo;arm&eacute;e congolaise dont la premi&egrave;re mission est pourtant de prot&eacute;ger notre population et notre territoire. Les FARDC ont fait un usage disproportionn&eacute;, inacceptable et condamnable de la force</strong></em> &raquo;, s&rsquo;indigne-t-il.</p>\r\n<p style=\"text-align: justify;\">Selon le prix Nobel, &laquo;<em><strong> cette &eacute;ni&egrave;me bavure illustre l&rsquo;urgence de mener une r&eacute;forme profonde du secteur de la s&eacute;curit&eacute; pour professionnaliser les forces de d&eacute;fense et de s&eacute;curit&eacute;</strong></em> &raquo;.</p>\r\n<p style=\"text-align: justify;\">Adressant ses &laquo; sinc&egrave;res &raquo; condol&eacute;ances aux familles des victimes, il a exprim&eacute; sa &laquo; compassion aux victimes &raquo;.</p>\r\n<p style=\"text-align: justify;\">Dans la foul&eacute;e, il exhorte le gouvernement &agrave; d&eacute;cr&eacute;ter un deuil national, veiller &agrave; ce que les victimes soient identifi&eacute;es, prendre en charge les soins des bless&eacute;s et apporter un soutien psychologique aux familles des victimes et aux membres de leur mouvement politico-religieux.</p>\r\n<p style=\"text-align: justify;\">Il appelle &eacute;galement &agrave; l&rsquo;organisation des fun&eacute;railles officielles et inhumer les victimes dans la dignit&eacute;. Denis Mukwege veut &eacute;galement qu&rsquo;une enqu&ecirc;te &laquo; ind&eacute;pendante &raquo; soit diligent&eacute;e afin que &laquo; toute la lumi&egrave;re soit faite sur cet incident tragique, et que les auteurs de ces actes ignobles soient jug&eacute;s et condamn&eacute;s conform&eacute;ment &agrave; la loi &raquo;.</p>', 'September 4,2023 13:51 ', '1', 3, 197, 14),
('64f5c5416cf46', 'Massacres de civils Ã  Goma : MoÃ¯se Katumbi dÃ©nonce Â« un crime contre lâ€™humanitÃ© Â»', 'katumbi.jpg', '<p style=\"text-align: justify;\">Dans la matin&eacute;e du mercredi 30 ao&ucirc;t &agrave; Goma, chef-lieu de la province du Nord-Kivu, des fid&egrave;les d&rsquo;une secte locale ont manifest&eacute; contre la pr&eacute;sence de la Mission onusienne (Monusco) sur le territoire congolais. Une manifestation qui a &eacute;t&eacute; r&eacute;prim&eacute;e par les Forces arm&eacute;es congolaises (FARDC).</p>\r\n<p style=\"text-align: justify;\">Une confrontation sanglante qui a caus&eacute; la mort de plus de quarante personnes dont un &eacute;l&eacute;ment des forces de l&rsquo;ordre, des bless&eacute;s et plusieurs d&eacute;g&acirc;ts mat&eacute;riels. Cet &eacute;v&eacute;nement a suscit&eacute; la r&eacute;action de plusieurs acteurs de la soci&eacute;t&eacute; civile.</p>\r\n<p style=\"text-align: justify;\">Mo&iuml;se Katumbi, opposant candidat &agrave; la pr&eacute;sidentielle de d&eacute;cembre prochain et r&eacute;fractaire au r&eacute;gime du Pr&eacute;sident F&eacute;lix Tshisekedi, n&rsquo;est pas rest&eacute; sans mots face &agrave; cette situation qu&rsquo;il qualifie directement de &laquo; crime contre l&rsquo;humanit&eacute; &raquo;.</p>\r\n<p style=\"text-align: justify;\">&laquo; Je condamne le massacre qui vient d&rsquo;avoir lieu &agrave; Goma. Les victimes &eacute;taient non arm&eacute;es. Cette tuerie est un crime contre l&rsquo;humanit&eacute; &raquo;, a d&eacute;clar&eacute; ce jeudi 31 ao&ucirc;t l&rsquo;ancien gouverneur du Katanga, bien que l&rsquo;arm&eacute;e congolaise ait indiqu&eacute; que les manifestants &eacute;taient arm&eacute;s.</p>\r\n<p style=\"text-align: justify;\">&laquo; Les images qui circulent sont insupportables car le droit &agrave; la vie est sacr&eacute;. Toutes mes condol&eacute;ances aux familles et proches des victimes &raquo;, a poursuivi le pr&eacute;sident du parti politique Ensemble pour la R&eacute;publique.</p>\r\n<p style=\"text-align: justify;\">Face &agrave; cette situation, Mo&iuml;se Katumbi a condamn&eacute; &laquo; l&rsquo;incapacit&eacute; &raquo; du gouvernement de l&rsquo;Union sacr&eacute;e de la Nation, plateforme politique du Pr&eacute;sident Tshisekedi &agrave; mettre un terme &agrave; l&rsquo;ins&eacute;curit&eacute;. &laquo; Dans tout le pays, des criminels sont en libert&eacute; &raquo;, a-t-il pest&eacute;.</p>\r\n<p style=\"text-align: justify;\">En revanche, Mo&iuml;se Katumbie exige qu&rsquo;une enqu&ecirc;te soit ouverte afin que les auteurs de ces tueries ainsi que leurs commanditaires puissent &ecirc;tre identifi&eacute;s, traduits en justice et condamn&eacute;s avec s&eacute;v&eacute;rit&eacute;. &laquo; Aucun crime ne peut rester impuni &raquo;, a-t-il martel&eacute;.</p>\r\n<p style=\"text-align: justify;\">Le bilan (non encore officiel) de cette m&eacute;saventure s&rsquo;&eacute;l&egrave;ve &agrave; une quarantaine de morts, plus de 150 bless&eacute;s sans compter les d&eacute;g&acirc;ts mat&eacute;riels. Depuis ce matin, plusieurs sources signalent une accalmie dans la grande ville Nord-kivusienne.</p>', 'September 4,2023 13:53 ', '1', 3, 222, 15);
INSERT INTO `t_articles` (`id_article`, `intitule_article`, `photo_article`, `description`, `date_ajout`, `id_user`, `id_categorie`, `vues`, `article_num`) VALUES
('64f5c62aee87c', 'Football : examens Ã  venir pour Paul Pogba de nouveau blessÃ©', 'pogba.jpg', '<p style=\"text-align: justify;\">Entr&eacute; en jeu lors de la victoire de la Juventus face &agrave; Empoli (0-2) dimanche, l&rsquo;international fran&ccedil;ais a ressenti une g&ecirc;ne &agrave; l&rsquo;arri&egrave;re d&rsquo;une cuisse.</p>\r\n<p style=\"text-align: justify;\">La s&eacute;rie noire semble se poursuivre inexorablement pour Paul Pogba. Entr&eacute; en jeu dimanche soir lors de la victoire de la Juventus &agrave; Empoli (0-2), l&rsquo;international fran&ccedil;ais semblait enfin entrevoir le bout du tunnel. Le champion du monde 2018 disputait en effet son second match de rang en championnat et semblait - enfin &ndash; ranger au rayon des mauvais souvenirs sa longue liste de blessures.</p>\r\n<p style=\"text-align: justify;\">Lanc&eacute; par Massimiliano Allegri &agrave; l&rsquo;heure de jeu, &agrave; la place de Fabio Miretti, le Fran&ccedil;ais, qui n&rsquo;avait pas &eacute;t&eacute; appel&eacute; par le s&eacute;lectionneur Didier Deschamps pour la fen&ecirc;tre internationale de septembre, semblait monter en puissance jusqu&rsquo;&agrave; ce qu&rsquo;il ressente une petite g&ecirc;ne physique en fin de match. &laquo; Pogba s&rsquo;est touch&eacute; la cuisse &agrave; la fin, il a eu un petit inconfort, a annonc&eacute; le coach italien &agrave; l&rsquo;issue de la rencontre. C&rsquo;est vraiment dommage. Mais &eacute;valuons comment il sera demain. Il est bien entr&eacute;, il a jou&eacute; des minutes de qualit&eacute;. &raquo;</p>\r\n<p style=\"text-align: justify;\">Paul Pogba qui a pass&eacute; plus de temps &agrave; l&rsquo;infirmerie que sur la pelouse (seulement 161 minutes de jeu lors de l&rsquo;exercice 2022-2023) depuis son retour &agrave; la Juve la saison derni&egrave;re en raison de multiples blessures doit passer des examens ce lundi pour estimer la gravit&eacute; de la blessure.</p>\r\n<p style=\"text-align: justify;\">Sur les r&eacute;seaux sociaux le milieu de terrain s&rsquo;est montr&eacute; tr&egrave;s &eacute;nigmatique. Il a publi&eacute; ce lundi midi des photos de lui face &agrave; Empoli o&ugrave; il appara&icirc;t tout sourire. Des clich&eacute;s accompagn&eacute;s de la phrase Fino alla fine (&laquo; Jusqu&rsquo;&agrave; la fin &raquo;).</p>', 'September 4,2023 13:57 ', '1', 1, 199, 16),
('64f5c7be86845', 'Google Cloud donne le coup d\'envoi de Next â€˜23', 'google_cloud.png', '<p>Cette semaine, Google Cloud accueille des milliers de personnes &agrave; San Francisco pour la premi&egrave;re &eacute;dition en physique, depuis 2019, de son &eacute;v&eacute;nement Google Cloud Next. Google y pr&eacute;sentera les derni&egrave;res innovations apport&eacute;es &agrave; l\'ensemble de son portefeuille de solutions d\'infrastructure, de donn&eacute;es et d\'IA, de collaboration dans Workspace et de cybers&eacute;curit&eacute;.</p>\r\n<p>La vid&eacute;o ci-dessous est la keynopte d\'ouverture de l\'&eacute;v&eacute;nement :</p>\r\n<p><iframe title=\"YouTube video player\" src=\"https://www.youtube.com/embed/lEUS3_Qjyjg?si=s1q2cN2SbbtW7Mwh\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe></p>', 'September 4,2023 14:04 ', '1', 3, 192, 17),
('64f5c8822131c', 'MbappÃ©, câ€™est du jamais-vu !', 'Mbappelotin.jpg', '<p style=\"text-align: justify;\">Kylian Mbapp&eacute; pouvait avoir le sourire, dimanche, apr&egrave;s la d&eacute;monstration de force du PSG sur la pelouse du Groupama Stadium. Car tandis que les champions de France enfon&ccedil;aient un peu plus l&rsquo;Olympique Lyonnais en venant l&rsquo;emporter 4-1 entre Rh&ocirc;ne et Sa&ocirc;ne, le Bondynois signait un nouveau doubl&eacute;, une semaine apr&egrave;s avoir d&eacute;j&agrave; inscrit deux buts dans le choc face au Racing club de Lens.</p>\r\n<p style=\"text-align: justify;\">Et malgr&eacute; son absence lors du match d&rsquo;ouverture face au FC Lorient et une entr&eacute;e en jeu en seconde p&eacute;riode, une semaine plus tard, contre Toulouse, voil&agrave; Kylian Mbapp&eacute; d&eacute;j&agrave; install&eacute; &agrave; la premi&egrave;re place du classement des buteurs. Et avec 5 buts apr&egrave;s 4 journ&eacute;es, l&rsquo;ancien Mon&eacute;gasque signe m&ecirc;me le meilleur d&eacute;but de sa saison en championnat. Un d&eacute;part canon qui permet au champion du monde tricolore d&rsquo;&eacute;tirer son incroyable s&eacute;rie.</p>', 'September 4,2023 14:07 ', '1', 1, 217, 18),
('64f5c9100ca84', 'France : une enquÃªte ouverte aprÃ¨s le dÃ©cÃ¨s par noyade du journaliste congolais Stephie Mukinzi', '1693823903.jpg', '<h3 style=\"text-align: justify;\"><strong>Le journaliste congolais Stephie Mukinzi est d&eacute;c&eacute;d&eacute; &agrave; 29 ans, par noyade, &agrave; Orl&eacute;ans (France), o&ugrave; il s&eacute;journait. La nouvelle a &eacute;t&eacute; confirm&eacute;e ce lundi 4 septembre 2023, dans la matin&eacute;e, par le m&eacute;dia Educ TV, sur ses pages des r&eacute;seaux sociaux. Une enqu&ecirc;te a &eacute;t&eacute; confi&eacute;e au commissariat de Montargis, toujours en France.</strong></h3>\r\n<p style=\"text-align: justify;\">Ce journaliste, en vacances en France, se baignait au lac de Ch&acirc;lette-sur-Loing o&ugrave; il s&rsquo;est ensuite noy&eacute;. D&rsquo;apr&egrave;s la presse locale, le dimanche 3 septembre, en fin d&rsquo;apr&egrave;s-midi, une alerte a &eacute;t&eacute; donn&eacute;e dans cette zone de baignade surveill&eacute;e. &laquo; Un t&eacute;moin a vu une main dispara&icirc;tre dans l&rsquo;eau et a imm&eacute;diatement pr&eacute;venu les ma&icirc;tres-nageurs. L&rsquo;un d&rsquo;eux a plong&eacute; pour essayer de r&eacute;cup&eacute;rer la victime, sans succ&egrave;s. &raquo;, rapporte le m&eacute;dia congolais Congo profond.&nbsp;&nbsp;</p>\r\n<p style=\"text-align: justify;\">Ce sont les pompiers qui ont ensuite pris le relais via une &eacute;quipe de plongeurs. Le corps a &eacute;t&eacute; rep&ecirc;ch&eacute; environ une demi-heure plus tard. Une enqu&ecirc;te a &eacute;t&eacute; ouverte pour d&eacute;terminer les circonstances de la mort de Stephie Mukinzi. Ce travail &eacute;t&eacute; confi&eacute; au commissariat de Montargis. Les enqu&ecirc;teurs devront &eacute;galement d&eacute;terminer si toutes les conditions de s&eacute;curit&eacute; &eacute;taient respect&eacute;es dans cette zone de baignade.</p>\r\n<p style=\"text-align: justify;\">Fondateur du site sp&eacute;cialis&eacute; &laquo; Mines.cd &raquo;, Stephie Mukinzi &eacute;tait aussi r&eacute;dacteur en chef &agrave; Politico.cd et ancien journaliste &agrave; Educ TV, la chaine de l&rsquo;&eacute;ducation en RDC.</p>', 'September 4,2023 14:09 ', '1', 3, 191, 19),
('64f5c9a247001', 'Le ministre Kabulo autorise la LINAFOOT Ã  organiser son championnat au stade Tata RaphaÃ«l', 'kabulo.png', '<h3 style=\"text-align: center;\"><em><strong>Le ministre des Sports et loisirs donne le feu vert &agrave; la LINAFOOT d&rsquo;organiser son championnat 2023-2024 au stade Tata Raphael apr&egrave;s une entrevue avec le Pr&eacute;sident du CONOR de la FECOFA.</strong></em></h3>\r\n<p style=\"text-align: justify;\">Le ministre des Sports et loisirs, Fran&ccedil;ois-Claude Kabulo muana Kabulo&nbsp; a autoris&eacute; la LINAFOOT &agrave; organiser son championnat 2023-2024 au stade Tata Raphael, &agrave; l&rsquo;issue d&rsquo;une audience qu&rsquo;il a accord&eacute;e jeudi 31 aout au Pr&eacute;sident du comit&eacute; de normalisation (CONOR) de la F&eacute;d&eacute;ration congolaise de football (FECOFA), Dieudonn&eacute; Sami.</p>\r\n<p style=\"text-align: justify;\">Ce dernier a soulign&eacute; : &laquo; Le minist&egrave;re des Sports et loisirs a obtenu du minist&egrave;re en charge des Infrastructures et travaux publics, l&rsquo;autorisation momentan&eacute;e pour le d&eacute;roulement du championnat au stade Tata Rapha&euml;l o&ugrave; se poursuivent encore les travaux de r&eacute;habilitation &raquo;.</p>\r\n<p style=\"text-align: justify;\">Certains analystes entrevoyaient d&eacute;j&agrave; un bras de fer entre le minist&egrave;re et le CONOR FECOFA au sujet de l&rsquo;organisation de ce championnat, surtout au sujet des infrastructures.</p>', 'September 4,2023 14:12 ', '1', 1, 213, 20),
('64f5ca1f83801', 'RDC : DÃ©cÃ¨s de Pierre Pay Pay, ancien gouverneur de la Banque centrale', '1693667039.jpg', '<p style=\"text-align: center;\"><em><strong>L&rsquo;ancien gouverneur de la Banque Centrale du Congo (BCC), Pierre Pay-Pay wa Syakasighe, est mort, ce samedi 2 septembre 2023, &agrave; Bruxelles (Belgique) &agrave; l&rsquo;&acirc;ge de 77 ans. Il &eacute;tait plusieurs fois ministre et d&eacute;put&eacute;.</strong></em></p>\r\n<p style=\"text-align: justify;\">Surnomm&eacute; &laquo; P3 &raquo;, Pierre Pay Pay a eu une riche carri&egrave;re politique en R&eacute;publique d&eacute;mocratique du Congo. A 33 ans, il &eacute;tait d&eacute;j&agrave; nomm&eacute; en 1980 au gouvernement du Premier ministre Andr&eacute; Bo-Boliko au poste de commissaire d&rsquo;&eacute;tat (nom donn&eacute; aux ministres du Za&iuml;re jusqu&rsquo;&agrave; la fin des ann&eacute;es 1980) &agrave; l&rsquo;&eacute;conomie nationale, &agrave; l&rsquo;industrie et au commerce ext&eacute;rieur.</p>\r\n<p style=\"text-align: justify;\">Il quitte ce poste le 5 novembre 1982 apr&egrave;s la nomination du 1er gouvernement de L&eacute;on Kengo wa Dondo.&nbsp;&nbsp;</p>\r\n<p style=\"text-align: justify;\">Dans le gouvernement Kengo, Pay Pay occupe le poste de commissaire d&rsquo;&eacute;tat au portefeuille.</p>\r\n<p style=\"text-align: justify;\">Lors du remaniement de 1983, il reprend le portefeuille de l&rsquo;&eacute;conomie nationale et du commerce ext&eacute;rieur en remplacement de Jean-Gualbert Nyembo Shabani. Il devient PDG de la G&eacute;camines commerciale en novembre 1984.&nbsp;&nbsp;</p>\r\n<p style=\"text-align: justify;\">Le 12 avril 1985, alors &acirc;g&eacute; de 38 ans, P3 est nomm&eacute; par Mobutu au poste de Gouverneur de la Banque centrale du Za&iuml;re en remplacement de Jules-Fontaine Sambwa Pinda. Il est &eacute;galement Gouverneur du Za&iuml;re aupr&egrave;s du FMI. Il appose sa signature sur la monnaie za&iuml;roise jusqu&rsquo;au 30 mars 1991, date &agrave; laquelle il est remplac&eacute; par Nyembo Shabani.&nbsp;&nbsp;</p>\r\n<p style=\"text-align: justify;\">De 1992 &agrave; 1994, P3 si&egrave;ge comme d&eacute;put&eacute; au parlement de la transition &agrave; la suite de la conf&eacute;rence nationale souveraine. Plus tard, il sera &eacute;lu d&eacute;put&eacute; puis pr&eacute;sident du bureau d&rsquo;&acirc;ge de l&rsquo;Assembl&eacute;e provinciale du Sud-Kivu.</p>', 'September 4,2023 14:14 ', '1', 3, 208, 21),
('64f5cac8e1ad7', 'Kinshasa : 40 jeunes reÃ§oivent des brevets aprÃ¨s leur formation au thÃ©Ã¢tre', '1693479667.jpg', '<p style=\"text-align: center;\"><em><strong><span style=\"text-decoration: underline;\">Des jeunes ont re&ccedil;u leurs brevets apr&egrave;s avoir particip&eacute; &agrave; une formation &agrave; l&rsquo;art de la sc&egrave;ne organis&eacute;e la Compagnie th&eacute;&acirc;tre des intrigants.</span></strong></em></p>\r\n<p style=\"text-align: justify;\">Une quarantaine de jeunes ont re&ccedil;u leurs brevets au cours d&rsquo;une c&eacute;r&eacute;monie apr&egrave;s leur formation &agrave; l&rsquo;art de la sc&egrave;ne au si&egrave;ge de la Compagnie th&eacute;&acirc;tre des intrigants (CTI) dans la commune de N&rsquo;djili &agrave; Kinshasa.</p>\r\n<p style=\"text-align: justify;\">Le directeur artistique de la CTI, Valentin Mitendo a d&eacute;clar&eacute; : &laquo;Nous avons form&eacute; des jeunes qui seront la rel&egrave;ve de demain &agrave; l&rsquo;art de la sc&egrave;ne, notamment le th&eacute;&acirc;tre. Nous voulons avoir un public qui consomme le th&eacute;&acirc;tre et aussi donner la parole &agrave; l&rsquo;enfant qui parfois &agrave; la maison, il n&rsquo;est pas en mesure de parler de ses probl&egrave;mes, &eacute;galement devant la foule&raquo;.</p>\r\n<p style=\"text-align: justify;\">La formation donn&eacute;e aux r&eacute;cipiendaires, a-t-il expliqu&eacute;, &eacute;tait divis&eacute;e en deux textes &agrave; savoir : &laquo;La terre va mal&raquo;&nbsp; et &laquo;Pourquoi pas elle ?&raquo;, avant de pr&eacute;ciser que&nbsp; &laquo;Le premier a permis &agrave; ces jeunes form&eacute;s de s&rsquo;impr&eacute;gner sur le ph&eacute;nom&egrave;ne de r&eacute;chauffement climatique et comment prot&eacute;ger l&rsquo;environnement par la gestion des ordures ainsi que la pr&eacute;servation de la nature. Et le second a conscientis&eacute; les parents &agrave; envoyer leurs enfants filles &agrave; l&rsquo;&eacute;cole, au lieu de privil&eacute;gier uniquement les gar&ccedil;ons, car tous nous avons besoin de l&rsquo;&eacute;ducation&raquo;.</p>\r\n<p style=\"text-align: justify;\">Le directeur artistique de la CTI, a en outre plaid&eacute; en faveur du soutien de ce projet, en appelant le gouvernement &agrave; travers le minist&egrave;re de la Culture &agrave; soutenir cette initiative afin de former les jeunes et les aider &agrave; s&rsquo;int&eacute;grer dans la soci&eacute;t&eacute; congolaise avant d&rsquo;inviter les parents &agrave; envoyer leurs enfants &agrave; la formation en t&eacute;moignant :&nbsp; &laquo;Nous avons chang&eacute; les comportements des artistes &agrave; travers ces formations. Ce changement les a permis &agrave; apprendre comment organiser des manifestations culturelles, jouer au th&eacute;&acirc;tre partout dans le monde et de cr&eacute;er soi-m&ecirc;me sa propre troupe th&eacute;&acirc;trale&raquo;. La prochaine session est pr&eacute;vue en octobre. D&eacute;j&agrave; 560 jeunes ont pris part &agrave; cette formation qui dure un mois.</p>', 'September 4,2023 14:17 ', '1', 4, 201, 22),
('64f5cc6eb32a9', 'Rencontre entre Poutine et Erdogan sur lâ€™accord sur lâ€™exportation des cÃ©rÃ©ales', 'poutine.jpg', '<p style=\"text-align: justify;\">Les pourparlers entre le pr&eacute;sident russe Vladimir Poutine et le pr&eacute;sident turc Recep Tayyip Erdogan ont d&eacute;but&eacute; lundi, le dirigeant turc cherchant &agrave; persuader la Russie de relancer un accord permettant &agrave; l&rsquo;Ukraine d&rsquo;exporter des c&eacute;r&eacute;ales et d&rsquo;autres produits de base &agrave; partir de trois ports de la mer Noire.</p>\r\n<p style=\"text-align: justify;\">En juillet, M. Poutine a refus&eacute; de prolonger cet accord, n&eacute;goci&eacute; par la Turquie et l&rsquo;Organisation des Nations unies un an plus t&ocirc;t.&nbsp;</p>\r\n<p style=\"text-align: justify;\">La Russie s&rsquo;est plainte qu&rsquo;un accord parall&egrave;le promettant de lever les obstacles aux exportations russes de denr&eacute;es alimentaires et d&rsquo;engrais n&rsquo;avait pas &eacute;t&eacute; respect&eacute;. Elle a d&eacute;clar&eacute; que les restrictions en mati&egrave;re de transport et d&rsquo;assurance entravaient son commerce agricole, bien qu&rsquo;elle ait exp&eacute;di&eacute; des quantit&eacute;s record de bl&eacute; depuis l&rsquo;ann&eacute;e derni&egrave;re.</p>\r\n<p style=\"text-align: justify;\">Lors de l&rsquo;ouverture des n&eacute;gociations, M. Poutine a d&eacute;clar&eacute; qu&rsquo;il &eacute;tait notamment dispos&eacute; &agrave; discuter de l&rsquo;accord sur les c&eacute;r&eacute;ales.</p>\r\n<p style=\"text-align: justify;\">L&rsquo;approvisionnement alimentaire mondial d&eacute;pend en grande partie de ces n&eacute;gociations.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Les donn&eacute;es du Centre de coordination conjoint d&rsquo;Istanbul, qui a organis&eacute; les exp&eacute;ditions ukrainiennes, montrent que 57 % des c&eacute;r&eacute;ales en provenance d&rsquo;Ukraine ont &eacute;t&eacute; achemin&eacute;es vers des pays en d&eacute;veloppement, la principale destination &eacute;tant la Chine, qui a re&ccedil;u pr&egrave;s d&rsquo;un quart des denr&eacute;es alimentaires.</p>\r\n<p style=\"text-align: justify;\">Les deux dirigeants se sont rencontr&eacute;s &agrave; Sotchi, station baln&eacute;aire russe situ&eacute;e sur la mer Noire, o&ugrave; le pr&eacute;sident russe poss&egrave;de une r&eacute;sidence.&nbsp;</p>\r\n<p style=\"text-align: justify;\">La rencontre a lieu dans un contexte marqu&eacute; par plus de 18 mois de guerre et par la r&eacute;cente contre-offensive de l&rsquo;Ukraine.</p>\r\n<p style=\"text-align: justify;\">Lundi, l&rsquo;arm&eacute;e de l&rsquo;air ukrainienne a indiqu&eacute; avoir intercept&eacute; 23 des 32 drones qui visaient les r&eacute;gions d&rsquo;Od&eacute;e et de Dnipropetrovsk, mais n&rsquo;a pas pr&eacute;cis&eacute; les dommages caus&eacute;s par les drones qui ont r&eacute;ussi &agrave; passer.</p>\r\n<p style=\"text-align: justify;\">Dimanche, le pr&eacute;sident ukrainien Volodymyr Zelensky a annonc&eacute; que le ministre de la D&eacute;fense Oleksii Reznikov serait remplac&eacute; cette semaine. Le poste exige de &laquo;nouvelles approches&raquo;, a mentionn&eacute; M. Zelensky, sans donner plus de d&eacute;tails.&nbsp;</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Lundi, M. Reznikov a publi&eacute; une photo de sa lettre de d&eacute;mission.</p>', 'September 4,2023 14:24 ', '1', 3, 255, 23),
('64f5cdfc02b07', 'Le drÃ´le de dÃ©part de Damso', 'damso.jpg', '<h3 style=\"text-align: justify;\"><em><strong>Apr&egrave;s des ann&eacute;es de succ&egrave;s, le rappeur belge a mis en sc&egrave;ne son d&eacute;part pour une nouvelle vie qui doit le conduire sur les routes du monde.</strong></em></h3>\r\n<p style=\"text-align: justify;\">Ce n&rsquo;est qu&rsquo;un au revoir. Damso a pris une d&eacute;cision radicale pour finir cet &eacute;t&eacute; 2023. Et c&rsquo;est sur sc&egrave;ne qu&rsquo;il a d&eacute;cid&eacute; de l&rsquo;annoncer en direct &agrave; son public lors du festival V&amp;B en Mayenne. Le 27 ao&ucirc;t dernier, il r&eacute;v&eacute;lait mettre sa carri&egrave;re en pause pour partir&hellip; en camping-car. &laquo; Je vais terminer sur &ccedil;a. Je vous souhaite le meilleur dans vos projets, je vais mettre Mosa&iuml;que solitaire (un de ses succ&egrave;s sortis en 2017, ndlr) et apr&egrave;s &ccedil;a je pars en camping-car (...) Merci beaucoup, on se capte en 2025 &raquo;, a-t-il conclu apr&egrave;s sa prestation. Un show haut en couleur puisqu&rsquo;il a &eacute;galement offert sa Rolex et sa cha&icirc;ne &agrave; des fans rassembl&eacute;s pour l&rsquo;occasion, en ajoutant : &laquo; Je donne tout parce que l&agrave; o&ugrave; je vais, je n\'en ai pas besoin. &raquo;</p>\r\n<h3 style=\"text-align: justify;\"><strong>Damso et son camping-car, un r&ecirc;ve de longue date</strong></h3>\r\n<p style=\"text-align: justify;\">Si la nouvelle a pu en surprendre plus d&rsquo;un, la d&eacute;cision du rappeur est tout sauf irr&eacute;fl&eacute;chie. En effet, en mars 2022 au micro du podcast de Tony Parker, il avait confi&eacute; regretter de ne pas &ecirc;tre assez pr&eacute;sent dans la vie de son fils et ne pas partager suffisamment de &laquo; moment de qualit&eacute; &raquo;. Et c&rsquo;est en 2021 qu&rsquo;il avait expliqu&eacute; son r&ecirc;ve de sillonner les routes du monde : &laquo; &Ecirc;tre dans mon camping-car, faire mon studio dedans et faire le tour du monde, c\'est mon r&ecirc;ve &raquo;, confiait-il &agrave; France Inter avant d&rsquo;ajouter que sa deadline l&rsquo;attendait en 2022. Il lui aura fallu un peu plus de temps mais Damso est enfin pr&ecirc;t &agrave; partir avec Lior, comme il l&rsquo;avait teas&eacute; sur Instagram au d&eacute;but du mois d&rsquo;ao&ucirc;t : &laquo; Je ne sais pas comment vous allez mais sachez qu\'il y a un homme qui vient de r&eacute;aliser son r&ecirc;ve. J\'ai achet&eacute; mon camping-car. &raquo;.</p>\r\n<p style=\"text-align: justify;\">Et la pause est d&eacute;sormais bien entam&eacute;e, le rappeur a finalement d&eacute;sactiv&eacute; son compte Instagram il y a deux jours. Retour estim&eacute; dans deux ans.</p>', 'September 4,2023 14:30 ', '1', 5, 285, 24),
('64f6c65250fd8', 'Fally Ipupa contre Gauthier Sey : Une affaire de diffamation qui suscite lâ€™intÃ©rÃªt du public', 'gauthiersey.JPG', '<h3 style=\"text-align: justify;\"><strong>L&rsquo;affaire opposant l&rsquo;artiste congolais Fally Ipupa au journaliste Gauthier Sey pour diffamation continue de faire parler d&rsquo;elle. Le chanteur a port&eacute; plainte contre le journaliste suite &agrave; ses d&eacute;clarations selon lesquelles Fally Ipupa serait un menteur et se livrerait &agrave; des activit&eacute;s douteuses en utilisant sa notori&eacute;t&eacute;. Une des principales all&eacute;gations de Gauthier Sey est que Fally Ipupa n&rsquo;aurait aucun contrat avec Vivendi.</strong></h3>\r\n<p style=\"text-align: justify;\">Ces accusations ont suscit&eacute; des r&eacute;actions divergentes de la part du public. Face &agrave; cela, Fally Ipupa a d&eacute;cid&eacute; de saisir la justice pour faire cesser ces all&eacute;gations diffamatoires. Cependant, l&rsquo;avocat de Gauthier Sey a &eacute;mis des r&eacute;serves quant &agrave; la plainte d&eacute;pos&eacute;e par l&rsquo;artiste congolais.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">L&rsquo;avocat du journaliste a fait remarquer qu&rsquo;aucune notification formelle concernant le lancement des proc&eacute;dures judiciaires ne leur a &eacute;t&eacute; adress&eacute;e. Selon lui, ils ont appris l&rsquo;existence de la plainte uniquement par le biais des r&eacute;seaux sociaux. Cette situation soul&egrave;ve des interrogations quant &agrave; la l&eacute;gitimit&eacute; de la plainte.</p>\r\n<p style=\"text-align: justify;\">Il est int&eacute;ressant de noter que Gauthier Sey a pris contact avec Vivendi Sport afin d&rsquo;obtenir plus d&rsquo;informations sur cette affaire. Son avocat affirme que le journaliste a envoy&eacute; une lettre &agrave; Vivendi Sport, qu&rsquo;il compte ensuite transmettre au Syndicat National des Journalistes Professionnels (SNJ) par le biais d&rsquo;un e-mail. Cette d&eacute;marche vise &agrave; rassembler des preuves pour se d&eacute;fendre devant le tribunal, au cas o&ugrave; une citation &agrave; compara&icirc;tre lui serait adress&eacute;e.</p>\r\n<p style=\"text-align: justify;\">Cette affaire de diffamation entre Fally Ipupa et Gauthier Sey continue de susciter l&rsquo;int&eacute;r&ecirc;t du public. Les prochaines &eacute;tapes de cette affaire seront d&eacute;terminantes pour &eacute;tablir la v&eacute;rit&eacute; et clarifier les all&eacute;gations port&eacute;es &agrave; l&rsquo;encontre du chanteur congolais.</p>', 'September 5,2023 8:10 ', '1', 3, 267, 25),
('65183f2b48493', 'RDC : les USA, le BrÃ©sil et la Suisse sâ€™opposent au dÃ©part Â« prÃ©cipitÃ© Â» de la Monusco', 'monusco.jpg', '<p>Le d&eacute;part de la Mission des Nations unies pour la stabilisation en RDC (Monusco) fait d&eacute;sormais couler beaucoup d&rsquo;ancres et de salives dans l&rsquo;opinion internationale. Alors que le gouvernement congolais intensifie sa d&eacute;marche pour obtenir le d&eacute;part &laquo; progressif &raquo; de la Monusco, certaines &laquo; grandes puissances &raquo; restent perplexes quant &agrave; la situation s&eacute;curitaire du pays apr&egrave;s le retrait des forces onusiennes.</p>\r\n<p>Lors de la 9427&egrave;me s&eacute;ance du Conseil de s&eacute;curit&eacute; des Nations unies, tenue jeudi 28 septembre au si&egrave;ge de ladite organisation dans la ville am&eacute;ricaine, New-York, les Etats-Unis ont ouvertement appel&eacute; la communaut&eacute; internationale &agrave; faire en sorte que le d&eacute;part de la Monusco &laquo; ne vienne pas exacerber une crise humanitaire d&eacute;j&agrave; grave &raquo;.</p>\r\n<p>Les USA ont propos&eacute; au Conseil de s&eacute;curit&eacute; de mettre en place un cadre de concertation avec les autorit&eacute;s congolaises pour &laquo; l&rsquo;efficacit&eacute; &raquo; de la Monusco. En m&ecirc;me temps, ils ont insist&eacute; sur le fait que &laquo; les choses doivent &ecirc;tre claires car la mission seule ne peut r&eacute;soudre le probl&egrave;me de l&rsquo;ins&eacute;curit&eacute; dans l&rsquo;Est du pays &raquo;.</p>\r\n<p>La Suisse, quant &agrave; elle, a lors de l&rsquo;intervention de son repr&eacute;sentant au Conseil de s&eacute;curit&eacute; des Nations unies, expliqu&eacute; que le d&eacute;part &laquo; pr&eacute;cipit&eacute; &raquo; des casques bleus pourrait entra&icirc;ner &laquo; des cons&eacute;quences n&eacute;fastes pour des milliers des personnes d&eacute;plac&eacute;es internes &raquo;.</p>\r\n<p>&laquo; La pr&eacute;sence de la Mission onusienne en R&eacute;publique d&eacute;mocratique du Congo constitue le seul rempart aussi faible qu&rsquo;il soit contre les violences et les abus des groupes arm&eacute;s &raquo;, a martel&eacute; Berne.</p>\r\n<p>Au cours de la 9427&egrave;me s&eacute;ance du Conseil de s&eacute;curit&eacute;, le Br&eacute;sil a &eacute;galement exprim&eacute; ses doutes sur le retrait des forces onusiennes. Selon lui, celui-ci peut &laquo; cr&eacute;er des vides de s&eacute;curit&eacute; et de luttes de pouvoir engendrant des violences et des atteintes aux droits de l&rsquo;Homme &raquo;.</p>\r\n<h1><span style=\"text-decoration: underline;\"><strong>&laquo; Il est illusoire et contre-productif de s&rsquo;accrocher au maintien de la Monusco &raquo;</strong></span></h1>\r\n<p>En R&eacute;publique d&eacute;mocratique du Congo, les d&eacute;nonciations relatives &agrave; l&rsquo;inefficacit&eacute; des actions sur terrain de la Monusco se sont amplifi&eacute;es depuis plusieurs mois. Dans son allocution lors de la 78&egrave;me Assembl&eacute;e g&eacute;n&eacute;rale des Nations unies, le Pr&eacute;sident Felix-Antoine Tshisekedi, a clairement signifi&eacute; qu&rsquo;apr&egrave;s plus de deux d&eacute;cennies de pr&eacute;sence de la Mission onusienne en RDC, il est temps pour le pays de prendre &laquo; pleinement son destin en main &raquo; afin de devenir le principal acteur de sa propre stabilit&eacute;.</p>\r\n<p>&laquo; Nous sommes reconnaissants pour leur soutien et leur partenariat mais nous sommes &eacute;galement conscients que le retrait progressif de la MONUSCO est une &eacute;tape n&eacute;cessaire pour consolider le progr&egrave;s que nous avons d&eacute;j&agrave; r&eacute;alis&eacute; [&hellip;] Il est a d&eacute;plor&eacute; que les missions du maintien de la paix d&eacute;ploy&eacute;es depuis 25 ans en R&eacute;publique d&eacute;mocratique du Congo n&rsquo;aient pas r&eacute;ussi &agrave; faire face aux rebellions et conflits arm&eacute;s qui d&eacute;chire ce pays, ni la r&eacute;gion des Grands Lacs, ni &agrave; prot&eacute;ger les populations civiles &raquo;, s&rsquo;&eacute;tait indign&eacute; le Chef de l&rsquo;&Eacute;tat congolais.</p>\r\n<p>Cependant, la Monusco elle-m&ecirc;me affirme r&eacute;guli&egrave;rement qu&rsquo;elle continue de mener &laquo; &agrave; bien &raquo; ses op&eacute;rations sur terrain. Face &agrave; l&rsquo;inefficacit&eacute; dont elle est accus&eacute;e, elle tente souvent de l&rsquo;expliquer soit par le manque de soutien et collaboration de la part de la population civile, ou encore par l&rsquo;opposition sur terrain venant de certains groupes arm&eacute;s.</p>\r\n<p>Lors de la pr&eacute;sentation du rapport trimestriel sur la situation s&eacute;curitaire en RDC, Bintou Keita, repr&eacute;sentante sp&eacute;ciale du secr&eacute;taire g&eacute;n&eacute;ral des Nations unies sur le sol congolais, a laiss&eacute; entendre que la Mission onusienne a augment&eacute; ses patrouilles conjointes avec les forces arm&eacute;es congolaises afin &laquo; de stabiliser la situation s&eacute;curitaire dans l&rsquo;Est du pays &raquo;.</p>\r\n<p>Plus loin dans son intervention, tout en accusant les terroristes du M23, du non-respect des r&eacute;solutions issues de la feuille de route de Luanda, la diplomate onusienne a &eacute;galement fustig&eacute; le blocage par le M23 des missions de la Mission des Nations unies en RDC, &agrave; Rumangabo, dans le territoire de Rutshuru au Nord-Kivu, pourtant ce dernier &eacute;tait choisi pour servir de site de pr&eacute;-cantonnement des &eacute;l&eacute;ments du M23.</p>\r\n<p>Pourtant, malgr&eacute; ces yeux doux, Kinshasa ne compte pas laisser les jours de la Monusco s&rsquo;allonger sur son territoire. &Agrave; l&rsquo;ONU, le 20 septembre dernier, F&eacute;lix-Antoine Tshisekedi d&eacute;clarait : &laquo; Il est donc illusoire et contre-productif de s&rsquo;accrocher au maintien de la Monusco pour restaurer la paix en R&eacute;publique d&eacute;mocratique du Congo et stabiliser celle-ci &raquo;.</p>\r\n<p>Selon lui, l&rsquo;acc&eacute;l&eacute;ration du retrait de la Monusco devient une n&eacute;cessit&eacute; imp&eacute;rieuse pour &laquo; apaiser les tensions entre cette derni&egrave;re et nos concitoyens &raquo;. Des propos qui ont &eacute;t&eacute; &eacute;galement appuy&eacute;s par Christophe Lutundula, ministre congolais des Affaires &eacute;trang&egrave;res, au cours du 9427&egrave;me s&eacute;ance du Conseil de s&eacute;curit&eacute; de l&rsquo;ONU.</p>\r\n<p>&nbsp;</p>', 'September 30,2023 17:30 ', '1', 3, 201, 26),
('6555d870e2efc', 'Peut-on contrÃ´ler l\'utilisation de ses donnÃ©es personnelles sur les rÃ©seaux sociaux ?', 'vf.png', '<p><strong>Sur Facebook ou sur Instagram, des messages interdisant aux r&eacute;seaux sociaux d\'utiliser des donn&eacute;es personnelles fleurissent. Sont-ils efficaces ?</strong></p>\r\n<p><em>Les utilisateurs de Facebook ou d\'Instagram ont d&eacute;j&agrave; vu passer un message indiquant \"je ne donne pas la permission d\'utiliser mes donn&eacute;es personnelles\". Un simple copier-coller emp&ecirc;cherait la collecte et l\'utilisation des donn&eacute;es personnelles des utilisateurs. En r&eacute;alit&eacute;, ce message ne prot&egrave;ge pas les donn&eacute;es personnelles. La CNIL, la commission nationale de l\'informatique et des libert&eacute;s, explique \"ce type de message ne garantit en rien la protection de vos cr&eacute;ations, de vos photos publi&eacute;es sur Facebook. Il ne sert donc &agrave; rien de le partager sur votre mur\".</em></p>\r\n<p><strong>Des donn&eacute;es exploit&eacute;es pour de la publicit&eacute;&nbsp;</strong></p>\r\n<p><em>Ces messages ont &eacute;merg&eacute; massivement, car le groupe am&eacute;ricain Meta a modifi&eacute; sa strat&eacute;gie commerciale. Facebook et Instagram proposent une version payante, sans publicit&eacute;. Dans la version gratuite, les donn&eacute;es seront exploit&eacute;es, notamment, pour de la publicit&eacute;, ce dont Meta ne s\'est jamais cach&eacute;. Lorsqu\'une personne cr&eacute;e son profil, elle accepte d&egrave;s l\'inscription les conditions g&eacute;n&eacute;rales d\'utilisation.&nbsp;&nbsp;</em></p>\r\n<p>&nbsp;</p>', 'November 16,2023 9:53 ', '1', 2, 143, 27),
('6555e14be99bc', 'Facebook et Instagram : vos donnÃ©es ou votre carte bancaire ?', 'th.jpeg', '<p><strong>Depuis le milieu de la semaine, en Europe, l&rsquo;acc&egrave;s &agrave; Instagram et Facebook n&eacute;cessite de faire un choix entre payer un abonnement, ou accepter de recevoir des publicit&eacute;s cibl&eacute;es, et donc de partager ses donn&eacute;es personnelles. En clair, c&rsquo;est la fin de l&rsquo;apparente gratuit&eacute; des r&eacute;seaux sociaux de Meta qui deviennent payants.</strong></p>\r\n<p style=\"text-align: justify;\"><em>L&rsquo;acc&eacute;l&eacute;ration vers un format payant &eacute;tait dans l&rsquo;air depuis quelques jours, mais personne ne s&rsquo;attendait &agrave; ce qu&rsquo;il arrive aussi vite. J&rsquo;en ai &eacute;t&eacute; le premier surpris, ce mercredi 8 novembre : en lan&ccedil;ant Instagram sur mon smartphone, j&rsquo;ai vu surgir cet &eacute;cran qui, depuis, m&rsquo;emp&ecirc;che d&rsquo;utiliser le r&eacute;seau social.</em></p>\r\n<p style=\"text-align: justify;\"><em>Une fen&ecirc;tre qui dit ceci : \"Faites un choix concernant les publicit&eacute;s. Dans le cadre de l&rsquo;&eacute;volution des lois de votre r&eacute;gion, vous pouvez maintenant choisir de continuer &agrave; utiliser les produits Meta gratuitement, en nous autorisant &agrave; utiliser vos informations pour les publicit&eacute;s, ou de vous abonner pour les utiliser sans publicit&eacute;s\".</em></p>\r\n<p style=\"text-align: justify;\"><em>En clair, Instagram et Facebook deviennent payants. Les donn&eacute;es personnelles &ndash; indispensables pour les pubs cibl&eacute;es &ndash; ou la carte bancaire : d&eacute;sormais il faut choisir ! Et l&rsquo;addition est sal&eacute;e : 9,99 euros par mois, si vous prenez l&rsquo;abonnement via un ordinateur. 12,99 euros par mois, via un mobile (Meta r&eacute;percutant la commission de 30% pr&eacute;lev&eacute;e par Apple et Google, sur leur magasin d\'applications mobiles respectif). Et tant qu&rsquo;on ne passe pas cet &eacute;cran, Instagram et Facebook restent inutilisables.</em></p>\r\n<p style=\"text-align: justify;\"><img style=\"text-align: start;\" src=\"https://www.francetvinfo.fr/pictures/C0OFGbMrm93xKDuwzVyrGPk0dEQ/0x0:1920x1080/2656x1494/filters:format(avif):quality(50)/2023/11/11/facebook-benjamin-vincent-654f408c0fe0a779521055.jpg\" alt=\"\" width=\"725\" height=\"408\" /></p>\r\n<h3 style=\"text-align: justify;\"><strong><em>Une &eacute;tape majeure pour m&eacute;ta</em></strong></h3>\r\n<p style=\"text-align: justify;\"><em>En embo&icirc;tant le pas &agrave; Elon Musk, qui a fait sauter un tabou sur le r&eacute;seau social X (ex-Twitter), apr&egrave;s des ann&eacute;es d&rsquo;impunit&eacute;, qui lui ont permis d&rsquo;exploiter les donn&eacute;es de ses &ndash; d&eacute;sormais &ndash; trois milliards d&rsquo;utilisateurs actifs chaque mois, le groupe de Mark Zuckerberg tire les cons&eacute;quences de trois &eacute;v&eacute;nements majeurs &ndash; dont deux propres &agrave; l&rsquo;Europe &ndash; qui ont profond&eacute;ment boulevers&eacute; son mod&egrave;le &eacute;conomique et ses revenus : RGPD, DSA et ATT.</em></p>\r\n<p style=\"text-align: justify;\"><em>Commen&ccedil;ons par l&rsquo;instauration du RGPD, le r&egrave;glement g&eacute;n&eacute;ral sur la protection des donn&eacute;es en 2018 : pas s&ucirc;r du tout, d&rsquo;ailleurs, que l&rsquo;initiative de Meta, avec ce choix entre abonnement et pubs cibl&eacute;es, soit conforme avec ces tarifs &eacute;lev&eacute;s, potentiellement dissuasifs.</em></p>\r\n<p style=\"text-align: justify;\"><em>Beaucoup plus r&eacute;cemment, la nouvelle r&eacute;glementation europ&eacute;enne sur les services num&eacute;riques, le fameux DSA avec son volet sur la protection de la vie priv&eacute;e. Et puis, propre &agrave; l&rsquo;iPhone, n&rsquo;oublions pas la transparence du suivi des applications (ATT pour \"App Tracking Transparency\" en anglais), cette fonction lanc&eacute;e par Apple, il y a deux ans et demi, qui a fait beaucoup de mal &agrave; Meta, en l&rsquo;emp&ecirc;chant de continuer &agrave; collecter les donn&eacute;es personnelles, sans l&rsquo;accord de l&rsquo;utilisateur.</em></p>\r\n<p><strong>De 119 &agrave; 251 euros par an</strong></p>\r\n<p>Aujourd&rsquo;hui, il faut donc choisir entre accepter d&rsquo;&ecirc;tre le produit &ndash; au sens marketing &ndash; en optant pour la gratuit&eacute;, ou devenir le client de Meta en payant. Et les tarifs vont augmenter le 1er mars prochain, si vous utilisez &agrave; la fois Facebook et Instagram : ils passeront de 9,99 &agrave; 15,99 euros (6 euros de plus par compte suppl&eacute;mentaire) sur ordinateur, et de 12,99 &agrave; 20,99 euros par mois (8 euros de plus) sur smartphone, soit jusqu&rsquo;&agrave; 251,88 euros par an &agrave; payer, pour continuer &agrave; utiliser Instagram et Facebook, sans publicit&eacute;s, et a priori, sans partager vos donn&eacute;es.</p>\r\n<p>En Europe, ces donn&eacute;es font gagner, en moyenne, 72 euros par utilisateur, et par an, &agrave; Meta. Chaque abonn&eacute; lui rapportera donc 180 euros de plus par an (119 euros net en plus par an, une fois d&eacute;duite la commission d\'Apple et Google).</p>\r\n<p>&nbsp;</p>', 'November 16,2023 10:30 ', '1', 2, 173, 28),
('6555e4e85fbbf', 'Chine : le chÃ´mage des jeunes explose', 'chine.png', '<p><strong>En Chine, le ch&ocirc;mage des jeunes explose. Selon les derniers chiffres officiels, un sur cinq n&rsquo;aurait pas de travail. Alors, certains jeunes dipl&ocirc;m&eacute;s se reconvertissent.</strong></p>\r\n<p>En Chine, depuis l&rsquo;&eacute;t&eacute;, les salons de l&rsquo;emploi sont pris d&rsquo;assaut par des milliers de jeunes dipl&ocirc;m&eacute;s, mais il y a peu d&rsquo;offres et beaucoup de demandes. \"C&rsquo;est tellement difficile de trouver un emploi cette ann&eacute;e\", d&eacute;plore un jeune homme. L&rsquo;&eacute;conomie au ralenti ne cr&eacute;e plus assez d&rsquo;emplois. Selon les derniers chiffres officiels, un jeune sur cinq n&rsquo;a pas de travail. Un dipl&ocirc;m&eacute; en sciences politiques propose dans la rue, contre r&eacute;mun&eacute;ration, de partager ses connaissances. D&rsquo;autres restent au lit.</p>\r\n<p><strong>Des reconversions</strong></p>\r\n<p><em>Rester coucher, la nouvelle tendance d&rsquo;une jeunesse dipl&ocirc;m&eacute;e, sans espoir. S&rsquo;il n&rsquo;y a pas de travail ou des emplois mal pay&eacute;s, autant ne rien faire. Depuis juillet, les autorit&eacute;s ne donnent plus le nombre de ch&ocirc;meurs entre 16 et 24 ans. Face au ch&ocirc;mage, de nombreux Chinois d&eacute;cident de changer de voie. &Agrave; P&eacute;kin, on apprend un nouveau m&eacute;tier de service, rangeuse de v&ecirc;tements pour clients fortun&eacute;s. Si la situation des jeunes dipl&ocirc;m&eacute;s est mauvaise, elle n&rsquo;est pas meilleure pour les moins qualifi&eacute;s. Dans les rues de la ville de Kunming, on recrute &agrave; la journ&eacute;e.</em></p>', 'November 16,2023 10:46 ', '1', 3, 186, 29),
('6555f3645b03c', 'Votre compte Google risque-t-il dâ€™Ãªtre supprimÃ© le 1er dÃ©cembre ?', 'fermeture-compte-google.jpg', '<p><strong>Google fait le m&eacute;nage dans les anciens comptes inactifs depuis au moins deux ans. Pour &eacute;viter les mauvaises surprises et rapatrier les documents, e-mails et autres photos qui sont stock&eacute;s sur ces vieux comptes, voici la marche &agrave; suivre.&nbsp;</strong></p>\r\n<blockquote>\r\n<p style=\"text-align: left;\">&Agrave; compter du 1er d&eacute;cembre 2023, Google pourra suspendre et vider de ses donn&eacute;es tout <span style=\"text-decoration: underline;\">compte inactif</span>. On parle de comptes qui n\'ont pas &eacute;t&eacute; utilis&eacute;s depuis au moins deux ans. Si vous &ecirc;tes dans ce cas, et que vous d&eacute;sirez conserver votre compte, d&eacute;couvrez comment faire.</p>\r\n<p style=\"text-align: left;\">Google s\'engage &agrave; supprimer tout le contenu des comptes en question, des e-mails aux photos en passant par les diff&eacute;rents documents cr&eacute;&eacute;s et stock&eacute;s sur la plateforme. Si vous avez laiss&eacute; en plan un ancien compte mais que vous ne souhaitez pas voir dispara&icirc;tre d&eacute;finitivement ce qu\'il contient, voici la marche &agrave; suivre.</p>\r\n</blockquote>\r\n<p style=\"text-align: left;\"><strong>Comment r&eacute;activer un vieux compte Google</strong></p>\r\n<p style=\"text-align: left;\"><strong><img src=\"https://cdn.futura-sciences.com/cdn-cgi/image/width=1920,quality=50,format=auto/sources/images/fermeture-compte-google.jpg\" alt=\"\" width=\"800\" height=\"533\" /></strong></p>\r\n<p>Pour &laquo; r&eacute;activer &raquo; un compte, il suffit de s\'y connecter une fois, sans action particuli&egrave;re. De toute mani&egrave;re, le simple fait d\'effectuer une recherche sur Google, de lire un <strong>e-mail</strong>, de consulter YouTube ou le Drive, mais aussi de t&eacute;l&eacute;charger une application mobile depuis ce compte suffit &agrave; le rendre actif. Dans tous les cas, Google s\'engage &agrave; envoyer plusieurs <strong>notifications </strong>avant de supprimer le compte, y compris &agrave; une adresse de r&eacute;cup&eacute;ration si elle a &eacute;t&eacute; signal&eacute;e.</p>\r\n<p>&Agrave; noter que cette mesure ne s\'applique qu\'aux<strong> comptes personnels</strong>, pas &agrave; ceux li&eacute;s &agrave; un employeur, &agrave; une &eacute;cole ou &agrave; une quelconque organisation. Ne sont pas non plus concern&eacute;s tous ceux qui poss&egrave;dent un compte payant Google One.</p>\r\n<p><strong>Google Takeout pour &eacute;viter les mauvaises surprises</strong></p>\r\n<p>Vous l\'aurez donc compris, pour &eacute;viter toute mauvaise surprise dans les semaines &agrave; venir, il est vivement conseill&eacute; de se connecter &agrave; ses vieux comptes, parfois oubli&eacute;s. Et si vous y trouvez des documents plus ou moins pr&eacute;cieux, sachez que vous pouvez les rapatrier vers votre compte principal en vous rendant sur Google Takeout. S&eacute;lectionnez alors toutes vos donn&eacute;es &agrave; t&eacute;l&eacute;charger puis recopiez-les service par service sur votre autre compte. Vous n\'aurez alors plus &agrave; vous soucier du maintien ou non de votre ancien compte.</p>\r\n<h2 id=\"comment-reactiver-un-vieux-compte-google\" style=\"outline: none; box-sizing: border-box; -webkit-font-smoothing: antialiased; margin: 2rem 0px; padding: 0px; border: 0px; vertical-align: baseline; font-size: 24px; font-family: Merriweather, MerriFallback, serif; line-height: 33px; scroll-margin-top: 8rem; background-color: #ffffff;\"></h2>', 'November 16,2023 11:48 ', '1', 2, 187, 30),
('6555f4c653319', 'Kinshasa : la chanson collective Â«Rumba ForeverÂ» prÃ©sentÃ©e au public', 'rumba.jpeg', '<p><strong>Kinshasa, 16 novembre 2023 (ACP).- La nouvelle chanson &laquo;Rumba Forever &raquo; r&eacute;alis&eacute;e avec la participation d&rsquo;une dizaine des stars de renomm&eacute;e a &eacute;t&eacute; pr&eacute;sent&eacute;e au public lors d&rsquo;une conf&eacute;rence de presse organis&eacute;e mercredi dans un centre culturel de la Gombe, au Nord de Kinshasa, en R&eacute;publique d&eacute;mocratique du Congo.</strong></p>\r\n<p>&laquo;Rumba Forever est un projet qui a r&eacute;uni les grands noms de la sc&egrave;ne musicale de notre pays. Il s&rsquo;agit d&rsquo;un ambitieux programme jamais mis sur les fonts baptismaux en RDC qui porte sur une musique devenue l&rsquo;identit&eacute; d&rsquo;un peuple. C&rsquo;est un projet d&rsquo;amour pour la culture, exprim&eacute; dans la promotion musicale et le vivre ensemble &raquo;, a d&eacute;clar&eacute; Amadou Diaby, initiateur du projet. Et d&rsquo;ajouter que : &laquo;C&rsquo;est ainsi que la vision de la &lsquo;&lsquo;Rumba Forever prend sa place dans l&rsquo;ardent d&eacute;sir de r&eacute;unir toutes les stars autour d&rsquo;un seul et unique id&eacute;al de p&eacute;renniser la Rumba qui est devenue patrimoine culturel immat&eacute;riel de l&rsquo;humanit&eacute; &raquo;. Pour l&rsquo;initiateur du projet, cette &oelig;uvre collective est une nouvelle r&eacute;conciliation avec l&rsquo;histoire. Car toutes les vedettes de diff&eacute;rentes g&eacute;n&eacute;rations chantent un m&ecirc;me refrain en polyphonie pour cimenter la Rumba au monde culturel. &laquo;C&rsquo;est l&rsquo;image d&rsquo;un jardin symphonique aux couleurs uniques que viennent admirer des m&eacute;lomanes. Les paroles de la chanson, l&rsquo;arrangement, les ch&oelig;urs, les couplets en solos sont puis&eacute;s du rythme originel avec une particularit&eacute; tonique de chaque artiste &raquo;, a soutenu Amadou Diaby.</p>\r\n<p>Recettes destin&eacute;es aux femmes victimes des violences sexuelles</p>\r\n<p>&nbsp;</p>\r\n<p>Il a fait savoir que la recette de cette production musicale est destin&eacute;e aux femmes victimes des violences sexuelles &agrave; l&rsquo;Est de la R&eacute;publique D&eacute;mocratique du Congo. &laquo; Nous allons travailler avec les responsables du Fonds national de r&eacute;paration des victimes des violences sexuelles li&eacute;es aux conflits (FONAREV). J&rsquo;ai toujours plac&eacute; l&rsquo;&ecirc;tre humain au centre de tout. Vous vous souvenez que j&rsquo;avais annonc&eacute; qu&rsquo;une bonne partie des recettes du concert de Wenge au stade des Martyrs sera donn&eacute;e aux femmes et orphelins de nos vaillants militaires des FARDC &raquo;. a-t-il dit.</p>\r\n<p>&nbsp;</p>\r\n<p>Apr&egrave;s le lancement de la chanson sur le march&eacute; du disque, le producteur annonce la mise en place du festival Rumba Forever qui sera organis&eacute; l&rsquo;ann&eacute;e prochaine &agrave; Kinshasa. Il sied de retenir que la direction artistique de cette &oelig;uvre a &eacute;t&eacute; assur&eacute;e par Souzy Kaseya, un des g&eacute;nies arrangeurs des musiques dans l&rsquo;histoire de la Rumba. Il est &eacute;galement auteur &ndash;compositeur de la chanson &lsquo;&lsquo;Rumba Forever&rsquo;&rsquo; qui a &eacute;t&eacute; enregistr&eacute;e &agrave; Kinshasa. Il a salu&eacute; la participation des chanteurs qui ont port&eacute; le projet et contribu&eacute; &agrave; la r&eacute;alisation de cette aubade musicale. &laquo;J&rsquo;ai &eacute;t&eacute; h&eacute;sitant lorsque l&rsquo;initiateur m&rsquo;a int&eacute;ress&eacute; sur le projet vu l&rsquo;ingratitude que j&rsquo;ai subi dans l&rsquo;histoire de la musique congolaise. Mais, apr&egrave;s avoir r&eacute;fl&eacute;chi et compris que la Rumba est non seulement ma valeur ou mon identit&eacute; mais une partie de ma vie. C&rsquo;est ainsi que je me suis investie personnellement dans l&rsquo;&eacute;tude des sons, des rythmes, des m&eacute;lodies, des notes, des textes et des paroles pour impacter toute l&rsquo;histoire. &Eacute;videmment, chacun a apport&eacute; sa pierre &agrave; l&rsquo;&eacute;difice avec amour et professionnalisme &raquo;, s&rsquo;est r&eacute;joui Maestro Souzy Kaseya. Et de poursuivre : &laquo;La symbiose de l&rsquo;arrangement musical avec les successions du chant exprime la vision de l&rsquo;intemporalit&eacute; pendant que les instruments sont dans un dialogue entre guitares, cuivres, batteries et bridges. Donc c&rsquo;est vraiment une chanson qui a &eacute;t&eacute; travaill&eacute;e dans les meilleures conditions possibles. La semaine prochaine, nous allons nous concentrer sur le tournage du clip vid&eacute;o de Rumba Forever&raquo;. Par ailleurs, le Repr&eacute;sentant de l&rsquo;UNESCO a salu&eacute; cette initiative qui s&rsquo;inscrit dans le cadre de la promotion et la valorisation de cette Rumba qui traverse tous les &acirc;ges. &laquo;Aujourd&rsquo;hui, la Rumba congolaise n&rsquo;est pas seulement un patrimoine du Congo mais de toute l&rsquo;humanit&eacute; enti&egrave;re. C&rsquo;est une fiert&eacute; parce que cette musique a conquis les c&oelig;urs de beaucoup de gens dans le monde entier depuis des d&eacute;cennies &raquo;, a-t-il indiqu&eacute;. Et de conclure : &laquo; La reconnaissance par l&rsquo;Unesco de notre part comme patrimoine immat&eacute;riel de l&rsquo;humanit&eacute; n&rsquo;est pas seulement une distraction. C&rsquo;est aussi un appel &agrave; l&rsquo;action&hellip; Car cette reconnaissance t&eacute;moigne la responsabilit&eacute; partag&eacute;e dans sa protection et sa promotion, garantissant ainsi l&rsquo;h&eacute;ritage pour les g&eacute;n&eacute;rations futures. Il est un devoir pour l&rsquo;Afrique de prot&eacute;ger la rumba congolaise&raquo;. ACP/</p>', 'November 16,2023 11:53 ', '1', 5, 560, 31),
('65891a081f60d', 'CommuniquÃ© concernant les Ã©vÃ¨nements festifs de fin d\'annÃ©e', 'Screenshot 2023-12-25 080708.jpg', '<p>Chers clients,</p>\r\n<p>Le meilleur est &agrave; venir.</p>\r\n<p>Nous vous remercions pour cette ann&eacute;e pass&eacute;e &agrave; travailler ensemble.&nbsp;</p>\r\n<p>Veuillez noter que nos bureaux seront ferm&eacute;s jusqu\'au 8 janvier 2024. Nous sommes impatients de vous servir &agrave; nouveau &agrave; notre retour.</p>\r\n<p>Toute l\'&eacute;quipe Aurora vous pr&eacute;sente ses meilleurs voeux.</p>\r\n<p>Cordialement, <strong>AURORA RDC</strong></p>', 'December 25,2023 6:58 ', '1', 7, 488, 32),
('658d2701b851a', 'AURORA RDC souhaite une bonne annÃ©e 2024 Ã  sa clientÃ¨le', 'souhait.jpg', '<h1><strong>Bonne ann&eacute;e &agrave; notre client&egrave;le!&nbsp;</strong></h1>\r\n<p>Nous vous souhaitons une ann&eacute;e <strong>2024 </strong>remplie de <strong>succ&egrave;s</strong>, de <strong>prosp&eacute;rit&eacute; </strong>et de <strong>bonheur</strong>.&nbsp;</p>\r\n<p>Nous sommes reconnaissants de votre <strong>confiance </strong>en notre entreprise et nous nous engageons &agrave; continuer de vous <strong>offrir des services de qualit&eacute; sup&eacute;rieure.</strong>&nbsp;</p>\r\n<p>Merci de votre <strong>fid&eacute;lit&eacute; </strong>et de votre <strong>soutien</strong>.</p>\r\n<p>Nous esp&eacute;rons que cette nouvelle ann&eacute;e vous apportera de <strong>nouvelles opportunit&eacute;s et de nouveaux d&eacute;fis &agrave; relever.</strong>&nbsp;</p>\r\n<p>Nous sommes impatients de travailler avec vous en 2024 et au-del&agrave;. ðŸŽ‰ðŸŽ‰ðŸŽ‰</p>', 'December 28,2023 8:42 ', '1', 7, 497, 35);

-- --------------------------------------------------------

--
-- Table structure for table `t_avances`
--

CREATE TABLE `t_avances` (
  `Id` int(11) NOT NULL,
  `Noms` text CHARACTER SET latin1 NOT NULL,
  `Fonction` text CHARACTER SET latin1 NOT NULL,
  `Montant` float NOT NULL,
  `Mois` text CHARACTER SET latin1 NOT NULL,
  `Annee` text CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_avances`
--

INSERT INTO `t_avances` (`Id`, `Noms`, `Fonction`, `Montant`, `Mois`, `Annee`) VALUES
(1, 'Kevin Kena', 'Chef de departement', 278.7, 'Janvier', '2022'),
(2, 'Landry Kena Mpiana', 'Developpeur', 1000, 'Janvier', '2022');

-- --------------------------------------------------------

--
-- Table structure for table `t_avancess`
--

CREATE TABLE `t_avancess` (
  `Id` int(11) NOT NULL,
  `Taux` float NOT NULL,
  `Description` text CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_avancess`
--

INSERT INTO `t_avancess` (`Id`, `Taux`, `Description`) VALUES
(1, 30, 'Ce taux est utilise lors de la demande d\'une avance');

-- --------------------------------------------------------

--
-- Table structure for table `t_blog`
--

CREATE TABLE `t_blog` (
  `id` int(11) NOT NULL,
  `idDestinataire` int(11) NOT NULL,
  `messages` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `heureEnvoie` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_blog`
--

INSERT INTO `t_blog` (`id`, `idDestinataire`, `messages`, `heureEnvoie`) VALUES
(1, 1, 'Hey', 'February 1, 2023, 2:02 pm'),
(2, 17, 'hey<br />\r\n', 'January 3, 2024, 7:56 am'),
(3, 19, 'Bonjour chers tous ', 'March 9, 2024, 8:03 am');

-- --------------------------------------------------------

--
-- Table structure for table `t_calcul`
--

CREATE TABLE `t_calcul` (
  `Id` int(11) NOT NULL,
  `Organisation` text CHARACTER SET utf8 NOT NULL,
  `CodeSecret` text CHARACTER SET utf8 NOT NULL,
  `Logo` text CHARACTER SET utf8 NOT NULL,
  `Details` text CHARACTER SET utf8 NOT NULL,
  `Commentaires` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_calcul`
--

INSERT INTO `t_calcul` (`Id`, `Organisation`, `CodeSecret`, `Logo`, `Details`, `Commentaires`) VALUES
(1, 'AURORA - RDC', 'e10adc3949ba59abbe56e057f20f883e', 'AURORA', 'AURORA', 'AURORA'),
(2, 'Tufaulu Pamoja', '827ccb0eea8a706c4c34a16891f84e7b', 'Cafod', 'Cafod', 'Cette section nous aide Ã  organiser nos calculs');

-- --------------------------------------------------------

--
-- Table structure for table `t_cal_parametre`
--

CREATE TABLE `t_cal_parametre` (
  `Id` int(11) NOT NULL,
  `IdOrg` int(11) NOT NULL,
  `TauxChange` float NOT NULL,
  `TauxCNSSOuv` float NOT NULL,
  `TauxCNSSEmp` float NOT NULL,
  `AllLogement` float NOT NULL,
  `AllFamiliale` float NOT NULL,
  `AllTransport` float NOT NULL,
  `AllDelocalisation` float NOT NULL,
  `ReductionEnfant` float NOT NULL,
  `JourTravail` float NOT NULL,
  `Onem` float NOT NULL,
  `INPP` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_cal_parametre`
--

INSERT INTO `t_cal_parametre` (`Id`, `IdOrg`, `TauxChange`, `TauxCNSSOuv`, `TauxCNSSEmp`, `AllLogement`, `AllFamiliale`, `AllTransport`, `AllDelocalisation`, `ReductionEnfant`, `JourTravail`, `Onem`, `INPP`) VALUES
(1, 1, 2785.38, 5, 13, 30, 0, 1.5, 0, 2, 22, 0.02, 0.03),
(2, 2, 2012.99, 5, 13, 30, 0, 2, 0, 2, 26, 0.02, 3);

-- --------------------------------------------------------

--
-- Table structure for table `t_canal`
--

CREATE TABLE `t_canal` (
  `IdCanal` int(11) NOT NULL,
  `NomCanal` text CHARACTER SET utf8mb4 NOT NULL,
  `IdProjet` int(11) NOT NULL,
  `NomProjet` text CHARACTER SET utf8mb4 NOT NULL,
  `IdUser` int(11) NOT NULL,
  `NomsUser` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `IdTache` int(11) NOT NULL,
  `NomTache` text CHARACTER SET utf8mb4 NOT NULL,
  `NomManager` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `EtapeProjet` varchar(50) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_canalt`
--

CREATE TABLE `t_canalt` (
  `IdCanal` int(11) NOT NULL,
  `NomCanal` text CHARACTER SET utf8mb4 NOT NULL,
  `IdProjet` int(11) NOT NULL,
  `NomProjet` text CHARACTER SET utf8mb4 NOT NULL,
  `IdManager` int(11) NOT NULL,
  `NomsManager` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `DateE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_canaltache`
--

CREATE TABLE `t_canaltache` (
  `Id` int(11) NOT NULL,
  `IdTache` int(11) NOT NULL,
  `NomTache` text CHARACTER SET utf8mb4 NOT NULL,
  `IdRedacteur` int(11) NOT NULL,
  `NomRedacteur` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `DateEnr` date NOT NULL,
  `Texte` text CHARACTER SET utf8mb4 NOT NULL,
  `EtapeProjet` varchar(50) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_categorie`
--

CREATE TABLE `t_categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom_categorie` varchar(255) CHARACTER SET latin1 NOT NULL,
  `description_categorie` text CHARACTER SET latin1 NOT NULL,
  `date_creation` varchar(40) CHARACTER SET latin1 NOT NULL,
  `id_user` varchar(255) CHARACTER SET latin1 NOT NULL,
  `couleur` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_categorie`
--

INSERT INTO `t_categorie` (`id_categorie`, `nom_categorie`, `description_categorie`, `date_creation`, `id_user`, `couleur`) VALUES
(1, 'Sport', 'Cette catÃ©gorie va concerner les articles parlant de sport uniquement', '02-09-2023 13:44:58', '1', '#20d97a'),
(2, 'Technologie', 'Cette catÃ©gorie parlera uniquement de la technologie', '05-11-2023 14:55:21', '1', '#eb4d3d'),
(3, 'ActualitÃ©', 'Cette cqtÃ©gorie concernera les actualitÃ©s', '12-08-2024 10:37:20', '1', '#007bff'),
(4, 'Culture', 'Cette catÃ©gorie va concerner la culture', '03-09-2023 10:45:54', '1', '#ff00d0'),
(5, 'Musique', 'Cette catÃ©gorie concernera l\'actualitÃ© musicale', '15-09-2023 16:10:52', '1', '#563d00'),
(6, 'Divertissement ', 'Cette catÃ©gorie va concerner le divertissement ', '05-09-2023 03:18:44', '1', '#333333'),
(7, 'CommuniquÃ© AURORA', 'Cette catÃ©gorie va comprendre toutes les communications de AURORA RDC envers ses clients', '25-12-2023 06:55:19', '1', '#ffbb00'),
(8, 'Films', 'Cette catÃ©gorie ne concernera que les films', '12-08-2024 10:38:14', '1', '#bff056');

-- --------------------------------------------------------

--
-- Table structure for table `t_categorie_equipe`
--

CREATE TABLE `t_categorie_equipe` (
  `id_cat_equipe` int(11) NOT NULL,
  `nom_cat_equipe` varchar(255) CHARACTER SET latin1 NOT NULL,
  `description_cat_equipe` text CHARACTER SET latin1 NOT NULL,
  `date` varchar(50) CHARACTER SET latin1 NOT NULL,
  `id_user_aj` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_categorie_equipe`
--

INSERT INTO `t_categorie_equipe` (`id_cat_equipe`, `nom_cat_equipe`, `description_cat_equipe`, `date`, `id_user_aj`) VALUES
(1, 'DÃ©veloppeur web', 'Cette catÃ©gorie concerne nos dÃ©veloppeurs', '02-09-2023 14:26:07', '1'),
(2, 'Designer', 'Cette catÃ©gorie va concerner les designers', '02-09-2023 14:30:42', '1'),
(3, 'RÃ©ceptionniste', 'Cette catÃ©gorie va concerner les gens chargÃ©s de la rÃ©ception', '04-09-2023 13:44:43', '1'),
(4, 'Marketing et Communication', 'S\'occuper de la communication et du marketing', '09-09-2023 13:51:57', '20');

-- --------------------------------------------------------

--
-- Table structure for table `t_chatpanel`
--

CREATE TABLE `t_chatpanel` (
  `Id` int(11) NOT NULL,
  `idPanel` int(11) NOT NULL,
  `idEnvoyeur` int(11) NOT NULL,
  `messages` text CHARACTER SET latin1 NOT NULL,
  `heureEnvoie` text CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_chatpanel`
--

INSERT INTO `t_chatpanel` (`Id`, `idPanel`, `idEnvoyeur`, `messages`, `heureEnvoie`) VALUES
(1, 1, 28, 'Salut', '24-04-03 16:43:22'),
(2, 1, 1, 'Ca va?', '24-04-03 16:43:36'),
(3, 1, 28, 'Oui ca va et toi?', '24-04-03 16:46:19'),
(4, 1, 1, 'Moi aussi ca va...<br />\r\nCa fait longtemps', '24-04-03 16:46:35'),
(5, 1, 1, 'Moi aussi ca va...<br />\r\nCa fait longtemps', '24-04-03 16:46:41'),
(6, 1, 28, 'Ouais grave...T\'as pas idÃ©e', '24-04-03 16:46:59'),
(7, 1, 1, 'Quelle sont les nouvelles?', '24-04-03 16:47:13'),
(8, 1, 28, 'Pas grand chose de mon cÃ´te et chez toi?', '24-04-03 16:47:42'),
(9, 1, 1, 'Nous sommes lÃ , Dieu fait grÃ¢ce', '24-04-03 16:48:09'),
(10, 1, 28, 'D\'accord', '24-04-03 16:48:35'),
(11, 1, 1, 'Salut', '24-04-05 07:34:09'),
(12, 2, 1, 'Salut', '24-06-08 13:52:03'),
(13, 2, 19, 'Bonjour Landry', '24-06-08 13:53:12'),
(14, 4, 17, 'Bonjour, priÃ¨re faire parti du panel de recrutement d\'un stagiaire', '24-10-12 11:37:05'),
(15, 4, 19, 'D\'accord, Papa Rodrigue, nous attendons la validation des autres. Car nous devons Ãªtre au moins 3 personnes. ', '24-10-12 12:00:48'),
(16, 4, 1, 'Vous pouvez juste appuyer sur publier l\'offre vous aurez la possibilitÃ© de continuer avec le reste', '24-10-13 14:03:39'),
(17, 6, 17, 'PriÃ¨re prendre part au panel pour le recrutement des stagiaires', '24-11-12 11:50:44'),
(18, 6, 19, 'Bien recu, merci beaucoup', '24-11-14 14:47:33');

-- --------------------------------------------------------

--
-- Table structure for table `t_comment`
--

CREATE TABLE `t_comment` (
  `Id` int(11) NOT NULL,
  `Noms` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Message` text CHARACTER SET latin1 NOT NULL,
  `Date` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Departement` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_comment`
--

INSERT INTO `t_comment` (`Id`, `Noms`, `Email`, `Message`, `Date`, `Departement`) VALUES
(1, 'Landry Kena Mpiana', 'landrykena2018@gmail.com', 'Merci', '22-04-18 19:56:39 pm', 'Technologie'),
(2, 'Rodrigue Wabo', 'rodwabo@aurorardc.com', 'Merci pour ces details', '22-04-18 20:23:07 pm', 'Technologie'),
(3, 'Bertin', 'bertin@gmail.com', 'IntÃ©ressant ', '22-04-19 07:05:45 am', 'Technologie'),
(4, 'Landry ', 'landrykena2030@gmail.com', 'Hey', '22-05-06 00:12:05 am', 'Services'),
(5, 'Landry ', 'landrykena2030@gmail.com', 'Hey', '22-05-06 00:12:55 am', 'Services'),
(6, 'Didier ZIBIKA', 'ngaboyekadidier@gmail.com', 'Bonjour\r\nVoilÃ  une belle initiative pour promouvoir les talents des jeunes congolais!\r\nNous disons courage encore et encore', '23-03-08 07:26:36 am', 'Services');

-- --------------------------------------------------------

--
-- Table structure for table `t_commentaires`
--

CREATE TABLE `t_commentaires` (
  `Id` int(11) NOT NULL,
  `idPanel` int(11) NOT NULL,
  `idAgent` int(11) NOT NULL,
  `commentaires` text CHARACTER SET latin1 NOT NULL,
  `timeEnv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_commentaires`
--

INSERT INTO `t_commentaires` (`Id`, `idPanel`, `idAgent`, `commentaires`, `timeEnv`) VALUES
(1, 2, 17, 'Oui, le poste est intÃ©ressant. NÃ©anmoins, priÃ¨re ajouter les tÃ¢ches inhÃ©rentes Ã  un chauffeur comme fairel la propretÃ© du vÃ©hicule et d\'autres petites tÃ¢ches d\'appui Ã  la logistique.', 1658646420),
(2, 1, 22, 'fedyhsdfwafw', 1663495781);

-- --------------------------------------------------------

--
-- Table structure for table `t_comptabilaninitial`
--

CREATE TABLE `t_comptabilaninitial` (
  `id` int(11) NOT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `montant` double NOT NULL,
  `DateEnreg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_comptabilaninitial`
--

INSERT INTO `t_comptabilaninitial` (`id`, `code`, `montant`, `DateEnreg`) VALUES
(4, '3112', 0, '2022-11-11 09:41:35'),
(5, '3130', 0, '2022-11-11 09:43:19'),
(6, '3132', 0, '2022-11-11 09:45:30'),
(7, '3145', 0, '2022-11-11 09:47:49'),
(8, '3147', 0, '2022-11-11 09:49:40'),
(9, '3150', 0, '2022-11-11 09:50:52'),
(10, '3154', 0, '2022-11-11 09:52:09'),
(11, '3160', 0, '2022-11-11 09:54:19'),
(12, '3170', 0, '2022-11-11 09:55:58'),
(13, '3180', 0, '2022-11-11 10:01:15'),
(14, '3185', 0, '2022-11-11 10:04:25'),
(15, '3190', 0, '2022-11-11 10:05:24'),
(16, '3210', 0, '2022-11-11 10:07:42'),
(17, '3215', 0, '2022-11-11 10:12:20'),
(18, '3240', 0, '2022-11-11 10:14:02'),
(19, '3255', 0, '2022-11-11 10:15:12'),
(20, '3260', 0, '2022-11-11 10:16:11'),
(21, '3310', 0, '2022-11-11 10:17:14'),
(22, '3320', 0, '2022-11-11 10:18:17'),
(23, '3325', 0, '2022-11-11 10:22:17'),
(24, '3330', 0, '2022-11-11 10:23:18'),
(25, '3340', 0, '2022-11-11 10:24:35'),
(26, '3360', 0, '2022-11-11 10:28:21'),
(27, '2141', 70000, '2022-11-11 12:37:46'),
(28, '3381', 0, '2022-11-11 12:42:51'),
(29, '3383', 0, '2022-11-11 13:24:29'),
(30, '3440', 0, '2022-11-11 13:25:17'),
(31, '3217', 0, '2022-11-14 07:37:18'),
(32, '3230', 0, '2022-11-14 07:39:40'),
(33, '3231', 0, '2022-11-14 07:41:18'),
(34, '3233', 0, '2022-11-14 07:42:41'),
(35, '3439', 0, '2022-11-16 07:11:09'),
(36, '3350', 0, '2022-11-16 07:12:14'),
(37, '3351', 0, '2022-11-16 07:14:13'),
(38, '3352', 0, '2022-11-16 07:47:22'),
(39, '3353', 0, '2022-11-16 07:48:42'),
(40, '3380', 0, '2022-11-16 07:49:52'),
(41, '3422', 0, '2022-11-16 07:52:21'),
(42, '3430', 0, '2022-11-16 07:53:25'),
(43, '3540', 0, '2022-11-16 07:54:18'),
(44, '5001', 8000, '2022-11-16 07:57:01'),
(45, '5002', 12000, '2022-11-16 07:58:12'),
(46, '1011', 0, '2022-11-21 08:22:06'),
(53, '3346', 0, '2022-12-14 07:18:11'),
(54, '3450', 0, '2022-12-14 08:20:51'),
(55, '3460', 0, '2022-12-14 08:23:24'),
(56, '3461', 0, '2022-12-14 08:24:34'),
(57, '3110', 0, '2022-12-14 08:25:46'),
(58, '3111', 0, '2022-12-14 08:26:44'),
(59, '3113', 0, '2022-12-14 08:28:26'),
(60, '3114', 0, '2022-12-14 08:29:15'),
(61, '3115', 0, '2022-12-14 08:30:38'),
(62, '3116', 0, '2022-12-14 09:14:51'),
(63, '3117', 0, '2022-12-14 09:17:23'),
(64, '3120', 0, '2022-12-14 09:21:16'),
(65, '3140', 0, '2022-12-14 09:22:18'),
(66, '3142', 0, '2022-12-14 12:55:58'),
(67, '3143', 0, '2022-12-14 12:57:34'),
(68, '3144', 0, '2022-12-14 13:00:32'),
(69, '3610', 0, '2022-12-14 13:01:32'),
(70, '3216', 0, '2022-12-14 13:02:31'),
(71, '3221', 0, '2022-12-14 13:04:44'),
(72, '3232', 0, '2022-12-14 13:05:42'),
(73, '3127', 0, '2022-12-14 13:06:42'),
(74, '2120', 0, '2022-12-14 13:08:26'),
(75, '2121', 410000, '2022-12-14 13:10:09'),
(76, '2123', 0, '2022-12-14 13:11:21'),
(77, '2501', 0, '2022-12-14 13:12:35'),
(78, '2511', 0, '2022-12-14 13:13:19'),
(79, '5011', 0, '2022-12-14 13:14:17'),
(80, '101', 500000, '2022-12-14 13:15:52'),
(81, '1012', 0, '2022-12-14 13:16:54'),
(82, '1013', 0, '2022-12-14 13:18:07'),
(83, '1014', 0, '2022-12-14 13:19:12'),
(84, '102', 0, '2022-12-14 13:20:09'),
(85, '1021', 0, '2022-12-14 13:21:17'),
(86, '1022', 0, '2022-12-14 13:22:35'),
(87, '1028', 0, '2022-12-14 13:23:33'),
(88, '103', 0, '2022-12-14 13:24:39'),
(89, '104', 0, '2022-12-14 13:26:06'),
(90, '1041', 0, '2022-12-14 13:26:52'),
(91, '1605', 0, '2022-12-14 13:27:52'),
(92, '1607', 0, '2022-12-14 13:28:43'),
(93, '1700', 0, '2022-12-14 13:29:31'),
(94, '1702', 0, '2022-12-14 13:30:21'),
(95, '1706', 0, '2022-12-14 13:31:08'),
(96, '2342', 0, '2022-12-16 05:53:18'),
(97, '2344', 0, '2022-12-16 05:56:12'),
(98, '1018', 0, '2022-12-16 12:55:21'),
(100, '7110', 0, '2022-12-26 19:02:18'),
(101, '7211', 0, '2022-12-26 23:13:57'),
(102, '7212', 0, '2022-12-26 23:17:40'),
(103, '3800', 0, '2022-12-26 23:18:10'),
(106, '7420', 0, '2022-12-29 18:17:48'),
(107, '7801', 0, '2022-12-29 18:19:21'),
(108, '1800', 0, '2022-12-29 18:23:39'),
(109, '7325', 0, '2022-12-29 18:29:40'),
(110, '3165', 0, '2022-12-29 18:47:36'),
(111, '3228', 0, '2022-12-29 18:52:12'),
(112, '7500', 0, '2022-12-29 18:57:50'),
(113, '7510', 0, '2022-12-29 18:58:54'),
(114, '3805', 0, '2022-12-29 19:02:18'),
(115, '3355', 0, '2022-12-29 19:04:58'),
(116, '3420', 0, '2022-12-29 19:06:29'),
(117, '3730', 0, '2022-12-29 19:10:21'),
(128, '40', 0, '2024-05-11 12:10:36'),
(129, '411', 0, '2024-05-11 12:52:11'),
(130, '5211', 0, '2024-05-11 13:21:52');

-- --------------------------------------------------------

--
-- Table structure for table `t_comptacomptes`
--

CREATE TABLE `t_comptacomptes` (
  `id` int(11) NOT NULL,
  `Nom_compte` varchar(100) NOT NULL,
  `Num_compte` varchar(10) NOT NULL,
  `Type_compte` int(11) NOT NULL,
  `Description_compte` text NOT NULL,
  `Statut` int(11) NOT NULL DEFAULT '1',
  `Categorie` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_comptacomptes`
--

INSERT INTO `t_comptacomptes` (`id`, `Nom_compte`, `Num_compte`, `Type_compte`, `Description_compte`, `Statut`, `Categorie`) VALUES
(4, 'Salaires du Personnel salariÃ© national', '3112', 8, 'Il couvre les coÃ»ts bruts des personnes payÃ©es par l\'intermÃ©diaire des Ã©tats de paie locaux', 1, 'C'),
(5, 'Assurance nationale de la masse salariale', '3130', 8, 'Elle couvre l\'assurance nationale de l\'employeur payÃ©e par la masse salariale', 1, 'C'),
(6, 'Assurance nationale des salaires/Quote part employeur', '3132', 8, 'Elle couvre les frais d\'assurance sociale de l\'employeur', 1, 'C'),
(7, 'CoÃ»t du rÃ©gime de retraite', '3145', 8, 'Il couvre les cotisations de retraite de l\'employeur', 1, 'C'),
(8, 'Salaires nationaux/CoÃ»ts de la pension', '3147', 8, 'Il couvre les cotisations de l\'employeur Ã  la caisse de retraite/de prÃ©voyance', 1, 'C'),
(9, 'Assurance-vie', '3150', 8, 'Couverture de coÃ»ts de la vie fournie Ã  un employÃ© d\'Aurora dans le cadre de son ensemble d\'avantages sociaux', 1, 'C'),
(10, 'Redondance', '3154', 8, 'CoÃ»ts des indemnitÃ©s de dÃ©part lorsqu\'un employÃ© est licenciÃ©', 1, 'C'),
(11, 'Personnel d\'agence et Freelance', '3160', 8, 'Cela couvre le personnel rÃ©munÃ©rÃ© par des agences de recrutement et par d\'autres organisations (oÃ¹, par exemple, nous payons une partie du coÃ»t d\'un membre du personnel partagÃ©). il couvre Ã©galement le personnel rÃ©munÃ©rÃ© en tant qu\'indÃ©pendant (annexe D de la rÃ©glementation fiscale) sur factures.', 1, 'C'),
(12, 'Recrutement du Personnel', '3170', 8, 'Couvre tous les coÃ»ts engagÃ©s pour recruter du personnel, y compris les annonces, les honoraires et les frais d\'entrevue. le recrutement des postes d\'agent recrutÃ© sur le plan nation est gÃ©rÃ© par le bureau compÃ©tent, qui doit en Ã©tablir le budget.', 1, 'C'),
(13, 'Formation du Personnel', '3180', 8, 'Cette catÃ©gorie couvre les cours internes et externes destinÃ©s au personnel et aux benevoles. le budget de la formation est rÃ©parti entre trois postes centraux; le budget de la formation informatique est dÃ©tenu par le dÃ©partement technologie, le budget de la formation Ã  la sÃ©curitÃ© est dÃ©tenu par la direction et pour la formation et le perfectionnement gÃ©nÃ©raux du personnel par le dÃ©partement de services et du personnel ou Ressources Humaines', 1, 'C'),
(14, 'Bien Ãªtre du Personnel', '3185', 8, 'Couvre les coÃ»ts du bien Ãªtre au bureau, y compris l\'eau Ã  boire, le sucre, lait, cafÃ©, etc.', 1, 'C'),
(15, 'CoÃ»ts de bÃ©nÃ©voles', '3190', 8, 'Tous les coÃ»ts des bÃ©nÃ©voles autres que la formation', 1, 'C'),
(16, 'Fournitures et consommables de bureau', '3210', 8, 'Couvre tous les articles de papeterie, les consommables informatiques, les licences annuelles de logiciels et les autres petits articles de fournitures de bureau', 1, 'C'),
(17, 'MatÃ©riel Informatiques ou logiciels autres que le capital', '3215', 8, 'La politique d\'Aurora en matiÃ¨re d\'immobilisations Ã©xige que seuls les Ã©quipements de logiciels informatiques coÃ»tant plus de 1000$ (coÃ»t unitaire) soient capitalisÃ©s. Tout article infÃ©rieur Ã  ce montant doit Ãªtre facturÃ© sur 3215', 1, 'C'),
(18, 'Photocopieuses', '3240', 8, 'Tous les frais liÃ©s aux photocopies et scannage pour un service externe', 1, 'C'),
(19, 'Internet', '3255', 8, 'CoÃ»ts externes liÃ©s Ã  l\'Ã©tablissement ou au maintien de la connectivitÃ© internet', 1, 'C'),
(20, 'Frais de tÃ©lÃ©phone', '3260', 8, 'Frais liÃ©s Ã  la communication au sein d\'Aurora', 1, 'C'),
(21, 'Loyers et tarifs des bureaux', '3310', 8, 'Tous les frais liÃ©s au loyer des diffÃ©rents bureau Aurora', 1, 'C'),
(22, 'Tarifs de bureau - GÃ©nÃ©ralitÃ©s', '3320', 8, 'Il s\'agit de tous les coÃ»ts liÃ©s au fonctionnement du bureau dans sa gÃ©nÃ©ralitÃ©', 1, 'C'),
(23, 'Eau pour le Bureau', '3325', 8, 'Tout paiement d\'eau pour les besoins du bureau autre que l\'eau Ã  boire', 1, 'C'),
(24, 'Assurances', '3330', 8, 'Cette assurance couvre les voyages, les bÃ¢timents et les biens, la responsabilitÃ© civile et des employeurs, etc', 1, 'C'),
(25, 'ElectricitÃ© et Gaz', '3340', 8, 'Couvre tous les frais liÃ©s Ã  l\'Ã©lÃ©ctricitÃ©, y compris les coÃ»ts liÃ©s Ã  l\'utilisation d\'un gÃ©nÃ©rateur et le gaz.', 1, 'C'),
(26, 'Equipement non immobilisÃ© et entretien', '3360', 8, 'Couvre l\'achat d\'Ã©quipements non capitalistiques (tout article individuel coÃ»tant moins que le seuil de capitalisation de 1000$) achetÃ©s. Il couvre Ã©galement les contrats d\'entretien et de rÃ©paration du matÃ©riel de bureau, y compris les photocopieurs, les machines Ã  affranchir et les ordinateurs.', 1, 'C'),
(27, 'VÃ©hicules', '2141', 2, 'Tout achat du vÃ©hicule pour l\'entreprise', 1, 'A'),
(28, 'Entretien des immeubles', '3381', 8, 'Il comprend les dÃ©penses autres que les dÃ©penses en immobilisations liÃ©es aux installations et aux amÃ©nagements, Ã  l\'amÃ©lioration des bureaux et Ã  l\'entretien gÃ©nÃ©ral', 1, 'C'),
(29, 'Nettoyage des bureaux', '3383', 8, 'Il inclut Ã©galement tous les produits liÃ©s Ã  la propretÃ© du bureau', 1, 'C'),
(30, 'Frais bancaire', '3440', 8, 'Tous les frais bancaires liÃ©es aux diffÃ©rentes opÃ©rations avec la banque', 1, 'C'),
(31, 'Location de locaux et frais connexes', '3217', 8, 'Ce compte couvre la location de locaux pour des rÃ©unions, des Ã©vÃ©nements, des confÃ©rences, etc. et comprend les frais associÃ©s', 1, 'C'),
(32, 'Honoraires des photographes', '3230', 8, 'Couts sur la capture et couverture evenementiel', 1, 'C'),
(33, 'Production de matÃ©riel audiovisuel', '3231', 8, 'Ce montant couvre les coÃ»ts de production de diapositives, de photographies, de vidÃ©os et dâ€™autres documents audio et visuels. Notez que les matÃ©riaux produits pour la vente et payÃ©s par la AURORA Trading Company et non par les budgets AURORA .', 1, 'C'),
(34, 'CoÃ»t dâ€™hÃ©bergement de site et autres actions connexes', '3233', 8, 'Cela couvre les coÃ»ts dâ€™hÃ©bergement du site dâ€™AURORA et dâ€™autres charges ayant la mÃªme nature et liÃ©es au paiement de service demandÃ© par les tiers', 1, 'C'),
(35, 'Impression et conception', '3439', 8, 'Cette somme couvre les frais de prÃ©paration des conceptions, de mise en place et du dÃ©ploiement des  produits dâ€™Aurora.', 1, 'C'),
(36, 'Services professionnels', '3350', 7, 'Ce compte sera utilisÃ© pour des services de conseil et dâ€™achat, par exemple des rÃ©dacteurs indÃ©pendants, des honoraires dâ€™Ã©diteurs, des honoraires de traducteurs, des  coupures de presse, des conseils de collecte de fonds, etc.', 1, 'C'),
(37, 'Abonnements', '3351', 8, 'GÃ©nÃ©ralement pour des magazines, des pÃ©riodiques ou des services dâ€™information en ligne', 1, 'C'),
(38, 'Frais dâ€™adhÃ©sion Ã  dâ€™autres organisations', '3352', 8, 'Cela couvre les frais dâ€™adhÃ©sion aux organismes et organisations professionnels. (Notez que certains frais dâ€™adhÃ©sion sont payÃ©s sous forme de subventions gÃ©nÃ©rales.)', 1, 'C'),
(39, 'Achats de livres', '3353', 8, 'Achat livre pour documentation Interne', 1, 'C'),
(40, 'Marchandises - Commerce', '3380', 1, 'Concerne toutes les marchandises achetÃ©es par Aurora dans le cadre de ses activitÃ©s ou pour les revendre', 1, 'A'),
(41, 'PublicitÃ©', '3422', 8, 'Couvre lâ€™achat dâ€™espace publicitaire dans les publications mÃ©diatiques, les journaux, etc., y compris les honoraires payables aux conseillers en publicitÃ©.', 1, 'C'),
(42, 'ActivitÃ© promotionnelle', '3430', 8, 'Ce compte comprend tous les coÃ»ts engagÃ©s dans le cadre dâ€™activitÃ©s promotionnelles gÃ©nÃ©rales', 1, 'C'),
(43, 'Frais dâ€™Ã©tude de marchÃ©', '3540', 8, 'Cela couvre les frais spÃ©cifiques engagÃ©s Ã  des fins dâ€™Ã©tudes de marchÃ©', 1, 'C'),
(44, 'Caisse', '5001', 1, 'ce sont les liquides en caisse susceptibles dâ€™Ãªtre utilisÃ© Ã  tout moment par Aurora', 1, 'A'),
(45, 'Banque', '5002', 1, 'ce sont les liquides en banque susceptibles dâ€™Ãªtre utilisÃ© Ã  tout moment par Aurora', 1, 'A'),
(46, 'Capital souscrit, non appelÃ©', '1011', 4, 'enregistre Ã  son crÃ©dit les promesses d\'apport en espÃ¨ces ou en nature, faites par les associÃ©s, par le dÃ©bit du compte 109 â€“ Apporteurs capital souscrit, non appelÃ©.\r\nAu moment de l\'appel d\'une nouvelle fraction du capital le compte 1011 est dÃ©bitÃ© par le crÃ©dit du compte 1012 Ã  concurrence du montant appelÃ©.', 1, 'P'),
(53, 'Pertes FinanciÃ¨res', '3346', 8, 'couvre les pertes ou  dÃ©penses que nous souhaitons saisir sÃ©parÃ©ment des autres activitÃ©s en raison de leur  caractÃ¨re exceptionnel ou inhabituel.  Ces Ã©lÃ©ments seront toujours dÃ©clarÃ©s dans le cadre des dÃ©penses du centre de coÃ»ts auxquelles ils se rapportent (et non au niveau de lâ€™entreprise) et peuvent inclure des Ã©lÃ©ments tels que les pertes dues Ã  la fraude ou au vol, les rÃ©clamations ou les pÃ©nalitÃ©s des fournisseurs ou des institutions gouvernementales, les Â« radiations Â» ou les franchises dâ€™assurance payÃ©es.  En cas de doute sur ce quâ€™il faut inclure dans ce compte, veuillez vous en remettre au responsable du contrÃ´le financier', 1, 'C'),
(54, 'Services Juridiques', '3450', 8, 'Couvre les honoraires des avocats, les frais dâ€™enregistrement et les frais de renouvellement pour les rapports annuels des sociÃ©tÃ©s et les Ã©lÃ©ments similaires.', 1, 'C'),
(55, 'Frais d\'audit', '3460', 8, 'ce compte concerne toute dÃ©pense liÃ©e Ã  l\'audit, incluant les frais de publication et tout autre frais relatif Ã  cette opÃ©ration', 1, 'C'),
(56, 'Autres Charges diverses', '3461', 8, 'Toute autre charge liÃ©e Ã  l\'exploitation de l\'entreprise', 1, 'C'),
(57, 'Voyages sur les vols internationaux', '3110', 8, 'Cela couvre tous les  voyages aÃ©riens  du personnel en dehors du  pays dâ€™affectation des membres du personnel (transfrontaliers).', 1, 'C'),
(58, 'Vols intÃ©rieurs', '3111', 8, 'Cela couvre tous les voyages aÃ©riens du personnel  Ã  lâ€™intÃ©rieur du pays dâ€™affectation.', 1, 'C'),
(59, 'Voyage route/Train/Bateau', '3113', 8, 'Cela tous les billets de voyages terrestres et lacustres', 1, 'C'),
(60, 'Hebergement de voyage', '3114', 8, 'Cela couvre tous les frais d\'hÃ©bergement lors de voyage', 1, 'C'),
(61, 'SÃ©jour en voyage', '3115', 8, 'Cela couvre tous les frais liÃ© au bien Ãªtre, restauration et autres lors d\'un voyage', 1, 'C'),
(62, 'Visas de voyage', '3116', 8, 'Cela concerne tous les frais liÃ©s au visa, demande de visa et autres documents relatifs au voyage', 1, 'C'),
(63, 'Voyages autres', '3117', 8, 'Cela concerne tout autre frais liÃ© de prÃ¨s ou de loin aux activitÃ©s de voyages au sein de l\'entreprise', 1, 'C'),
(64, 'Frais d\'accueil', '3120', 8, 'Ce montant couvre les frais de rÃ©ception et autres dÃ©penses similaires pour les dignitaires en visite, les fournisseurs, les contacts avec les mÃ©dias et les visiteurs Ã  lâ€™Ã©tranger; cela exclut les dÃ©penses du conseil dâ€™administration et des comitÃ©s qui sont imputÃ©es au compte 4210', 1, 'C'),
(65, 'Entretien des vÃ©hicules', '3140', 8, 'Cela couvrirait les rÃ©parations et les frais de stationnement pour les vÃ©hicules appartenant Ã  AURORA', 1, 'C'),
(66, 'CoÃ»ts de carburant', '3142', 8, 'Concerne toute charge liÃ©e Ã  la consommation du carburant. Elle peut aussi concerner le carburant pour le groupe Ã©lectrogÃ¨ne', 1, 'C'),
(67, 'Immatriculation et permis de vÃ©hicules', '3143', 8, 'Cela concerne tous les coÃ»ts liÃ©s Ã  l\'immatriculation et permis de vÃ©hicules.', 1, 'C'),
(68, 'Assurance automobile', '3144', 8, 'CoÃ»t liÃ© Ã  l\'assurance des engins roulant de l\'entreprise', 1, 'C'),
(69, 'DÃ©penses de comitÃ©s', '3610', 10, 'Cela comprend tous les coÃ»ts liÃ©s Ã  la tenue de rÃ©unions de comitÃ©s et de conseils dâ€™administration ou Ã  dâ€™autres activitÃ©s.', 1, 'C'),
(70, 'DÃ©penses des confÃ©renciers', '3216', 8, 'Cela couvre les honoraires de lâ€™orateur et tous les frais accessoires, y compris les frais de dÃ©placement et dâ€™hÃ©bergement.', 1, 'C'),
(71, 'Location d\'Ã©quipement', '3221', 8, 'Cela couvre lâ€™Ã©quipement louÃ©, par exemple des fourgonnettes ou lâ€™Ã©clairage pour les confÃ©rences ; le coÃ»t de location de lâ€™Ã©quipement audiovisuel et des stands dâ€™exposition pour les Ã©vÃ©nements et les prÃ©sentations.', 1, 'C'),
(72, 'Autres frais de photographie', '3232', 8, 'Toute charge liÃ©e Ã  la photographie et vidÃ©o', 1, 'C'),
(73, 'Litterature et livres', '3127', 8, 'Cela couvre lâ€™achat de livres et dâ€™autres documents et les abonnements.', 1, 'C'),
(74, 'Brevet, Licence, concessions, logiciel', '2120', 2, 'Cela couvre les frais de recherche et dÃ©veloppement, fonds commercial, investissement de crÃ©ation, logiciels, brevets et licences.', 1, 'A'),
(75, 'Immobilisations corporelles', '2121', 2, 'terrains, bÃ¢timents, matÃ©riels et mobiliers', 1, 'A'),
(76, 'Immobilisations financiÃ¨res', '2123', 2, 'Cela couvre les avances et acomptes versÃ©s sur immobilisations financiÃ¨res, dÃ©pÃ´ts et cautionnements, prÃªts, titres de participation et titres immobilisÃ©s', 1, 'A'),
(77, 'Stocks', '2501', 1, 'ce sont les produits achetÃ©s pour Ãªtre revendus Ã  lâ€™Ã©tat ou aprÃ¨s une lÃ©gÃ¨re transformation (ex : achat et reventes des matÃ©riels informatiques)', 1, 'A'),
(78, 'Les crÃ©ances', '2511', 1, 'ce sont les crÃ©ances transformables en liquiditÃ©s dans un dÃ©lai nâ€™excÃ©dant pas gÃ©nÃ©ralement quelques mois. Nous y trouvons les effets de commerce, les crÃ©ances sur client, fournisseurs et autres crÃ©ances.', 1, 'A'),
(79, 'Ecart de conversion', '5011', 1, 'ce sont les liquides en caisse susceptibles dâ€™Ãªtre utilisÃ© Ã  tout moment par Aurora', 1, 'A'),
(80, 'Capital Social', '101', 4, 'Lâ€™apport souscrit et libÃ©rÃ© par les associÃ©.\r\nLe Capital social traduit le montant des valeurs apportÃ©es par les associÃ©s.\r\nDans les sociÃ©tÃ©s, le capital initial correspond Ã  la valeur des apports (nature ou espÃ¨ces) effectuÃ©s par les associÃ©s Ã  la crÃ©ation de l\'entitÃ© tels qu\'ils figurent dans les statuts.\r\nIl est divisÃ© en actions ou parts d\'une mÃªme valeur nominale.', 1, 'P'),
(81, 'Capital souscrit, appelÃ©, non versÃ©', '1012', 4, 'enregistre Ã  son crÃ©dit la fraction de capital en instance d\'Ãªtre effectivement libÃ©rÃ©e par les apporteurs.\r\nEn cas de libÃ©ration effective par les apporteurs de la fraction de capital appelÃ©, le compte 1012 â€“ Capital souscrit, appelÃ©, non versÃ© est virÃ© au compte 1013 â€“ Capital souscrit appelÃ©, versÃ©, non amorti.', 1, 'P'),
(82, 'Capital souscrit, appelÃ©, versÃ©, non amorti', '1013', 4, 'Enregistre la libÃ©ration effective par les apporteurs de la fraction de capital appelÃ©', 1, 'P'),
(83, 'Capital souscrit, appelÃ©, versÃ©, amorti', '1014', 4, 'enregistre les actions dont le capital est partiellement ou totalement amorti et qui donnent les mÃªmes droits que les actions non amorties Ã  l\'exception du premier dividende (IntÃ©rÃªt statutaire)', 1, 'P'),
(84, 'Capital par dotation', '102', 3, 'Le Capital par dotation reprÃ©sente la contrepartie de l\'intÃ©gration au patrimoine des entitÃ©s publiques, des immobilisations et fonds affectÃ©s, sur dÃ©cision de l\'AutoritÃ© publique, au fonctionnement de ces entitÃ©s.\r\nCette dotation peut aussi se rÃ©aliser par transformation de dettes', 1, 'P'),
(85, 'Dotation initiale', '1021', 3, 'Capital par dotation ne saurait Ãªtre utilisÃ© que dans les entitÃ©s publiques. Il reÃ§oit en effet les fonds de dotation des collectivitÃ©s publiques. Il enregistre la contre-valeur des biens affectÃ©s de maniÃ¨re irrÃ©vocable Ã  ces entitÃ©s.\r\nil n\'en demeure pas moins vrai que certaines subventions d\'investissement, accordÃ©es par les collectivitÃ©s auxquelles les entitÃ©s sont rattachÃ©es, peuvent Ãªtre considÃ©rÃ©es comme Ã©tant des fonds de dotation. Ce sera notamment le cas d\'espÃ¨ce d\'organismes subventionneurs et d\'entitÃ© subventionnÃ©e Ã©manant de la mÃªme personne morale publique. Dans ce cas, il faut se rÃ©fÃ©rer Ã  la dÃ©cision d\'octroi pour leur qualification.', 1, 'P'),
(86, 'Dotations complÃ©mentaires', '1022', 3, 'Autres supplÃ©mentaires aux dotations initiales', 1, 'P'),
(87, 'Autres dotations', '1028', 3, 'Autres dotations', 1, 'P'),
(88, 'Capital personnel', '103', 3, 'A la crÃ©ation de l\'entitÃ© exploitÃ©e sous la forme individuelle, le capital initial reprÃ©sente le montant des apports en nature ou en espÃ¨ces effectuÃ©s par l\'entrepreneur Ã  titre dÃ©finitif et des dettes qu\'il dÃ©cide d\'inscrire au bilan.\r\nCe capital initial est modifiÃ© ultÃ©rieurement par les apports et les retraits de capital ainsi que par l\'affectation des rÃ©sultats.\r\nCe compte ne doit pas Ãªtre confondu avec le compte de l\'exploitant. Lorsque le solde de ce compte est dÃ©biteur, il reste au passif, mais prÃ©cÃ©dÃ© du signe moins.', 1, 'P'),
(89, 'Compte de l\'exploitant', '104', 3, 'Ce compte sert Ã  Ã©tablir la situation de l\'entrepreneur en ce qui concerne :\r\nles apports et complÃ©ments d\'apports financiers et/ou de biens et services effectuÃ©s Ã  titre temporaire en cours d\'exercice. Ces apports et complÃ©ments d\'apports financiers peuvent consister en des versements dans la caisse ou sur un compte bancaire de l\'entitÃ© ou en des rÃ¨glements de dÃ©penses de l\'entitÃ© sur la trÃ©sorerie privÃ©e de l\'exploitant ;\r\nles retraits effectuÃ©s au cours de l\'exercice pour son usage personnel ou celui de sa famille et dans le cadre de l\'exploitation. Ceux-ci consistent en des :\r\nprÃ©lÃ¨vements en nature de biens et services, objets de l\'activitÃ©, qui concourent Ã  la dÃ©termination du rÃ©sultat ;\r\nprÃ©lÃ¨vements financiers opÃ©rÃ©s sur un compte de trÃ©sorerie affectÃ© Ã  l\'activitÃ©, qu\'il s\'agisse de prÃ©lÃ¨vements directs (retraits de fonds) ou indirects (paiement d\'une dÃ©pense privÃ©e).', 1, 'P'),
(90, 'Apports temporaires', '1041', 3, 'Exploitants temporaires', 1, 'P'),
(91, 'Dettes fiscales, sociales', '1605', 3, 'Dettes fiscales et autres cotisations sociales', 1, 'P'),
(92, 'Autres dettes et risques provisionnÃ©s', '1607', 3, 'Risques et dettes provisionnÃ©s', 1, 'P'),
(93, 'CrÃ©dit d\'escompte', '1700', 3, 'reprÃ©sente les engagements pris auprÃ¨s de Ã©tablissements financiers et doivent Ãªtre dÃ©nouÃ©s dans un bref dÃ©lai.', 1, 'P'),
(94, 'CrÃ©dit de trÃ©sorerie et dÃ©couverts', '1702', 3, 'CrÃ©dit de trÃ©sorerie et dÃ©couverts : reprÃ©sente les engagements pris auprÃ¨s de Ã©tablissements financiers et doivent Ãªtre dÃ©nouÃ©s dans un bref dÃ©lai.', 1, 'P'),
(95, 'Les Ã©carts de conversions', '1706', 3, 'matÃ©rialise au passif les gains latents sur les crÃ©ances et dettes libellÃ©es en monnaie Ã©trangÃ¨res.', 1, 'P'),
(96, 'Charges comptabilisÃ©es d\'avance', '2342', 1, 'Cela concerne les autres charges qui sont comptabilisÃ©es en avance en attendant d\'Ãªtre rÃ©gularisÃ©es', 1, 'A'),
(97, 'Compte d\'attente de rÃ©gularisation', '2344', 1, 'Concerne toutes les dÃ©penses en attente d\'Ãªtre rÃ©gularisÃ©es.', 1, 'A'),
(98, 'Capital souscrit, soumis Ã  des conditions particuliÃ¨res', '1018', 3, 'enregistre Ã  son crÃ©dit le montant du capital provenant d\'opÃ©rations particuliÃ¨res telles que :\r\nl\'incorporation de plus-values nettes Ã  long terme (P.V.N.L.T.), lorsque les dispositions lÃ©gislatives et rÃ©glementaires le prÃ©voient ;\r\nl\'Ã©mission de certificats d\'investissement, d\'actions de prÃ©fÃ©rence et d\'actions Ã  dividendes prioritaires, sans droit de vote.', 1, 'P'),
(101, 'IntÃ©rÃªts reÃ§us', '7110', 9, 'Il concerne tous les intÃ©rÃªts reÃ§us pour une quelconque activitÃ© d\'Aurora avec les tiers.', 1, 'R'),
(102, 'Droit d\'abonnement et souscriptions aux services', '7211', 9, 'Concerne tous les paiements des abonnements et autres souscriptions aux diffÃ©rents services d\'Aurora', 1, 'R'),
(103, 'Ventes', '7212', 5, 'Concerne toutes ventes des biens et services par Aurora', 1, 'R'),
(104, 'Dotations aux amortissements', '3800', 10, 'Dotations aux amortissements', 1, 'C'),
(107, 'Produit divers', '7420', 9, 'Concerne tout autre produit gÃ©nÃ©rÃ© par des moyens non prÃ©vus dans les diffÃ©rentes activitÃ©s', 1, 'R'),
(108, 'Reprise sur provisions', '7801', 9, 'Concerne la reprise aux provisions sur les amortissements ou pertes diverses', 1, 'R'),
(109, 'RÃ©sultat', '1800', 4, 'Il s\'agit du rÃ©sultat net de l\'exercice', 1, 'P'),
(110, 'Produits constatÃ©s d\'avance', '7325', 9, 'Produit constatÃ©s d\'avance et comptabilisÃ© Ã  cette fin', 1, 'R'),
(111, 'Charges du personnel', '3165', 7, 'Concerne toutes charges liÃ© au personnel : salaires et ses corrolaires', 1, 'C'),
(112, 'Autres charges diverses', '3228', 12, 'Concerne toute autre charge non spÃ©cifiÃ©e', 1, 'C'),
(113, 'Produits financiers', '7500', 11, 'Produits financiers', 1, 'R'),
(114, 'Produits exceptionnels', '7510', 11, 'Produits exceptionnels', 1, 'R'),
(115, 'Dotations aux provisions', '3805', 10, 'Dotations aux provisions', 1, 'C'),
(116, 'ImpÃ´ts, taxes et versements assimilÃ©s', '3355', 8, 'Concerne tout ce qui a trait aux impÃ´ts et autres taxes assimilÃ©s', 1, 'C'),
(117, 'Charges financiÃ¨res', '3420', 10, 'charges financiÃ¨res', 1, 'C'),
(118, 'ImpÃ´ts sur le bÃ©nÃ©fice', '3730', 12, 'ImpÃ´ts sur le bÃ©nÃ©fice de l\'exercice', 1, 'C'),
(129, 'Fournisseurs, comptes rattachÃ©s', '40', 3, 'Compte fournisseur', 1, 'P'),
(130, 'Clients', '411', 1, 'Compte client', 1, 'A'),
(131, 'Banques dÃ©bitrices', '5211', 3, 'Banque dÃ©bitrice', 1, 'P');

-- --------------------------------------------------------

--
-- Table structure for table `t_comptaecritures`
--

CREATE TABLE `t_comptaecritures` (
  `id` int(11) NOT NULL,
  `Compte` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Code` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `Periode` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `Date` date NOT NULL,
  `Reference` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Devise` int(11) NOT NULL,
  `Montant` double NOT NULL,
  `Taux` double NOT NULL,
  `Bureau` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Departement` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Source` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Type_ec` int(11) NOT NULL,
  `Tva_ecriture` float DEFAULT '0',
  `DateEnreg_ecriture` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `statut_ecriture` int(11) DEFAULT '1',
  `TypeJournal` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
  `exTypeJournal` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
  `Piececompt` varchar(250) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'nofile.png',
  `UniqueIndex` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_comptaecritures`
--

INSERT INTO `t_comptaecritures` (`id`, `Compte`, `Code`, `Periode`, `Date`, `Reference`, `Description`, `Devise`, `Montant`, `Taux`, `Bureau`, `Departement`, `Source`, `Type_ec`, `Tva_ecriture`, `DateEnreg_ecriture`, `statut_ecriture`, `TypeJournal`, `exTypeJournal`, `Piececompt`, `UniqueIndex`, `idUser`) VALUES
(1, 'Immobilisations corporelles', '2121', 'T04/2024', '2024-04-02', '001', 'Achat mobilier de bureau', 1, 5000, 2700, 'AuGoKye', 'Technologie', 'Aurora', 1, 0, '2024-05-11 11:53:10', 1, 'JCaisse', '', 'nofile.png', '110524135310', 17),
(2, 'Caisse', '5001', 'T04/2024', '2024-04-02', '001', 'DÃ©caissement pour achat immobilier', 1, 5000, 2700, 'AuGoKye', 'General', 'Aurora', 2, 0, '2024-05-11 11:53:10', 1, 'JCaisse', '', 'nofile.png', '110524135310', 17),
(4, 'Immobilisations corporelles', '2121', 'T04/2024', '2024-04-05', '002', 'Achat d\'un micro ordinateur', 1, 15000, 2700, 'AuGoKye', 'Technologie', 'Aurora', 1, 0, '2024-05-11 12:04:42', 1, 'JBanque', '', 'nofile.png', '110524140442', 17),
(5, 'Banque', '5002', 'T04/2024', '2024-04-05', '002', 'DÃ©caissement pour achat micro ordinateur', 1, 15000, 2700, 'AuGoK', 'General', 'Aurora', 2, 0, '2024-05-11 12:04:42', 1, 'JBanque', '', 'nofile.png', '110524140442', 17),
(7, 'Marchandises - Commerce', '3380', 'T04/2024', '2024-04-08', '003', 'Achat marchandise', 1, 6000, 2700, 'AuGoKye', 'Technologie', 'Aurora', 1, 0, '2024-05-11 12:12:00', 1, 'JCaisse', '', 'nofile.png', '110524141200', 17),
(8, 'Caisse', '5001', 'T04/2024', '2024-04-08', '003', 'DÃ©caissement pour achat marchandise', 1, 3000, 2700, 'AuGoKye', 'General', 'Aurora', 2, 0, '2024-05-11 12:12:00', 1, 'JCaisse', '', 'nofile.png', '110524141200', 17),
(9, 'Fournisseurs, comptes rattachÃ©s', '40', 'T04/2024', '2024-04-08', '003', 'Fournisseur pour achat caisse', 1, 3000, 2700, 'AuGoKye', 'Finance', 'Aurora', 2, 0, '2024-05-11 12:12:00', 1, 'JCaisse', '', 'nofile.png', '110524141200', 17),
(10, 'Caisse', '5001', 'T04/2024', '2024-04-10', '004(a)', 'Vente marchandises', 1, 3000, 2700, 'AuGoKye', 'General', 'Aurora', 1, 0, '2024-05-11 12:43:14', 1, 'JCaisse', '', 'nofile.png', '110524144314', 17),
(11, 'Marchandises - Commerce', '3380', 'T04/2024', '2024-04-10', '004(a)', 'Vente marchandises', 1, 3000, 2700, 'AuGoKye', 'Finance', 'Aurora', 2, 0, '2024-05-11 12:43:14', 1, 'JCaisse', '', 'nofile.png', '110524144314', 17),
(13, 'Banque', '5002', 'T04/2024', '2024-04-10', '004(b)', 'Vente marchandises', 1, 3000, 2700, 'AuGoKye', 'General', 'Aurora', 1, 0, '2024-05-11 12:50:11', 1, 'JBanque', '', 'nofile.png', '110524145011', 17),
(14, 'Marchandises - Commerce', '3380', 'T04/2024', '2024-04-10', '004(b)', 'Vente marchandises', 1, 3000, 2700, 'AuGoKye', 'Finance', 'Aurora', 2, 0, '2024-05-11 12:50:11', 1, 'JBanque', '', 'nofile.png', '110524145011', 17),
(16, 'Clients', '411', 'T04/2024', '2024-04-10', '004(c)', 'Vente marchandises', 1, 3000, 2700, 'AuGoKye', 'Finance', 'Aurora', 1, 0, '2024-05-11 12:53:39', 1, 'JComptedi', '', 'nofile.png', '110524145339', 17),
(17, 'Marchandises - Commerce', '3380', 'T04/2024', '2024-04-10', '004(c)', 'Vente marchandises', 1, 3000, 2700, 'AuGoKye', 'Finance', 'Aurora', 2, 0, '2024-05-11 12:53:39', 1, 'JComptedi', '', 'nofile.png', '110524145339', 17),
(19, 'Fournisseurs, comptes rattachÃ©s', '40', 'T04/2024', '2024-04-13', '005', 'Reglement dette fournisseur', 1, 2000, 2700, 'AuGoKye', 'Finance', 'Aurora', 1, 0, '2024-05-11 12:55:26', 1, 'JCaisse', '', 'nofile.png', '110524145526', 17),
(20, 'Caisse', '5001', 'T04/2024', '2024-04-13', '005', 'Reglement dette fournisseur', 1, 2000, 2700, 'AuGoKye', 'General', 'Aurora', 2, 0, '2024-05-11 12:55:26', 1, 'JCaisse', '', 'nofile.png', '110524145526', 17),
(22, 'Marchandises - Commerce', '3380', 'T04/2024', '2024-04-16', '006', 'Achat marchandise', 1, 3500, 2700, 'AuGoKye', 'Finance', 'Aurora', 1, 0, '2024-05-11 13:03:30', 1, 'JBanque', '', 'nofile.png', '110524150330', 17),
(23, 'Banque', '5002', 'T04/2024', '2024-04-16', '006', 'Achat marchandise', 1, 3500, 2700, 'AuGoKye', 'General', 'Aurora', 2, 0, '2024-05-11 13:03:30', 1, 'JBanque', '', 'nofile.png', '110524150330', 17),
(25, 'Banque', '5002', 'T04/2024', '2024-04-19', '007', 'Vente marchandises', 1, 4000, 2700, 'AuGoKye', 'General', 'Aurora', 1, 0, '2024-05-11 13:06:21', 1, 'JBanque', '', 'nofile.png', '110524150621', 17),
(26, 'Clients', '411', 'T04/2024', '2024-04-19', '007', 'Vente marchandises', 1, 2400, 2700, 'AuGoKye', 'Finance', 'Aurora', 1, 0, '2024-05-11 13:06:21', 1, 'JBanque', '', 'nofile.png', '110524150621', 17),
(27, 'Marchandises - Commerce', '3380', 'T04/2024', '2024-04-19', '007', 'Vente marchandises', 1, 6400, 2700, 'AuGoKye', 'Finance', 'Aurora', 2, 0, '2024-05-11 13:06:21', 1, 'JBanque', '', 'nofile.png', '110524150621', 17),
(28, 'Caisse', '5001', 'T04/2024', '2024-04-23', '008', 'Paiement crÃ©ance client', 1, 3250, 2700, 'AuGoKye', 'General', 'Aurora', 1, 0, '2024-05-11 13:09:20', 1, 'JCaisse', '', 'nofile.png', '110524150920', 17),
(29, 'Clients', '411', 'T04/2024', '2024-04-23', '008', 'Paiement crÃ©ance client', 1, 3250, 2700, 'AuGoKye', 'Finance', 'Aurora', 2, 0, '2024-05-11 13:09:20', 1, 'JCaisse', '', 'nofile.png', '110524150920', 17),
(31, 'Banque', '5002', 'T04/2024', '2024-04-27', '009', 'Approvisionnement banque par caisse', 1, 4000, 2700, 'AuGoKye', 'General', 'Aurora', 1, 0, '2024-05-11 13:15:06', 1, 'JFondsint', '', 'nofile.png', '110524151506', 17),
(32, 'Caisse', '5001', 'T04/2024', '2024-04-27', '009', 'Approvisionnement banque par caisse', 1, 4000, 2700, 'AuGoKye', 'General', 'Aurora', 2, 0, '2024-05-11 13:15:06', 1, 'JFondsint', '', 'nofile.png', '110524151506', 17),
(34, 'Banque', '5002', 'T04/2024', '2024-04-28', '010', 'Emprunt bancaire', 1, 20000, 2700, 'AuGoKye', 'General', 'Aurora', 1, 0, '2024-05-11 13:24:53', 1, 'JBanque', '', 'nofile.png', '110524152453', 17),
(35, 'Banques dÃ©bitrices', '5211', 'T04/2024', '2024-04-28', '010', 'Emprunt bancaire', 1, 20000, 2700, 'AuGoKye', 'Finance', 'Aurora', 2, 0, '2024-05-11 13:24:53', 1, 'JBanque', '', 'nofile.png', '110524152453', 17),
(37, 'VÃ©hicules', '2141', 'T04/2024', '2024-04-29', '011', 'Achat vÃ©hicule', 1, 50000, 2700, 'AuGoKye', 'Finance', 'Aurora', 1, 0, '2024-05-11 13:29:05', 1, 'JBanque', '', 'nofile.png', '110524152905', 17),
(38, 'Banque', '5002', 'T04/2024', '2024-04-29', '011', 'Achat vÃ©hicule', 1, 25000, 2700, 'AuGoKye', 'General', 'Aurora', 2, 0, '2024-05-11 13:29:05', 1, 'JBanque', '', 'nofile.png', '110524152905', 17),
(39, 'Fournisseurs, comptes rattachÃ©s', '40', 'T04/2024', '2024-04-29', '011', 'Achat vÃ©hicule', 1, 25000, 2700, 'AuGoKye', 'Finance', 'Aurora', 2, 0, '2024-05-11 13:29:05', 1, 'JBanque', '', 'nofile.png', '110524152905', 17),
(40, 'Banque', '5002', 'T04/2024', '2024-04-30', '012', 'Vente marchandises', 1, 5400, 2700, 'AuGoKye', 'General', 'Aurora', 1, 0, '2024-05-11 13:31:09', 1, 'JBanque', '', 'nofile.png', '110524153109', 17),
(41, 'Marchandises - Commerce', '3380', 'T04/2024', '2024-04-30', '012', 'Vente marchandises', 1, 5400, 2700, 'AuGoKye', 'Finance', 'Aurora', 2, 0, '2024-05-11 13:31:09', 1, 'JBanque', '', 'nofile.png', '110524153109', 17),
(43, 'Caisse', '5001', 'T04/2024', '2024-04-30', '013', 'Vente marchandises', 1, 3000, 2700, 'AuGoKye', 'General', 'Aurora', 1, 0, '2024-05-11 13:33:02', 1, 'JCaisse', '', 'nofile.png', '110524153302', 17),
(44, 'Marchandises - Commerce', '3380', 'T04/2024', '2024-04-30', '013', 'Vente marchandises', 1, 3000, 2700, 'AuGoKye', 'Finance', 'Aurora', 2, 0, '2024-05-11 13:33:02', 1, 'JCaisse', '', 'nofile.png', '110524153302', 17),
(45, 'Assurance automobile', '3144', 'T04/2024', '2024-04-25', '98878', 'TEST', 1, 487, 2700, 'AuGoKye', 'Finance', 'Aurora', 1, 0, '2024-07-10 07:31:07', 1, 'JBanque', '', 'nofile.png', '100724093107', 17),
(46, 'Capital personnel', '103', 'T04/2024', '2024-04-25', '98878', 'Paiement main d\'oeuvre manutentionaire', 1, 487, 2700, 'AuGoKye', 'Service', 'Aurora', 2, 0, '2024-07-10 07:31:07', 1, 'JBanque', '', 'nofile.png', '100724093107', 17);

-- --------------------------------------------------------

--
-- Table structure for table `t_comptaecritureshold`
--

CREATE TABLE `t_comptaecritureshold` (
  `id` int(11) NOT NULL,
  `Indexsauv` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `Compte` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Code` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `Periode` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `Date` date NOT NULL,
  `Reference` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Devise` int(11) NOT NULL,
  `Montant` double NOT NULL,
  `Taux` double NOT NULL,
  `Bureau` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Departement` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Source` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Type_ec` int(11) NOT NULL,
  `Tva_ecriture` float DEFAULT '0',
  `DateEnreg_ecriture` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `statut_ecriture` int(11) DEFAULT '1',
  `TypeJournal` varchar(15) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_comptaecriturestempo`
--

CREATE TABLE `t_comptaecriturestempo` (
  `id` int(11) NOT NULL,
  `Compte` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Code` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `Periode` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `Date` date NOT NULL,
  `Reference` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Devise` int(11) NOT NULL,
  `Montant` double NOT NULL,
  `Taux` double NOT NULL,
  `Bureau` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Departement` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '1 débit, 2 crédit',
  `Source` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Type_ec` int(11) NOT NULL,
  `Tva_ecriture` float DEFAULT '0',
  `DateEnreg_ecriture` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `statut_ecriture` int(11) DEFAULT '1',
  `TypeJournal` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
  `Statutsauv` int(11) NOT NULL DEFAULT '0',
  `Indexsauv` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `Datesauv` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Ligne` int(11) NOT NULL,
  `Piececompt` varchar(250) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'nofile.png',
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_comptagrandlivre`
--

CREATE TABLE `t_comptagrandlivre` (
  `id` int(11) NOT NULL,
  `Num_ecriture` int(11) NOT NULL,
  `Libelle_ecriture` text CHARACTER SET utf8mb4 NOT NULL,
  `Numero_compte` int(11) NOT NULL,
  `Nom_compte` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Montant_debit` float NOT NULL,
  `Montant_credit` float NOT NULL,
  `Date_ecriture` date DEFAULT NULL,
  `DateEnreg` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_comptajournaux`
--

CREATE TABLE `t_comptajournaux` (
  `id` int(11) NOT NULL,
  `Designation` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `refcompte` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'compte par defaut',
  `typejournal` int(11) NOT NULL COMMENT '1.banque, 2.caisse,3.divers, 4.vente, 5.achat',
  `Description` text CHARACTER SET utf8mb4 NOT NULL,
  `UniqueCode` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
  `Statut` int(11) NOT NULL COMMENT '1 visible, 2 non',
  `Code` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `DateCreation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_comptajournaux`
--

INSERT INTO `t_comptajournaux` (`id`, `Designation`, `refcompte`, `typejournal`, `Description`, `UniqueCode`, `Statut`, `Code`, `DateCreation`, `idUser`) VALUES
(1, 'Banque', '5002', 1, 'Journal banque contenant les Ã©critures, utilisant la banque pour les transactions.', '250123003039', 1, 'JBanque', '2023-01-25 00:30:39', 23),
(2, 'Caisse', '5001', 2, 'Journal caisse contenant les Ã©critures.', '250123004158', 1, 'JCaisse', '2023-01-28 00:41:58', 23),
(3, 'Compte divers', '0', 3, 'Journal des opÃ©rations n\'utilisant pas la caisse et/ou banque.', '250123124003', 1, 'JComptedi', '2023-01-30 12:40:03', 23),
(25, 'Journal des Donateur', '0', 3, 'Enregistre tous les mouvements de fonds entre l\'organisation et les bailleurs de fonds', '170324073437', 1, 'JJournald', '2024-03-17 07:34:37', 17),
(36, 'Fonds internes', '0', 3, 'Ce journal aura Ã  faire rÃ©fÃ©rences Ã  toutes les transactions internes que nous aurons Ã  passer entre notre banque et notre caisse.', '110524151247', 1, 'JFondsint', '2024-05-11 15:12:47', 17);

-- --------------------------------------------------------

--
-- Table structure for table `t_comptalistecomptes`
--

CREATE TABLE `t_comptalistecomptes` (
  `id` int(11) NOT NULL,
  `Numero` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `Nom` varchar(58) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_comptalistecomptes`
--

INSERT INTO `t_comptalistecomptes` (`id`, `Numero`, `Nom`) VALUES
(1, '1', 'Comptes de ressources durables'),
(2, '10', 'Capital'),
(3, '101', 'Capital social'),
(4, '102', 'Capital par dotation'),
(5, '103', 'Capital personnel'),
(6, '104', 'Compte de l\'exploitant'),
(7, '105', 'Primes liÃ©es Capitaux propres'),
(8, '106', 'Ã‰carts de rÃ©Ã©valuation'),
(9, '1061', 'Ã‰carts de rÃ©Ã©valuation lÃ©gale'),
(10, '1062', 'Ã‰carts de rÃ©Ã©valuation libre'),
(11, '109', 'Actionnaires, capital souscrit, non appelÃ©'),
(12, '11', 'RÃ©serves'),
(13, '111', 'RÃ©serve lÃ©gale'),
(14, '113', 'RÃ©serves rÃ©glementÃ©es'),
(15, '118', 'Autres rÃ©serves'),
(16, '12', 'Report Ã  nouveau'),
(17, '121', 'Report Ã  nouveau crÃ©diteur'),
(18, '129', 'Report Ã  nouveau dÃ©biteur'),
(19, '14', 'Subventions d\'investissement'),
(20, '15', 'Provisions rÃ©glementÃ©es et assimilÃ©es'),
(21, '151', 'Amortissements dÃ©rogatoires'),
(22, '152', 'Plus-values cession Ã  rÃ©investir'),
(23, '153', 'Fonds rÃ©glementÃ©s'),
(24, '155', 'Provis. rÃ©glementÃ©es sur Immobilisations.'),
(25, '156', 'Provis. rÃ©glementÃ©es sur stocks'),
(26, '16', 'Emprunts et dettes assimilÃ©es'),
(27, '161', 'Emprunts obligataires'),
(28, '1611', 'Emprunts obligataires ordinaires'),
(29, '1612', 'Emprunts obligataires convertibles'),
(30, '1618', 'Emprunts obligataires'),
(31, '162', 'Emprunts Ã‰tablissement crÃ©dit'),
(32, '163', 'Avances reÃ§ues de l\'Ã©tat'),
(33, '164', 'Avances reÃ§ues, C/C bloquÃ©s'),
(34, '165', 'DÃ©pÃ´ts et cautionnements reÃ§us'),
(35, '167', 'Avances Ã  conditions. particuliÃ¨res'),
(36, '168', 'Autres emprunts et dettes'),
(37, '166', 'IntÃ©rÃªts courus'),
(38, '1661', 'Sur emprunts obligataires'),
(39, '1662', 'Sur emprunts Ã©tablissements de. crÃ©dit'),
(40, '1663', 'Sur avances reÃ§ues de l\'Ã©tat'),
(41, '1664', 'Sur avances reÃ§ues, C/C bloquÃ©s'),
(42, '1665', 'Sur dÃ©pÃ´ts, cautionnements'),
(43, '1667', 'sur avances Ã  conditions. particuliÃ¨res.'),
(44, '1668', 'Sur autres emprunts et dettes'),
(45, '17', 'Dettes crÃ©dit-bail et assimilÃ©'),
(46, '172', 'Emprunts crÃ©dit-bail immobilier'),
(47, '173', 'Emprunts crÃ©dit-bail mobilier'),
(48, '176', 'IntÃ©rÃªts courus'),
(49, '1762', 'Sur emprunt. crÃ©dit-bail immobilier'),
(50, '1763', 'Sur emprunt. crÃ©dit-bail mobilier'),
(51, '1768', 'Sur emprunt. Ã©quivalent. autres. contrats'),
(52, '178', 'Emprunt. Ã©quivalents autres contrats'),
(53, '18', 'Dettes liÃ©es'),
(54, '181', 'Dettes liÃ©es participations'),
(55, '182', 'Dettes liÃ©es sociÃ©tÃ©s en participation.'),
(56, '183', 'Int. courus sur Dettes liÃ©es Ã  des participations'),
(57, '184', 'Comptes permanents bloquÃ©s'),
(58, '185', 'Comptes permanents non bloquÃ©s'),
(59, '186', 'Comptes de liaison charges'),
(60, '187', 'Comptes de liaison produits'),
(61, '188', 'Comptes liaison : SociÃ©tÃ©s en Part.'),
(62, '19', 'Provis. Fin. Risques & Charges'),
(63, '2', 'Comptes d\'actif immobilisÃ©'),
(64, '20', 'Charges immobilisÃ©es'),
(65, '201', 'Frais d\'Ã©tablissement'),
(66, '202', 'Charges Ã  rÃ©partir'),
(67, '206', 'Primes Remboursement Obligations'),
(68, '21', 'Immobilisations incorporelles'),
(69, '211', 'Frais recherche et dÃ©veloppement'),
(70, '212', 'Brevets, licences, concessions'),
(71, '213', 'Logiciels'),
(72, '214', 'Marques'),
(73, '215', 'Fonds commercial'),
(74, '216', 'Droit au bail'),
(75, '217', 'Investissements de crÃ©ation'),
(76, '218', 'Autres droits, valeurs incorporelles.'),
(77, '219', 'Immobilisations. incorporelles en cours'),
(78, '2191', 'Frais recherche et dÃ©veloppement'),
(79, '2193', 'Logiciels'),
(80, '2198', 'Autres droits, valeurs incorporelles.'),
(81, '22', 'Terrains'),
(82, '221', 'Terrains agricoles et forestiers'),
(83, '222', 'Terrains nus'),
(84, '223', 'Terrains bÃ¢tis'),
(85, '224', 'Travaux mise en valeur terrains'),
(86, '225', 'Terrains de gisement'),
(87, '226', 'Terrains amÃ©nagÃ©s'),
(88, '228', 'Autres terrains'),
(89, '229', 'AmÃ©nagements terrains en cours'),
(90, '23', 'BÃ¢timents, installations. techniques'),
(91, '231', 'BÃ¢timents sur sol propre'),
(92, '232', 'BÃ¢timents sur sol d\'autrui'),
(93, '233', 'Ouvrages d\'infrastructure'),
(94, '234', 'Installations techniques'),
(95, '235', 'AmÃ©nagement de bureaux'),
(96, '237', 'BÃ¢timents en concession'),
(97, '238', 'Autres installations et agencements'),
(98, '239', 'BÃ¢timent et installations en cours'),
(99, '2391', 'En cours sur BÃ¢timents sur sol propre'),
(100, '2392', 'En cours sur BÃ¢timents sur sol d\'autrui'),
(101, '2393', 'En cours sur Ouvrages d\'infrastructure'),
(102, '2394', 'En cours sur Installations techniques'),
(103, '2395', 'En cours sur AmÃ©nagement de bureaux'),
(104, '2397', 'En cours sur BÃ¢timents en concession'),
(105, '2398', 'En cours sur Autres installations et agencements'),
(106, '24', 'MatÃ©riel'),
(107, '241', 'MatÃ©riel, outillage industriel et commercial'),
(108, '242', 'MatÃ©riel et outillage agricole'),
(109, '243', 'MatÃ©riel Emballage rÃ©cupÃ©rable'),
(110, '244', 'MatÃ©riel et mobilier'),
(111, '245', 'MatÃ©riel de transport'),
(112, '246', 'Immobilisations. animales, agricoles'),
(113, '248', 'Autres matÃ©riels'),
(114, '249', 'MatÃ©riel en cours'),
(115, '2491', 'MatÃ©riel, outillage industriel et commercial en cours'),
(116, '2492', 'MatÃ©riel et outillage agricole en cours'),
(117, '2493', 'MatÃ©riel Emballage rÃ©cupÃ©rable en cours'),
(118, '2494', 'MatÃ©riel et mobilier de bureau en cours'),
(119, '2495', 'MatÃ©riel de transport en cours'),
(120, '2496', 'Immobilisations. animales, agricoles en cours'),
(121, '2497', 'Agencements., amÃ©nagement. du matÃ©riel en cours'),
(122, '2498', 'Autres matÃ©riels en cours'),
(123, '25', 'Avances, acomptes versÃ©s sur immobilisations'),
(124, '26', 'Titres de participation'),
(125, '27', 'Autres immobilisations. financiÃ¨res'),
(126, '271', 'PrÃªts et crÃ©ances non commerciales'),
(127, '272', 'PrÃªts au personnel'),
(128, '273', 'CrÃ©ances sur l\'Etat'),
(129, '274', 'Titres immobilisÃ©s'),
(130, '275', 'DÃ©pÃ´ts et cautionnements versÃ©s'),
(131, '276', 'IntÃ©rÃªts courus'),
(132, '2761', 'Int. Courus PrÃªts et crÃ©ances non commerciales'),
(133, '2762', 'Int. Courus PrÃªts au personnel'),
(134, '2763', 'Int. Courus CrÃ©ances sur l\'Etat'),
(135, '2764', 'Int. Courus Titres immobilisÃ©s'),
(136, '2765', 'Int. Courus DÃ©pÃ´ts et cautionnements versÃ©s'),
(137, '2767', 'Int. Courus CrÃ©ances rattachÃ©es Ã  des participations'),
(138, '2768', 'Int. Courus Immobilisations financiÃ¨res diverses'),
(139, '277', 'CrÃ©ances rattachÃ©es Ã  des participations'),
(140, '278', 'Immobilisations financiÃ¨res diverses'),
(141, '28', 'Amortissements'),
(142, '281', 'Amortis. : immobilisations. incorporelles'),
(143, '2811', 'Amortissements. : frais R &D'),
(144, '2812', 'Amortissements. : brevets, licences'),
(145, '2813', 'Amortissements des logiciels'),
(146, '2814', 'Amortissements des marques'),
(147, '2815', 'Amortissements. du fonds commercial'),
(148, '2816', 'Amortissements du droit au bail'),
(149, '2817', 'Amont. : investissements. crÃ©ation'),
(150, '2818', 'Amortissements. autres valeurs incorporelles.'),
(151, '282', 'Amortissements des terrains'),
(152, '283', 'Amortissements. : bÃ¢timents, installations.'),
(153, '2831', 'Amort. bÃ¢tim. industriels. sol propre'),
(154, '2832', 'Amort. bÃ¢timents. industriels. sol autrui'),
(155, '2833', 'Amortissements. : ouvrages infrastructure'),
(156, '2834', 'Amont. : installations. techniques'),
(157, '2835', 'Amortissements. : amÃ©nagement. bureaux'),
(158, '2837', 'Amont. bÃ¢timents. industriels. concession'),
(159, '2838', 'Amont. : autres. installations., agencements.'),
(160, '284', 'Amortissements du matÃ©riel'),
(161, '2841', 'Amont. mat-outillage industriels.'),
(162, '2842', 'Amont. mat-outillage agricole'),
(163, '2843', 'Amont. mat-outillage d\'emballage'),
(164, '2844', 'Amortissements. matÃ©riel, mobilier'),
(165, '2845', 'Amortissements. matÃ©riel transport'),
(166, '2846', 'Amont. : immobilisations. animales, agric.'),
(167, '2847', 'Amont. : agencements., amÃ©nagement.'),
(168, '2848', 'Amortissements. : autres matÃ©riels'),
(169, '29', 'Provisions pour dÃ©prÃ©ciation'),
(170, '291', 'Provisions : immobilisations. incorporelles'),
(171, '2912', 'Provisions : brevets, licences'),
(172, '2913', 'Provisions des logiciels'),
(173, '2914', 'Provisions des marques'),
(174, '2915', 'Provisions du fonds commercial'),
(175, '2916', 'Provisions du droit au bail'),
(176, '2917', 'Provisions : investissements. crÃ©ation'),
(177, '2918', 'Provisions autres valeurs incorporelles.'),
(178, '2919', 'Provision Immobilisations incorporelles. En cours'),
(179, '292', 'Provisions des terrains'),
(180, '293', 'Provisions : bÃ¢timents, installations.'),
(181, '2931', 'Provisions bÃ¢timents. industriels. sol propre'),
(182, '2932', 'Provisions bÃ¢timents. industriels. sol autrui'),
(183, '2933', 'Provisions : ouvrages infrastructure'),
(184, '2934', 'Provisions : installations. techniques'),
(185, '2935', 'Provisions : amÃ©nagement. bureaux'),
(186, '2937', 'Provisions bÃ¢timents. industriels. concession'),
(187, '2938', 'Provisions : autres. installations., agencements.'),
(188, '2939', 'Provision BÃ¢timents En cours'),
(189, '294', 'Provisions du matÃ©riel'),
(190, '2941', 'Provisions mat-outillage industriels.'),
(191, '2942', 'Provisions mat-outillage agricole'),
(192, '2943', 'Provisions mat-outillage d\'emballage'),
(193, '2944', 'Provisions matÃ©riel, mobilier'),
(194, '2945', 'Provisions matÃ©riel transport'),
(195, '2946', 'Provisions : immobilisations. animales, agric.'),
(196, '2947', 'Provisions : agencements., amÃ©nagement.'),
(197, '2948', 'Provisions : autres matÃ©riels'),
(198, '2949', 'Provision MatÃ©riel En cours'),
(199, '295', 'Provisions avances et acomptes'),
(200, '296', 'Provisions sut titres de participations'),
(201, '297', 'Provisions sur autres immob.financiÃ¨res'),
(202, '3', 'Comptes de stocks'),
(203, '31', 'Marchandises'),
(204, '32', 'MatiÃ¨res premiÃ¨res, fournitures'),
(205, '33', 'Autres approvisionnements'),
(206, '34', 'Produits en cours'),
(207, '35', 'Services en cours'),
(208, '36', 'Produits finis'),
(209, '37', 'Produits intermÃ¨diaires., rÃ©siduels'),
(210, '38', 'Stocks en cours de route'),
(211, '381', 'Marchandises en cours de route'),
(212, '382', 'Mat. premiÃ¨res. en cours de route'),
(213, '383', 'Autres approvisionnements. en cours route'),
(214, '386', 'Produits finis en cours de route'),
(215, '387', 'Stock en consignation., en dÃ©pÃ´t'),
(216, '39', 'DÃ©prÃ©ciations des stocks'),
(217, '391', 'DÃ©prÃ©ciations. : stocks marchandises'),
(218, '392', 'DÃ©prÃ©ciations. : stocks mat. premiÃ¨res'),
(219, '393', 'DÃ©prÃ©ciations. : stocks autres. approvisionnements.'),
(220, '394', 'DÃ©prÃ©ciations. : produits en cours'),
(221, '395', 'DÃ©prÃ©ciations. : services en cours'),
(222, '396', 'DÃ©prÃ©ciations. : stocks produits finis'),
(223, '397', 'DÃ©prÃ©ciations. : stocks produits intermÃ¨diaires.'),
(224, '398', 'DÃ©prÃ©ciations. : stocks cours de route'),
(225, '4', 'Comptes de tiers'),
(226, '40', 'Fournisseurs, comptes rattachÃ©s'),
(227, '401', 'Fournisseurs, dettes en compte'),
(228, '402', 'Fournisseurs, effets Ã  payer'),
(229, '408', 'Fournis., factures non parvenues'),
(230, '409', 'Fournisseurs dÃ©biteurs'),
(231, '41', 'Clients et comptes rattachÃ©s'),
(232, '411', 'Clients'),
(233, '412', 'Clients, effets Ã  recevoir'),
(234, '414', 'CrÃ©ances Cessions. courantes immobilisations.'),
(235, '415', 'Clients effets. escomptÃ©s non Ã©chus'),
(236, '416', 'CrÃ©ances litigieuses douteuses'),
(237, '418', 'Clients, produits Ã  recevoir'),
(238, '419', 'Clients crÃ©diteurs'),
(239, '42', 'Personnel'),
(240, '421', 'Personnel, avances et acomptes'),
(241, '422', 'Personnel, rÃ©munÃ©rations dues'),
(242, '423', 'Personnel, oppositions. saisies-arrÃªts'),
(243, '424', 'Personnel, Å“uvres sociales'),
(244, '425', 'ReprÃ©sentants du personnel'),
(245, '4281', 'Dettes provisionnÃ©es. congÃ©s Ã  payer'),
(246, '4286', 'Pers., Autres charges Ã  payer'),
(247, '4287', 'Personnel, Produits Ã  recevoir'),
(248, '43', 'Organismes sociaux'),
(249, '431', 'SÃ©curitÃ© sociale'),
(250, '433', 'Autres organismes sociaux'),
(251, '4386', 'Organismes. sociaux, Autres charges Ã  payer'),
(252, '4387', 'Organismes sociaux, Produits Ã  recevoir'),
(253, '44', 'Ã‰tat et collectivitÃ©s publiques'),
(254, '441', 'Ã‰tat, impÃ´t sur les bÃ©nÃ©fices'),
(255, '442', 'Ã‰tat, autres impÃ´ts et taxes'),
(256, '443', 'Ã‰tat, TVA facturÃ©e'),
(257, '444', 'Ã‰tat, TVA due ou crÃ©dit de TVA'),
(258, '445', 'Ã‰tat, TVA rÃ©cupÃ©rable'),
(259, '446', 'Ã‰tat, Autres taxes sur C.A.'),
(260, '447', 'Ã‰tat, impÃ´ts retenus Ã  la source'),
(261, '4486', 'Etat, Charges Ã  payer'),
(262, '4487', 'Etat, Produits Ã  recevoir'),
(263, '449', 'Ã‰tat, crÃ©ances, dettes diverses'),
(264, '45', 'Organismes internationaux'),
(265, '451', 'Organismes africains'),
(266, '452', 'Autres organismes internationaux'),
(267, '4581', 'Organismes. int., fonds de dotation. Ã  recevoir'),
(268, '4582', 'Organismes. int., subvention Ã  recevoir'),
(269, '46', 'AssociÃ©s et groupe'),
(270, '461', 'AssociÃ©s, opÃ©rations en. / capital'),
(271, '462', 'AssociÃ©s, comptes courants'),
(272, '463', 'AssociÃ©s, opÃ©rations en. en commun'),
(273, '465', 'AssociÃ©s, dividendes Ã  payer'),
(274, '466', 'Groupe, comptes courants'),
(275, '467', 'Action., restant du Cal appelÃ©'),
(276, '47', 'DÃ©biteurs et crÃ©diteurs divers'),
(277, '4711', 'DÃ©biteurs divers'),
(278, '4712', 'CrÃ©diteurs divers'),
(279, '472', 'Versements. restant Ã  effectuer/titres non libÃ©rÃ©s'),
(280, '474', 'RÃ©partition pÃ©riodique'),
(281, '475', 'CrÃ©ances / Travaux non encore facturables'),
(282, '476', 'Charges constatÃ©es d\'avance'),
(283, '477', 'Produits constatÃ©s d\'avance'),
(284, '478', 'Ã‰carts de conversion - actif'),
(285, '4781', 'Diminution des crÃ©ances'),
(286, '4782', 'Augmentation des dettes'),
(287, '4788', 'DiffÃ©rences. compens./couverture change'),
(288, '479', 'Ã‰carts de conversion - passif'),
(289, '4791', 'Augmentation des crÃ©ances'),
(290, '4792', 'Diminution des dettes'),
(291, '4798', 'DiffÃ©rences. compens./couverture change'),
(292, '48', 'CrÃ©ances et dettes H.A.O.'),
(293, '481', 'Fournisseurs d\'investissements'),
(294, '482', 'Fournisseurs investissements., EAP'),
(295, '483', 'Dettes / acqu. titres placement'),
(296, '484', 'Autres dettes H.A.O.'),
(297, '485', 'CrÃ©ances / cessions immobilisations.'),
(298, '486', 'CrÃ©ances Cessions. titres placement'),
(299, '488', 'Autres crÃ©ances H.A.O.'),
(300, '49', 'DÃ©prÃ©ciations sur risques tiers'),
(301, '490', 'DÃ©prÃ©ciation : Comptes fournisseurs'),
(302, '491', 'DÃ©prÃ©ciation : Comptes clients'),
(303, '492', 'DÃ©prÃ©ciation : Comptes personnel'),
(304, '493', 'DÃ©prÃ©ciation : Comptes organismes sociaux'),
(305, '494', 'DÃ©prÃ©ciation : Comptes d\'Ã‰tat et collectivitÃ©s publiqu'),
(306, '495', 'DÃ©prÃ©ciation : Comptes organismes internationaux'),
(307, '496', 'DÃ©prÃ©ciation : Comptes associÃ©-groupe'),
(308, '497', 'DÃ©prÃ©ciation : Comptes dÃ©biteurs divers'),
(309, '498', 'DÃ©prÃ©ciation : Comptes de crÃ©ances H.A.O.'),
(310, '4981', 'DÃ©prÃ©ciation crÃ©ances sur cessions d\'immobilisations'),
(311, '4982', 'DÃ©prÃ©ciation crÃ©ances sur cessions de titres placement'),
(312, '4983', 'DÃ©prÃ©ciation Autres crÃ©ances H.A.O.'),
(313, '499', 'Risques provisionnÃ©s'),
(314, '4991', 'Risques provisionnÃ©s sur opÃ©rations d\'exploitation'),
(315, '4998', 'Risques provisionnÃ©s sur opÃ©rations H.A.O.'),
(316, '5', 'Comptes de trÃ©sorerie'),
(317, '50', 'Titres de placement'),
(318, '501', 'Titres du trÃ©sor, bons caisse CT'),
(319, '502', 'Actions'),
(320, '503', 'Obligations'),
(321, '504', 'Bons de souscription'),
(322, '51', 'Valeurs Ã  encaisser'),
(323, '52', 'Banques'),
(324, '5211', 'Banques dÃ©bitrices'),
(325, '5212', 'Banque crÃ©ditrices'),
(326, '522', 'Banques autres Ã©tats UÃ‰MOA'),
(327, '523', 'Banques autres Ã©tats Zone Franc'),
(328, '524', 'Banques hors Zone Franc'),
(329, '526', 'IntÃ©rÃªts courus sur crÃ©dits bancaires'),
(330, '53', 'Ã‰tablisst financiers, assimilÃ©s'),
(331, '54', 'Instruments de trÃ©sorerie'),
(332, '541', 'Options de taux d\'intÃ©rÃªt'),
(333, '542', 'Options de taux de change'),
(334, '543', 'Options de taux boursiers'),
(335, '544', 'Instruments de marchÃ©s Ã  terme'),
(336, '545', 'Avoirs or, autres. mÃ©taux prÃ©cieux'),
(337, '56', 'Banques, crÃ©dits de trÃ©sorerie, escompte'),
(338, '561', 'CrÃ©dits de trÃ©sorerie'),
(339, '564', 'Escompte de crÃ©dits de campagne'),
(340, '565', 'Escompte de crÃ©dits ordinaires'),
(341, '566', 'IntÃ©rÃªts courus sur crÃ©dits de trÃ©sorerie et escompte'),
(342, '57', 'Caisse'),
(343, '58', 'RÃ©gies d\'avances, accrÃ©ditifs'),
(344, '59', 'DÃ©prÃ©ciations. risques trÃ©sorerie'),
(345, '590', 'DÃ©prÃ©ciations. Risques Titres de placements'),
(346, '591', 'DÃ©prÃ©ciations. Risques Valeurs Ã  encaisser'),
(347, '592', 'DÃ©prÃ©ciations. Autres risques de trÃ©sorerie'),
(348, '6', 'Comptes de charges (A.O.)'),
(349, '60', 'Achats et variations de stocks'),
(350, '601', 'Achats de marchandises'),
(351, '602', 'Achats Mat. premiÃ¨res, fournitures.'),
(352, '6021', 'MP et fournitures. dans l\'UÃ‰MOA'),
(353, '6022', 'MP et fournitures. hors UÃ‰MOA'),
(354, '6023', 'MP et fournitures. Entrep. du groupe dans l\'UÃ‰MOA'),
(355, '6024', 'MP et fournitures. Entreprises du groupe hors UÃ‰MOA'),
(356, '6029', 'MP et fournitures. Rabais, remises, ristournes. obtenus'),
(357, '603', 'Variations. : stocks biens achetÃ©s'),
(358, '6031', 'Variations : stocks marchandises'),
(359, '6032', 'Variations. Mat. premiÃ¨res, fournit.'),
(360, '6033', 'Variations. Autres approvisionnement.'),
(361, '604', 'Achats stockÃ©s de matiÃ¨res et fournitures'),
(362, '605', 'Autres achats'),
(363, '6051', 'Fournitures non stockables - eau'),
(364, '6052', 'Ã‰lectricitÃ©'),
(365, '6053', 'Autres Ã©nergies'),
(366, '6054', 'Fournitures entretien'),
(367, '6055', 'Fournit. bureau non stockables'),
(368, '6056', 'Achats petit matÃ©riel, outillage'),
(369, '6057', 'Achats Ã©tudes, prestations de. service'),
(370, '6058', 'Achats travaux, matÃ©riel, Ã©quipement.'),
(371, '6059', 'Rabais, remises, ristournes. obtenus'),
(372, '608', 'Achats d\'emballages'),
(373, '61', 'Transports'),
(374, '611', 'Transports sur achats'),
(375, '612', 'Transports sur ventes'),
(376, '613', 'Transports pour le compte tiers'),
(377, '614', 'Transports du personnel'),
(378, '618', 'Autres frais de transport'),
(379, '62 et 63', 'Services extÃ©rieurs A et B'),
(380, '621', 'Sous-traitance gÃ©nÃ©rale'),
(381, '622', 'Locations et charges locatives'),
(382, '623', 'Redevances crÃ©dit-bail et assimilÃ©es.'),
(383, '6232', 'CrÃ©dit-bail immobilier'),
(384, '6233', 'CrÃ©dit-bail mobilier'),
(385, '6235', 'Contrats assimilÃ©s'),
(386, '624', 'Entretien, rÃ©parat., maintenance'),
(387, '6241', 'Entretien, rÃ©parat. biens immobilisations.'),
(388, '6242', 'Entretien, rÃ©p. biens mobiliers'),
(389, '6243', 'Maintenance'),
(390, '6248', 'Autres entretiens et rÃ©parations'),
(391, '625', 'Primes d\'assurance'),
(392, '626', 'Ã‰tudes, recherches, documentation.'),
(393, '627', 'PublicitÃ© et publications'),
(394, '628', 'Frais de tÃ©lÃ©communications'),
(395, '63', 'Services extÃ©rieurs B'),
(396, '631', 'Frais bancaires'),
(397, '632', 'RÃ©munÃ©rations. intermÃ¨diaires., conseils'),
(398, '633', 'Frais de formation du personnel'),
(399, '634', 'Redevances brevets, licences'),
(400, '6342', 'Redevances brevets, licences'),
(401, '6343', 'Redevances pour logiciels'),
(402, '6344', 'Redevances pour marques'),
(403, '635', 'Cotisations'),
(404, '6351', 'Cotisations'),
(405, '6358', 'Concours divers'),
(406, '637', 'RÃ©munÃ©rations. personnel extÃ©rieur'),
(407, '6371', 'Personnel intÃ©rimaire'),
(408, '6372', 'Personnel dÃ©tachÃ© ou prÃªtÃ©'),
(409, '638', 'Autres charges externes'),
(410, '64', 'ImpÃ´ts et taxes'),
(411, '641', 'ImpÃ´ts et taxes directs'),
(412, '6411', 'ImpÃ´ts fonciers et taxes annexes'),
(413, '6412', 'Patentes-licences, taxes annexes'),
(414, '6413', 'Taxes / appointements, salaires'),
(415, '6414', 'Taxes d\'apprentissage'),
(416, '6415', 'Format. professionnelle continue'),
(417, '6418', 'Autres impÃ´ts et taxes directs'),
(418, '645', 'ImpÃ´ts et taxes indirects'),
(419, '646', 'Droits d\'enregistrement'),
(420, '6461', 'Droits de mutation'),
(421, '6462', 'Droits de timbre'),
(422, '6463', 'Taxes / les vÃ©hicules sociÃ©tÃ©'),
(423, '6464', 'Vignettes'),
(424, '6468', 'Autres droits'),
(425, '647', 'PÃ©nalitÃ©s et amendes fiscales'),
(426, '65', 'Autres charges'),
(427, '651', 'Pertes CrÃ©ances clients et autres.'),
(428, '652', 'QP rÃ©sultat / opÃ©rations en. en commun'),
(429, '6521', 'Quote-part transfÃ©rÃ©e bÃ©nÃ©fices'),
(430, '6525', 'Pertes imputÃ©es par transfert'),
(431, '653', 'QP rÃ©sult.annul./exÃ©cution. partiel'),
(432, '654', 'Val comptable cession courante immobilisations'),
(433, '65411', 'Valeur Brute Immobilisations incorporelles'),
(434, '65418', 'Amont. Immobilisations incorporelles'),
(435, '65421', 'Valeur Brute Immobilisations corporelles'),
(436, '65428', 'Amont. Immobilisations corporelles'),
(437, '65461', 'Valeur Brute Immobilisations financiÃ¨res'),
(438, '65468', 'Amont. Immobilisations financiÃ¨res'),
(439, '658', 'Charges diverses'),
(440, '6581', 'Jetons prÃ©sence, autres rÃ©munÃ©ration administrateur.'),
(441, '6582', 'Dons'),
(442, '6583', 'MÃ©cÃ©nat'),
(443, '659', 'Charges provisionnÃ©es exploitation.'),
(444, '6591', 'Sur risques Ã  court terme'),
(445, '6593', 'Sur stocks'),
(446, '6594', 'Sur crÃ©ances'),
(447, '6598', 'Autres charges provisionnÃ©es'),
(448, '66', 'Charges de personnel'),
(449, '661', 'RÃ©munÃ©rations personnel national'),
(450, '6611', 'Appointements., salaires, commissions.'),
(451, '6612', 'Primes et gratifications'),
(452, '6613', 'CongÃ©s payÃ©s'),
(453, '6614', 'IndemnitÃ©s prÃ©avis, licenciement'),
(454, '6615', 'IndemnitÃ©s. maladie versÃ©es travailleur'),
(455, '6616', 'SupplÃ©ment familial'),
(456, '6617', 'Avantages en nature'),
(457, '6618', 'Autres rÃ©munÃ©rations directes'),
(458, '662', 'RÃ©munÃ¨rations. personnel non national'),
(459, '6621', 'Appointements., salaires, commissions.'),
(460, '6622', 'Primes et gratifications'),
(461, '6623', 'CongÃ©s payÃ©s'),
(462, '6624', 'IndemnitÃ©s prÃ©avis, licenciement'),
(463, '6625', 'IndemnitÃ©s. maladie versÃ©es travailleur'),
(464, '6626', 'SupplÃ©ment familial'),
(465, '6627', 'Avantages en nature'),
(466, '6628', 'Autres rÃ©munÃ©rations directes'),
(467, '663', 'IndemnitÃ©s. forfaitaires versÃ©es'),
(468, '664', 'Charges sociales'),
(469, '6641', 'Ch. sociales /personnel national'),
(470, '6642', 'Ch. soc. /personnel non national'),
(471, '666', 'RÃ©munÃ©rations. exploitant individuel'),
(472, '6661', 'RÃ©munÃ©rations. travail l\'exploitant'),
(473, '6662', 'Charges sociales'),
(474, '667', 'RÃ©munÃ©rations. transfÃ©rÃ©e personnel extÃ©rieur.'),
(475, '6671', 'Personnel intÃ©rimaire'),
(476, '6672', 'Personnel dÃ©tachÃ© ou prÃªtÃ©'),
(477, '668', 'Autres charges sociales'),
(478, '67', 'Frais financiers, charges assimilÃ©es.'),
(479, '671', 'IntÃ©rÃªts des emprunts'),
(480, '672', 'IntÃ©rÃªts loyers crÃ©dit-bail'),
(481, '6721', 'IntÃ©rÃªts loyer C-bail immobilier'),
(482, '6722', 'IntÃ©rÃªts loyer C-bail mobilier'),
(483, '6723', 'IntÃ©rÃªts loyers :autres contrats'),
(484, '673', 'Escomptes accordÃ©s'),
(485, '674', 'Autres intÃ©rÃªts'),
(486, '676', 'Pertes de change'),
(487, '677', 'Pertes sur cessions de titres placement'),
(488, '678', 'Pertes sur risques financiers'),
(489, '6781', 'Sur rentes viagÃ¨res'),
(490, '6782', 'Sur opÃ©rations financiÃ¨res'),
(491, '6784', 'Sur instruments de trÃ©sorerie'),
(492, '679', 'Charges provisionnÃ©es financiÃ¨re'),
(493, '6791', 'Sur risques financiers'),
(494, '6795', 'Sur titres de placement'),
(495, '6798', 'Autres. charges provisionnÃ©es. financiÃ¨res'),
(496, '68', 'Dotations aux amortissements'),
(497, '681', 'Dotations amortissements d\'exploitation'),
(498, '6811', 'Dotations. amort. : Charges immobilisÃ©es'),
(499, '68121', 'Dotations. amort. : Frais R&D'),
(500, '68122', 'Dotations. amort. : Brevets,licences'),
(501, '68125', 'Dotations. amort. : Fonds commercial'),
(502, '68127', 'Dotations. amort. : autres immobilisations. incorporelles.'),
(503, '68131', 'Dotations. amort. : Terrains'),
(504, '68132', 'Dotations. amort. : BÃ¢timents'),
(505, '68133', 'Dotations. amort. : AAI'),
(506, '68134', 'Dotations. amort. : MatÃ©riel'),
(507, '68135', 'Dotations. amort. : Transport'),
(508, '687', 'Dot. amort.Ã  caractÃ¨re financier'),
(509, '6872', 'Dotat. amort. P.R.Oblig.'),
(510, '6878', 'Aut. dotat. amort. financiÃ¨res'),
(511, '69', 'Dotations aux provisions'),
(512, '691', 'Dotat. aux provisions exploitat.'),
(513, '6911', 'Pour risques et charges'),
(514, '6912', 'Pour grosses rÃ©parations'),
(515, '6913', 'DÃ©prÃ©ciat. : immob. incorporel.'),
(516, '6914', 'DÃ©prÃ©ciat. : immob. corporelles'),
(517, '697', 'Dotat. aux provis. financiÃ¨res'),
(518, '6971', 'Pour risques et charges'),
(519, '6972', 'DÃ©prÃ©ciat. : immob. financiÃ¨res'),
(520, '7', 'Comptes de produits (A.O.)'),
(521, '70', 'Ventes'),
(522, '701', 'Ventes de marchandises'),
(523, '702', 'Ventes de produits finis'),
(524, '7021', 'Produits finis dans l\'UÃ‰MOA'),
(525, '7022', 'Produits finis Hors UÃ‰MOA'),
(526, '7023', 'Produits finis Groupe UÃ‰MOA'),
(527, '7024', 'Produits finis Groupe hors UÃ‰MOA'),
(528, '703', 'Ventes produits intermÃ©diaires'),
(529, '7031', 'Produits interm. dans l\'UÃ‰MOA'),
(530, '7032', 'Produits interm. Hors UÃ‰MOA'),
(531, '7033', 'Produits interm. Groupe UÃ‰MOA'),
(532, '7034', 'Prodts interm. Groupe hors UÃ‰MOA'),
(533, '704', 'Ventes de produits rÃ©siduels'),
(534, '7041', 'Produits rÃ©siduels dans l\'UÃ‰MOA'),
(535, '7042', 'Produits rÃ©siduels Hors UÃ‰MOA'),
(536, '7043', 'Produits rÃ©siduels Groupe UÃ‰MOA'),
(537, '7044', 'Prodts rÃ©sidu. Groupe hors UÃ‰MOA'),
(538, '705', 'Travaux facturÃ©s'),
(539, '7051', 'Travaux dans l\'UÃ‰MOA'),
(540, '7052', 'Travaux Hors UÃ‰MOA'),
(541, '7053', 'Travaux Groupe UÃ‰MOA'),
(542, '7054', 'Travaux Groupe hors UÃ‰MOA'),
(543, '706', 'Services vendus'),
(544, '7061', 'Services vendus dans l\'UÃ‰MOA'),
(545, '7062', 'Services vendus Hors UÃ‰MOA'),
(546, '7063', 'Services vendus Groupe UÃ‰MOA'),
(547, '7064', 'Services vendus Groupe hors UÃ‰MOA'),
(548, '707', 'Produits accessoires'),
(549, '7071', 'Ports, emballagas perdus, autres frais'),
(550, '7072', 'Commissions et courtages'),
(551, '7073', 'Locations'),
(552, '7074', 'Boni/reprises, cess. emballages'),
(553, '7075', 'Mise Ã  disposition de personnel'),
(554, '7076', 'Redevances brevets, logiciels'),
(555, '7077', 'Service dans l\'intÃ©rÃªt personnel'),
(556, '7078', 'Autres produits accessoires'),
(557, '71', 'Subventions d\'exploitation'),
(558, '711', 'Sur produits Ã  l\'exportation'),
(559, '712', 'Sur produits Ã  l\'importation'),
(560, '713', 'Sur produits de pÃ©rÃ©quation'),
(561, '718', 'Autres subventions exploitation'),
(562, '72', 'Production immobilisÃ©e'),
(563, '721', 'Immobilisations incorporelles'),
(564, '722', 'Immobilisations corporelles'),
(565, '726', 'Immobilisations financiÃ¨res'),
(566, '73', 'Variat. Stocks biens et services'),
(567, '734', 'Variat. Stocks produits en cours'),
(568, '735', 'Variations : en-cours services'),
(569, '736', 'Variat. : stocks produits finis'),
(570, '737', 'Variat. stocks produit intermÃ©d.'),
(571, '75', 'Autres produits'),
(572, '752', 'QP rÃ©sultat / opÃ©rat. en commun'),
(573, '7521', 'Quote-part transfÃ©rÃ©e de pertes'),
(574, '7525', 'BÃ©nÃ©fices attribuÃ©s par transfert'),
(575, '753', 'QP rÃ©sultat /Ã©xecut.part.contrat'),
(576, '754', 'Pdt cessions courantes d\'immob.'),
(577, '7541', 'Prix cession Immobilisations incorporelles'),
(578, '7542', 'Prix cession Immobilisations corporelles'),
(579, '7546', 'Prix cession Immobilisations financiÃ¨res'),
(580, '758', 'Produits divers'),
(581, '7581', 'Jetons prÃ©sence et autres-Adm'),
(582, '7582', 'IndemnitÃ©s d\'assurances reÃ§ues'),
(583, '759', 'Rep. charge provision. exploitat'),
(584, '7591', 'Sur risques Ã  court terme'),
(585, '7593', 'Sur stocks'),
(586, '7594', 'Sur crÃ©ances'),
(587, '7598', 'Sur autres charges provisionnÃ©es'),
(588, '77', 'Revenus financiers et assimilÃ©s'),
(589, '771', 'IntÃ©rÃªts de prÃªts'),
(590, '772', 'Revenus de participations'),
(591, '773', 'Escomptes obtenus'),
(592, '774', 'Revenus de titres de placement'),
(593, '776', 'Gains de change'),
(594, '777', 'Gains Cessions titres placement'),
(595, '778', 'Gains sur risques financiers'),
(596, '779', 'Rep. charges prov. financiÃ¨res'),
(597, '7791', 'Sur risques financiers'),
(598, '7795', 'Sur titres de placement'),
(599, '7798', 'Aut. charges provis. financiÃ¨res'),
(600, '78', 'Transferts de charges'),
(601, '781', 'Transferts charges exploitation'),
(602, '787', 'Transferts charges financiÃ¨res'),
(603, '79', 'Reprises de provisions'),
(604, '791', 'Reprises provisions exploitat.'),
(605, '7911', 'Pour risques et charges'),
(606, '7912', 'Pour grosses rÃ©parations'),
(607, '7913', 'dÃ©prÃ©ciat. : immob. incorporel.'),
(608, '7914', 'DÃ©prÃ©ciat. : immob. corporelles'),
(609, '797', 'Reprises provisions financiÃ¨res'),
(610, '7971', 'Pour risques et charges'),
(611, '7972', 'DÃ©prÃ©ciat. : immob. financiÃ¨res'),
(612, '7978', 'Reprises d\'amortissements'),
(613, '8', 'Comptes des autres charges et autres produits'),
(614, '81', 'Valeurs comptables cess. immob.'),
(615, '8111', 'Val.Brute Immobilisations incorporelles'),
(616, '8118', 'Amort. Immobilisations incorporelles'),
(617, '8121', 'Val.Brute Immobilisations corporelles'),
(618, '8128', 'Amort. Immobilisations corporelles'),
(619, '8161', 'Val.Brute Immobilisations financiÃ¨res'),
(620, '8168', 'Amort. Immobilisations financiÃ¨res'),
(621, '82', 'Produits des cess. immobilisat.'),
(622, '821', 'Prix cession Immobilisations incorporelles'),
(623, '822', 'Prix cession Immobilisations corporelles'),
(624, '826', 'Prix cession Immobilisations financiÃ¨res'),
(625, '83', 'Charges hors activitÃ© ordinaire'),
(626, '831', 'Charges H.A.O. constatÃ©es'),
(627, '834', 'Pertes sur crÃ©ances H.A.O.'),
(628, '835', 'Dons et libÃ©ralitÃ©s accordÃ©s'),
(629, '836', 'Abandons de crÃ©ances consentis'),
(630, '839', 'Charges provisionnÃ©es H.A.O.'),
(631, '8393', 'Charges provisionnÃ©es H.A.O. Stocks'),
(632, '8394', 'Charges provisionnÃ©es H.A.O. Tiers'),
(633, '8395', 'Charges provisionnÃ©es H.A.O. TrÃ©sorerie'),
(634, '84', 'Produits hors activitÃ© ordinaire'),
(635, '841', 'Produits H.A.O. constatÃ©s'),
(636, '845', 'Dons et libÃ©ralitÃ©s obtenus'),
(637, '846', 'Abandons de crÃ©ances obtenus'),
(638, '848', 'Transferts de charges H.A.O.'),
(639, '849', 'Reprises sur Charges provisionnÃ©es H.A.O.'),
(640, '8493', 'Rep. Charges provisionnÃ©es H.A.O. Stocks'),
(641, '8494', 'Rep. Charges provisionnÃ©es H.A.O. Tiers'),
(642, '8495', 'Rep. Charges provisionnÃ©es H.A.O. TrÃ©sorerie'),
(643, '85', 'Dotat. hors activitÃ© ordinaire'),
(644, '851', 'Dotat. aux provis. rÃ©glementÃ©es'),
(645, '852', 'Dotat. aux amortissem. H.A.O.'),
(646, '853', 'Dotat. provis. dÃ©prÃ©ciat. H.A.O.'),
(647, '854', 'Dotat. provis. R & C H.A.O.'),
(648, '858', 'Autres dotations H.A.O.'),
(649, '86', 'Reprises hors activitÃ© ordinaire'),
(650, '861', 'Reprises provisions rÃ©glementÃ©es'),
(651, '862', 'Reprises d\'amortissements H.A.O.'),
(652, '863', 'Repris. provis. dÃ©prÃ©c. H.A.O.'),
(653, '864', 'Rep. provis. R & C H.A.O.'),
(654, '865', 'Rep. subvent. investissement'),
(655, '868', 'Autres Reprises H.A.O.'),
(656, '87', 'Participation des travailleurs'),
(657, '88', 'Subventions d\'Ã©quilibre'),
(658, '89', 'ImpÃ´ts sur le rÃ©sultat'),
(659, '891', 'ImpÃ´ts bÃ©nÃ©fices (exercice)'),
(660, '892', 'Rappels impÃ´ts / rÃ©sultat antÃ©r.'),
(661, '895', 'ImpÃ´t minimum forfaitaire I.M.F.'),
(662, '899', 'DÃ©grÃ¨vem. impÃ´ts / rÃ©sult. ant.'),
(663, '9', 'Comptes des engagements'),
(664, '901', 'Engagements de financement obtenus'),
(665, '9011', 'CrÃ©dits confirmÃ©s obtenus'),
(666, '9012', 'Emprunts restant Ã  encaisser'),
(667, '9013', 'FacilitÃ©s financiÃ¨res renouvelables'),
(668, '9014', 'FacilitÃ©s d\'Ã©mission'),
(669, '9018', 'Autres engagements de financement obtenus'),
(670, '902', 'Engagements de garantie obtenus'),
(671, '9021', 'Avals obtenus'),
(672, '9022', 'Cautions, garanties obtenues'),
(673, '9023', 'HypothÃ¨ques obtenues'),
(674, '9024', 'Effets endossÃ©s par des tiers'),
(675, '9028', 'Autres garanties obtenues'),
(676, '903', 'Engagements rÃ©ciproques'),
(677, '9031', 'Achats de marchandises Ã  terme'),
(678, '9032', 'Achats Ã  terme de devises'),
(679, '9033', 'Commandes fermes des clients'),
(680, '9038', 'Autres engagements rÃ©ciproques'),
(681, '904', 'Autres engagements obtenus'),
(682, '9041', 'Abandons crÃ©ances conditionnels'),
(683, '9043', 'Ventes clause rÃ©serve propriÃ©tÃ©'),
(684, '9048', 'Divers engagements obtenus'),
(685, '905', 'Engagements de financement accordÃ©s'),
(686, '9051', 'CrÃ©dits accordÃ©s non encaissÃ©s'),
(687, '9058', 'Autres engagements de financement accordÃ©s'),
(688, '906', 'Engagements de garantie accordÃ©s'),
(689, '9061', 'Avals accordÃ©s'),
(690, '9062', 'Cautions, garanties accordÃ©es'),
(691, '9063', 'HypothÃ¨ques accordÃ©es'),
(692, '9064', 'Effets endossÃ©s par l\'entreprise'),
(693, '9068', 'Autres garanties accordÃ©es'),
(694, '907', 'Engagements rÃ©ciproques'),
(695, '9071', 'Ventes de marchandises Ã  terme'),
(696, '9072', 'Ventes Ã  terme de devises'),
(697, '9073', 'Commandes fermes aux fournisseur'),
(698, '9078', 'Autres engagements rÃ©ciproques'),
(699, '908', 'Autres engagements accordÃ©s'),
(700, '9081', 'Annulations conditionelles de dettes'),
(701, '9082', 'Engagements de retraite'),
(702, '9083', 'Achats clause rÃ©serve propriÃ©tÃ©'),
(703, '9088', 'Divers engagements accordÃ©s');

-- --------------------------------------------------------

--
-- Table structure for table `t_comptaperiodes`
--

CREATE TABLE `t_comptaperiodes` (
  `id` int(11) NOT NULL,
  `Code` varchar(5) CHARACTER SET latin1 NOT NULL,
  `Statut` int(11) NOT NULL,
  `Mois` varchar(10) CHARACTER SET latin1 NOT NULL,
  `Debut` date NOT NULL,
  `Fin` date NOT NULL,
  `IntervalDate` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_comptaperiodes`
--

INSERT INTO `t_comptaperiodes` (`id`, `Code`, `Statut`, `Mois`, `Debut`, `Fin`, `IntervalDate`) VALUES
(1, 'T01', 1, 'Janvier', '0000-00-00', '0000-00-00', ''),
(2, 'T02', 2, 'FÃ©vrier', '2025-02-01', '2025-02-28', ''),
(3, 'T03', 1, 'Mars', '0000-00-00', '0000-00-00', ''),
(4, 'T04', 2, 'Avril', '2024-04-01', '2024-04-30', ''),
(5, 'T05', 1, 'Mais', '0000-00-00', '0000-00-00', ''),
(6, 'T06', 1, 'Juin', '0000-00-00', '0000-00-00', ''),
(7, 'T07', 1, 'Juillet', '0000-00-00', '0000-00-00', ''),
(8, 'T08', 1, 'Aout', '0000-00-00', '0000-00-00', ''),
(9, 'T09', 2, 'Septembre', '2024-09-01', '2024-09-30', ''),
(10, 'T10', 1, 'Octobre', '0000-00-00', '0000-00-00', ''),
(11, 'T11', 1, 'Novembre', '0000-00-00', '0000-00-00', ''),
(12, 'T12', 1, 'DÃ©cembre', '0000-00-00', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_comptapieces`
--

CREATE TABLE `t_comptapieces` (
  `id` int(11) NOT NULL,
  `Reference` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Nom` varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_comptareferences`
--

CREATE TABLE `t_comptareferences` (
  `id` int(11) NOT NULL,
  `Reference` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Date_ref` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_comptareferences`
--

INSERT INTO `t_comptareferences` (`id`, `Reference`, `Date_ref`) VALUES
(49, 'ABCD', '2023-02-13 10:59:37'),
(52, 'tst0824', '2023-02-15 09:57:12'),
(88, 'ref2031313', '2023-12-03 09:33:16'),
(89, '3011n', '2024-01-26 08:08:10'),
(90, 'AAA12', '2024-02-10 11:42:19'),
(91, 'AAA13', '2024-02-10 11:47:48'),
(92, 'xydatta', '2024-02-18 07:52:44'),
(94, '123cscs', '2024-03-18 21:49:25'),
(95, 'ASDFRG', '2024-04-16 17:52:31'),
(97, '001', '2024-05-11 11:46:42'),
(98, '002', '2024-05-11 12:01:33'),
(99, '003', '2024-05-11 12:07:30'),
(100, '004(a)', '2024-05-11 12:41:36'),
(101, '004(b)', '2024-05-11 12:44:28'),
(102, '004(c)', '2024-05-11 12:53:00'),
(103, '005', '2024-05-11 12:54:40'),
(104, '006', '2024-05-11 13:02:30'),
(105, '007', '2024-05-11 13:04:58'),
(106, '008', '2024-05-11 13:08:16'),
(107, '009', '2024-05-11 13:14:21'),
(108, '010', '2024-05-11 13:23:55'),
(109, '011', '2024-05-11 13:27:24'),
(110, '012', '2024-05-11 13:30:20'),
(111, '013', '2024-05-11 13:32:03'),
(112, '98878', '2024-05-25 11:48:41'),
(114, '25232', '2025-02-24 19:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `t_comptatypecomptes`
--

CREATE TABLE `t_comptatypecomptes` (
  `id` int(11) NOT NULL,
  `Nom_type` varchar(70) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_comptatypecomptes`
--

INSERT INTO `t_comptatypecomptes` (`id`, `Nom_type`) VALUES
(1, 'Actifs circulants'),
(2, 'Actifs immobilisÃ©s'),
(3, 'Dettes'),
(4, 'Capitaux propres'),
(5, 'Chiffre d\'affaires (ventes/services)'),
(6, 'Charges marchandises'),
(7, 'Charges de personnel'),
(8, 'Autres charges d\'exploitation'),
(9, 'RÃ©sultat des activitÃ©s annexes (produits)'),
(10, 'RÃ©sultat des activitÃ©s annexes (charges)'),
(11, 'RÃ©sultats exceptionnels et impÃ´ts (produits)'),
(12, 'RÃ©sultats exceptionnels et impÃ´ts (charges)');

-- --------------------------------------------------------

--
-- Table structure for table `t_comptavaleurs`
--

CREATE TABLE `t_comptavaleurs` (
  `id` int(11) NOT NULL,
  `Nom` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Valeur` float NOT NULL,
  `refdoc` varchar(250) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'nofile.png',
  `date_modif` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_comptavaleurs`
--

INSERT INTO `t_comptavaleurs` (`id`, `Nom`, `Valeur`, `refdoc`, `date_modif`) VALUES
(1, 'Taux', 2900, '829456806__2900.png', '2025-02-12 07:53:46'),
(2, 'TVA', 16, '', '2023-11-23 11:27:20');

-- --------------------------------------------------------

--
-- Table structure for table `t_contact_fournisseur`
--

CREATE TABLE `t_contact_fournisseur` (
  `id` int(11) NOT NULL,
  `fournisseur_id` int(11) NOT NULL,
  `type_contact` varchar(50) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_contact_fournisseur`
--

INSERT INTO `t_contact_fournisseur` (`id`, `fournisseur_id`, `type_contact`, `nom`, `telephone`, `email`) VALUES
(32, 45, 'principale', 'Hank Akim', '0782640107', 'hnkakim@gmail.com'),
(33, 45, 'facturation', 'Hank Akim', '0782640107', 'hnkakim@gmail.com'),
(34, 45, 'technique', 'Hank Akim', '0782640107', 'hnkakim@gmail.com'),
(35, 46, 'principale', 'Hank Akim', '0782640107', 'hnkakim@gmail.com'),
(36, 46, 'facturation', 'Hank Akim', '0782640107', 'hnkakim@gmail.com'),
(37, 46, 'technique', 'Hank Akim', '0782640107', 'hnkakim@gmail.com'),
(38, 47, 'principale', 'Hank Akim', '0782640107', 'hnkakim@gmail.com'),
(39, 47, 'facturation', 'Hank Akim', '0782640107', 'hnkakim@gmail.com'),
(40, 47, 'technique', 'Hank Akim', '0782640107', 'hnkakim@gmail.com'),
(41, 48, 'principale', 'Hank Akim', '0782640107', 'hnkakim@gmail.com'),
(42, 49, 'principale', 'Hank Akim', '0782640107', 'hnkakim@gmail.com'),
(43, 50, 'principale', 'Babi Kamara Hank Akim', '0991898723', 'hnkakim@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `t_document_fournisseur`
--

CREATE TABLE `t_document_fournisseur` (
  `id` int(11) NOT NULL,
  `fournisseur_id` int(11) NOT NULL,
  `nom_original` varchar(255) NOT NULL,
  `type_document` varchar(50) NOT NULL,
  `nom_genere` varchar(255) NOT NULL,
  `chemin_fichier` varchar(255) NOT NULL,
  `date_emission` date DEFAULT NULL,
  `date_expiration` date DEFAULT NULL,
  `upload_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ajoute_par` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_document_fournisseur`
--

INSERT INTO `t_document_fournisseur` (`id`, `fournisseur_id`, `nom_original`, `type_document`, `nom_genere`, `chemin_fichier`, `date_emission`, `date_expiration`, `upload_date`, `ajoute_par`) VALUES
(15, 45, 'ANALYSE DE MARCHÃ.docx', 'Contrat', 'fichier-1753557044350-764219534.pdf', 'C:\\MAMP\\htdocs\\logistique\\uploads\\fichier-1753557044350-764219534.pdf', '2025-07-16', '2025-08-22', '2025-07-25 10:24:47', NULL),
(16, 45, 'ANALYSE DE MARCHÃ.docx', 'Contrat', 'fichier-1753556974750-585746782.docx', 'C:\\MAMP\\htdocs\\logistique\\uploads\\fichier-1753556974750-585746782.docx', '2025-07-08', '2025-07-18', '2025-07-26 19:09:34', NULL),
(17, 45, 'd.docx', 'Contrat', 'fichier-1753557093985-603972173.docx', 'C:\\MAMP\\htdocs\\logistique\\uploads\\fichier-1753557093985-603972173.docx', '2025-07-08', '2025-11-21', '2025-07-26 19:11:33', NULL),
(18, 46, 'CV hank en.pdf', 'Contrat', 'fichier-1753695392717-325286682.pdf', 'C:\\MAMP\\htdocs\\logistique\\uploads\\fichier-1753695392717-325286682.pdf', '2025-07-18', '2025-08-03', '2025-07-28 09:36:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_entreprise`
--

CREATE TABLE `t_entreprise` (
  `id_entreprise` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_entreprise`
--

INSERT INTO `t_entreprise` (`id_entreprise`, `nom`) VALUES
(1, 'Entreprise Test');

-- --------------------------------------------------------

--
-- Table structure for table `t_evaluation_fournisseur`
--

CREATE TABLE `t_evaluation_fournisseur` (
  `id_evaluation` int(11) NOT NULL,
  `id_fournisseur` int(11) NOT NULL,
  `id_entreprise` int(11) NOT NULL DEFAULT '1',
  `id_utilisateur` int(11) NOT NULL,
  `qualite` int(11) DEFAULT NULL,
  `delai` int(11) DEFAULT NULL,
  `conformite` int(11) DEFAULT NULL,
  `service` int(11) DEFAULT NULL,
  `cout` int(2) NOT NULL DEFAULT '0',
  `communication` int(11) DEFAULT NULL,
  `score_global` float DEFAULT NULL,
  `commentaire` text,
  `date_evaluation` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_evaluation_fournisseur`
--

INSERT INTO `t_evaluation_fournisseur` (`id_evaluation`, `id_fournisseur`, `id_entreprise`, `id_utilisateur`, `qualite`, `delai`, `conformite`, `service`, `cout`, `communication`, `score_global`, `commentaire`, `date_evaluation`) VALUES
(34, 45, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, '2025-07-25 11:28:04'),
(35, 45, 1, 1, 1, 1, 3, 1, 1, 1, 1.33333, '33', '2025-07-25 11:30:37'),
(36, 46, 1, 1, 8, 8, 8, 8, 8, 8, 8, NULL, '2025-07-28 14:41:34'),
(37, 46, 1, 1, 2, 2, 3, 2, 2, 2, 2.16667, '31331', '2025-07-28 14:43:21'),
(38, 48, 1, 1, 4, 4, 4, 4, 4, 4, 4, '21213', '2025-07-28 14:53:30'),
(39, 47, 1, 1, 8, 8, 8, 8, 8, 8, 8, NULL, '2025-07-29 08:57:03'),
(40, 50, 1, 1, 6, 9, 8, 4, 10, 1, 6.33333, NULL, '2025-07-29 09:00:10'),
(41, 49, 1, 1, 6, 6, 6, 6, 6, 6, 6, NULL, '2025-07-29 09:45:51'),
(42, 50, 1, 1, 9, 5, 5, 5, 5, 5, 5.66667, NULL, '2025-07-29 09:49:46'),
(43, 49, 1, 1, 9, 9, 9, 9, 9, 9, 9, NULL, '2025-07-29 09:51:36');

-- --------------------------------------------------------

--
-- Table structure for table `t_fournisseur`
--

CREATE TABLE `t_fournisseur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `nom_commercial` varchar(255) DEFAULT NULL,
  `nif` varchar(50) DEFAULT NULL,
  `tva` varchar(50) DEFAULT NULL,
  `statut_juridique` varchar(100) DEFAULT NULL,
  `adresse_siege` varchar(255) DEFAULT NULL,
  `adresse_facturation` varchar(255) DEFAULT NULL,
  `adresse_livraison` varchar(255) DEFAULT NULL,
  `site_web` varchar(255) DEFAULT NULL,
  `rib_iban` varchar(100) DEFAULT NULL,
  `banque` varchar(255) DEFAULT NULL,
  `adresse_banque` varchar(255) DEFAULT NULL,
  `conditions_paiement` varchar(100) DEFAULT NULL,
  `conditions_generales_vente` text,
  `devise` varchar(10) DEFAULT NULL,
  `credit_info` varchar(100) DEFAULT NULL,
  `description` text,
  `tarifs` varchar(255) DEFAULT NULL,
  `delai_livraison` varchar(100) DEFAULT NULL,
  `conditions_garantie` varchar(255) DEFAULT NULL,
  `date_debut_relation` date DEFAULT NULL,
  `date_fin_contrat` date DEFAULT NULL,
  `reference_contrat` varchar(100) DEFAULT NULL,
  `certifications` varchar(255) DEFAULT NULL,
  `remarques` text,
  `last_update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `statut` varchar(50) DEFAULT 'En attente',
  `score` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_fournisseur`
--

INSERT INTO `t_fournisseur` (`id`, `nom`, `nom_commercial`, `nif`, `tva`, `statut_juridique`, `adresse_siege`, `adresse_facturation`, `adresse_livraison`, `site_web`, `rib_iban`, `banque`, `adresse_banque`, `conditions_paiement`, `conditions_generales_vente`, `devise`, `credit_info`, `description`, `tarifs`, `delai_livraison`, `conditions_garantie`, `date_debut_relation`, `date_fin_contrat`, `reference_contrat`, `certifications`, `remarques`, `last_update`, `statut`, `score`) VALUES
(45, 'Agrokivu', 'Agrokivu', '12312321', '12424', 'vente en gros', 'goma', 'goma', 'partout', 'http://localhost/logistique/Gestion_des_fournisseurs.php#', '12321422', 'Equity', 'Kigali', 'cash', NULL, 'usd', 'solvable', 'Bon partenaire', 'Abordable', '30 jours', '123213', '2025-07-01', '2025-10-24', '1213213', 'vallide', NULL, '2025-07-25 11:30:37', 'Suspendu', 1.16667),
(46, 'Glomeec', 'Akim', '21332', 'Q2221321321321', 'VENTE', 'Kigali', 'Gisozi', 'GOMA', 'http://localhost:3000/uploads/fichier-1753439086993-282321288.docx', '21334', 'WQEWQE', 'QWEWQE', 'WQEWQEf', 'saddsadsa', 'fc', 'SOLVABLE', 'asdsad', 'asdsad', 'sadsad', 'asdsa', '2025-07-10', '2025-07-31', 'sadsadsasadsaddsa', 'asdsadasdsadas', 'sadsadasds', '2025-07-28 14:43:21', 'Suspendu', 5.08333),
(47, 'kivu kawa', 'kivu kawa', '213213', '123213', 'vente', 'Kigali', 'Gisozi', 'goma', 'http://localhost/phpMyAdmin/index.php?route=/sql&server=1&db=c1743910c_aurorardc&table=t_evaluation_fournisseur&pos=0', 'qwe', 'wqe', 'wqewqe', 'wqewqe', 'sadsadsd', 'FC', 'solvable', 'asffsa', 'abordable', '30 jours', 'asd', '2025-07-08', '2027-07-31', 'sad', 'sad', 'sadsd', '2025-07-29 08:57:03', 'Suspendu', 8),
(48, 'Glomeec', 'Akim', NULL, NULL, NULL, 'Kigali', 'Gisozi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 14:53:30', 'Suspendu', 4),
(49, 'General Directorate of Revenues of North Kivu (DGRN-K) – Goma, DRC', 'Akim', NULL, NULL, NULL, 'Kagugu behind fawe girls', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-29 09:51:36', 'Suspendu', 7.5),
(50, 'General Directorate of Revenues of North Kivu (DGRN-K) – Goma, DRC', 'Hank Akim', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Babi Kamara Hank Akim', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-29 09:49:46', 'Suspendu', 6);

-- --------------------------------------------------------

--
-- Table structure for table `t_incident_fournisseur`
--

CREATE TABLE `t_incident_fournisseur` (
  `id_incident` int(11) NOT NULL,
  `id_fournisseur` int(11) NOT NULL,
  `type_incident` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gravite` enum('Faible','Moyenne','Élevée') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Faible',
  `statut_incident` enum('Ouvert','Résolu') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Ouvert',
  `description` text COLLATE utf8mb4_unicode_ci,
  `date_incident` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_incident_fournisseur`
--

INSERT INTO `t_incident_fournisseur` (`id_incident`, `id_fournisseur`, `type_incident`, `gravite`, `statut_incident`, `description`, `date_incident`) VALUES
(1, 50, 'Retard de livraison', 'Moyenne', 'Ouvert', 'adsadsadsadsa', '2025-07-29 10:28:21');

-- --------------------------------------------------------

--
-- Table structure for table `t_ponderations_entreprise`
--

CREATE TABLE `t_ponderations_entreprise` (
  `id_entreprise` int(11) NOT NULL,
  `critere` varchar(50) NOT NULL,
  `poids` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_ponderations_entreprise`
--

INSERT INTO `t_ponderations_entreprise` (`id_entreprise`, `critere`, `poids`) VALUES
(1, 'communication', 10),
(1, 'conformite', 10),
(1, 'cout', 10),
(1, 'delai', 13),
(1, 'qualite', 29),
(1, 'service', 20);

-- --------------------------------------------------------

--
-- Table structure for table `t_produit_service`
--

CREATE TABLE `t_produit_service` (
  `id` int(11) NOT NULL,
  `fournisseur_id` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_produit_service`
--

INSERT INTO `t_produit_service` (`id`, `fournisseur_id`, `description`) VALUES
(5, 45, 'vente, formation'),
(6, 46, 'Vente detail, BTB, BTC'),
(7, 47, 'asafs');

-- --------------------------------------------------------

--
-- Table structure for table `t_salairebase`
--

CREATE TABLE `t_salairebase` (
  `Id` int(11) NOT NULL,
  `Montant` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_salairebase`
--

INSERT INTO `t_salairebase` (`Id`, `Montant`) VALUES
(1, 120);

-- --------------------------------------------------------

--
-- Table structure for table `t_utilisateur`
--

CREATE TABLE `t_utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `role` enum('evaluateur','admin','autre') DEFAULT 'evaluateur',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_utilisateur`
--

INSERT INTO `t_utilisateur` (`id_utilisateur`, `nom`, `email`, `mot_de_passe`, `role`, `date_creation`) VALUES
(1, 'Utilisateur Test', 'test@example.com', '75216c44a46bfff78f692d1fe695c02a407a2136625dcc17ca6cf3141e0c4c72', 'evaluateur', '2025-07-18 17:30:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bons_commande`
--
ALTER TABLE `bons_commande`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_approvisionnement`
--
ALTER TABLE `plan_approvisionnement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_procedure`
--
ALTER TABLE `type_procedure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_about`
--
ALTER TABLE `t_about`
  ADD PRIMARY KEY (`id_about`);

--
-- Indexes for table `t_activites_prog`
--
ALTER TABLE `t_activites_prog`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `t_agendaevents`
--
ALTER TABLE `t_agendaevents`
  ADD PRIMARY KEY (`IdEvent`),
  ADD KEY `evt_start` (`DebutEvent`),
  ADD KEY `evt_end` (`FinEvent`);

--
-- Indexes for table `t_agents`
--
ALTER TABLE `t_agents`
  ADD PRIMARY KEY (`Id_Agent`);

--
-- Indexes for table `t_agentsintegres`
--
ALTER TABLE `t_agentsintegres`
  ADD PRIMARY KEY (`Id_Agent`);

--
-- Indexes for table `t_agent_org`
--
ALTER TABLE `t_agent_org`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `t_alldeloc`
--
ALTER TABLE `t_alldeloc`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `t_allfam`
--
ALTER TABLE `t_allfam`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `t_allloge`
--
ALTER TABLE `t_allloge`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `t_alltrans`
--
ALTER TABLE `t_alltrans`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `t_annonces`
--
ALTER TABLE `t_annonces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_answers`
--
ALTER TABLE `t_answers`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `t_answerskill`
--
ALTER TABLE `t_answerskill`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `t_archiveclasseur`
--
ALTER TABLE `t_archiveclasseur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniqueId` (`uniqueId`),
  ADD KEY `t_archiveclasseur_ibfk_1` (`idUser`);

--
-- Indexes for table `t_archivedossier`
--
ALTER TABLE `t_archivedossier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniqueId` (`uniqueId`),
  ADD KEY `fk_usercc` (`idUser`),
  ADD KEY `fk_classeur` (`idClasseur`);

--
-- Indexes for table `t_archivefichier`
--
ALTER TABLE `t_archivefichier`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_dossier` (`idDossier`),
  ADD KEY `fk_userdoc` (`userID`);

--
-- Indexes for table `t_articles`
--
ALTER TABLE `t_articles`
  ADD PRIMARY KEY (`article_num`);

--
-- Indexes for table `t_avances`
--
ALTER TABLE `t_avances`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `t_avancess`
--
ALTER TABLE `t_avancess`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `t_blog`
--
ALTER TABLE `t_blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_calcul`
--
ALTER TABLE `t_calcul`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `t_cal_parametre`
--
ALTER TABLE `t_cal_parametre`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `t_canal`
--
ALTER TABLE `t_canal`
  ADD PRIMARY KEY (`IdCanal`);

--
-- Indexes for table `t_canalt`
--
ALTER TABLE `t_canalt`
  ADD PRIMARY KEY (`IdCanal`);

--
-- Indexes for table `t_canaltache`
--
ALTER TABLE `t_canaltache`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `t_categorie`
--
ALTER TABLE `t_categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Indexes for table `t_categorie_equipe`
--
ALTER TABLE `t_categorie_equipe`
  ADD PRIMARY KEY (`id_cat_equipe`);

--
-- Indexes for table `t_chatpanel`
--
ALTER TABLE `t_chatpanel`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `t_comment`
--
ALTER TABLE `t_comment`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `t_commentaires`
--
ALTER TABLE `t_commentaires`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `t_comptabilaninitial`
--
ALTER TABLE `t_comptabilaninitial`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `t_comptacomptes`
--
ALTER TABLE `t_comptacomptes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Num_compte` (`Num_compte`);

--
-- Indexes for table `t_comptaecritures`
--
ALTER TABLE `t_comptaecritures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_userId` (`idUser`),
  ADD KEY `fk_journcode` (`TypeJournal`);

--
-- Indexes for table `t_comptaecritureshold`
--
ALTER TABLE `t_comptaecritureshold`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_comptaecriturestempo`
--
ALTER TABLE `t_comptaecriturestempo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`idUser`),
  ADD KEY `fk_journal` (`TypeJournal`);

--
-- Indexes for table `t_comptagrandlivre`
--
ALTER TABLE `t_comptagrandlivre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_comptajournaux`
--
ALTER TABLE `t_comptajournaux`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Code` (`Code`),
  ADD KEY `fk_user_jrn` (`idUser`);

--
-- Indexes for table `t_comptalistecomptes`
--
ALTER TABLE `t_comptalistecomptes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_comptaperiodes`
--
ALTER TABLE `t_comptaperiodes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Code` (`Code`);

--
-- Indexes for table `t_comptapieces`
--
ALTER TABLE `t_comptapieces`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Reference` (`Reference`);

--
-- Indexes for table `t_comptareferences`
--
ALTER TABLE `t_comptareferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Reference` (`Reference`);

--
-- Indexes for table `t_comptatypecomptes`
--
ALTER TABLE `t_comptatypecomptes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_comptavaleurs`
--
ALTER TABLE `t_comptavaleurs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_contact_fournisseur`
--
ALTER TABLE `t_contact_fournisseur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fournisseur_id` (`fournisseur_id`);

--
-- Indexes for table `t_document_fournisseur`
--
ALTER TABLE `t_document_fournisseur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fournisseur_id` (`fournisseur_id`),
  ADD KEY `FK_doc_ajoutepar` (`ajoute_par`);

--
-- Indexes for table `t_entreprise`
--
ALTER TABLE `t_entreprise`
  ADD PRIMARY KEY (`id_entreprise`);

--
-- Indexes for table `t_evaluation_fournisseur`
--
ALTER TABLE `t_evaluation_fournisseur`
  ADD PRIMARY KEY (`id_evaluation`),
  ADD KEY `id_fournisseur` (`id_fournisseur`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `fk_eval_entreprise` (`id_entreprise`);

--
-- Indexes for table `t_fournisseur`
--
ALTER TABLE `t_fournisseur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_incident_fournisseur`
--
ALTER TABLE `t_incident_fournisseur`
  ADD PRIMARY KEY (`id_incident`),
  ADD KEY `idx_fournisseur` (`id_fournisseur`);

--
-- Indexes for table `t_ponderations_entreprise`
--
ALTER TABLE `t_ponderations_entreprise`
  ADD PRIMARY KEY (`id_entreprise`,`critere`);

--
-- Indexes for table `t_produit_service`
--
ALTER TABLE `t_produit_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fournisseur_id` (`fournisseur_id`);

--
-- Indexes for table `t_salairebase`
--
ALTER TABLE `t_salairebase`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `t_utilisateur`
--
ALTER TABLE `t_utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bons_commande`
--
ALTER TABLE `bons_commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `plan_approvisionnement`
--
ALTER TABLE `plan_approvisionnement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `type_procedure`
--
ALTER TABLE `type_procedure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `t_about`
--
ALTER TABLE `t_about`
  MODIFY `id_about` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_activites_prog`
--
ALTER TABLE `t_activites_prog`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `t_agendaevents`
--
ALTER TABLE `t_agendaevents`
  MODIFY `IdEvent` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `t_agents`
--
ALTER TABLE `t_agents`
  MODIFY `Id_Agent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_agentsintegres`
--
ALTER TABLE `t_agentsintegres`
  MODIFY `Id_Agent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `t_agent_org`
--
ALTER TABLE `t_agent_org`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `t_alldeloc`
--
ALTER TABLE `t_alldeloc`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_allfam`
--
ALTER TABLE `t_allfam`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_allloge`
--
ALTER TABLE `t_allloge`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_alltrans`
--
ALTER TABLE `t_alltrans`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_annonces`
--
ALTER TABLE `t_annonces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_answers`
--
ALTER TABLE `t_answers`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `t_answerskill`
--
ALTER TABLE `t_answerskill`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `t_archiveclasseur`
--
ALTER TABLE `t_archiveclasseur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_archivedossier`
--
ALTER TABLE `t_archivedossier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `t_archivefichier`
--
ALTER TABLE `t_archivefichier`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_articles`
--
ALTER TABLE `t_articles`
  MODIFY `article_num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `t_avances`
--
ALTER TABLE `t_avances`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_avancess`
--
ALTER TABLE `t_avancess`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_blog`
--
ALTER TABLE `t_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_calcul`
--
ALTER TABLE `t_calcul`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_cal_parametre`
--
ALTER TABLE `t_cal_parametre`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_canal`
--
ALTER TABLE `t_canal`
  MODIFY `IdCanal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_canalt`
--
ALTER TABLE `t_canalt`
  MODIFY `IdCanal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_canaltache`
--
ALTER TABLE `t_canaltache`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_categorie`
--
ALTER TABLE `t_categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `t_categorie_equipe`
--
ALTER TABLE `t_categorie_equipe`
  MODIFY `id_cat_equipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_chatpanel`
--
ALTER TABLE `t_chatpanel`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `t_comment`
--
ALTER TABLE `t_comment`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_commentaires`
--
ALTER TABLE `t_commentaires`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_comptabilaninitial`
--
ALTER TABLE `t_comptabilaninitial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `t_comptacomptes`
--
ALTER TABLE `t_comptacomptes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `t_comptaecritures`
--
ALTER TABLE `t_comptaecritures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `t_comptaecritureshold`
--
ALTER TABLE `t_comptaecritureshold`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_comptaecriturestempo`
--
ALTER TABLE `t_comptaecriturestempo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_comptagrandlivre`
--
ALTER TABLE `t_comptagrandlivre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_comptajournaux`
--
ALTER TABLE `t_comptajournaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `t_comptalistecomptes`
--
ALTER TABLE `t_comptalistecomptes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=704;

--
-- AUTO_INCREMENT for table `t_comptaperiodes`
--
ALTER TABLE `t_comptaperiodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_comptapieces`
--
ALTER TABLE `t_comptapieces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_comptareferences`
--
ALTER TABLE `t_comptareferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `t_comptatypecomptes`
--
ALTER TABLE `t_comptatypecomptes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_comptavaleurs`
--
ALTER TABLE `t_comptavaleurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_contact_fournisseur`
--
ALTER TABLE `t_contact_fournisseur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `t_document_fournisseur`
--
ALTER TABLE `t_document_fournisseur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `t_entreprise`
--
ALTER TABLE `t_entreprise`
  MODIFY `id_entreprise` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_evaluation_fournisseur`
--
ALTER TABLE `t_evaluation_fournisseur`
  MODIFY `id_evaluation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `t_fournisseur`
--
ALTER TABLE `t_fournisseur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `t_incident_fournisseur`
--
ALTER TABLE `t_incident_fournisseur`
  MODIFY `id_incident` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_produit_service`
--
ALTER TABLE `t_produit_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `t_salairebase`
--
ALTER TABLE `t_salairebase`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_utilisateur`
--
ALTER TABLE `t_utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_contact_fournisseur`
--
ALTER TABLE `t_contact_fournisseur`
  ADD CONSTRAINT `t_contact_fournisseur_ibfk_1` FOREIGN KEY (`fournisseur_id`) REFERENCES `t_fournisseur` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `t_document_fournisseur`
--
ALTER TABLE `t_document_fournisseur`
  ADD CONSTRAINT `FK_doc_ajoutepar` FOREIGN KEY (`ajoute_par`) REFERENCES `t_utilisateur` (`id_utilisateur`) ON DELETE SET NULL,
  ADD CONSTRAINT `t_document_fournisseur_ibfk_1` FOREIGN KEY (`fournisseur_id`) REFERENCES `t_fournisseur` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `t_evaluation_fournisseur`
--
ALTER TABLE `t_evaluation_fournisseur`
  ADD CONSTRAINT `fk_eval_entreprise` FOREIGN KEY (`id_entreprise`) REFERENCES `t_entreprise` (`id_entreprise`),
  ADD CONSTRAINT `t_evaluation_fournisseur_ibfk_1` FOREIGN KEY (`id_fournisseur`) REFERENCES `t_fournisseur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `t_evaluation_fournisseur_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `t_utilisateur` (`id_utilisateur`);

--
-- Constraints for table `t_incident_fournisseur`
--
ALTER TABLE `t_incident_fournisseur`
  ADD CONSTRAINT `fk_incident_fournisseur` FOREIGN KEY (`id_fournisseur`) REFERENCES `t_fournisseur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `t_ponderations_entreprise`
--
ALTER TABLE `t_ponderations_entreprise`
  ADD CONSTRAINT `t_ponderations_entreprise_ibfk_1` FOREIGN KEY (`id_entreprise`) REFERENCES `t_entreprise` (`id_entreprise`) ON DELETE CASCADE;

--
-- Constraints for table `t_produit_service`
--
ALTER TABLE `t_produit_service`
  ADD CONSTRAINT `t_produit_service_ibfk_1` FOREIGN KEY (`fournisseur_id`) REFERENCES `t_fournisseur` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
