-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: simAssetUmk
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accreditations`
--

DROP TABLE IF EXISTS `accreditations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accreditations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `filepath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accreditations`
--

LOCK TABLES `accreditations` WRITE;
/*!40000 ALTER TABLE `accreditations` DISABLE KEYS */;
INSERT INTO `accreditations` VALUES (2,'bbCl3FYRvBKORYnjuZjD.png','2023-07-30 05:40:49','2023-07-30 06:27:58');
/*!40000 ALTER TABLE `accreditations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accreditations_translations`
--

DROP TABLE IF EXISTS `accreditations_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accreditations_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `accreditation_id` bigint unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descriptions` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accreditations_translations_accreditation_id_locale_unique` (`accreditation_id`,`locale`),
  KEY `accreditations_translations_locale_index` (`locale`),
  CONSTRAINT `accreditations_translations_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accreditations_translations`
--

LOCK TABLES `accreditations_translations` WRITE;
/*!40000 ALTER TABLE `accreditations_translations` DISABLE KEYS */;
INSERT INTO `accreditations_translations` VALUES (1,2,'id','<p>Foto ini merupakan sertifikat akreditasi yang dikeluarkan oleh Badan Akreditasi Nasional Perguruan Tinggi (BAN-PT). Sertifikat ini merupakan pengakuan resmi bahwa perguruan tinggi telah memenuhi standar mutu yang ditetapkan oleh BAN-PT dalam melaksanakan program pendidikan. Sertifikat ini menegaskan bahwa perguruan tinggi memiliki kurikulum yang relevan, staf pengajar yang berkualitas, fasilitas yang memadai, dan sistem penjaminan mutu yang baik. Dengan sertifikat akreditasi ini, perguruan tinggi dapat diakui secara nasional dan internasional sebagai lembaga pendidikan yang terpercaya dan berkualitas.</p>'),(2,2,'en','<p>This photo is an accreditation certificate issued by the National Accreditation Board for Higher Education (BAN-PT). This certificate is an official acknowledgment that the tertiary institution has met the quality standards set by BAN-PT in implementing educational programs. The certificate confirms that the institution has a relevant curriculum, qualified faculty members, adequate facilities and a sound quality assurance system. With this accreditation certificate, this institution is recognized nationally and internationally as a trusted and quality educational institution.</p>');
/*!40000 ALTER TABLE `accreditations_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acquisition_methods`
--

DROP TABLE IF EXISTS `acquisition_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acquisition_methods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acquisition_methods`
--

LOCK TABLES `acquisition_methods` WRITE;
/*!40000 ALTER TABLE `acquisition_methods` DISABLE KEYS */;
INSERT INTO `acquisition_methods` VALUES (1,'Uang sendiri','2024-03-07 18:13:44','2024-03-07 18:13:44'),(2,'Hibah','2024-03-07 18:13:53','2024-03-07 18:13:53'),(3,'Pemberian','2024-03-07 18:13:59','2024-03-07 18:13:59');
/*!40000 ALTER TABLE `acquisition_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_categories`
--

DROP TABLE IF EXISTS `asset_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_categories_asset_id_foreign` (`asset_id`),
  KEY `asset_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `asset_categories_asset_id_foreign` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`),
  CONSTRAINT `asset_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_categories`
--

LOCK TABLES `asset_categories` WRITE;
/*!40000 ALTER TABLE `asset_categories` DISABLE KEYS */;
INSERT INTO `asset_categories` VALUES (1,'e6b510ca-7800-48e0-8152-2806b6ac755d',2),(2,'09c79bdf-1c62-47d8-a049-f6615254d2e3',3),(3,'fb85e26f-1199-4160-a652-79497a4dac2d',3);
/*!40000 ALTER TABLE `asset_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acquisition_method_id` bigint unsigned NOT NULL,
  `condition_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_purchase` date NOT NULL,
  `purchase_price` int NOT NULL,
  `purchase_receipt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int NOT NULL,
  `total_price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_acquisition_method_id_foreign` (`acquisition_method_id`),
  KEY `assets_condition_id_foreign` (`condition_id`),
  CONSTRAINT `assets_acquisition_method_id_foreign` FOREIGN KEY (`acquisition_method_id`) REFERENCES `acquisition_methods` (`id`),
  CONSTRAINT `assets_condition_id_foreign` FOREIGN KEY (`condition_id`) REFERENCES `conditions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES ('09c79bdf-1c62-47d8-a049-f6615254d2e3',2,1,'Theodore Winters','2000-11-23',19,NULL,'Qui obcaecati tempor',127,2413,'2024-03-07 18:18:36','2024-03-07 18:18:36'),('e6b510ca-7800-48e0-8152-2806b6ac755d',3,1,'ROUER ASUS RT-AX5400','2024-03-08',2000000,NULL,'barang baru',4,8000000,'2024-03-07 18:18:25','2024-03-07 18:18:25'),('fb85e26f-1199-4160-a652-79497a4dac2d',1,1,'Alana Baker','1974-04-17',253,NULL,'Ea assumenda quas vo',822,207966,'2024-03-07 18:18:45','2024-03-07 18:18:45');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildings`
--

DROP TABLE IF EXISTS `buildings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildings`
--

LOCK TABLES `buildings` WRITE;
/*!40000 ALTER TABLE `buildings` DISABLE KEYS */;
INSERT INTO `buildings` VALUES (1,'Gedung GIC update','2024-03-07 18:10:36','2024-03-07 18:10:36'),(2,'Gedung A','2024-03-07 18:10:50','2024-03-07 18:10:50'),(3,'Gedung B','2024-03-07 18:10:56','2024-03-07 18:10:56'),(4,'Gedung C','2024-03-07 18:11:04','2024-03-07 18:11:04');
/*!40000 ALTER TABLE `buildings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Elektronik','2024-03-07 18:13:09','2024-03-07 18:13:09'),(2,'Jarigan','2024-03-07 18:13:15','2024-03-07 18:13:15'),(3,'Server','2024-03-07 18:13:19','2024-03-07 18:13:19');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conditions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
INSERT INTO `conditions` VALUES (1,'Baru','2024-03-07 18:13:29','2024-03-07 18:13:29'),(2,'Rusak','2024-03-07 18:13:33','2024-03-07 18:13:33');
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculums`
--

DROP TABLE IF EXISTS `curriculums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curriculums` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` int NOT NULL,
  `credit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `syllabus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculums`
--

LOCK TABLES `curriculums` WRITE;
/*!40000 ALTER TABLE `curriculums` DISABLE KEYS */;
INSERT INTO `curriculums` VALUES (1,'Logika dan Algoritma','Logic and Algorithms',1,'3','blsd3TPNZTqDRw6QUlU0.pdf','2023-07-31 00:12:45','2023-07-31 00:12:45'),(6,'Pendidikan Agama Islam','Islamic education',1,'2','RLVdGtvGvBS2umFrlSf6.pdf','2023-07-31 01:05:04','2023-07-31 01:05:12'),(7,'Pendidikan Karakter','Character building',1,'2','Gz2ZSAjlHGNG6OQlVthp.pdf','2023-07-31 01:05:40','2023-07-31 01:05:40'),(8,'Matematika I (Matematika Teknik)','Mathematics I (Engineering Mathematics)',1,'2',NULL,'2023-07-31 01:06:07','2023-07-31 01:06:07'),(9,'Pengantar teknologi Informasi','Introduction to Information technology',1,'3','6tVCVTsfbripuuYKPe9n.pdf','2023-07-31 01:06:33','2023-07-31 01:06:33'),(10,'Matematika II(Aljabar Linear dan Matriks)','Mathematics II(Linear and Matrix Algebra)',2,'3','3zDiVqJWH83M4wnsePk6.pdf','2023-07-31 01:08:53','2023-07-31 01:08:53'),(11,'Manajemen & Kewirausahaan','Management & Entrepreneurship',2,'2','FGLYiXJ4QYxMpLCY6Zwg.pdf','2023-07-31 01:09:22','2023-07-31 01:09:22'),(12,'Struktur Data','Data Structure',2,'3','HcsJip6kUdPx9vhZMlcv.pdf','2023-07-31 01:09:42','2023-07-31 01:09:42'),(13,'Engineering English','Bahasa Inggris Teknik',2,'3',NULL,'2023-07-31 01:10:05','2023-07-31 01:10:05'),(14,'	 Pemrograman Terstruktur','Structured Programming',3,'3','pFUAhJb5MNpOqv4VYvok.pdf','2023-07-31 01:10:27','2023-07-31 01:10:27'),(15,'Komunikasi data','Data communication',3,'3','UPnxrzPomGRxW729BYek.pdf','2023-07-31 01:11:07','2023-07-31 01:11:07'),(16,'Arsitektur Komputer','Computer Architecture',3,'3','ZBYbGJ1QN4ImNdIxz353.pdf','2023-07-31 01:11:32','2023-07-31 01:11:32'),(17,'Pemrograman Basis Data (SQL)','Database Programming (SQL)',4,'4','ktP4Az1UBl79N2tzHHX2.pdf','2023-07-31 01:11:52','2023-07-31 01:11:52'),(18,'Pemrograman Visual I (Visual Basic)','Visual I Programming (Visual Basic)',4,'3',NULL,'2023-07-31 01:12:12','2023-07-31 01:12:12'),(19,'Pemrograman Web I','Web Programming I',4,'4','s7lrYym418dA3HEsY3RH.pdf','2023-07-31 01:12:32','2023-07-31 01:12:32'),(20,'Pemrograman Visual III (Foxpro)*R','Visual Programming III (Foxpro)*R',5,'3','31mJss3jFaYuTecLuHsz.pdf','2023-07-31 01:13:04','2023-07-31 01:13:04'),(21,'Teknik Riset Operasi','Operations Research Engineering',5,'3','xAv7l4JqkR3aLY7bDnQS.pdf','2023-07-31 01:13:29','2023-07-31 01:13:29');
/*!40000 ALTER TABLE `curriculums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloads`
--

DROP TABLE IF EXISTS `downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `filepath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('publish','no_publish') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloads`
--

LOCK TABLES `downloads` WRITE;
/*!40000 ALTER TABLE `downloads` DISABLE KEYS */;
INSERT INTO `downloads` VALUES (2,'rBfFlKPOdCeva0k8qQEx.doc','doc','publish','2023-07-27 22:55:48','2023-07-27 22:55:48');
/*!40000 ALTER TABLE `downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloads_translations`
--

DROP TABLE IF EXISTS `downloads_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloads_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `downloads_id` bigint unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `downloads_translations_downloads_id_locale_unique` (`downloads_id`,`locale`),
  KEY `downloads_translations_locale_index` (`locale`),
  CONSTRAINT `downloads_translations_downloads_id_foreign` FOREIGN KEY (`downloads_id`) REFERENCES `downloads` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloads_translations`
--

LOCK TABLES `downloads_translations` WRITE;
/*!40000 ALTER TABLE `downloads_translations` DISABLE KEYS */;
INSERT INTO `downloads_translations` VALUES (3,2,'id','PROGRAM STUDI TEKNIK INFORMATIKA'),(4,2,'en','INFORMATICS ENGINEERING STUDY PROGRAM');
/*!40000 ALTER TABLE `downloads_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_tags`
--

DROP TABLE IF EXISTS `event_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_tags_event_id_foreign` (`event_id`),
  KEY `event_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `event_tags_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `event_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_tags`
--

LOCK TABLES `event_tags` WRITE;
/*!40000 ALTER TABLE `event_tags` DISABLE KEYS */;
INSERT INTO `event_tags` VALUES (3,19,1),(4,19,3),(5,20,3),(6,20,4),(7,21,1),(8,21,3),(9,22,3);
/*!40000 ALTER TABLE `event_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_translations`
--

DROP TABLE IF EXISTS `event_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `events_id` bigint unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_translations_events_id_locale_unique` (`events_id`,`locale`),
  KEY `event_translations_locale_index` (`locale`),
  CONSTRAINT `event_translations_events_id_foreign` FOREIGN KEY (`events_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_translations`
--

LOCK TABLES `event_translations` WRITE;
/*!40000 ALTER TABLE `event_translations` DISABLE KEYS */;
INSERT INTO `event_translations` VALUES (11,12,'id','Meningkatkan Produktivitas di Tempat Kerja melalui Komunikasi Efektif','meningkatkan-produktivitas-di-tempat-kerja-melalui-komunikasi-efektif','Aula umk','Dalam seminar ini, kami akan menjelajahi peran penting komunikasi efektif dalam meningkatkan produktivitas di tempat kerja. Peserta akan mempelajari strategi komunikasi yang penting, teknik mendengarkan aktif, dan keterampilan penyelesaian konflik. Melalui sesi interaktif dan studi kasus kehidupan nyata, peserta akan mendapatkan wawasan berharga untuk menciptakan lingkungan kerja yang lebih produktif dan harmonis.'),(12,12,'en','Enhancing Workplace Productivity through Effective Communication','enhancing-workplace-productivity-through-effective-communication','Aula umk','In this seminar, we will explore the crucial role of effective communication in boosting workplace productivity. Participants will learn essential communication strategies, active listening techniques, and conflict resolution skills. Through interactive sessions and real-life case studies, attendees will gain valuable insights to create a more productive and harmonious work environment.'),(23,19,'id','Seminar Teknologi dan Inovasi di Era Digital','seminar-teknologi-dan-inovasi-di-era-digital',NULL,'Seminar Teknologi dan Inovasi di Era Digital adalah acara yang diadakan oleh Program Studi Teknik Informatika (PTI) Universitas Muhammadiyah Kendari (UMKendari). Seminar ini bertujuan untuk menggali pemahaman lebih dalam tentang perkembangan teknologi dan inovasi terkini di era digital. Para peserta akan mendapatkan wawasan tentang tren teknologi, aplikasi kecerdasan buatan, dan dampaknya pada berbagai sektor. Acara ini terbuka untuk mahasiswa, akademisi, dan masyarakat umum yang tertarik dengan perkembangan teknologi.'),(24,19,'en','Seminar on Technology and Innovation in the Digital Era','seminar-on-technology-and-innovation-in-the-digital-era',NULL,'The Seminar on Technology and Innovation in the Digital Era is an event organized by the Department of Information Technology Engineering (PTI) at the University of Muhammadiyah Kendari (UMKendari). The seminar aims to explore a deeper understanding of the latest technological advancements and innovations in the digital era. Participants will gain insights into technology trends, artificial intelligence applications, and their impacts on various sectors. The event is open to students, academics, and the general public interested in technology developments.'),(25,20,'id','Pelatihan Pemrograman Dasar untuk Pemula','pelatihan-pemrograman-dasar-untuk-pemula','Laboratorium umkendari, LT 4','Pelatihan Pemrograman Dasar untuk Pemula adalah kegiatan yang diselenggarakan oleh Himpunan Mahasiswa Program Studi Teknik Informatika (HMPTI) UMKendari. Pelatihan ini bertujuan untuk memberikan pemahaman dasar tentang pemrograman komputer bagi peserta yang belum memiliki latar belakang pemrograman. Peserta akan diajarkan konsep dasar pemrograman dan melakukan latihan praktis dalam bahasa pemrograman yang mudah dipahami. Pelatihan ini terbuka untuk mahasiswa dan masyarakat umum yang tertarik untuk memulai karir dalam dunia pemrograman.'),(26,20,'en','Basic Programming Training for Beginners','basic-programming-training-for-beginners','Umkendari Laboratory, LT 4','The Basic Programming Training for Beginners is an event organized by the Student Association of the Department of Information Technology Engineering (HMPTI) at the University of Muhammadiyah Kendari (UMKendari). The training aims to provide a fundamental understanding of computer programming for participants with little or no programming background. Participants will be taught basic programming concepts and engage in practical exercises using beginner-friendly programming languages. The training is open to students and the general public interested in starting a career in the world of programming.'),(27,21,'id','Pertemuan Evaluasi Kurikulum Program Studi Pendidikan Teknologi Informasi','pertemuan-evaluasi-kurikulum-program-studi-pendidikan-teknologi-informasi','Gedung E Lantai 4, Ruangan telekonferensi','Pertemuan ini akan membahas hasil evaluasi terhadap kurikulum program studi pendidikan teknologi informasi. Fokus utama adalah mengidentifikasi keberhasilan dan tantangan yang dihadapi dalam mengimplementasikan kurikulum saat ini. Tim pengajar akan berbagi data mengenai pencapaian pembelajaran, respons mahasiswa, dan perubahan tren industri. Diskusi akan difokuskan pada peningkatan konten kurikulum, penyempurnaan metode pengajaran, serta integrasi teknologi terbaru dalam materi pembelajaran.'),(28,21,'en','Information Technology Education Study Program Curriculum Evaluation Meeting','information-technology-education-study-program-curriculum-evaluation-meeting','Building E 4th Floor, Teleconference Room','This meeting will discuss the results of an evaluation of the information technology education study program curriculum. The main focus is to identify the successes and challenges faced in implementing the current curriculum. The teaching team will share data on learning achievements, student responses, and changing industry trends. Discussions will focus on improving curriculum content, improving teaching methods, and integrating the latest technology into learning materials.'),(29,22,'id','Workshop Pengembangan Materi Ajar Digital untuk Program Studi Pendidikan Teknologi Informasi','workshop-pengembangan-materi-ajar-digital-untuk-program-studi-pendidikan-teknologi-informasi',NULL,'Workshop ini bertujuan untuk meningkatkan keterampilan pengajar dalam merancang dan mengembangkan materi ajar digital yang interaktif dan efektif. Peserta akan mempelajari prinsip-prinsip desain pembelajaran digital, alat-alat teknologi pendukung, dan penggunaan platform pembelajaran online. Workshop ini akan memfasilitasi kolaborasi antara pengajar untuk berbagi ide dan pengalaman dalam menciptakan pengalaman belajar yang menarik dan relevan bagi mahasiswa.'),(30,22,'en','Workshop on Developing Digital Teaching Materials for the Information Technology Education Study Program','workshop-on-developing-digital-teaching-materials-for-the-information-technology-education-study-program',NULL,'This workshop aims to improve teaching skills in designing and developing interactive and effective digital teaching materials. Participants will learn the principles of digital learning design, supporting technology tools, and the use of online learning platforms. This workshop will facilitate collaboration between instructors to share ideas and experiences in creating interesting and relevant learning experiences for students.');
/*!40000 ALTER TABLE `event_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_start` date NOT NULL,
  `date_end` date DEFAULT NULL,
  `time_start` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time_end` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `status` enum('publish','no_publish') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (12,'TKrDvXvoWkG6fefGMQsBwWoCyvjiZ63Tw7CpGiGq.png','2023-08-10',NULL,'08:30',NULL,NULL,NULL,NULL,'2023-07-27','publish','2023-07-26 06:09:09','2023-07-27 00:31:48'),(19,'abNh5DmTqi7tymZCnPWzzRr4CEF0ZNGQMmrUNIYb.jpg','2023-08-08',NULL,'08:00',NULL,'http://www.form.google.com/sadfasdf','youtube','http://www.youtube.com/384dfadsf','2023-08-01','publish','2023-07-31 23:09:10','2023-07-31 23:09:34'),(20,'j4W9RHCzwK9M0VGNuXVgPW6sTQ2JcDZhxohhC3fY.jpg','2023-08-01','2023-08-05','08:00','11:30','https://www.form.google.com/sadfasdf','youtube','http://www.youtube.com/384dfadsf','2023-08-01','publish','2023-07-31 23:12:00','2023-07-31 23:12:05'),(21,'zHxMnKsRbygwoaC2b560A8o6F6nThzqPUJJBVM9G.jpg','2023-08-10',NULL,'14:00',NULL,NULL,'youtube',NULL,'2023-08-10','publish','2023-08-10 03:38:29','2023-08-10 03:38:37'),(22,'y0LKANFP9QpzxhnSrolzOngiRYM1aqfCWWpTDzeE.png','2023-08-11',NULL,'09:00',NULL,'https://www.form.google.com/8934dfuha','zoom','https://us05web.zoom.us/j/83894156004?pwd=UTaNARfhOa7a2fCieJ7ABJ3AchLCOM.1','2023-08-10','publish','2023-08-10 03:42:14','2023-08-10 03:42:26');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floors`
--

DROP TABLE IF EXISTS `floors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `floors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `building_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `floors_building_id_foreign` (`building_id`),
  CONSTRAINT `floors_building_id_foreign` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floors`
--

LOCK TABLES `floors` WRITE;
/*!40000 ALTER TABLE `floors` DISABLE KEYS */;
INSERT INTO `floors` VALUES (1,4,'Lantai 1','2024-03-07 18:12:06','2024-03-07 18:12:06'),(2,4,'Lantai 2','2024-03-07 18:12:09','2024-03-07 18:12:13'),(3,4,'Lantai 3','2024-03-07 18:12:17','2024-03-07 18:12:17'),(4,4,'Lantai 4','2024-03-07 18:12:21','2024-03-07 18:12:21');
/*!40000 ALTER TABLE `floors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footer_links`
--

DROP TABLE IF EXISTS `footer_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `footer_links` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `footer_id` bigint unsigned NOT NULL,
  `link_title_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `footer_links_footer_id_foreign` (`footer_id`),
  CONSTRAINT `footer_links_footer_id_foreign` FOREIGN KEY (`footer_id`) REFERENCES `footers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footer_links`
--

LOCK TABLES `footer_links` WRITE;
/*!40000 ALTER TABLE `footer_links` DISABLE KEYS */;
INSERT INTO `footer_links` VALUES (28,6,'Pmb','Admission','https://pmb.umkendari.ac.id/'),(29,6,'Umkendari','Umkendari','https://umkendari.ac.id/'),(30,6,'Virtual','Virtual','https://virtual.umkendari.ac.id/'),(31,6,'Alumni','Alumni','https://tracerstudy.umkendari.ac.id/'),(32,6,'Simak','academic information system','https://simak.umkendari.ac.id/');
/*!40000 ALTER TABLE `footer_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footers`
--

DROP TABLE IF EXISTS `footers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `footers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `map` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footers`
--

LOCK TABLES `footers` WRITE;
/*!40000 ALTER TABLE `footers` DISABLE KEYS */;
INSERT INTO `footers` VALUES (6,NULL,NULL,NULL,'2023-08-10 00:58:34','2023-08-10 00:58:34');
/*!40000 ALTER TABLE `footers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_asset_id_foreign` (`asset_id`),
  CONSTRAINT `galleries_asset_id_foreign` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'e6b510ca-7800-48e0-8152-2806b6ac755d','images/Cc9ySJM4daZGTH4E3N3uYNAzkaou3Rd4ZL3DFgvV.webp'),(2,'e6b510ca-7800-48e0-8152-2806b6ac755d','images/yiZut1FBjTjoHxqFxoenZF1PsD8qz3g61FY1KX14.jpg'),(3,'09c79bdf-1c62-47d8-a049-f6615254d2e3','images/7aYEnzR4c091H92YKyRbxEDcTrgBUMJRCZ1GLRT3.png'),(4,'09c79bdf-1c62-47d8-a049-f6615254d2e3','images/0lqg0TAEQTxE2uGtgEKnLE8uKISFB3hcJRS3Ewvj.png'),(5,'fb85e26f-1199-4160-a652-79497a4dac2d','images/26iVeUqPM3L7Cl0yN3b51Einh4uXKp5VRIXLoIwF.png'),(6,'fb85e26f-1199-4160-a652-79497a4dac2d','images/Z1EepFok5XAH4LEq4ppgcgX9Yove496PFiOqIfIc.png');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `greetings`
--

DROP TABLE IF EXISTS `greetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `greetings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `content_id` longtext COLLATE utf8mb4_unicode_ci,
  `content_en` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `greetings`
--

LOCK TABLES `greetings` WRITE;
/*!40000 ALTER TABLE `greetings` DISABLE KEYS */;
INSERT INTO `greetings` VALUES (1,'<h2><strong>Assalamualaikum Warahmatullahi Wabarakatuh,</strong></h2><p><br></p><p>Selamat datang di website resmi Program Studi Pendidikan Teknologi Informasi. Kami sangat senang dapat berbagi informasi mengenai program studi kami, yang didedikasikan untuk menghasilkan para tenaga pendidik yang handal di bidang teknologi informasi.</p><p><br></p><p>Pendidikan Teknologi Informasi memiliki peran penting dalam mempersiapkan generasi yang siap menghadapi tantangan dunia digital yang terus berkembang. Melalui kurikulum yang inovatif, fasilitas yang modern, serta dosen-dosen berpengalaman, kami bertekad untuk menciptakan lingkungan belajar yang inspiratif dan mendukung perkembangan potensi setiap mahasiswa.</p><p><br></p><p>Kami mengundang Anda untuk menjelajahi informasi lebih lanjut tentang program studi kami melalui website ini. Temukan detail kurikulum, profil dosen, kegiatan mahasiswa, dan berbagai peluang yang tersedia. Jangan ragu untuk menghubungi kami jika Anda memiliki pertanyaan atau ingin mengetahui lebih lanjut tentang apa yang kami tawarkan.</p><p><br></p><p>Terima kasih atas kunjungan Anda, dan kami berharap dapat menyambut Anda sebagai bagian dari komunitas Program Studi Pendidikan Teknologi Informasi.</p><p>Wassalamualaikum Warahmatullahi Wabarakatuh. update</p>','<h2><strong>Assalamualaikum Warahmatullahi Wabarakatuh,</strong></h2><p><br></p><p>Welcome to the official website of the Information Technology Education Program. We are delighted to share information about our program, which is dedicated to producing proficient educators in the field of information technology.</p><p><br></p><p>Information Technology Education plays a vital role in preparing a generation ready to face the ever-evolving challenges of the digital world. Through an innovative curriculum, state-of-the-art facilities, and experienced faculty members, we are committed to creating an inspiring learning environment that supports the development of each student\'s potential.</p><p><br></p><p>We invite you to explore further information about our program through this website. Discover curriculum details, faculty profiles, student activities, and various opportunities available. Please do not hesitate to contact us if you have any questions or would like to learn more about what we offer.</p><p><br></p><p>Thank you for your visit, and we hope to welcome you as part of the Information Technology Education Program community.</p><p>Sincerely, update</p>','2023-08-01 23:41:53','2023-08-02 00:06:48');
/*!40000 ALTER TABLE `greetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `header_webs`
--

DROP TABLE IF EXISTS `header_webs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `header_webs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_rgba` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `header_webs`
--

LOCK TABLES `header_webs` WRITE;
/*!40000 ALTER TABLE `header_webs` DISABLE KEYS */;
INSERT INTO `header_webs` VALUES (1,'4lqUvShj9bVlP0R6muVX.svg','YgvoP2SlOUTucR8gEoxd.svg',NULL,'Y','2023-08-08 00:44:28','2023-08-17 02:46:26');
/*!40000 ALTER TABLE `header_webs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information_tags`
--

DROP TABLE IF EXISTS `information_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `information_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `information_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `information_tags_information_id_foreign` (`information_id`),
  KEY `information_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `information_tags_information_id_foreign` FOREIGN KEY (`information_id`) REFERENCES `informations` (`id`),
  CONSTRAINT `information_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information_tags`
--

LOCK TABLES `information_tags` WRITE;
/*!40000 ALTER TABLE `information_tags` DISABLE KEYS */;
INSERT INTO `information_tags` VALUES (5,1,1),(6,1,3),(7,2,1),(8,3,3),(9,5,3),(13,8,1),(14,8,3),(15,9,4),(16,10,5),(17,11,1),(18,11,3),(19,12,1),(20,12,3);
/*!40000 ALTER TABLE `information_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informations`
--

DROP TABLE IF EXISTS `informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author` bigint unsigned NOT NULL,
  `type` enum('news','announcement','education','academic','lectures','lecturer_activities','student_activities') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int NOT NULL DEFAULT '0',
  `publication_date` date NOT NULL,
  `status` enum('publish','pending','no_publish') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `informations_author_foreign` (`author`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informations`
--

LOCK TABLES `informations` WRITE;
/*!40000 ALTER TABLE `informations` DISABLE KEYS */;
INSERT INTO `informations` VALUES (1,1,'news','moY4cr4hYoAgGWcyt9QEJSKn6DyKJRjS7GFHDrt5.jpg',NULL,0,'2023-08-01','publish','2023-07-31 23:00:37','2023-07-31 23:00:47'),(2,1,'news','c5HRPoHsjRbNEIXShd15DQuiaSpXQTKeWc5lXBbo.jpg',NULL,0,'2023-08-01','publish','2023-07-31 23:03:37','2023-07-31 23:03:39'),(3,1,'news','xv35m1reM3wpeeG8flRiEIkzaPWxoIO6C5T7da1a.jpg',NULL,0,'2023-08-08','publish','2023-07-31 23:06:00','2023-07-31 23:06:02'),(5,1,'lectures',NULL,NULL,0,'2023-08-01','publish','2023-07-31 23:14:23','2023-07-31 23:14:25'),(8,1,'lecturer_activities','sbXlwFQgk9JXfOUfxzZKvAnRr7MQ9m9bLv9cK0T7.jpg',NULL,0,'2023-08-08','publish','2023-08-06 23:16:40','2023-08-06 23:17:23'),(9,1,'student_activities','g8KhEW6QUF73Ie9jntGSw2mzwdlwm54vkZCtIIWU.jpg',NULL,0,'2023-08-07','publish','2023-08-06 23:24:01','2023-08-06 23:24:04'),(10,1,'lecturer_activities','8m8hlt5Z1WZQVwFIExOdoCelVLjqdaDuI1pDvbft.jpg',NULL,0,'2023-08-07','publish','2023-08-06 23:25:41','2023-08-06 23:25:43'),(11,1,'lectures','HxhPk2eBDQkHFEFEQQKpqIVlUIQcB28AihnXNAQh.webp',NULL,0,'2023-08-07','publish','2023-08-06 23:43:10','2023-08-06 23:43:16'),(12,1,'news','9wOaBu4qoHtuCsfpGSWEynDwxFN2T6SxJA6UYd6i.jpg',NULL,0,'2023-08-10','publish','2023-08-10 04:35:24','2023-08-10 04:35:26');
/*!40000 ALTER TABLE `informations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informations_translations`
--

DROP TABLE IF EXISTS `informations_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informations_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `informations_id` bigint unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption_image` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `informations_translations_informations_id_locale_unique` (`informations_id`,`locale`),
  KEY `informations_translations_locale_index` (`locale`),
  CONSTRAINT `informations_translations_informations_id_foreign` FOREIGN KEY (`informations_id`) REFERENCES `informations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informations_translations`
--

LOCK TABLES `informations_translations` WRITE;
/*!40000 ALTER TABLE `informations_translations` DISABLE KEYS */;
INSERT INTO `informations_translations` VALUES (11,1,'id','Mahasiswa Prodi PTI UMKendari Raih Penghargaan pada Kompetisi Koding Internasional','mahasiswa-prodi-pti-umkendari-raih-penghargaan-pada-kompetisi-koding-internasional','<p>Pada tanggal 1 Agustus 2023, mahasiswa Program Studi Teknik Informatika (PTI) di Universitas Muhammadiyah Kendari (UMKendari) berhasil meraih penghargaan prestisius dalam ajang kompetisi koding tingkat internasional. Tim mahasiswa UMKendari yang terdiri dari tiga anggota berhasil mencatatkan prestasi gemilang dalam ajang \"International Coding Challenge 2023\".</p><p><br></p><p>Kompetisi yang diselenggarakan secara daring ini melibatkan peserta dari berbagai negara dan perguruan tinggi terkemuka di dunia. Para peserta diuji dalam berbagai aspek pemrograman dan kemampuan menganalisis masalah kompleks. Tim dari UMKendari berhasil menyelesaikan tantangan-tantangan sulit dengan penuh inovasi dan kreativitas, yang akhirnya mengantarkan mereka meraih peringkat kedua dalam kompetisi ini.</p><p>Rektor UMKendari, Prof. Dr. Ahmad Hasan, menyatakan kebanggaannya atas prestasi mahasiswa Prodi PTI ini. Ia mengungkapkan bahwa keberhasilan ini menunjukkan komitmen UMKendari dalam menghasilkan lulusan yang berkualitas dan mampu bersaing di tingkat internasional.</p><p><br></p><p>Tim mahasiswa yang meraih penghargaan ini terdiri dari Yudi Pratama, Maya Sari, dan Rizky Putra. Mereka mampu membuktikan keunggulan kemampuan teknis dan bakat dalam dunia pemrograman. Prestasi mereka diharapkan menjadi inspirasi bagi mahasiswa Prodi PTI lainnya untuk terus berusaha dan berprestasi dalam kompetisi-kompetisi berkelas internasional.</p>','mahasiswa prodi PTI juara 1'),(12,1,'en','PTI UMKendari Students Achieve Award in International Coding Competition','pti-umkendari-students-achieve-award-in-international-coding-competition','<p>On August 1, 2023, students from the Department of Information Technology Engineering (PTI) at the University of Muhammadiyah Kendari (UMKendari) achieved a prestigious award in an international coding competition. The UMKendari student team, consisting of three members, showcased remarkable performance in the \"International Coding Challenge 2023.\"</p><p><br></p><p>This online competition involved participants from various countries and leading universities worldwide. Participants were tested on various programming aspects and their ability to analyze complex problems. The UMKendari team successfully tackled challenging tasks with innovation and creativity, ultimately securing the second position in the competition.</p><p>Prof. Dr. Ahmad Hasan, the Rector of UMKendari, expressed his pride in the achievement of the PTI students. He stated that this success demonstrates UMKendari\'s commitment to producing high-quality graduates who can compete at an international level.</p><p><br></p><p>The award-winning student team comprised Yudi Pratama, Maya Sari, and Rizky Putra. They demonstrated excellence in technical skills and talent in the programming world. Their achievement is expected to inspire other PTI students to strive for success and excel in international competitions.</p>','1st place PTI study program student'),(13,2,'id','Workshop Big Data Analytics untuk Mahasiswa Prodi PTI UMKendari','workshop-big-data-analytics-untuk-mahasiswa-prodi-pti-umkendari','<p>Pada tanggal 1 Agustus 2023, Program Studi Teknik Informatika (PTI) di Universitas Muhammadiyah Kendari (UMKendari) menyelenggarakan workshop berjudul \"Big Data Analytics\" untuk mahasiswa Prodi PTI. Kegiatan ini bertujuan untuk memberikan pemahaman mendalam tentang analisis data besar dan teknik-teknik terkini yang digunakan dalam industri.</p><p><br></p><p>Workshop ini dihadiri oleh lebih dari 50 mahasiswa dari berbagai tingkat semester. Acara tersebut dibuka oleh Ketua Prodi PTI, Dr. Putri Dewi, yang menyampaikan pentingnya penguasaan Big Data Analytics dalam menghadapi tantangan industri 4.0. Para peserta workshop diberikan kesempatan untuk belajar tentang teknologi Big Data, alat analisis, dan implementasinya dalam berbagai bidang, termasuk bisnis, kesehatan, dan ilmu pengetahuan.</p><p><br></p><p>Narasumber dalam workshop ini adalah para ahli industri dan akademisi yang berpengalaman dalam bidang Big Data Analytics. Mereka membagikan pengetahuan dan pengalaman praktis kepada mahasiswa, memberikan wawasan mendalam tentang aplikasi Big Data dalam pemecahan masalah di dunia nyata.</p><p>Workshop Big Data Analytics ini menjadi salah satu upaya UMKendari dalam meningkatkan kualitas pendidikan di Prodi PTI dan mempersiapkan mahasiswa agar dapat menjadi tenaga kerja yang kompeten dan siap menghadapi perubahan teknologi di masa depan.</p>','worksop 1 bidang akademik'),(14,2,'en','Big Data Analytics Workshop for PTI UMKendari Students','big-data-analytics-workshop-for-pti-umkendari-students','<p>On August 1, 2023, the Department of Information Technology Engineering (PTI) at the University of Muhammadiyah Kendari (UMKendari) organized a workshop titled \"Big Data Analytics\" for PTI students. The event aimed to provide an in-depth understanding of big data analysis and the latest techniques used in the industry.</p><p><br></p><p>The workshop was attended by more than 50 students from various semesters. The event was inaugurated by the Head of PTI Department, Dr. Putri Dewi, who emphasized the importance of mastering Big Data Analytics in facing the challenges of Industry 4.0. Participants had the opportunity to learn about Big Data technology, analytical tools, and their implementations in various fields, including business, healthcare, and sciences.</p><p><br></p><p>The workshop featured speakers who were industry experts and experienced academics in the field of Big Data Analytics. They shared practical knowledge and experiences with the students, providing deep insights into the applications of Big Data in solving real-world problems.</p><p><br></p><p>The Big Data Analytics workshop is one of UMKendari\'s efforts to enhance the quality of education in the PTI program and prepare students to become competent professionals ready to face technological changes in the future.</p>','workshop 1 academic field'),(15,3,'id','Mahasiswa PTI UMKendari Luncurkan Aplikasi Mobile Inovatif untuk Edukasi Anak','mahasiswa-pti-umkendari-luncurkan-aplikasi-mobile-inovatif-untuk-edukasi-anak','<p>Sebuah inovasi menarik datang dari mahasiswa Program Studi Teknik Informatika (PTI) di Universitas Muhammadiyah Kendari (UMKendari). Pada tanggal 1 Agustus 2023, tiga mahasiswa Prodi PTI berhasil meluncurkan aplikasi mobile edukatif yang bertujuan untuk mendukung perkembangan pendidikan anak-anak usia dini.</p><p><br></p><p>Aplikasi yang diberi nama \"EduKids\" ini menawarkan beragam fitur pendidikan yang interaktif dan menyenangkan, dirancang khusus untuk anak-anak usia 3 hingga 6 tahun. Dengan tampilan yang menarik dan user-friendly, aplikasi ini mencakup materi edukatif mulai dari angka, huruf, warna, hewan, dan tumbuhan, hingga lagu dan cerita pendek yang mendidik. Semua konten dalam aplikasi dipilih dengan cermat agar sesuai dengan standar kurikulum pendidikan usia dini.</p><p><br></p><p>Tim pengembang aplikasi EduKids terdiri dari Yudha Pratama, Indah Wulandari, dan Rian Permadi. Mereka menghabiskan berbulan-bulan untuk merancang, mengembangkan, dan menguji aplikasi ini sebelum akhirnya meluncurkannya ke publik. Proses pengembangan melibatkan kolaborasi dengan pengajar dan ahli pendidikan anak untuk memastikan aplikasi ini dapat memberikan manfaat maksimal bagi perkembangan anak-anak.</p><p>Rektor UMKendari, Prof. Dr. Ahmad Hasan, menyambut baik inisiatif dan keberhasilan mahasiswa PTI ini. Beliau berharap aplikasi EduKids dapat menjadi alat yang efektif dalam mendukung edukasi anak-anak di tingkat dini. Selain itu, aplikasi ini juga memiliki potensi untuk menjadi produk unggulan yang mengharumkan nama baik UMKendari di kancah teknologi pendidikan.</p><p><br></p><p>EduKids direncanakan akan tersedia secara gratis di platform iOS dan Android. Tim pengembang berencana untuk terus mengembangkan aplikasi dengan tambahan fitur dan konten edukatif yang lebih bervariasi, sesuai dengan umpan balik dan kebutuhan pengguna.</p><p><br></p><p>Keberhasilan peluncuran EduKids merupakan contoh konkret dari peran aktif mahasiswa Prodi PTI UMKendari dalam menciptakan solusi inovatif dan berdampak positif bagi masyarakat. Diharapkan, aplikasi ini dapat menjadi salah satu sumbangsih teknologi dalam meningkatkan kualitas pendidikan anak-anak di Indonesia.</p>','aplikasi mobile buatan pti'),(16,3,'en','PTI UMKendari Students Launch Innovative Mobile App for Children\'s Education','pti-umkendari-students-launch-innovative-mobile-app-for-childrens-education','<p>An interesting innovation has emerged from the students of the Department of Information Technology Engineering (PTI) at the University of Muhammadiyah Kendari (UMKendari). On August 1, 2023, three PTI students successfully launched an educational mobile app aimed at supporting the development of early childhood education.</p><p><br></p><p>The app, named \"EduKids,\" offers a variety of interactive and fun educational features designed specifically for children aged 3 to 6 years. With an attractive and user-friendly interface, the app covers educational materials ranging from numbers, letters, colors, animals, and plants to educational songs and short stories. All content in the app has been carefully selected to align with early childhood education curriculum standards.</p><p>The EduKids app development team consists of Yudha Pratama, Indah Wulandari, and Rian Permadi. They spent months designing, developing, and testing the app before finally launching it to the public. The development process involved collaboration with educators and child development experts to ensure that the app can provide maximum benefits for children\'s learning and growth.</p><p><br></p><p>Prof. Dr. Ahmad Hasan, the Rector of UMKendari, welcomed the initiative and success of the PTI students. He hopes that the EduKids app can be an effective tool in supporting early childhood education. Moreover, the app has the potential to become a flagship product that enhances UMKendari\'s reputation in the field of educational technology.</p><p><br></p><p>EduKids is planned to be available for free on iOS and Android platforms. The development team intends to continue enhancing the app with additional features and more diverse educational content based on user feedback and needs.</p><p><br></p><p>The successful launch of EduKids is a concrete example of the active role played by PTI UMKendari students in creating innovative solutions that have a positive impact on society. It is hoped that this app can contribute to improving the quality of children\'s education in Indonesia and beyond.</p>','mobile application made by pti'),(17,5,'id','Perubahan Jadwal Kuliah Semester Genap 2023/2024','perubahan-jadwal-kuliah-semester-genap-20232024','<p>Bagi seluruh mahasiswa Universitas Muhammadiyah Kendari (UMKendari), diumumkan bahwa terdapat perubahan jadwal kuliah untuk semester genap tahun akademik 2023/2024. Perubahan ini dilakukan untuk meningkatkan efisiensi dan kualitas proses perkuliahan. Mahasiswa diharapkan untuk memeriksa jadwal kuliah terbaru melalui Sistem Informasi Akademik (SIAKAD) di website resmi UMKendari atau menghubungi Bagian Akademik masing-masing fakultas. Pastikan untuk selalu mengikuti jadwal kuliah yang terbaru dan sesuai dengan program studi masing-masing.</p>','saf'),(18,5,'en','Changes in Odd Semester 2023/2024 Lecture Schedule','changes-in-odd-semester-20232024-lecture-schedule','<p>For all students of the University of Muhammadiyah Kendari (UMKendari), it is announced that there have been changes in the lecture schedule for the odd semester of the academic year 2023/2024. These changes are made to enhance the efficiency and quality of the lecture process. Students are advised to check the latest lecture schedule through the Academic Information System (SIAKAD) on the official UMKendari website or contact the Academic Division of their respective faculties. Make sure to always follow the latest and appropriate lecture schedule according to your respective study programs.</p>','sadf'),(23,8,'id','Seminar Pemrograman Lanjutan','seminar-pemrograman-lanjutan','<p>Dosen-dosen dalam Prodi Pendidikan Teknologi Informasi mengadakan seminar tentang pemrograman lanjutan. Seminar ini bertujuan untuk memperdalam pemahaman mahasiswa tentang konsep-konsep pemrograman tingkat lanjutan dan aplikasinya dalam pengembangan perangkat lunak.</p>','seminar pemrograman lanjutan'),(24,8,'en','Advanced Programming Seminar','advanced-programming-seminar','<p>Faculty members of the Information Technology Education Program conduct seminars on advanced programming. The seminar aims to deepen students\' understanding of advanced programming concepts and their application in software development.</p>','advanced programming seminar'),(25,9,'id','Mengajar Mata Kuliah Jaringan Komputer','mengajar-mata-kuliah-jaringan-komputer','<p>Anggota fakultas dari program ini secara aktif mengajar mata kuliah jaringan komputer. Mereka membahas topik-topik seperti protokol jaringan, keamanan jaringan, dan administrasi jaringan untuk membekali siswa dengan pengetahuan yang mendalam.</p>','kkn luar negri'),(26,9,'en','Teaching Computer Networking Course','teaching-computer-networking-course','<p>Faculty members of the program are actively teaching computer networking courses. They cover topics such as network protocols, network security, and network administration to provide students with in-depth knowledge.</p>','kkn abroad'),(27,10,'id','Diskusi Teknologi Mingguan','diskusi-teknologi-mingguan','<p>Siswa juga mengadakan diskusi teknologi mingguan di mana mereka mengeksplorasi isu-isu terkini di dunia teknologi informasi, seperti perkembangan bahasa pemrograman, tren aplikasi, dan tantangan keamanan siber.</p>','kegiatan dosen minggu 1'),(28,10,'en','Weekly Technology Discussions','weekly-technology-discussions','<p>&nbsp;Students also hold weekly technology discussions where they explore current issues in the world of information technology, such as programming language developments, application trends, and cybersecurity challenges.</p>','lecturer activities week 1'),(29,11,'id','Perkuliahan Tatap Muka Kembali Dilaksanakan dengan Protokol Ketat','perkuliahan-tatap-muka-kembali-dilaksanakan-dengan-protokol-ketat','<p>Universitas Maju Bersama telah memutuskan untuk melanjutkan perkuliahan tatap muka dengan menerapkan protokol ketat guna menjaga keselamatan dan kesehatan seluruh civitas akademika. Keputusan ini diambil setelah melihat penurunan angka kasus COVID-19 dalam beberapa minggu terakhir.</p><p><br></p><p>Rektor Universitas Maju Bersama, Prof. Dr. Indra Sakti, mengungkapkan bahwa keputusan ini diambil setelah mempertimbangkan berbagai aspek, termasuk perkembangan situasi pandemi di wilayah sekitar kampus. \"Kami memahami pentingnya interaksi langsung antara dosen dan mahasiswa dalam pembelajaran. Namun, keselamatan dan kesehatan semua pihak tetap menjadi prioritas utama,\" ujarnya.</p><p><br></p><p>Protokol ketat pun akan diterapkan selama perkuliahan tatap muka berlangsung. Setiap ruangan kelas akan dibatasi kapasitasnya untuk menjaga jarak fisik, dan semua peserta diwajibkan untuk menggunakan masker. Selain itu, fasilitas cuci tangan akan disediakan di berbagai tempat strategis di kampus.</p><p><br></p><p>Mahasiswa yang tidak dapat atau tidak ingin mengikuti perkuliahan tatap muka tetap diberikan opsi untuk mengikuti perkuliahan secara daring. \"Kami memahami bahwa beberapa mahasiswa mungkin masih merasa khawatir, dan kami menghormati keputusan mereka untuk tetap belajar dari jarak jauh,\" tambah Prof. Indra Sakti.</p><p>Universitas Maju Bersama berharap langkah ini dapat memberikan pengalaman pembelajaran yang lebih baik bagi mahasiswa sambil tetap menjaga kesehatan dan keselamatan semua pihak yang terlibat. Perkuliahan tatap muka akan dimulai pada tanggal 14 Agustus mendatang.</p>','perkuliahan'),(30,11,'en','In-Person Classes Resume with Strict Protocols','in-person-classes-resume-with-strict-protocols','<p>Advanced University Together has decided to resume in-person classes while implementing strict protocols to ensure the safety and health of all members of the academic community. This decision comes after observing a decline in COVID-19 cases in recent weeks.</p><p><br></p><p>Prof. Dr. Indra Sakti, the Chancellor of Advanced University Together, stated that the decision was made after considering various factors, including the pandemic situation in the surrounding area. \"We understand the importance of direct interaction between faculty and students in the learning process. However, the safety and health of all parties remain our top priority,\" he said.</p><p><br></p><p>Stringent protocols will be enforced during in-person classes. Each classroom will have limited capacity to maintain physical distancing, and all participants are required to wear masks. Furthermore, handwashing facilities will be provided at various strategic locations on campus.</p><p><br></p><p>Students who are unable or unwilling to attend in-person classes will still have the option to participate in online learning. \"We understand that some students may still have concerns, and we respect their decision to continue remote learning,\" added Prof. Indra Sakti.</p><p><br></p><p>Advanced University Together hopes that this step will provide a better learning experience for students while safeguarding the health and safety of all individuals involved. In-person classes are set to commence on August 14th.</p>','lecture'),(31,12,'id','Transformasi Pendidikan di Era Digital: Mengintegrasikan Teknologi untuk Peningkatan Pembelajaran','transformasi-pendidikan-di-era-digital-mengintegrasikan-teknologi-untuk-peningkatan-pembelajaran','<p>Dalam lanskap pendidikan yang terus berkembang, integrasi teknologi telah menjadi landasan inovasi dan kemajuan. Bidang Pendidikan Teknologi Informasi telah menjadi pusat perhatian dalam transformasi ini, membentuk bagaimana pendidik dan peserta didik berinteraksi dengan pengetahuan. Saat kita menavigasi tantangan dan peluang yang dihadirkan oleh era digital, sangat penting untuk mengeksplorasi bagaimana teknologi membentuk kembali pedagogi dan memberdayakan guru dan siswa.</p><p><br></p><p>Salah satu aspek kunci dari transformasi ini adalah munculnya platform pembelajaran online. Platform ini menyediakan ruang virtual tempat siswa dapat terlibat dengan materi pelajaran, berpartisipasi dalam diskusi, dan berkolaborasi dalam proyek. Fleksibilitas pembelajaran online tidak hanya memperluas akses ke pendidikan tetapi juga mendorong pembelajaran mandiri dan pemikiran kritis. Siswa sekarang memiliki kebebasan untuk belajar dengan kecepatan mereka sendiri, mengakses sumber daya dari mana saja di dunia.</p><p><br></p><p>Selain itu, integrasi teknologi telah memungkinkan terciptanya pengalaman belajar yang interaktif dan imersif. Augmented Reality (AR) dan Virtual Reality (VR) telah memperkenalkan dimensi baru dalam pendidikan, memungkinkan siswa untuk mengeksplorasi konsep kompleks dengan cara yang menarik secara visual. Misalnya, siswa yang mempelajari pemrograman komputer kini dapat memvisualisasikan algoritme abstrak melalui simulasi interaktif, membuat proses pembelajaran lebih menarik dan mudah dipahami.</p><p><br></p><p>Dalam ranah penilaian, teknologi telah membuka jalan bagi metode evaluasi yang inovatif. Ujian tradisional secara bertahap dilengkapi dengan kuis online, penilaian rekan, dan evaluasi berbasis proyek. Pergeseran ini tidak hanya memberikan pemahaman holistik tentang kemampuan siswa tetapi juga mempersiapkan mereka menghadapi tantangan dunia nyata yang membutuhkan penerapan pengetahuan secara praktis.</p><p><br></p><p>Meskipun memiliki banyak keuntungan, integrasi teknologi dalam Pendidikan Teknologi Informasi bukannya tanpa tantangan. Pendidik harus beradaptasi dengan metodologi pengajaran baru dan terus memperbarui keterampilan digital mereka. Selain itu, memastikan akses yang adil ke teknologi dan mengatasi kekhawatiran tentang privasi data dan gangguan digital merupakan pertimbangan penting.</p><p><br></p><p>Saat kami berdiri di persimpangan inovasi teknologi dan pendidikan, bidang Pendidikan Teknologi Informasi terus berkembang. Merangkul perubahan ini dengan fokus pedagogis dapat menghasilkan lingkungan belajar yang lebih inklusif, menarik, dan efektif. Dengan membina generasi individu yang melek digital, kita dapat mempersiapkan mereka untuk berkembang di dunia di mana teknologi bukan hanya alat, tetapi cara hidup.</p><p><br></p><p>Harap diingat bahwa konten di atas adalah simulasi dan dibuat sebagai contoh. Jika Anda ingin menggunakan konten tersebut atau mengadaptasinya, pastikan untuk memastikan keakuratan dan relevansinya dengan sumber informasi yang sah.</p>','Pengumuman Tambah dan Drop Mata Kuliah'),(32,12,'en','Transforming Education in the Digital Age: Integrating Technology for Enhanced Learning','transforming-education-in-the-digital-age-integrating-technology-for-enhanced-learning','<p>In the ever-evolving landscape of education, the integration of technology has become a cornerstone of innovation and progress. The field of Information Technology Education has taken center stage in this transformation, shaping how educators and learners interact with knowledge. As we navigate the challenges and opportunities presented by the digital age, it is imperative to explore how technology is reshaping pedagogy and empowering both teachers and students.</p><p><br></p><p>One of the key aspects of this transformation is the emergence of online learning platforms. These platforms provide a virtual space where students can engage with course materials, participate in discussions, and collaborate on projects. The flexibility of online learning has not only expanded access to education but has also encouraged self-directed learning and critical thinking. Students now have the freedom to learn at their own pace, accessing resources from anywhere in the world.</p><p><br></p><p>Furthermore, the integration of technology has enabled the creation of interactive and immersive learning experiences. Augmented Reality (AR) and Virtual Reality (VR) have introduced new dimensions to education, allowing students to explore complex concepts in a visually engaging manner. For instance, students studying computer programming can now visualize abstract algorithms through interactive simulations, making the learning process more engaging and comprehensible.</p><p><br></p><p>In the realm of assessment, technology has paved the way for innovative evaluation methods. Traditional exams are gradually being complemented by online quizzes, peer assessments, and project-based evaluations. This shift not only provides a holistic understanding of a student\'s abilities but also prepares them for real-world challenges that require practical application of knowledge.</p><p><br></p><p>Despite the numerous advantages, the integration of technology in Information Technology Education is not without its challenges. Educators must adapt to new teaching methodologies and continuously update their digital skills. Moreover, ensuring equitable access to technology and addressing concerns about data privacy and digital distractions are crucial considerations.</p><p><br></p><p>As we stand at the crossroads of technological innovation and education, the field of Information Technology Education continues to evolve. Embracing these changes with a pedagogical focus can lead to a more inclusive, engaging, and effective learning environment. By nurturing a generation of digitally-literate individuals, we can prepare them to thrive in a world where technology is not just a tool, but a way of life.</p><p><br></p><p>Harap diingat bahwa konten di atas adalah simulasi dan dibuat sebagai contoh. Jika Anda ingin menggunakan konten tersebut atau mengadaptasinya, pastikan untuk memastikan keakuratan dan relevansinya dengan sumber informasi yang sah.</p>','Pengumuman Tambah dan Drop Mata Kuliah');
/*!40000 ALTER TABLE `informations_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leader_educations`
--

DROP TABLE IF EXISTS `leader_educations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leader_educations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `setting_id` bigint unsigned NOT NULL,
  `undergraduate_degree` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `university_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `major` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admission_year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `graduation_year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `leader_educations_setting_id_foreign` (`setting_id`),
  CONSTRAINT `leader_educations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leader_educations`
--

LOCK TABLES `leader_educations` WRITE;
/*!40000 ALTER TABLE `leader_educations` DISABLE KEYS */;
INSERT INTO `leader_educations` VALUES (18,6,'S1','Universitas Gadjah Mada','Teknik Informatika','2010','2013'),(19,6,'S2','Universitas Indonesia ','Magister Informatika','2017','2019'),(20,6,'S3','Universitas Negeri Makassar','Ilmu Komputer','2020','2023');
/*!40000 ALTER TABLE `leader_educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer_educations`
--

DROP TABLE IF EXISTS `lecturer_educations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer_educations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lecturer_id` bigint unsigned NOT NULL,
  `undergraduate_degree` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `university_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `major` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admission_year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `graduation_year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lecturer_educations_lecturer_id_foreign` (`lecturer_id`),
  CONSTRAINT `lecturer_educations_lecturer_id_foreign` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer_educations`
--

LOCK TABLES `lecturer_educations` WRITE;
/*!40000 ALTER TABLE `lecturer_educations` DISABLE KEYS */;
INSERT INTO `lecturer_educations` VALUES (17,5,'S1','Universitas Gadjah Mada','Teknik Informatika','2018','2020'),(18,5,'S2','Universitas Ahmad Dahlan','Magister Informatkika','2020','2022'),(21,7,'S1','Universitas Megah','Ekonomi','2003','2007'),(22,7,'S2','Universitas Pembangunan Nasional','Ekonomi Pembangunan','2008','2010'),(23,7,'S3','Universitas Riset Internasional',' Ilmu Ekonomi','2011','2015'),(24,8,'S1','Universitas Psikologi Utama','Psikologi','2004','2008'),(25,8,'S2',' Universitas Kesehatan Mental',' Psikologi Klinis','2009','2011'),(26,8,'S3','Universitas Psikologi Lanjutan','Psikologi Terapan','2012','2016'),(27,9,'S1','Universitas Sastra Utama','Sastra','2002','2006'),(28,9,'S2','Universitas Bahasa dan Sastra',' Sastra Indonesia','2007','2009'),(29,10,'S1','Universitas Kimia Nasional','Kimia','2005','2009'),(30,10,'S2','Universitas Riset Kimia','Kimia Organik','2010','2012'),(31,10,'S3',' Universitas Kimia Internasional','Kimia Organik Lanjutan','2013','2018'),(32,11,'S1','Universitas Teknologi Listrik','Teknik Elektro','2009','2011'),(33,11,'S2','Universitas Teknologi Internasional','Teknik Elektro dan Komputer','2012','2016'),(34,5,'S1','Universitas Gadjah Mada','Teknik Informatika','2018','2020'),(35,5,'S2','Universitas Ahmad Dahlan','Magister Informatkika','2020','2022'),(36,5,'S1','Universitas Gadjah Mada','Teknik Informatika','2018','2020'),(37,5,'S2','Universitas Ahmad Dahlan','Magister Informatkika','2020','2022'),(38,5,'S1','Universitas Gadjah Mada','Teknik Informatika','2018','2020'),(39,5,'S2','Universitas Ahmad Dahlan','Magister Informatkika','2020','2022'),(46,6,'S1','Universitas Teknologi Makmur','Teknik Informatika','2005','2009'),(47,6,'S2',' Universitas Ilmu Terapan','Teknologi Informasi','2010','2018');
/*!40000 ALTER TABLE `lecturer_educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturers`
--

DROP TABLE IF EXISTS `lecturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nidn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sinta_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `academic_field` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturers`
--

LOCK TABLES `lecturers` WRITE;
/*!40000 ALTER TABLE `lecturers` DISABLE KEYS */;
INSERT INTO `lecturers` VALUES (5,'Prof. Dr. Maria Wulandari, RN, Ph.D.','0934523465','Maria @gmail.com','https://sinta.kemdikbud.go.id/authors/profile/6019394','Pendidikan, teknologi, internet','cDMAxmcPUDy5LttiZb3S.png','2023-08-03 11:26:08','2023-08-04 01:25:10'),(6,' Prof. Dr. Ibuana Sutanto, M.Sc.','1234567890','ibuana.sutanto@example.com','https://sinta.kemdikbud.go.id/authors/profile/6019394',' Ilmu Komputer, teknologi, informatika','etGGLSXFsZuIbQk0eJnT.png','2023-08-04 01:13:23','2023-08-04 01:29:28'),(7,'Prof. Dr. Budi Raharjo, MBA','9876543210','budi.raharjo@example.com','https://sinta.kemdikbud.go.id/authors/profile/6019394','Ekonomi Pembangunan','q4cCbb4aQGyUK8OL5QCN.png','2023-08-04 01:16:02','2023-08-04 01:16:02'),(8,'Prof. Dr. Anto Wijaya, Psy.D.','5678901234','anto.wijaya@example.com','https://sinta.kemdikbud.go.id/authors/profile/6019394',' Psikologi Klinis','mZpNaaGtqaot3iQXT7BJ.png','2023-08-04 01:18:06','2023-08-04 01:18:06'),(9,' Prof. Dr. Dharma Putra, Ph.D.','2345678901','dharma.putra@example.com','https://sinta.kemdikbud.go.id/authors/profile/6019394','Sastra Indonesia','VHCtZm5S3Zg5FgVq5b9b.png','2023-08-04 01:19:29','2023-08-04 01:19:29'),(10,'Prof. Dr. Agus Santoso, D.Sc.','4567890123','agus.santoso@example.com','https://sinta.kemdikbud.go.id/authors/profile/6019394','Kimia Organik, pendidikan','bf8ksgKsKv8ArSZ0UF8V.png','2023-08-04 01:22:04','2023-08-04 01:22:04'),(11,'Prof. Dr. Iwan Setiawan, M.Eng.','6789012345','iwan.setiawan@example.com','https://sinta.kemdikbud.go.id/authors/profile/6019394','Teknik Elektro','QQ2ZnnOAUvEQHbtnjEem.png','2023-08-04 01:24:02','2023-08-04 01:24:02');
/*!40000 ALTER TABLE `lecturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_12_26_030321_create_permission_tables',1),(6,'2023_12_26_054706_create_buildings_table',1),(7,'2023_12_26_054749_create_floors_table',1),(8,'2023_12_26_054908_create_rooms_table',1),(9,'2023_12_27_072020_create_categories_table',1),(10,'2023_12_27_080340_create_conditions_table',1),(11,'2023_12_27_083246_create_acquisition_methods_table',1),(12,'2023_12_27_120332_create_assets_table',1),(13,'2023_12_27_121456_create_asset_categories_table',1),(14,'2023_12_27_121812_create_galleries_table',1),(15,'2024_01_13_045458_add_quantity_and_total_price_to_assets_table',1),(16,'2024_01_16_035351_create_placement_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',2);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author` bigint unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int NOT NULL DEFAULT '0',
  `publication_date` date NOT NULL,
  `status` enum('publish','pending','no_publish') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `news_author_foreign` (`author`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (4,1,'SkFkVr3adh5aureeM4U79ugtrPzNzgLVNTwik2L8.png',NULL,0,'2023-07-27','publish','2023-07-26 00:37:17','2023-07-26 00:37:23');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_tags`
--

DROP TABLE IF EXISTS `news_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `news_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `news_tags_news_id_foreign` (`news_id`),
  KEY `news_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `news_tags_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`),
  CONSTRAINT `news_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_tags`
--

LOCK TABLES `news_tags` WRITE;
/*!40000 ALTER TABLE `news_tags` DISABLE KEYS */;
INSERT INTO `news_tags` VALUES (7,4,2),(8,4,3);
/*!40000 ALTER TABLE `news_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_translations`
--

DROP TABLE IF EXISTS `news_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `news_id` bigint unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption_image` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_translations_news_id_locale_unique` (`news_id`,`locale`),
  KEY `news_translations_locale_index` (`locale`),
  CONSTRAINT `news_translations_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_translations`
--

LOCK TABLES `news_translations` WRITE;
/*!40000 ALTER TABLE `news_translations` DISABLE KEYS */;
INSERT INTO `news_translations` VALUES (7,4,'id','Kasus COVID-19 Menurun Secara Signifikan di Kota-kota Besar, Redakan Kekhawatiran Pandemi','kasus-covid-19-menurun-secara-signifikan-di-kota-kota-besar-redakan-kekhawatiran-pandemi','<p>Dalam perkembangan terbaru, kota-kota besar di seluruh dunia melaporkan penurunan signifikan dalam kasus COVID-19, memberikan harapan di tengah pandemi. Otoritas kesehatan dan para ahli menyebut penurunan ini karena kampanye vaksinasi yang berhasil, kepatuhan terus-menerus terhadap langkah-langkah kesehatan masyarakat, dan peningkatan kekebalan di kalangan penduduk.</p><p><br></p><p>Wilayah metropolitan seperti New York City, London, dan Tokyo telah menyaksikan penurunan yang mencolok dalam tingkat infeksi selama beberapa minggu terakhir. Penurunan ini telah mendorong pemerintah untuk dengan hati-hati mengurangi beberapa pembatasan untuk menghidupkan kembali perekonomian mereka sambil terus memantau situasi dengan cermat.</p><p><br></p><p>Meskipun tren positif ini, para pejabat kesehatan menekankan pentingnya tetap waspada, terutama dengan munculnya varian baru. Mereka mendorong masyarakat untuk divaksinasi dan terus menggunakan masker di tempat-tempat ramai untuk mencegah kemungkinan timbulnya kembali virus.</p>','keterangan gambar'),(8,4,'en','COVID-19 Cases Drop Significantly in Major Cities, Easing Pandemic Concerns','covid-19-cases-drop-significantly-in-major-cities-easing-pandemic-concerns','<p>In a recent development, major cities worldwide have reported a significant drop in COVID-19 cases, offering a glimmer of hope amidst the pandemic. Health authorities and experts attribute this decline to the successful implementation of vaccination campaigns, continued adherence to public health measures, and increased immunity among the population.</p><p><br></p><p>Metropolitan areas like New York City, London, and Tokyo have witnessed a notable decline in infection rates over the past few weeks. This decline has prompted governments to cautiously ease certain restrictions to revive their economies while closely monitoring the situation.</p><p><br></p><p>Despite the positive trend, health officials emphasize the importance of remaining vigilant, especially with the emergence of new variants. They encourage people to get vaccinated and continue wearing masks in crowded places to prevent any potential resurgence of the virus.</p>','caption image');
/*!40000 ALTER TABLE `news_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizational_structures`
--

DROP TABLE IF EXISTS `organizational_structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizational_structures` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizational_structures`
--

LOCK TABLES `organizational_structures` WRITE;
/*!40000 ALTER TABLE `organizational_structures` DISABLE KEYS */;
INSERT INTO `organizational_structures` VALUES (1,'Struktur PTI (2021-2026)','PTI Structrue (2021-2026)','6sxOejG5k4nBjSThL51z.jpg','2023-07-30 08:06:39','2023-07-30 08:36:10'),(2,'judul update','title update','cKjXgVxfOHE2MAeaeElq.png','2023-07-30 08:24:18','2023-07-30 08:24:18'),(3,'judul update','title update','6sxOejG5k4nBjSThL51z.jpg','2023-07-30 08:25:37','2023-07-30 08:25:37');
/*!40000 ALTER TABLE `organizational_structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `placements`
--

DROP TABLE IF EXISTS `placements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `placements` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building_id` bigint unsigned NOT NULL,
  `floor_id` bigint unsigned DEFAULT NULL,
  `room_id` bigint unsigned DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `placement_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `placements_asset_id_foreign` (`asset_id`),
  KEY `placements_building_id_foreign` (`building_id`),
  KEY `placements_floor_id_foreign` (`floor_id`),
  KEY `placements_room_id_foreign` (`room_id`),
  CONSTRAINT `placements_asset_id_foreign` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`),
  CONSTRAINT `placements_building_id_foreign` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`),
  CONSTRAINT `placements_floor_id_foreign` FOREIGN KEY (`floor_id`) REFERENCES `floors` (`id`),
  CONSTRAINT `placements_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `placements`
--

LOCK TABLES `placements` WRITE;
/*!40000 ALTER TABLE `placements` DISABLE KEYS */;
INSERT INTO `placements` VALUES ('3bfd5e38-8fb6-4e26-a98e-0c81bff37386','fb85e26f-1199-4160-a652-79497a4dac2d',4,1,1,'PL00002',NULL,'2024-06-21','2024-06-20 16:31:29','2024-06-20 16:31:29'),('88039f22-0319-46a9-88b6-44cee9a3300b','e6b510ca-7800-48e0-8152-2806b6ac755d',4,1,1,'PL00001',NULL,'2024-03-08','2024-03-07 18:20:03','2024-03-07 18:20:03');
/*!40000 ALTER TABLE `placements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','web','2024-03-07 18:09:37','2024-03-07 18:09:37');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `floor_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rooms_floor_id_foreign` (`floor_id`),
  CONSTRAINT `rooms_floor_id_foreign` FOREIGN KEY (`floor_id`) REFERENCES `floors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,1,'Ruangan A101','2024-03-07 18:12:31','2024-03-07 18:12:31'),(2,1,'Ruangan A102','2024-03-07 18:12:47','2024-03-07 18:12:47'),(3,1,'Ruangan A103','2024-03-07 18:12:53','2024-03-07 18:12:53');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0vS4XgVAtrqbq53057CtcpaRSPC2k1uOHFuFVdoo',NULL,'185.237.144.196','Go-http-client/1.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaG13MG9JTUl5MEtvN3BYUXBjcjNFY0ZvdndYcE1VSnE4Q202RUgydSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zdGkudW1rZW5kYXJpLmFjLmlkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1716959280),('1LcJ7l9pdneW6ERLEnE5kzpNeveGnMKMeaaN6vwQ',NULL,'157.55.39.48','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidEhKaFV3aVRVNzRLa1VFZmtMVHlEaFZTaGdWS2xyMnhPMXNnNVhMNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3LnN0aS51bWtlbmRhcmkuYWMuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1716961769),('4MuQrVmfAyatBlEGnGTGukII9oJPVSAWQfIjseDy',NULL,'157.55.39.48','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibWhlT1hRaHJES0ltbG04dGlCVW5wUVhhWkhjcldreWNrTWVFa1Z1RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vd3d3LnN0aS51bWtlbmRhcmkuYWMuaWQvdW5kdWhhbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716961790),('6trQHEo0yUnZSkHeyH7x0FXw4KYyQG2cillXfDri',NULL,'52.167.144.230','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEs2VHdycXUwMjhLYjBSOUdHTGROVDg4QWZGMUM0dlZicTJMZzI0UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTE3OiJodHRwczovL3d3dy5zdGkudW1rZW5kYXJpLmFjLmlkL2luZm9ybWFzaS9wdGktdW1rZW5kYXJpLXN0dWRlbnRzLWxhdW5jaC1pbm5vdmF0aXZlLW1vYmlsZS1hcHAtZm9yLWNoaWxkcmVucy1lZHVjYXRpb24iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1716961800),('9ybQWBIKpHlgyQCyQmQ7JJ6SueuI7wmI9qeHOax7',NULL,'185.237.144.196','Go-http-client/1.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoibmgzSUVIRVZlQnNuQlNURThSVzRPR0tzSnZXdHRBbkFueFRyNmhVRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zdGkudW1rZW5kYXJpLmFjLmlkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1716957512),('EUySsFcvIf5TkKizjglepcUEYS3AQK6IDMcTgHzK',NULL,'185.237.144.196','Go-http-client/1.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzNiWDJBYWhQcHFxQmh4cUt0N3pWTFZOdUZxUWRtRk05cENzeXdObCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zdGkudW1rZW5kYXJpLmFjLmlkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1716962865),('gejrwnU3PWFMBPT3FXzBlxDhMn9PcLLdENgJO8G3',NULL,'103.94.11.154','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoibmltejI2ZmF3cUFDbUVqTURuckFTQlcxakV0R3N0WUl6emhlTGdUQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vc3RpLnVta2VuZGFyaS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NjoibG9jYWxlIjtzOjI6ImlkIjt9',1716961758),('GFCmsiNdclOdkJIJpUlaiWNvlak16WPpkUZzTXdY',NULL,'52.167.144.230','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibll1TVBORGZ5UGNKblRVbTdjaUNqdTBHOGRPZ0djalVrV013VVlaOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODg6Imh0dHBzOi8vd3d3LnN0aS51bWtlbmRhcmkuYWMuaWQvaW5mb3JtYXNpL2luLXBlcnNvbi1jbGFzc2VzLXJlc3VtZS13aXRoLXN0cmljdC1wcm90b2NvbHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1716961800),('GlOjgop4oVZc31AGsTXrLeFMTtyjUhsusyxzbUgR',NULL,'40.77.167.132','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidnJoNGNIN0o0a0Z4M215QjZSdWlFU3BkV2lQVVBBbWdHMzJWbGQ1NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vd3d3LnN0aS51bWtlbmRhcmkuYWMuaWQvdGVudGFuZy9zdHJ1a3R1ci1vcmdhbmlzYXNpIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1716961805),('H3wwgG6X6FdUvqg9B4hdgLdFuWZFJPW5mF5vaDlm',NULL,'52.167.144.237','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidGFid3ZUbHFISnVFd3VsbGlGRldUZlIyV1o0NWxzc2pYbHJHY1BJQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTE6Imh0dHBzOi8vd3d3LnN0aS51bWtlbmRhcmkuYWMuaWQvaW5mb3JtYXNpL2NoYW5nZXMtaW4tb2RkLXNlbWVzdGVyLTIwMjMyMDI0LWxlY3R1cmUtc2NoZWR1bGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1716962435),('IYH1zqLq1PxKy8hDWkb7S67gtHDNAXk1twAxPYps',NULL,'40.77.167.132','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTmFIdFNEc1V4cTl1NjFibTB3eEFXbncySWhabk84YWkzM29ST3lRUSI7czo2OiJsb2NhbGUiO3M6MjoiaWQiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ3OiJodHRwczovL3d3dy5zdGkudW1rZW5kYXJpLmFjLmlkL2dhbnRpLWJhaGFzYS9pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716961810),('lJtyDblvXongubXuXP97xcMleUK5uJ66IoCjhSSq',NULL,'157.55.39.48','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieGpPNkprakt4TThRMDd2b2s5VWoySUlaNTNOQkxuMWJmSUR1OVlRRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vd3d3LnN0aS51bWtlbmRhcmkuYWMuaWQvdGVudGFuZy9kb3NlbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716961791),('lpcZzg3PTqdsot5sQEnINIjj27JoiRtPmjMVjytG',NULL,'157.55.39.204','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2t3cmZDYWkxWXBmOEhOb29NTDZtTEFub25WVll3UlFCc0xxRFRybCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vc3RpLnVta2VuZGFyaS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716961759),('ofVXnig6WZABQwdsGkA3JI0wMs5rYWye1K8WxRx6',NULL,'40.77.167.132','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibzRBYjhuOHZ3aFVycFpvS1JNYXJYQXBMVlBXdmZETWl0R3pRQUFMbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vd3d3LnN0aS51bWtlbmRhcmkuYWMuaWQvaW5mb3JtYXNpIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1716961805),('PUf3XEibh9SSrUwTrnUqtoq2bAYF1tFslVjaqO50',NULL,'157.55.39.48','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGVzQjJxTHdPQjBCWVVFOUFZUEJjaXhva3FTYmFUVUVIaktOQU92NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vd3d3LnN0aS51bWtlbmRhcmkuYWMuaWQvZXZlbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1716961791),('r4INcreDeJuVN9WoEvsqWtS45VXS75OVHkNbMh4H',NULL,'52.167.144.230','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXJQQkd0N3ZGd3REUWNCNE9HUFUxUHd0OGRNT21tR3QyNEVhVlRUeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTY6Imh0dHBzOi8vd3d3LnN0aS51bWtlbmRhcmkuYWMuaWQvaW5mb3JtYXNpL2JpZy1kYXRhLWFuYWx5dGljcy13b3Jrc2hvcC1mb3ItcHRpLXVta2VuZGFyaS1zdHVkZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1716961799),('SJUxbxyvGJG5uWNdj89YwQSD5hiIZ40XqIVasrMe',NULL,'40.77.167.132','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGs5b2JRbEk1T09CSkp4RkR1UWU2bjFlU0Rad0hCUmFPd3h6SWNLaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTE0OiJodHRwczovL3d3dy5zdGkudW1rZW5kYXJpLmFjLmlkL2V2ZW50L2luZm9ybWF0aW9uLXRlY2hub2xvZ3ktZWR1Y2F0aW9uLXN0dWR5LXByb2dyYW0tY3VycmljdWx1bS1ldmFsdWF0aW9uLW1lZXRpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1716961811),('svEJ6QqVO2JKgSYQfG7dIOKOyG43m18DM7xxFg0b',NULL,'40.77.167.132','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUdyYWtNczFGdkVGYlZxWGp4SUYxbXZyQ0oydlRyU3l5M0dGOXBuVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHBzOi8vd3d3LnN0aS51bWtlbmRhcmkuYWMuaWQvaW5mb3JtYXNpL2FkdmFuY2VkLXByb2dyYW1taW5nLXNlbWluYXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1716961806),('tZvjsqCzPtRWleQNM9TvkCC0IFw0GVEtq0wugcwR',NULL,'40.77.167.132','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkJGdzVRZTRPOVZ2SFlGdWVyS1BzdVhRWW44MlpmM1BMQzBYT0c5QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQyOiJodHRwczovL3d3dy5zdGkudW1rZW5kYXJpLmFjLmlkL2V2ZW50L3dvcmtzaG9wLW9uLWRldmVsb3BpbmctZGlnaXRhbC10ZWFjaGluZy1tYXRlcmlhbHMtZm9yLXRoZS1pbmZvcm1hdGlvbi10ZWNobm9sb2d5LWVkdWNhdGlvbi1zdHVkeS1wcm9ncmFtIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1716961806),('uQlMJycZEHTC56DXRW6Rc89W72URjzX4QE5jr6WU',NULL,'103.94.11.154','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM05FRHlLRkh3bTZKc2VtbVREc2EycXdmNnZJV3dYT1pXTGFObk9FNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHBzOi8vd3d3LnN0aS51bWtlbmRhcmkuYWMuaWQvdGVudGFuZy92aXNpLW1pc2kiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6ImxvY2FsZSI7czoyOiJlbiI7fQ==',1716961379),('UzZ1lJc9swh56iR7y9eFIPmV3xPuwDntEDu3MK7V',NULL,'185.237.144.196','Go-http-client/1.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjZPZU1hbFJyQXJmVTVKeVNuTVIyR0w1RkpONmhwS2pWU0FFanRCQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zdGkudW1rZW5kYXJpLmFjLmlkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1716961086),('W54xxD9VoBRtJZiJpWvL1ghu7U6rBtkaN4FkDvsD',NULL,'185.237.144.196','Go-http-client/1.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWJ3c3JGeDJzd1E5TUtGQzdTbUNrUVh0bXo3cVl1YlNDSWFzZDJMbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zdGkudW1rZW5kYXJpLmFjLmlkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1716955802),('WjwXP5TA6MYoDgvZJxJ2BKLMevbjUCDGcw61TdNK',NULL,'40.77.167.132','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSU11eGUwN3hwYlQwS1BVTmtiOHpZaWFnMlJXQ0RpRktHUVcxM2VqMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vd3d3LnN0aS51bWtlbmRhcmkuYWMuaWQvdGVudGFuZy9zdGFmIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1716961804),('XyJc5AKyBXpkuqY4B61wUaoEGxtrK2wm5BNjgqbo',NULL,'52.167.144.4','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHNXZ2N5R011aEZHd2pqd3oxa2tzaTFCOHlybEpvaFBPcjFvNWtscCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vd3d3LnN0aS51bWtlbmRhcmkuYWMuaWQva3VyaWt1bHVtIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1716962971),('YSaRwh2G2i7bYmjBNec7Qvy205T9B9PHq4KDk4zf',NULL,'103.94.11.154','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVmN6SmY2RXBmczNXWDY2TzdVMWhGWHZoTHFObkxvR0U1cHhUQ0dhdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vc3RpLnVta2VuZGFyaS5hYy5pZC90ZW50YW5nL3N0cnVrdHVyLW9yZ2FuaXNhc2kiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6ImxvY2FsZSI7czoyOiJpZCI7fQ==',1716961051),('z4bwaPLjsADw5TknmNEnccqWdC5efZjBvYwkvIP2',NULL,'157.55.39.48','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1JnSUVjaUZWWnVubXl6YmlOVUN2TGk1bE1nMGlrcHZiUmlhTjN0dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHBzOi8vd3d3LnN0aS51bWtlbmRhcmkuYWMuaWQvdGVudGFuZy9rYXByb2RpIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1716961790),('zdrrSgjVF4lUbuEH0NlXVeUD7WzY4rO4JmLgVjsl',NULL,'157.55.39.14','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0xEQVpXblFVRHExb3JEeHZvczJZM1VHcmNJdmNicE42T2ZjVEFubCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTE0OiJodHRwczovL3d3dy5zdGkudW1rZW5kYXJpLmFjLmlkL2luZm9ybWFzaS9wdGktdW1rZW5kYXJpLXN0dWRlbnRzLWFjaGlldmUtYXdhcmQtaW4taW50ZXJuYXRpb25hbC1jb2RpbmctY29tcGV0aXRpb24iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1716962501);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_translations`
--

DROP TABLE IF EXISTS `setting_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `setting_id` bigint unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `web_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_translations_setting_id_locale_unique` (`setting_id`,`locale`),
  KEY `setting_translations_locale_index` (`locale`),
  CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_translations`
--

LOCK TABLES `setting_translations` WRITE;
/*!40000 ALTER TABLE `setting_translations` DISABLE KEYS */;
INSERT INTO `setting_translations` VALUES (9,6,'id','Sistem dan Teknologi Informasi ','solusi teknologi, STI UMKendari, konsultasi TI, pengembangan perangkat lunak, jaringan dan keamanan, dukungan teknis.'),(10,6,'en','Information Systems and Technology','technological solutions, STI UMKendari, IT consultation, custom software development, networking and security, technical support.');
/*!40000 ALTER TABLE `setting_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `leader_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leader_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leader_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (6,'Muhammad Akbar Yasin, S.T., M.T.','akbar.yasin@umkendari.ac.id','CaOSko6bexJn5uXJuUac.jpg','ptisdf@umkendari.ac.id','08234354357','2023-08-02 11:29:16','2023-10-11 00:45:35');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('static','carousel') COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `filepath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES (30,'carousel',NULL,NULL,NULL,'2Ww62K9JkEyZ6SoZPzD2.svg','2023-08-09 02:37:45','2023-08-09 02:37:45'),(31,'carousel',NULL,NULL,NULL,'75QVswPSTNdylBPb86DA.svg','2023-08-09 02:37:45','2023-08-09 02:37:45'),(32,'carousel',NULL,NULL,NULL,'v9TWqKgfiFn6bzDchfTb.svg','2023-08-09 02:37:45','2023-08-09 02:37:45');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_media`
--

DROP TABLE IF EXISTS `social_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_media`
--

LOCK TABLES `social_media` WRITE;
/*!40000 ALTER TABLE `social_media` DISABLE KEYS */;
INSERT INTO `social_media` VALUES (1,'Facebook','https://www.facebook.com/umkdi/?locale=id_ID','<i class=\"fa-brands fa-facebook\"></i>','2023-08-10 01:59:31','2023-08-10 01:59:31'),(2,'Instagram','https://www.instagram.com/umkendari/','<i class=\"fa-brands fa-instagram\"></i>','2023-08-10 01:59:31','2023-08-10 01:59:31'),(3,'Twitter','https://twitter.com/Umkendari_','<i class=\"fa-brands fa-twitter\"></i>','2023-08-10 01:59:31','2023-08-10 01:59:31'),(4,'Tik tok','https://www.tiktok.com/discover/umk-kendari','<i class=\"fa-brands fa-tiktok\"></i>','2023-08-10 01:59:31','2023-08-10 01:59:31'),(5,'Youtube','https://www.youtube.com/@umkendari3181','<i class=\"fa-brands fa-youtube\"></i>','2023-08-10 01:59:31','2023-08-10 01:59:31');
/*!40000 ALTER TABLE `social_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_staff_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_staff_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffs`
--

LOCK TABLES `staffs` WRITE;
/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
INSERT INTO `staffs` VALUES (4,'Mochammad Ali','mochammad.ali@umkendari.ac.id','Laboran','Laboratories','cKzD6ijPNwVuiFIBm5dD.png','2023-08-04 01:31:18','2023-08-04 01:31:18'),(5,'Sri Wahyuni','sri.wahyuni@umkendari.ac.id','Administrasi Akademik','Academic Administration','Dt0PhAJV2OV924thqu4X.png','2023-08-04 01:31:56','2023-08-04 01:31:56'),(6,'I Wayan Sudira','i.wayan.sudira@umkendari.ac.id','Teknisi Laboratorium','Laboratory Technician','XbcSq29XebEyzIZWd6Qd.png','2023-08-04 01:32:29','2023-08-04 01:32:29'),(7,'Dwi Putri Wulandari','dwi.putri.wulandari@umkendari.ac.id','Pustakawan','Librarian','KIIHPjNVrNkjpGwhu5x5.png','2023-08-04 01:33:10','2023-08-04 01:33:10');
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Akademik','akademik','2023-07-25 07:05:38','2023-07-25 07:05:39'),(2,'MOU','mou','2023-07-25 07:06:03','2023-07-25 07:06:04'),(3,'Pendidikan','pendidikan','2023-07-25 07:06:29','2023-07-25 07:06:30'),(4,'Kegiatan Mahasiswa','kegiatan-mahasiswa','2023-07-31 03:03:31','2023-07-31 03:03:32'),(5,'Kegiatan Dosen','kegiatan-dosen','2023-07-31 03:03:54','2023-07-31 03:03:55');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Admin','admin.aset@umkendari.ac.id',NULL,'$2y$12$Bmpfc6lSw8MCZS84T.PNLum1ruQZmcnYoXilaVUtTPMzxhkzztJvW',NULL,'2024-03-07 18:09:37','2024-03-07 18:09:37');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_profiles`
--

DROP TABLE IF EXISTS `video_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_profiles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `url_video` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_yt_channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_id` text COLLATE utf8mb4_unicode_ci,
  `description_en` text COLLATE utf8mb4_unicode_ci,
  `status` enum('publish','no_publish') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_profiles`
--

LOCK TABLES `video_profiles` WRITE;
/*!40000 ALTER TABLE `video_profiles` DISABLE KEYS */;
INSERT INTO `video_profiles` VALUES (2,'https://www.youtube.com/watch?v=vvmdKPtbjDk&t=189s','https://www.youtube.com/@ptiumkendari9804','Ingin mengeksplor lebih jauh tentang Prodi Pendidikan Teknologi Informasi? Jangan lupa untuk mengunjungi YouTube profil resmi kami!','Want to explore more about Information Technology Education Study Program? Don\'t forget to visit our official YouTube profile!','publish','2023-08-03 02:16:16','2023-08-08 02:34:41');
/*!40000 ALTER TABLE `video_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visi_misi`
--

DROP TABLE IF EXISTS `visi_misi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visi_misi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visi_misi`
--

LOCK TABLES `visi_misi` WRITE;
/*!40000 ALTER TABLE `visi_misi` DISABLE KEYS */;
INSERT INTO `visi_misi` VALUES (4,'visi misi','2023-07-27 04:12:39','2023-08-06 22:58:29');
/*!40000 ALTER TABLE `visi_misi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visi_misi_translations`
--

DROP TABLE IF EXISTS `visi_misi_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visi_misi_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `visi_misi_id` bigint unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vision` longtext COLLATE utf8mb4_unicode_ci,
  `mission` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `visi_misi_translations_visi_misi_id_locale_unique` (`visi_misi_id`,`locale`),
  KEY `visi_misi_translations_locale_index` (`locale`),
  CONSTRAINT `visi_misi_translations_visi_misi_id_foreign` FOREIGN KEY (`visi_misi_id`) REFERENCES `visi_misi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visi_misi_translations`
--

LOCK TABLES `visi_misi_translations` WRITE;
/*!40000 ALTER TABLE `visi_misi_translations` DISABLE KEYS */;
INSERT INTO `visi_misi_translations` VALUES (1,4,'id','<p>Menjadi program Teknologi Informasi (IT) yang unggul dan inovatif dalam pendidikan, penelitian, dan pengembangan teknologi, serta menghasilkan lulusan yang berkualitas tinggi dan kompetitif secara global. update</p>','<ol><li>Menyediakan pendidikan berkualitas tinggi dan komprehensif dalam berbagai aspek Teknologi Informasi untuk melengkapi mahasiswa dengan pengetahuan dan keterampilan yang diperlukan.</li><li>Mendorong budaya penelitian dan inovasi di bidang Teknologi Informasi yang berkontribusi pada kemajuan teknologi dan pembangunan masyarakat.</li><li>Berkolaborasi dengan industri dan lembaga lain untuk meningkatkan kesempatan belajar praktis dan mengembangkan keterampilan pemecahan masalah dunia nyata di antara mahasiswa.</li><li>Menumbuhkan profesional TI yang etis dan bertanggung jawab secara sosial yang memberikan kontribusi positif bagi masyarakat dan menjunjung tinggi standar etika dalam praktik mereka.</li><li>Terus mengevaluasi dan meningkatkan kurikulum, metode pengajaran, dan fasilitas untuk memastikan program tetap mutakhir dan relevan di tengah perubahan pesat dalam dunia TI. update</li></ol>'),(2,4,'en','<p>To be a leading and innovative Information Technology (IT) program that fosters excellence in education, research, and technology development, while producing highly skilled and globally competitive graduates. update</p>','<ol><li>Provide high-quality and comprehensive education in various aspects of Information Technology to equip students with the necessary knowledge and skills.</li><li>Foster a culture of research and innovation in Information Technology that contributes to technological advancements and societal development.</li><li>Collaborate with industries and other institutions to enhance practical learning opportunities and promote real-world problem-solving skills among students.</li><li>Cultivate ethical and socially responsible IT professionals who contribute positively to their communities and uphold ethical standards in their practices.</li><li>Continuously assess and improve the curriculum, teaching methods, and facilities to ensure the program remains up-to-date and relevant in the rapidly changing IT landscape. update</li></ol><p><br></p>');
/*!40000 ALTER TABLE `visi_misi_translations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-07  9:22:24
