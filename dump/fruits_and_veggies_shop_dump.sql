-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 20 oct. 2024 à 10:09
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `fruits_and_veggies_shop`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `type`) VALUES
(4, 'cat1'),
(5, 'cat2'),
(6, 'cat3');

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `adress` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `zip_code` char(5) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `category` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `adress`, `zip_code`, `city`, `category`) VALUES
(1, 'Emily', 'BlueHair', '2 Willow Lane', '8888', 'Pelican Town', 1),
(2, 'Lewis', 'Mayor', 'Mayor\'s Manor', '8888', 'Pelican Town', 2),
(3, 'George', 'Oldman', '1 River Road', '8888', 'Pelican Town', 2),
(4, 'Sandy', 'DesertLady', 'Oasis', '0167', 'The Desert', 1),
(5, 'Abigail', 'Purple', 'Pierre\'s General Store', '8888', 'Pelican Town', 1),
(6, 'Demetrius', 'Brown', '24 Mountain Road', '8888', 'Pelican Town', 2);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_11_24_145812_init_playground', 1),
(2, '2020_11_24_145812_init_playground', 1);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `delivery` varchar(45) DEFAULT NULL,
  `date` date NOT NULL,
  `status` tinyint DEFAULT NULL,
  `shipping_cost_id` int NOT NULL,
  `number` int NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`,`shipping_cost_id`,`customer_id`),
  KEY `fk_shippingcost_order` (`shipping_cost_id`),
  KEY `fk_customers_order` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `delivery`, `date`, `status`, `shipping_cost_id`, `number`, `customer_id`) VALUES
(1, 'babar', '2024-07-04', NULL, 4, 1, 1),
(2, 'fedex', '2024-06-28', 1, 5, 2, 1),
(3, 'deliveroo', '2024-07-01', 1, 3, 3, 2),
(4, 'fedex', '2024-06-29', 1, 5, 4, 2),
(5, 'ups', '2024-07-04', 0, 4, 5, 2),
(11, 'ups', '2024-07-04', 1, 4, 6, 2),
(12, 'ups', '2024-07-04', 1, 4, 7, 2),
(13, 'ups', '2024-07-04', 1, 4, 8, 2);

-- --------------------------------------------------------

--
-- Structure de la table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
CREATE TABLE IF NOT EXISTS `order_product` (
  `product_id` int NOT NULL,
  `order_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`product_id`,`order_id`),
  KEY `fk_product_has_order_order1_idx` (`order_id`),
  KEY `fk_product_has_order_product_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `order_product`
--

INSERT INTO `order_product` (`product_id`, `order_id`, `quantity`) VALUES
(1, 1, 1),
(1, 3, 1),
(1, 5, 1),
(1, 11, 2),
(2, 1, 2),
(2, 4, 2),
(2, 12, 1),
(3, 13, 5),
(5, 2, 2),
(5, 3, 1),
(6, 2, 1),
(6, 4, 1),
(6, 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `productAvailability` tinyint DEFAULT NULL,
  `productImage` varchar(45) DEFAULT NULL,
  `productDescription` longtext,
  `price` float DEFAULT NULL,
  `productWeight` float DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `fruitOrVeggie` varchar(16) NOT NULL,
  `season` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ripenessLevel` int DEFAULT NULL,
  `origin` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `organic` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `productAvailability`, `productImage`, `productDescription`, `price`, `productWeight`, `quantity`, `category_id`, `fruitOrVeggie`, `season`, `ripenessLevel`, `origin`, `organic`) VALUES
(1, 'banane', 1, 'images/bananes.jpg', 'Comme le disait le grand sage Benjamin G : \"Banana, mother fucker !\"', 105, 1000, 110, 4, 'fruit', 'été/automne', 4, 'Guyane', 0),
(2, 'tomate', 1, 'images/tomate.jpg', 'Une belle tomate rouge.', 105, 1000, 10, 4, 'veggie', '', 0, '', 0),
(3, 'oignon', 1, 'images/oignon.jpg', 'Il vous fera pleurer de joie tellement il est bon !', 10.5, 500, 1, 4, 'veggie', '', 0, '', 0),
(5, 'poire', 0, 'images/poire.jpg', 'Juteuse et parfumée.', 10.5, 500, 1, 4, 'fruit', 'été/automne', 5, 'Savoie - France', 1),
(6, 'courgette', 0, 'images/courgette.png', 'jolie courgette qui vient directement du potager', 10.5, 500, 1, 4, 'veggie', '', 0, '', 0),
(8, 'melon', 1, 'images/melon.jpg', 'melon bien rond et qui sent bon', 13, 500, 0, 5, 'fruit', 'été', 5, 'Charentes - France', 0),
(9, 'chicon', 1, 'images/chicon.jpg', 'les chicons cest bon!', 13, 500, 0, 5, 'veggie', '', 0, '', 0),
(10, 'pêche', 1, 'images/peche.jpg', 'peaches, peaches, peaches, peaches...', 50, 1200, 2, 5, 'fruit', 'été', 7, 'Drôme - France', 0),
(11, 'carotte', 1, 'images/carotte.png', 'orange', 50, 1200, 2, 5, 'veggie', '', 0, '', 0),
(12, 'orange', 1, 'images/orange.png', 'ronde et pleine de vitamine C', 500, 1200, 5, 6, 'fruit', 'hiver', 7, 'Alpes Maritimes - France', 0),
(13, 'truffe noire', 1, 'images/truffe.jpg', 'brillante, noire, parfumée', 500, 1200, 5, 6, 'veggie', '', 0, '', 0),
(14, 'ananas', 1, 'images/ananas.png', 'coloré et sent très bon !', 500, 1200, 5, 6, 'fruit', 'printemps', 4, 'Costarica', 1),
(15, 'pastèque', 1, 'images/pasteque.png', 'rafraichissante ronde juteuse', 157.5, 2000, 10, 4, 'fruit', 'été', 5, 'Espagne', 0),
(18, 'carambole', NULL, 'images/carambole.jpg', 'Le fruit étoile, très bon pour la santé.', 10000, 20, 1, NULL, 'fruit', NULL, NULL, NULL, NULL),
(19, 'petit pois', NULL, 'petitpois.png', 'des petits pois qui sont verts', 400, 1000, 100, NULL, 'veggie', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(100) NOT NULL,
  `user_id` int DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` longtext,
  `last_activity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`),
  KEY `index_activity` (`last_activity`),
  KEY `index_ip_address` (`ip_address`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('nbCjt6GFJ7b76Fol1qGKW5mOLWlaRa2lwJn7QYku', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXBOZ3dsa3ZWRnp1VnFZTFk5dUc3Rjl0OE5ERTFZaWtHU1F2OEdkdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1729418886);

-- --------------------------------------------------------

--
-- Structure de la table `shipping_cost`
--

DROP TABLE IF EXISTS `shipping_cost`;
CREATE TABLE IF NOT EXISTS `shipping_cost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `poids_min` int DEFAULT NULL,
  `poids_max` int DEFAULT NULL,
  `prix` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `shipping_cost`
--

INSERT INTO `shipping_cost` (`id`, `poids_min`, `poids_max`, `prix`) VALUES
(3, 0, 500, 5),
(4, 500, 2000, 4),
(5, 2000, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sql_playground_test`
--

DROP TABLE IF EXISTS `sql_playground_test`;
CREATE TABLE IF NOT EXISTS `sql_playground_test` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sql_playground_test`
--

INSERT INTO `sql_playground_test` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Campus Numérique In The Alps', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_customers_orders` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_shippingcost_orders` FOREIGN KEY (`shipping_cost_id`) REFERENCES `shipping_cost` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `fk_order_product_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `fk_order_product_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
