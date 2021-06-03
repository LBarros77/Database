-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: Biblioteca
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
-- Table structure for table `Autores`
--

DROP TABLE IF EXISTS `Autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Autores` (
  `codigo` int NOT NULL,
  `nome` char(45) NOT NULL,
  `nacionalidade` char(45) DEFAULT 'Brasileira',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Autores`
--

LOCK TABLES `Autores` WRITE;
/*!40000 ALTER TABLE `Autores` DISABLE KEYS */;
INSERT INTO `Autores` VALUES (22564411,'Walter Isaacson','Americana'),(55490076,'Adélia Prado','Brasileira'),(77548854,'Ana Lucia Jankovic Barduchi','Brasileira'),(85668900,'Ethevaldo Siqueira','Brasileira'),(90984133,'Steven Scott','Americana');
/*!40000 ALTER TABLE `Autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Editoras`
--

DROP TABLE IF EXISTS `Editoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Editoras` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nome` char(45) NOT NULL,
  `endereco` char(45) DEFAULT NULL,
  `conta` int DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=9898001 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Editoras`
--

LOCK TABLES `Editoras` WRITE;
/*!40000 ALTER TABLE `Editoras` DISABLE KEYS */;
INSERT INTO `Editoras` VALUES (2134000,'Saraiva','São Paulo',8003434),(2207000,'Eras','Brasilia',8002432),(3557000,'Summer','Curitiba',8002198),(6655000,'Pontos','São Paulo',8005600),(9898000,'Marks','Rio de Janeiro',8009000);
/*!40000 ALTER TABLE `Editoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funcionarios`
--

DROP TABLE IF EXISTS `Funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Funcionarios` (
  `CPF` varchar(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `endereco` char(45) NOT NULL,
  `telefone` int NOT NULL,
  `salario` decimal(3,2) NOT NULL,
  `funcao` char(45) DEFAULT NULL,
  PRIMARY KEY (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionarios`
--

LOCK TABLES `Funcionarios` WRITE;
/*!40000 ALTER TABLE `Funcionarios` DISABLE KEYS */;
INSERT INTO `Funcionarios` VALUES ('20321295096','João Alberto Smith','Itatiba',22447865,0.00,NULL),('23161197770','Ana Salles Azir','Salto',22317865,0.00,'Recepcionista'),('30361290876','Ademir José Silva','Campinas',21531785,0.00,NULL),('32361298734','Luis Henrique Telles','Campinas',21531785,0.00,NULL),('45403612087','Francisco José Almeida','Indaiatuba',25417761,0.00,NULL),('61254590871','Lucia Vicentim','Salto',21316565,0.00,'Bibliotecaria');
/*!40000 ALTER TABLE `Funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Livros`
--

DROP TABLE IF EXISTS `Livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Livros` (
  `numero` int NOT NULL,
  `titulo` char(45) NOT NULL,
  `genero` char(30) NOT NULL,
  `edicao` char(2) DEFAULT NULL,
  `ano_public` year DEFAULT NULL,
  `CPF_funcionario` varchar(11) DEFAULT NULL,
  `codigo_editora` int DEFAULT NULL,
  `CPF_usauarioFle` varchar(11) DEFAULT NULL,
  `CPF_usuarioReservar` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `CPF_funcionario` (`CPF_funcionario`),
  KEY `codigo_editora` (`codigo_editora`),
  KEY `CPF_usauarioFle` (`CPF_usauarioFle`),
  KEY `CPF_usuarioReservar` (`CPF_usuarioReservar`),
  CONSTRAINT `Livros_ibfk_1` FOREIGN KEY (`CPF_funcionario`) REFERENCES `Funcionarios` (`CPF`),
  CONSTRAINT `Livros_ibfk_2` FOREIGN KEY (`codigo_editora`) REFERENCES `Editoras` (`codigo`),
  CONSTRAINT `Livros_ibfk_3` FOREIGN KEY (`CPF_usauarioFle`) REFERENCES `Usuarios` (`CPF`),
  CONSTRAINT `Livros_ibfk_4` FOREIGN KEY (`CPF_usuarioReservar`) REFERENCES `Usuarios` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Livros`
--

LOCK TABLES `Livros` WRITE;
/*!40000 ALTER TABLE `Livros` DISABLE KEYS */;
INSERT INTO `Livros` VALUES (10277843,'O Pelicano','Romance','12',1984,NULL,2134000,NULL,NULL),(32176500,'Salomão - O Homem...','Romance','2',2011,'61254590871',6655000,NULL,NULL),(45112239,'Steve Jobs - a Biografia','Biografia','48',2011,NULL,2207000,'19321122213',NULL),(67392217,'Empregabilidade - co...','Administração','22',1977,'32361298734',9898000,NULL,NULL),(67554421,'Bagagem','Poesia','5',1972,NULL,6655000,NULL,'19321122213'),(77680012,'A Duração do Dia','Poesia','1',2010,NULL,2134000,'10122020232',NULL),(87659908,'Tecnologia que Muld...','Tecnologia','2',2007,NULL,2134000,NULL,'70964411900');
/*!40000 ALTER TABLE `Livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Livros_autores`
--

DROP TABLE IF EXISTS `Livros_autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Livros_autores` (
  `numero_livro` int DEFAULT NULL,
  `codigo_autor` int DEFAULT NULL,
  KEY `numero_livro` (`numero_livro`),
  KEY `codigo_autor` (`codigo_autor`),
  CONSTRAINT `Livros_autores_ibfk_1` FOREIGN KEY (`numero_livro`) REFERENCES `Livros` (`numero`),
  CONSTRAINT `Livros_autores_ibfk_2` FOREIGN KEY (`codigo_autor`) REFERENCES `Autores` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Livros_autores`
--

LOCK TABLES `Livros_autores` WRITE;
/*!40000 ALTER TABLE `Livros_autores` DISABLE KEYS */;
INSERT INTO `Livros_autores` VALUES (32176500,22564411),(45112239,22564411),(10277843,55490076),(67554421,55490076),(67392217,77548854),(87659908,85668900),(32176500,90984133);
/*!40000 ALTER TABLE `Livros_autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios` (
  `CPF` varchar(11) NOT NULL,
  `nome` char(30) NOT NULL,
  `endereco` char(45) DEFAULT NULL,
  `telefone` int NOT NULL,
  PRIMARY KEY (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES ('10122020232','Maria de Lourdes Amaral',NULL,35440089),('19321122213','José Francisco de Paula',NULL,27219756),('22539910976','Ivete Medina Chernell',NULL,48170352),('45399109881','Raquel Santos',NULL,87603451),('70964411900','Luiza Souza Prado',NULL,34559087),('8','Maria de Lourdes Amaral',NULL,35440089);
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-03 19:43:20
