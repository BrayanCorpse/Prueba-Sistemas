
CREATE DATABASE pruebavacante;

USE pruebavacante;


CREATE TABLE `migrations` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` INT(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT  INTO `migrations`(`id`,`migration`,`batch`) VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2020_11_08_163734_create_rooms_table',2),(5,'2020_11_08_163753_create_hotels_table',2),(6,'2020_11_08_163816_create_visits_table',3);


CREATE TABLE `password_resets` (
  `email` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `rooms` (
  `idr` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` INT(11) NOT NULL,
  `floor` INT(11) NOT NULL,
  `description` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` DOUBLE(8,2) NOT NULL,
  `remember_token` VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`idr`)
) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT  INTO `rooms`(`idr`,`tipo`,`number`,`floor`,`description`,`price`,`remember_token`,`created_at`,`updated_at`) VALUES (1,'Individual',27,3,'Habitación basica para una sola persona',500.00,NULL,NULL,NULL),(2,'Doble',12,1,'Habitación comoda asignada a dos personas',1200.00,NULL,NULL,NULL),(3,'Queen',35,3,'Habitación comoda con una cama de matrimonio',1500.00,NULL,NULL,NULL),(4,'King',50,4,'Habitación comoda con una cama king-size. Puede ser ocupado por una o más personas.',2300.00,NULL,NULL,NULL),(5,'Suite Ejecutiva',70,5,'Una habitación con uno o más dormitorios y una sala de estar separada.',4000.00,NULL,NULL,NULL),(6,'Suite presidencial',90,6,'Habitación con todas las comodidades sala decorada y dos habitaciones.',8000.00,NULL,NULL,NULL);

CREATE TABLE `hotels` (
  `idh` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` VARCHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` INT(11) NOT NULL,
  `idr` INT(10) UNSIGNED NOT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `remember_token` VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`idh`),
  KEY `hotels_idr_foreign` (`idr`),
  CONSTRAINT `hotels_idr_foreign` FOREIGN KEY (`idr`) REFERENCES `rooms` (`idr`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT  INTO `hotels`(`idh`,`name`,`location`,`phone`,`email`,`capacity`,`idr`,`deleted_at`,`remember_token`,`created_at`,`updated_at`) VALUES (1,'Love Hotel','Patriotismo 53, Colonia Escandón, CDMX.','5578654678','lovehotal@love.com',100,5,NULL,NULL,NULL,NULL),(2,'Seven sins','Av. Universidad 1905, Colonia Copilco, Tlalpan, CDMX.','5587654345','seven@sevensins.com.mx',200,6,NULL,NULL,NULL,NULL),(3,'Picasso','Salvador Sánchez 130, Colonia Valle Verde, Toluca.','7224567890','picaso@picaso.online',50,3,NULL,NULL,NULL,NULL);

CREATE TABLE `users` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` TIMESTAMP NULL DEFAULT NULL,
  `password` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT  INTO `users`(`id`,`name`,`lastname`,`email`,`photo`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) VALUES (4,'Brayan','Manzano','manzanocortesbrayan@gmail.com','storage/yo.jpg',NULL,'$2y$10$SzT6/bwHd8TypBAbcAmAzOzDIsobCks12YNN8yqogPsALKAQVdCH2',NULL,'2020-11-06 23:27:35','2020-11-06 23:27:35'),(5,'Carlos','Wane','car@gmail.com',NULL,NULL,'$2y$10$VY/NV7fH3NbTjK3b/Tw0decdrUZHOwsmvLX3tFpcnCWAuefvzC.9y',NULL,'2020-11-06 23:56:17','2020-11-06 23:56:17'),(6,'Marcus','Dantus','marcus@gmail.com',NULL,NULL,'$2y$10$8sD7IIrV0mAX6VcgO7M0u.866y0el7trgdIfvgEM8z..h3yIUq3pa',NULL,'2020-11-08 04:53:37','2020-11-08 04:53:37'),(7,'Sergio','Reyes','ser@hotmail.com',NULL,NULL,'$2y$10$0KbCNIwm75TFFWZOd2Bp9eZGW/DGkMtn.kPUHZfC.Ixn1n2ksqbva',NULL,'2020-11-09 17:40:26','2020-11-09 17:40:26');


DROP TABLE IF EXISTS `visits`;

CREATE TABLE `visits` (
  `idv` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idh` INT(10) UNSIGNED NOT NULL,
  `idu` BIGINT(20) UNSIGNED NOT NULL,
  `fecha` VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visits` INT(11) NOT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `remember_token` VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`idv`),
  KEY `visits_idh_foreign` (`idh`),
  KEY `visits_idu_foreign` (`idu`),
  CONSTRAINT `visits_idh_foreign` FOREIGN KEY (`idh`) REFERENCES `hotels` (`idh`),
  CONSTRAINT `visits_idu_foreign` FOREIGN KEY (`idu`) REFERENCES `users` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

