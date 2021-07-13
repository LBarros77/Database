-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: Logistica
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
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `IdCliente` int NOT NULL,
  `NomeCliente` varchar(40) NOT NULL,
  `Endereco` varchar(40) NOT NULL,
  `Cidade` varchar(30) DEFAULT 'São Paulo',
  `Estado` varchar(30) DEFAULT 'São Paulo',
  `Obs` text,
  PRIMARY KEY (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,'José Reicen','Rua das Mães, 234','Osasco','São Paulo',NULL),(10,'Keila Martins','AV. Constantim, 432','Belém','Pará',NULL),(11,'Carme Luciola de Souza','Jardim America, Rua Palmitos, 31','Brasil','Brasilia',NULL),(100,'Divaldo Almeida','Cantares, AV. Floriano, 902','Belo Horizonte','Minas Gerais',NULL),(101,'Pedro Well','Jardim das Oliveiras, 09, 762','São Paulo','São Paulo',NULL),(110,'Di Maria Clementino','AV. JP Alves, 402','Guaruja','São Paulo',NULL),(2997,'Marlene Costa','Rua do Carmo Pereira, 54','Campinas','São Paulo',NULL);
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrdemPedido`
--

DROP TABLE IF EXISTS `OrdemPedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrdemPedido` (
  `IdOrdemPedido` int NOT NULL AUTO_INCREMENT,
  `IdProduto` int NOT NULL,
  `IdPedido` int NOT NULL,
  `Quantidade` int unsigned DEFAULT NULL,
  PRIMARY KEY (`IdOrdemPedido`),
  KEY `ID_Produto` (`IdProduto`),
  KEY `ID_Pedido` (`IdPedido`),
  CONSTRAINT `ID_Pedido` FOREIGN KEY (`IdPedido`) REFERENCES `Pedidos` (`IdPedido`),
  CONSTRAINT `ID_Produto` FOREIGN KEY (`IdProduto`) REFERENCES `Produtos` (`IdProduto`),
  CONSTRAINT `check_quantidade` CHECK ((`Quantidade` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=8744 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrdemPedido`
--

LOCK TABLES `OrdemPedido` WRITE;
/*!40000 ALTER TABLE `OrdemPedido` DISABLE KEYS */;
INSERT INTO `OrdemPedido` VALUES (1983,3,9923,14),(2781,4,3255,8),(3222,2,7382,10),(8015,2311,3256,4),(8743,1,9022,5);
/*!40000 ALTER TABLE `OrdemPedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedidos`
--

DROP TABLE IF EXISTS `Pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedidos` (
  `IdPedido` int NOT NULL AUTO_INCREMENT,
  `IdCliente` int NOT NULL,
  `IdTransportadora` int NOT NULL,
  `Data` date NOT NULL,
  `Obs` text,
  PRIMARY KEY (`IdPedido`),
  KEY `IdCliente` (`IdCliente`),
  KEY `IdTransportadora` (`IdTransportadora`),
  CONSTRAINT `Pedidos_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `Clientes` (`IdCliente`),
  CONSTRAINT `Pedidos_ibfk_2` FOREIGN KEY (`IdTransportadora`) REFERENCES `Transportadoras` (`IdTransportadora`)
) ENGINE=InnoDB AUTO_INCREMENT=9924 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedidos`
--

LOCK TABLES `Pedidos` WRITE;
/*!40000 ALTER TABLE `Pedidos` DISABLE KEYS */;
INSERT INTO `Pedidos` VALUES (3255,11,3287,'2021-09-14',NULL),(3256,10,3287,'2021-09-14',NULL),(5632,2997,4021,'2021-09-15',NULL),(7382,100,7811,'2021-04-02',NULL),(9022,110,9120,'2020-03-12',NULL),(9923,101,4021,'2020-04-03',NULL);
/*!40000 ALTER TABLE `Pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produtos`
--

DROP TABLE IF EXISTS `Produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Produtos` (
  `IdProduto` int NOT NULL AUTO_INCREMENT,
  `NomeProduto` varchar(40) NOT NULL,
  `Descricao` text,
  `Preco` float NOT NULL,
  `Quantidade` int unsigned DEFAULT NULL,
  PRIMARY KEY (`IdProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=2312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produtos`
--

LOCK TABLES `Produtos` WRITE;
/*!40000 ALTER TABLE `Produtos` DISABLE KEYS */;
INSERT INTO `Produtos` VALUES (1,'Esmerilhadeira Bosch','Verde, 220w',400,3),(2,'Furadeira Dewalt','Amarela, martelete',499.99,2),(3,'Serra circular Dewalt','Amarela, diamtro de disco 5/8\'',549.9,1),(4,'Retifica Bosch','Verde',320.5,2),(5,'Serra linear Bosch','Verde, modo turbo',280.78,1),(2311,'SPMW34',NULL,200,6);
/*!40000 ALTER TABLE `Produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transportadoras`
--

DROP TABLE IF EXISTS `Transportadoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transportadoras` (
  `IdTransportadora` int NOT NULL,
  `NomeTransportadora` varchar(30) NOT NULL,
  `Edereco` varchar(40) NOT NULL,
  `Cidade` varchar(30) DEFAULT 'São Paulo',
  `Atividade` varchar(40) DEFAULT 'Transporte de cargas',
  PRIMARY KEY (`IdTransportadora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transportadoras`
--

LOCK TABLES `Transportadoras` WRITE;
/*!40000 ALTER TABLE `Transportadoras` DISABLE KEYS */;
INSERT INTO `Transportadoras` VALUES (2010,'TransAmeric','Lapa, Rua Montinho, 39','Rio de Janeiro','Cargas pesadas'),(2399,'TRANSCAR','Vila M, Rua Jane, 2015','Belo Horizonte','Transporte de cargas'),(3287,'Levo Já','Jardim Patricia, Rua Cornete, 221','Uberlândia','Cargas médias'),(4021,'Trans Norte','Nobrezim, AV. Camarões, 49','Abaré','Carga peso pena'),(7811,'TRANSCAR','Centro, Av. jão silva, 732','Vista Alegre','Transporte de cargas'),(9120,'TRPMG','Carapicuiba, Rua São Beneditot, 1004','São Paulo','Cargas médias');
/*!40000 ALTER TABLE `Transportadoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Logistica'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-13  7:19:19
