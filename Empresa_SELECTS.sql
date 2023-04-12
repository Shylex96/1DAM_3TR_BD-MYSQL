-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: empresa
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `centrostrabajo`
--

DROP TABLE IF EXISTS `centrostrabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centrostrabajo` (
  `idCentroTrabajo` int NOT NULL,
  `nombreCentroTrabajo` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `direccionCentroTrabajo` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idCentroTrabajo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centrostrabajo`
--

LOCK TABLES `centrostrabajo` WRITE;
/*!40000 ALTER TABLE `centrostrabajo` DISABLE KEYS */;
INSERT INTO `centrostrabajo` VALUES (10,'Sede Central','C/Alcalá, 820, Madrid'),(20,'Relación con Clientes','C/Atocha, 405, Madrid');
/*!40000 ALTER TABLE `centrostrabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `idDepartamento` int NOT NULL,
  `idCentroTrabajoFK` int DEFAULT NULL,
  `idEmpleadoFK` int DEFAULT NULL,
  `tipoDirectorDepartamento` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `presupuestoDepartamento` decimal(10,0) DEFAULT NULL,
  `idDepartamentoFK` int DEFAULT NULL,
  `nombreDepartamento` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idDepartamento`),
  KEY `idCentroTrabajoFK1` (`idCentroTrabajoFK`),
  KEY `idEmpleadoFK1` (`idEmpleadoFK`),
  KEY `idDepartamentoFK1` (`idDepartamentoFK`),
  CONSTRAINT `idCentroTrabajoFK1` FOREIGN KEY (`idCentroTrabajoFK`) REFERENCES `centrostrabajo` (`idCentroTrabajo`),
  CONSTRAINT `idDepartamentoFK1` FOREIGN KEY (`idDepartamentoFK`) REFERENCES `departamentos` (`idDepartamento`),
  CONSTRAINT `idEmpleadoFK1` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleados` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (100,10,260,'P',12,NULL,'DIRECCION GENERAL'),(110,20,180,'P',15,100,'DIRECCION COMERCIAL'),(111,20,180,'F',11,110,'SECTOR INDUSTRIAL'),(112,20,270,'P',9,110,'SECTOR SERVICIOS'),(120,10,150,'F',3,100,'ORGANIZACION'),(121,10,150,'P',2,120,'PERSONAL'),(122,10,350,'P',6,120,'PROCESO DE DATOS'),(130,10,310,'P',2,100,'FINANZAS');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `idEmpleado` int NOT NULL,
  `idDepartamentoFK` int DEFAULT NULL,
  `extensionEmpleado` smallint DEFAULT NULL,
  `fechaNacimientoEmpleado` date DEFAULT NULL,
  `fechaIngresoEmpleado` date DEFAULT NULL,
  `salarioEmpleado` decimal(10,0) DEFAULT NULL,
  `comisionEmpleado` decimal(10,0) DEFAULT NULL,
  `hijosEmpleado` smallint DEFAULT NULL,
  `nombreEmpleado` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `idDepartamentoFK2` (`idDepartamentoFK`),
  CONSTRAINT `idDepartamentoFK2` FOREIGN KEY (`idDepartamentoFK`) REFERENCES `departamentos` (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (110,121,350,'1969-02-05','1990-02-05',2100,0,3,'PONS, CESAR'),(120,112,840,'1975-05-30','2008-09-30',2500,1100,1,'LASA, MARIO'),(130,112,810,'1985-08-30','2009-01-22',1900,1100,2,'TEROL, LUCIANO'),(150,112,340,'1970-07-31','1988-01-05',3400,0,0,'PEREZ, JULIO'),(160,111,740,'1979-06-29','2008-11-01',2100,1100,2,'AGUIRRE, AUREO'),(180,110,508,'1974-10-08','1996-03-08',3800,500,2,'PEREZ, MARCOS'),(190,121,350,'1972-05-02','2002-02-01',2000,0,4,'VEIGA, JULIANA'),(210,100,740,'1980-09-18','1999-01-12',2800,0,2,'GALVEZ, PILAR'),(240,111,508,'1982-02-16','2006-02-14',1800,1000,3,'SANZ, LAVINIA'),(250,100,200,'1986-10-17','2007-02-19',3500,0,0,'ALBA, ADRIANA'),(260,100,760,'1983-09-23','2008-07-02',5200,0,6,'LOPEZ, ANTONIO'),(270,112,250,'1985-05-11','2006-08-31',2800,800,3,'GARCIA, OCTAVIO'),(280,130,220,'1948-01-01','1968-09-28',1900,0,5,'FLOR, DOROTEA'),(285,122,800,'1989-10-15','2009-02-05',2800,0,0,'POLO, OTILIA'),(290,120,410,'1947-11-20','1968-02-04',1700,0,3,'GIL, GLORIA'),(310,130,620,'1986-11-11','2011-02-05',3200,0,0,'GARCIA, AUGUSTO'),(320,122,910,'1947-12-18','1968-01-29',3050,0,2,'SANZ, CORNELIO'),(330,112,480,'1948-08-09','1982-02-20',1800,900,3,'DIEZ, AMELIA'),(350,112,620,'1969-04-08','2004-09-05',3500,0,1,'CAMPS, AURELIO'),(360,111,850,'1998-10-19','2008-09-30',1500,100,2,'LARA, DORINA'),(370,121,610,'1987-06-17','2007-01-15',900,0,1,'RUIZ, FABIOLA'),(380,112,750,'1948-03-25','1967-12-27',800,0,0,'MARTIN, MICAELA'),(390,110,360,'1946-02-14','1966-10-03',1120,0,1,'MORAN, CARMEN'),(400,111,880,'1989-08-13','2007-10-27',850,0,0,'LARA, LUCRECIA'),(410,122,500,'1988-07-09','2008-10-08',750,0,0,'MUÑOZ, AZUCENA'),(420,130,780,'1986-10-17','2008-11-11',3000,0,0,'FIERRO, CLAUDIA'),(430,122,660,'1947-02-21','1978-11-14',1100,0,1,'MORA, VALERIANA'),(440,111,450,'1986-09-21','2006-02-03',1100,1000,0,'DURAN, LIVIA'),(450,112,650,'1986-10-16','2006-02-23',1100,1000,0,'PEREZ, SABINA'),(480,111,760,'1985-03-30','2006-02-23',1100,1000,1,'PINO, DIANA'),(490,112,880,'1984-06-01','2007-12-27',800,1000,0,'TORRES, HORACIO'),(500,111,750,'1985-10-03','2006-12-27',1000,1000,0,'VAZQUEZ, HONORIA'),(510,110,550,'1986-04-26','2006-10-27',1000,0,1,'CAMPOS, ROMULO'),(550,111,780,'1990-01-05','2008-01-16',900,1200,0,'SANTOS, SANCHO');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-12 10:59:51
