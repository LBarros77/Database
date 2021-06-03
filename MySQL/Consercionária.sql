-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: consercionária
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Disponíveis`
--

DROP TABLE IF EXISTS `Disponíveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Disponíveis` (
  `CodModelo` int DEFAULT NULL,
  `CodFilial` int DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Quantidade` int DEFAULT NULL,
  KEY `CodModelo` (`CodModelo`),
  KEY `CodFilial` (`CodFilial`),
  CONSTRAINT `Disponíveis_ibfk_1` FOREIGN KEY (`CodModelo`) REFERENCES `Modelo` (`CodModelo`),
  CONSTRAINT `Disponíveis_ibfk_2` FOREIGN KEY (`CodFilial`) REFERENCES `Filial` (`CodFilial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disponíveis`
--

LOCK TABLES `Disponíveis` WRITE;
/*!40000 ALTER TABLE `Disponíveis` DISABLE KEYS */;
INSERT INTO `Disponíveis` VALUES (1,1,'2012-08-27',6),(3,2,'2011-05-13',4),(4,1,'2012-09-20',8);
/*!40000 ALTER TABLE `Disponíveis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Filial`
--

DROP TABLE IF EXISTS `Filial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Filial` (
  `CodFilial` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(40) NOT NULL,
  `Cidade` varchar(20) DEFAULT 'Recife',
  PRIMARY KEY (`CodFilial`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Filial`
--

LOCK TABLES `Filial` WRITE;
/*!40000 ALTER TABLE `Filial` DISABLE KEYS */;
INSERT INTO `Filial` VALUES (1,'Grande Rio','Petrolina'),(2,'Multicar','Juazeiro'),(3,'Pomal','Petrolina');
/*!40000 ALTER TABLE `Filial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marca`
--

DROP TABLE IF EXISTS `Marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Marca` (
  `CodMarca` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(40) NOT NULL,
  `PaisOrigem` varchar(20) NOT NULL DEFAULT 'Brasil',
  PRIMARY KEY (`CodMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marca`
--

LOCK TABLES `Marca` WRITE;
/*!40000 ALTER TABLE `Marca` DISABLE KEYS */;
INSERT INTO `Marca` VALUES (1,'VW','Brasil'),(3,'Ford','Brasil'),(4,'Fiat','Brasil');
/*!40000 ALTER TABLE `Marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Modelo`
--

DROP TABLE IF EXISTS `Modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Modelo` (
  `CodModelo` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(40) NOT NULL,
  `Tipo` varchar(20) DEFAULT NULL,
  `Cor` varchar(15) NOT NULL,
  `Cidade` varchar(20) DEFAULT NULL,
  `CodMarca` int DEFAULT NULL,
  PRIMARY KEY (`CodModelo`),
  KEY `CodMarca` (`CodMarca`),
  CONSTRAINT `Modelo_ibfk_1` FOREIGN KEY (`CodMarca`) REFERENCES `Marca` (`CodMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Modelo`
--

LOCK TABLES `Modelo` WRITE;
/*!40000 ALTER TABLE `Modelo` DISABLE KEYS */;
INSERT INTO `Modelo` VALUES (1,'Gol','Power','Preto','Salgueiro',1),(2,'Palio','Flex','Vermelho','Petrolina',4),(3,'EcoSport','Flex','Prata','Juazeiro',3),(4,'Fox','SportLine','Cinza','Salgueiro',1);
/*!40000 ALTER TABLE `Modelo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-03 19:30:21
