/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.7.24 : Database - pruebavacante
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pruebavacante` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `pruebavacante`;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `hotels` */

DROP TABLE IF EXISTS `hotels`;

CREATE TABLE `hotels` (
  `idh` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int(11) NOT NULL,
  `idr` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idh`),
  KEY `hotels_idr_foreign` (`idr`),
  CONSTRAINT `hotels_idr_foreign` FOREIGN KEY (`idr`) REFERENCES `rooms` (`idr`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `hotels` */

insert  into `hotels`(`idh`,`name`,`location`,`phone`,`email`,`capacity`,`idr`,`deleted_at`,`remember_token`,`created_at`,`updated_at`) values (1,'Love Hotel','Patriotismo 53, Colonia Escandón, CDMX.','5578654678','lovehotal@love.com',100,5,NULL,NULL,NULL,NULL),(2,'Seven sins','Av. Universidad 1905, Colonia Copilco, Tlalpan, CDMX.','5587654345','seven@sevensins.com.mx',200,6,NULL,NULL,NULL,NULL),(3,'Picasso','Salvador Sánchez 130, Colonia Valle Verde, Toluca.','7224567890','picaso@picaso.online',50,3,NULL,NULL,NULL,NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2020_11_08_163734_create_rooms_table',2),(5,'2020_11_08_163753_create_hotels_table',2),(6,'2020_11_08_163816_create_visits_table',3);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `rooms` */

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `idr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idr`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `rooms` */

insert  into `rooms`(`idr`,`tipo`,`number`,`floor`,`description`,`price`,`remember_token`,`created_at`,`updated_at`) values (1,'Individual',27,3,'Habitación basica para una sola persona',500.00,NULL,NULL,NULL),(2,'Doble',12,1,'Habitación comoda asignada a dos personas',1200.00,NULL,NULL,NULL),(3,'Queen',35,3,'Habitación comoda con una cama de matrimonio',1500.00,NULL,NULL,NULL),(4,'King',50,4,'Habitación comoda con una cama king-size. Puede ser ocupado por una o más personas.',2300.00,NULL,NULL,NULL),(5,'Suite Ejecutiva',70,5,'Una habitación con uno o más dormitorios y una sala de estar separada.',4000.00,NULL,NULL,NULL),(6,'Suite presidencial',90,6,'Habitación con todas las comodidades sala decorada y dos habitaciones.',8000.00,NULL,NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`lastname`,`email`,`photo`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (4,'Brayan','Manzano','manzanocortesbrayan@gmail.com','storage/yo.jpg',NULL,'$2y$10$SzT6/bwHd8TypBAbcAmAzOzDIsobCks12YNN8yqogPsALKAQVdCH2',NULL,'2020-11-06 23:27:35','2020-11-06 23:27:35'),(5,'Carlos','Wane','car@gmail.com',NULL,NULL,'$2y$10$VY/NV7fH3NbTjK3b/Tw0decdrUZHOwsmvLX3tFpcnCWAuefvzC.9y',NULL,'2020-11-06 23:56:17','2020-11-06 23:56:17'),(6,'Marcus','Dantus','marcus@gmail.com',NULL,NULL,'$2y$10$8sD7IIrV0mAX6VcgO7M0u.866y0el7trgdIfvgEM8z..h3yIUq3pa',NULL,'2020-11-08 04:53:37','2020-11-08 04:53:37'),(7,'Sergio','Reyes','ser@hotmail.com',NULL,NULL,'$2y$10$0KbCNIwm75TFFWZOd2Bp9eZGW/DGkMtn.kPUHZfC.Ixn1n2ksqbva',NULL,'2020-11-09 17:40:26','2020-11-09 17:40:26');

/*Table structure for table `visits` */

DROP TABLE IF EXISTS `visits`;

CREATE TABLE `visits` (
  `idv` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idh` int(10) unsigned NOT NULL,
  `idu` bigint(20) unsigned NOT NULL,
  `fecha` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visits` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idv`),
  KEY `visits_idh_foreign` (`idh`),
  KEY `visits_idu_foreign` (`idu`),
  CONSTRAINT `visits_idh_foreign` FOREIGN KEY (`idh`) REFERENCES `hotels` (`idh`),
  CONSTRAINT `visits_idu_foreign` FOREIGN KEY (`idu`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `visits` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
