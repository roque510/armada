CREATE DATABASE  IF NOT EXISTS `db_credistar` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_credistar`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: db_credistar
-- ------------------------------------------------------
-- Server version	5.7.9-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blacklist_direcciones`
--

DROP TABLE IF EXISTS `blacklist_direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist_direcciones` (
  `blacklist_dir_id` bigint(20) NOT NULL,
  `blacklist_dir_fecha` date DEFAULT NULL,
  `blacklist_dir_pais` varchar(50) DEFAULT NULL,
  `blacklist_dir_departamento` varchar(50) DEFAULT NULL,
  `blacklist_dir_municipio` varchar(50) DEFAULT NULL,
  `blacklist_dir_colonia` varchar(80) DEFAULT NULL,
  `blacklist_dir_comentario` varchar(100) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`blacklist_dir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se registraran un listado de direcciones que sean de alto riesgo para que el sistema haga una restriccion de las mismas.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist_direcciones`
--

LOCK TABLES `blacklist_direcciones` WRITE;
/*!40000 ALTER TABLE `blacklist_direcciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist_direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist_telefonos`
--

DROP TABLE IF EXISTS `blacklist_telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist_telefonos` (
  `blacklist_telefono_id` bigint(20) NOT NULL,
  `blacklist_fecha` date DEFAULT NULL,
  `blacklist_telefono_numero` varchar(50) DEFAULT NULL,
  `blacklist_telefono_comentario` varchar(80) DEFAULT NULL,
  `blacklist_telefono_tipo` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`blacklist_telefono_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guaradara una lista negra de todos los telefonos que sean riesgosos su referencia en alguna solicitud del sistema.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist_telefonos`
--

LOCK TABLES `blacklist_telefonos` WRITE;
/*!40000 ALTER TABLE `blacklist_telefonos` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist_telefonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargos` (
  `cargo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cargo_descripcion` varchar(50) NOT NULL,
  `cargo_abreviatura` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cargo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla donde se almacenaran los tipos de cargos que puede llegar a tener un cliente de segundo nivel en su lugar de trabajo.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cias`
--

DROP TABLE IF EXISTS `cias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cias` (
  `cia_id` varchar(4) NOT NULL,
  `cia_descripcion` varchar(50) NOT NULL,
  `cia_abreviatura` varchar(50) DEFAULT NULL,
  `cia_rtn` varchar(25) DEFAULT NULL,
  `cia_rubro` varchar(25) DEFAULT NULL,
  `cia_mision` varchar(200) DEFAULT NULL,
  `cia_vision` varchar(200) DEFAULT NULL,
  `cia_valores` varchar(200) DEFAULT NULL,
  `cia_logo` varchar(50) DEFAULT NULL,
  `cia_direccion` varchar(100) DEFAULT NULL,
  `cia_direccion1` varchar(100) DEFAULT NULL,
  `cia_telefono` varchar(25) DEFAULT NULL,
  `cia_telefono1` varchar(25) DEFAULT NULL,
  `cia_contacto` varchar(50) DEFAULT NULL,
  `cia_generico1` varchar(50) DEFAULT NULL,
  `cia_generico2` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`cia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran todas las compañias y sus datos generales, los cuales seran los clientes internos directos del sistema CrediStar. Dicha tabla es la escencia cuando se se desee agregar un nuevo cliente de primer nivel.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cias`
--

LOCK TABLES `cias` WRITE;
/*!40000 ALTER TABLE `cias` DISABLE KEYS */;
/*!40000 ALTER TABLE `cias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `entidad_id` bigint(20) NOT NULL,
  `nivel_edu_id` bigint(20) DEFAULT NULL,
  `profesion_id` bigint(20) DEFAULT NULL,
  `cliente_score` int(11) DEFAULT NULL,
  `cliente_limite_credito` decimal(10,2) DEFAULT NULL,
  `clliente_cuota` decimal(10,2) DEFAULT NULL,
  `cliente_usuario_creacion` varchar(25) DEFAULT NULL,
  `cliente_fecha_creacion` datetime DEFAULT NULL,
  `cliente_usuario_modificacion` varchar(25) DEFAULT NULL,
  `cliente_fecha_modificacion` datetime DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`entidad_id`),
  KEY `FK_clientes_nivel_edu_id_idx` (`nivel_edu_id`),
  KEY `FK_clientes_profesion_id_idx` (`profesion_id`),
  CONSTRAINT `FK_clientes_nivel_edu_id` FOREIGN KEY (`nivel_edu_id`) REFERENCES `nivel_educativo` (`nivel_edu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_clientes_profesion_id` FOREIGN KEY (`profesion_id`) REFERENCES `profesiones` (`profesion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran las entidades que sean clasificadas como tipo clientes en el sistema CrediStar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes_empleos`
--

DROP TABLE IF EXISTS `clientes_empleos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes_empleos` (
  `cliente_id` bigint(20) NOT NULL,
  `empleo_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cliente_id`,`empleo_id`),
  KEY `FK_clientes_empleados_empleo_id_idx` (`empleo_id`),
  CONSTRAINT `FK_clientes_empleados_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`entidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_clientes_empleados_empleo_id` FOREIGN KEY (`empleo_id`) REFERENCES `empleos` (`empleo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenara todos los diferentes empleos para las diferentes entidades inclusive si la entidad maneja multiples empleos a la vez.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes_empleos`
--

LOCK TABLES `clientes_empleos` WRITE;
/*!40000 ALTER TABLE `clientes_empleos` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes_empleos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colonias`
--

DROP TABLE IF EXISTS `colonias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colonias` (
  `colonia_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `municipio_id` bigint(20) DEFAULT NULL,
  `colonia_descripcion` varchar(50) DEFAULT NULL,
  `colonia_riesgo` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`colonia_id`),
  KEY `FK_colonias_municipio_id_idx` (`municipio_id`),
  CONSTRAINT `FK_colonias_municipio_id` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`municipio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla la cual contendra las colonias de un cierto municipio en especifico.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colonias`
--

LOCK TABLES `colonias` WRITE;
/*!40000 ALTER TABLE `colonias` DISABLE KEYS */;
/*!40000 ALTER TABLE `colonias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratos_tipos`
--

DROP TABLE IF EXISTS `contratos_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratos_tipos` (
  `contrato_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contrato_tipo_descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`contrato_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran los tipos de contratos (semana, quincenal, mensual, etc.) que puede tener un cliente de segundo nivel en su lugar de trabajo.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratos_tipos`
--

LOCK TABLES `contratos_tipos` WRITE;
/*!40000 ALTER TABLE `contratos_tipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratos_tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `depto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pais_id` bigint(20) NOT NULL,
  `depto_nombre` varchar(50) DEFAULT NULL,
  `departamentos_COL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`depto_id`),
  KEY `FK_deptos_pais_id_idx` (`pais_id`),
  CONSTRAINT `FK_deptos_pais_id` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`pais_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que contendra los departamentos de los cuales se compone un pais en especifico.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependientes`
--

DROP TABLE IF EXISTS `dependientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependientes` (
  `cliente_id` bigint(20) NOT NULL,
  `entidad_id` bigint(20) NOT NULL,
  `dependiente_comentario` varchar(100) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  `subestatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`cliente_id`,`entidad_id`),
  KEY `FK_dependientes_entidad_id_idx` (`entidad_id`),
  CONSTRAINT `FK_dependientes_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`entidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_dependientes_entidad_id` FOREIGN KEY (`entidad_id`) REFERENCES `entidades` (`entidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran los dependientes que puede llegar a tener una entidad.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependientes`
--

LOCK TABLES `dependientes` WRITE;
/*!40000 ALTER TABLE `dependientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direcciones` (
  `direccion_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `direccion_descripcion` varchar(50) DEFAULT NULL,
  `direccion_tipo_id` bigint(20) DEFAULT NULL,
  `direccion_antiguedad` decimal(10,2) DEFAULT '0.00',
  `pais_id` bigint(20) DEFAULT NULL,
  `depto_id` bigint(20) DEFAULT NULL,
  `municipio_id` bigint(20) DEFAULT NULL,
  `colonia_id` bigint(20) DEFAULT NULL,
  `direccion_codigo_postal` varchar(10) DEFAULT NULL,
  `direccion_calle_avenida` varchar(100) DEFAULT NULL,
  `direccion_punto_referencia` varchar(100) DEFAULT NULL,
  `direccion_numero_casa` varchar(50) DEFAULT NULL,
  `direccion_riesgo` int(11) DEFAULT '0',
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`direccion_id`),
  KEY `FK_direcciones_direccion_tipo_idx` (`direccion_tipo_id`),
  KEY `FK_direcciones_pais_id_idx` (`pais_id`),
  KEY `FK_direcciones_depto_id_idx` (`depto_id`),
  KEY `FK_direcciones_municipio_id_idx` (`municipio_id`),
  KEY `FK_direcciones_colonia_id_idx` (`colonia_id`),
  CONSTRAINT `FK_direcciones_colonia_id` FOREIGN KEY (`colonia_id`) REFERENCES `colonias` (`colonia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_direcciones_depto_id` FOREIGN KEY (`depto_id`) REFERENCES `departamentos` (`depto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_direcciones_direccion_tipo` FOREIGN KEY (`direccion_tipo_id`) REFERENCES `direcciones_tipos` (`direccion_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_direcciones_municipio_id` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`municipio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_direcciones_pais_id` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`pais_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla general de las direcciones, es la tabla que contendra la relacion de todas las tablas de ubicaciones como pais, departamentos, ciuidades y colonias para que el sistema vaya generando una base de conocimiento de las direcciones.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones_tipos`
--

DROP TABLE IF EXISTS `direcciones_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direcciones_tipos` (
  `direccion_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `direccion_tipo_descripcion` varchar(50) NOT NULL,
  `direccion_tipo_abreviatura` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`direccion_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla la cual contendra los tipos de direcciones que se le pueden definir a la tabla maestra de direcciones.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones_tipos`
--

LOCK TABLES `direcciones_tipos` WRITE;
/*!40000 ALTER TABLE `direcciones_tipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `direcciones_tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docs_graficos`
--

DROP TABLE IF EXISTS `docs_graficos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docs_graficos` (
  `doc_grafico_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entidad_id` bigint(20) DEFAULT NULL,
  `doc_grafico_registro` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`doc_grafico_id`),
  KEY `FK_docs_graficos_entidad_id_idx` (`entidad_id`),
  CONSTRAINT `FK_docs_graficos_entidad_id` FOREIGN KEY (`entidad_id`) REFERENCES `entidades` (`entidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se relacionaran los documentos graficos que tiene cada una de las entidades.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docs_graficos`
--

LOCK TABLES `docs_graficos` WRITE;
/*!40000 ALTER TABLE `docs_graficos` DISABLE KEYS */;
/*!40000 ALTER TABLE `docs_graficos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleos`
--

DROP TABLE IF EXISTS `empleos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleos` (
  `empleo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `empleo_tipo_id` bigint(20) DEFAULT NULL,
  `empresa_id` bigint(20) DEFAULT NULL,
  `empleo_antiguedad` decimal(10,2) DEFAULT NULL,
  `empleo_jefe_nombre` varchar(50) DEFAULT NULL,
  `empleo_jefe_cargo` varchar(50) DEFAULT NULL,
  `contrato_tipo_id` bigint(20) DEFAULT NULL,
  `frecuencia_pago_id` bigint(20) DEFAULT NULL,
  `moneda_id` bigint(20) DEFAULT NULL,
  `empleo_ingreso_neto` decimal(10,2) DEFAULT NULL,
  `empleo_ingreso_declarado` decimal(10,2) DEFAULT NULL,
  `empleo_comsiones_extras` decimal(10,2) DEFAULT NULL,
  `empleo_imp_deduciones` decimal(10,2) DEFAULT NULL,
  `empleo_hora_contactar` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`empleo_id`),
  KEY `FK_empleos_empleo_tipo_id_idx` (`empleo_tipo_id`),
  KEY `FK_empleos_empresa_id_idx` (`empresa_id`),
  KEY `FK_empleos_contrato_tipo_id_idx` (`contrato_tipo_id`),
  KEY `FK_empleos_frecuencia_pago_id_idx` (`frecuencia_pago_id`),
  KEY `FK_empleos_moneda_id_idx` (`moneda_id`),
  CONSTRAINT `FK_empleos_contrato_tipo_id` FOREIGN KEY (`contrato_tipo_id`) REFERENCES `contratos_tipos` (`contrato_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_empleos_empleo_tipo_id` FOREIGN KEY (`empleo_tipo_id`) REFERENCES `empleos_tipos` (`empleo_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_empleos_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_empleos_frecuencia_pago_id` FOREIGN KEY (`frecuencia_pago_id`) REFERENCES `frecuencias_pagos` (`frecuencia_pago_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_empleos_moneda_id` FOREIGN KEY (`moneda_id`) REFERENCES `monedas` (`moneda_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenara los empleos que actualmente tienen cada uno de los clientes de segundo nivel ingresados, los cuales se realacionaran directmaente con una empresa.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos`
--

LOCK TABLES `empleos` WRITE;
/*!40000 ALTER TABLE `empleos` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleos_tipos`
--

DROP TABLE IF EXISTS `empleos_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleos_tipos` (
  `empleo_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `empleo_tipo_descripcion` varchar(50) NOT NULL,
  `empleo_tipo_abreviatura` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`empleo_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se registraran los tipos de empleos en donde se clasifica el lugar de trabajo para un cliente de segundo nivel.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleos_tipos`
--

LOCK TABLES `empleos_tipos` WRITE;
/*!40000 ALTER TABLE `empleos_tipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleos_tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresas` (
  `empresa_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `empresa_nombre` varchar(50) NOT NULL,
  `empresa_abreviatura` varchar(50) DEFAULT NULL,
  `empresa_rtn` varchar(50) DEFAULT NULL,
  `empresa_correo` varchar(50) DEFAULT NULL,
  `direccion_id` bigint(20) DEFAULT NULL,
  `estatus_id` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`empresa_id`),
  KEY `FK_empresas_direccion_id_idx` (`direccion_id`),
  CONSTRAINT `FK_empresas_direccion_id` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones` (`direccion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenara  las diferentes empresas en donde pueden llegar a laborar o laboran  actualmente los clientes de segundo nivel.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidades`
--

DROP TABLE IF EXISTS `entidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entidades` (
  `entidad_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entidad_primer_nombre` varchar(25) DEFAULT NULL,
  `entidad_segundo_nombre` varchar(25) DEFAULT NULL,
  `entidad_primer_apellido` varchar(25) DEFAULT NULL,
  `entidad_segund_apellido` varchar(25) DEFAULT NULL,
  `entidad_genero` varchar(25) DEFAULT NULL,
  `estado_civil_id` bigint(20) DEFAULT NULL,
  `entidad_correo` varchar(50) DEFAULT NULL,
  `entidad_fecha_nacimiento` date DEFAULT NULL,
  `entidad_identidad_principal` int(11) DEFAULT NULL,
  `entidad_rtn` varchar(50) DEFAULT NULL,
  `entidad_imagen` varchar(50) DEFAULT NULL,
  `direccion_id` bigint(20) DEFAULT NULL,
  `entidad_tipo_id` bigint(20) DEFAULT NULL,
  `entidad_generado` varchar(25) DEFAULT NULL,
  `entidad_usuario_creacion` varchar(25) DEFAULT NULL,
  `entidad_fecha_creacion` datetime DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`entidad_id`),
  KEY `FK_entidades_estado_civil_id_idx` (`estado_civil_id`),
  KEY `FK_entidades_direccion_id_idx` (`direccion_id`),
  KEY `FK_entidades_entidad_tipo_id_idx` (`entidad_tipo_id`),
  CONSTRAINT `FK_entidades_direccion_id` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones` (`direccion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_entidades_entidad_tipo_id` FOREIGN KEY (`entidad_tipo_id`) REFERENCES `entidades_tipos` (`entidad_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_entidades_estado_civil_id` FOREIGN KEY (`estado_civil_id`) REFERENCES `estados_civiles` (`estado_civil_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla general en donde se almacenaran las entidades tanto de: clientes de segundo nivel, referencias personales, jefes de empleos, etc. la idea es que esta tabla almacene cualquier dato que se pueda reutilizar luego.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidades`
--

LOCK TABLES `entidades` WRITE;
/*!40000 ALTER TABLE `entidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidades_direcciones`
--

DROP TABLE IF EXISTS `entidades_direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entidades_direcciones` (
  `entidad_id` bigint(20) NOT NULL,
  `direccion_id` bigint(20) NOT NULL,
  PRIMARY KEY (`entidad_id`,`direccion_id`),
  KEY `FK_entidades_direcciones_direccion_id_idx` (`direccion_id`),
  CONSTRAINT `FK_entidades_direcciones_direccion_id` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones` (`direccion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_entidades_direcciones_entidad_id` FOREIGN KEY (`entidad_id`) REFERENCES `entidades` (`entidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se registraran las diferentes direcciones de las diferentes entidades, incluso si la entidad maneja varias direcciones.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidades_direcciones`
--

LOCK TABLES `entidades_direcciones` WRITE;
/*!40000 ALTER TABLE `entidades_direcciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidades_direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidades_identificaciones`
--

DROP TABLE IF EXISTS `entidades_identificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entidades_identificaciones` (
  `entidad_id` bigint(20) NOT NULL,
  `identificacion_id` bigint(20) NOT NULL,
  `identificacion_principal` int(11) DEFAULT NULL,
  PRIMARY KEY (`entidad_id`,`identificacion_id`),
  KEY `FK_entidades_identificaciones_identificacion_id_idx` (`identificacion_id`),
  CONSTRAINT `FK_entidades_identificaciones_entidad_id` FOREIGN KEY (`entidad_id`) REFERENCES `entidades` (`entidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_entidades_identificaciones_identificacion_id` FOREIGN KEY (`identificacion_id`) REFERENCES `identificaciones` (`identificacion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se relacionaran todas lass identificaciones que puede llegar a poseer una entidad.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidades_identificaciones`
--

LOCK TABLES `entidades_identificaciones` WRITE;
/*!40000 ALTER TABLE `entidades_identificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidades_identificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidades_telefonos`
--

DROP TABLE IF EXISTS `entidades_telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entidades_telefonos` (
  `entidad_id` bigint(20) NOT NULL,
  `telefono_id` bigint(20) NOT NULL,
  `estatus_id` varchar(2) NOT NULL,
  `subestatus_id` varchar(2) NOT NULL,
  PRIMARY KEY (`entidad_id`,`telefono_id`,`estatus_id`,`subestatus_id`),
  KEY `FK_entidades_telefonos_telefono_id_idx` (`telefono_id`),
  CONSTRAINT `FK_entidades_telefonos_entidad_id` FOREIGN KEY (`entidad_id`) REFERENCES `entidades` (`entidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_entidades_telefonos_telefono_id` FOREIGN KEY (`telefono_id`) REFERENCES `telefonos` (`telefono_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran los multiples telefonos que le pueden pertenecer a una entidad.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidades_telefonos`
--

LOCK TABLES `entidades_telefonos` WRITE;
/*!40000 ALTER TABLE `entidades_telefonos` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidades_telefonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidades_tipos`
--

DROP TABLE IF EXISTS `entidades_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entidades_tipos` (
  `entidad_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entidad_tipo_descripcion` varchar(50) NOT NULL,
  `entidad_tipo_abreviatura` varchar(50) DEFAULT NULL,
  `entidad_tipo_generado` varchar(25) DEFAULT NULL,
  `estatus_id` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`entidad_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla la cual contendra los tipos de entidades que puede ser una entidad, como ser: Juridica, Natural, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidades_tipos`
--

LOCK TABLES `entidades_tipos` WRITE;
/*!40000 ALTER TABLE `entidades_tipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidades_tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_civiles`
--

DROP TABLE IF EXISTS `estados_civiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados_civiles` (
  `estado_civil_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado_civil_descripcion` varchar(25) NOT NULL,
  `estado_civil_abreviatura` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`estado_civil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se definen los diferentes tipos de estados civiles que puede tener una entidad en el sistema.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_civiles`
--

LOCK TABLES `estados_civiles` WRITE;
/*!40000 ALTER TABLE `estados_civiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados_civiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatus`
--

DROP TABLE IF EXISTS `estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estatus` (
  `estatus_id` varchar(2) NOT NULL,
  `estatus_desripcion` varchar(25) NOT NULL,
  `estatus_comentario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla la cual contendra los valores de todos los tipos de estados a ser usado a lo largo de las transacciones y mantenimientos del sistema CrediStar.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatus`
--

LOCK TABLES `estatus` WRITE;
/*!40000 ALTER TABLE `estatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frecuencias_pagos`
--

DROP TABLE IF EXISTS `frecuencias_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frecuencias_pagos` (
  `frecuencia_pago_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `frecuencia_pago_descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`frecuencia_pago_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran los tipos de frecuencias de pagos que puede tener un cliente de segundo nivel en su lugar de trabajo.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frecuencias_pagos`
--

LOCK TABLES `frecuencias_pagos` WRITE;
/*!40000 ALTER TABLE `frecuencias_pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `frecuencias_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos` (
  `grupo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cia_id` varchar(4) DEFAULT NULL,
  `grupo_nombre` varchar(50) NOT NULL,
  `grupo_abreviatura` varchar(50) DEFAULT NULL,
  `grupo_limite_credito` decimal(10,2) DEFAULT NULL,
  `grupo_limite_score` int(11) DEFAULT NULL,
  `grupo_limite_cuota` decimal(10,2) DEFAULT NULL,
  `grupo_cambio_estatus` int(11) DEFAULT NULL,
  `grupo_modificar` int(11) DEFAULT NULL,
  `grupo_acceso` int(11) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`grupo_id`),
  KEY `FK_grupos_cia_id_idx` (`cia_id`),
  CONSTRAINT `FK_grupos_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se registraran los grupos principales de usuarios, esto nos srevira para poder definir los perfiles de accesos y grupos de pantallas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos_pantallas`
--

DROP TABLE IF EXISTS `grupos_pantallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos_pantallas` (
  `cia_id` varchar(4) NOT NULL,
  `grupo_id` bigint(20) NOT NULL,
  `pantalla_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cia_id`,`pantalla_id`,`grupo_id`),
  KEY `FK_grupos_pantallas_grupo_id_idx` (`grupo_id`),
  KEY `FK_grupos_pantallas_pantalla_id_idx` (`pantalla_id`),
  CONSTRAINT `FK_grupos_pantallas_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_grupos_pantallas_grupo_id` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`grupo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_grupos_pantallas_pantalla_id` FOREIGN KEY (`pantalla_id`) REFERENCES `pantallas` (`pantalla_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se definiran cada grupo acceso a que pantallas son las que debera tener, esta asignacion se realizara por compañia.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos_pantallas`
--

LOCK TABLES `grupos_pantallas` WRITE;
/*!40000 ALTER TABLE `grupos_pantallas` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupos_pantallas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identificaciones`
--

DROP TABLE IF EXISTS `identificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identificaciones` (
  `identificacion_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identificacion_tipo_id` bigint(20) DEFAULT NULL,
  `identificacion_numero` varchar(50) DEFAULT NULL,
  `identificacion_registro` varchar(50) DEFAULT NULL,
  `identificacion_dato1` varchar(50) DEFAULT NULL,
  `identificacion_dato2` varchar(50) DEFAULT NULL,
  `identificacion_dato3` varchar(50) DEFAULT NULL,
  `identificacion_comentario` int(11) DEFAULT NULL,
  PRIMARY KEY (`identificacion_id`),
  KEY `FK_identificaciones_identificacion_tipo_id_idx` (`identificacion_tipo_id`),
  CONSTRAINT `FK_identificaciones_identificacion_tipo_id` FOREIGN KEY (`identificacion_tipo_id`) REFERENCES `identificaciones_tipos` (`identificacion_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla la cual almacenara todas las diferentes identificaciones que una sola entidad puede llegar a manejar.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identificaciones`
--

LOCK TABLES `identificaciones` WRITE;
/*!40000 ALTER TABLE `identificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `identificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identificaciones_tipos`
--

DROP TABLE IF EXISTS `identificaciones_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identificaciones_tipos` (
  `identificacion_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identificacion_tipo_descripcion` varchar(50) NOT NULL,
  `identificacion_tipo_abreviaturas` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`identificacion_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se clasificaran las identificaciones comos ser: cedulas, licencias, pasaportes, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identificaciones_tipos`
--

LOCK TABLES `identificaciones_tipos` WRITE;
/*!40000 ALTER TABLE `identificaciones_tipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `identificaciones_tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limites_creditos`
--

DROP TABLE IF EXISTS `limites_creditos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `limites_creditos` (
  `limite_credito_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cia_id` varchar(4) DEFAULT NULL,
  `limite_credito_rango_score` int(11) DEFAULT NULL,
  `limite_credito_rango_ingreso` decimal(10,2) DEFAULT NULL,
  `limite_credito_tipo` varchar(25) DEFAULT NULL,
  `limite_credito_operacion` varchar(25) DEFAULT NULL,
  `limite_credito_afectacion` varchar(25) DEFAULT NULL,
  `limite_credito_valor` decimal(10,2) DEFAULT NULL,
  `limite_credito_dato1` varchar(50) DEFAULT NULL,
  `limite_credito_dato2` varchar(50) DEFAULT NULL,
  `limite_credito_factor` decimal(10,2) DEFAULT NULL,
  `limite_credito_estatus` varchar(25) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`limite_credito_id`),
  KEY `FK_limites_creditos_cia_id_idx` (`cia_id`),
  CONSTRAINT `FK_limites_creditos_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran los calculos para las afectaciones de los limites de credito segun sea la afectacion  resultante del score que se haya determinado por el sistema  CrediStar.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limites_creditos`
--

LOCK TABLES `limites_creditos` WRITE;
/*!40000 ALTER TABLE `limites_creditos` DISABLE KEYS */;
/*!40000 ALTER TABLE `limites_creditos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monedas`
--

DROP TABLE IF EXISTS `monedas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monedas` (
  `moneda_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `moneda_descripcion` varchar(50) DEFAULT NULL,
  `moneda_simbolo` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`moneda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenara el tipo de moneda con el cual se trabajara en CrediStar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monedas`
--

LOCK TABLES `monedas` WRITE;
/*!40000 ALTER TABLE `monedas` DISABLE KEYS */;
/*!40000 ALTER TABLE `monedas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipios` (
  `municipio_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `depto_id` bigint(20) DEFAULT NULL,
  `municipio_nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`municipio_id`),
  KEY `FK_municipios_depto_id_idx` (`depto_id`),
  CONSTRAINT `FK_municipios_depto_id` FOREIGN KEY (`depto_id`) REFERENCES `departamentos` (`depto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla la cual contendra los municipios de cada departamento registrado en el sistema.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel_educativo`
--

DROP TABLE IF EXISTS `nivel_educativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivel_educativo` (
  `nivel_edu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nivel_edu_descrip` varchar(50) NOT NULL,
  `nivel_edu_abreviatura` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`nivel_edu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se registraran los diferentes tipos de niveles educativos que puede llegar a tener un cliente de segundo nivel';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_educativo`
--

LOCK TABLES `nivel_educativo` WRITE;
/*!40000 ALTER TABLE `nivel_educativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `nivel_educativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `pais_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pais_nombre` varchar(50) NOT NULL,
  `pais_region` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pais_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran los paises de los cuales manejera el sistema.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pantallas`
--

DROP TABLE IF EXISTS `pantallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pantallas` (
  `pantalla_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pantalla_nombre` varchar(50) NOT NULL,
  `pantalla_abreviatura` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`pantalla_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran todas las pantallas, funciones y consultas del sistema CrediStar, solo para registrar que objetos se desean controlar en el mismo.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pantallas`
--

LOCK TABLES `pantallas` WRITE;
/*!40000 ALTER TABLE `pantallas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pantallas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesiones`
--

DROP TABLE IF EXISTS `profesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesiones` (
  `profesion_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profesion_descripcion` varchar(50) NOT NULL,
  `profesion_relacion` varchar(50) DEFAULT NULL,
  `profesion_abreviatura` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`profesion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran las profesiones que puede llegar a tener un cliente de segundo nivel en CrediStar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesiones`
--

LOCK TABLES `profesiones` WRITE;
/*!40000 ALTER TABLE `profesiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedades`
--

DROP TABLE IF EXISTS `propiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propiedades` (
  `propiedad_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `propiedad_descripcion` varchar(50) DEFAULT NULL,
  `propiedad_tipo_id` bigint(20) DEFAULT NULL,
  `propiedad_comentario` varchar(100) DEFAULT NULL,
  `propiedad_valor` decimal(10,2) DEFAULT NULL,
  `propiedad_registro` varchar(50) DEFAULT NULL,
  `direccion_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`propiedad_id`),
  KEY `FK_propiedades_propiedad_tipo_id_idx` (`propiedad_tipo_id`),
  KEY `FK_propiedades_direccion_id_idx` (`direccion_id`),
  CONSTRAINT `FK_propiedades_direccion_id` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones` (`direccion_id`) ON UPDATE NO ACTION,
  CONSTRAINT `FK_propiedades_propiedad_tipo_id` FOREIGN KEY (`propiedad_tipo_id`) REFERENCES `propiedades_tipos` (`propiedad_tipo_id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se ingresaran las propiedades que puede llegar a tener un cliente de segun do nivel registrado en el sistema CrediStar.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades`
--

LOCK TABLES `propiedades` WRITE;
/*!40000 ALTER TABLE `propiedades` DISABLE KEYS */;
/*!40000 ALTER TABLE `propiedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedades_tipos`
--

DROP TABLE IF EXISTS `propiedades_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propiedades_tipos` (
  `propiedad_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `propiedad_tipo_descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`propiedad_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se definiran los tipos de propiedades que puede llegar a tener una entidad general de propiedades.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades_tipos`
--

LOCK TABLES `propiedades_tipos` WRITE;
/*!40000 ALTER TABLE `propiedades_tipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `propiedades_tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencias_personales`
--

DROP TABLE IF EXISTS `referencias_personales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referencias_personales` (
  `referencia_personal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entidad_id` bigint(20) DEFAULT NULL,
  `referencia_relacion_id` bigint(20) DEFAULT NULL,
  `referencias_personales_antiguedad` decimal(10,2) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`referencia_personal_id`),
  KEY `FK_referencias_personales_entidad_id_idx` (`entidad_id`),
  KEY `FK_referencias_personales_referencia_relacion_id_idx` (`referencia_relacion_id`),
  CONSTRAINT `FK_referencias_personales_entidad_id` FOREIGN KEY (`entidad_id`) REFERENCES `entidades` (`entidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_referencias_personales_referencia_relacion_id` FOREIGN KEY (`referencia_relacion_id`) REFERENCES `referencias_relaciones` (`referencia_relacion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se relacionaran las diferentes  referencias personales que puede llegar a tener una entidad.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencias_personales`
--

LOCK TABLES `referencias_personales` WRITE;
/*!40000 ALTER TABLE `referencias_personales` DISABLE KEYS */;
/*!40000 ALTER TABLE `referencias_personales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencias_relaciones`
--

DROP TABLE IF EXISTS `referencias_relaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referencias_relaciones` (
  `referencia_relacion_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `referencia_relacion_descripcion` varchar(50) NOT NULL,
  `referencia_relacion_abreviatura` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`referencia_relacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se definiaran los tipos de relaciones que se puede tener ante una referencia personal que haya brindado un cliente de segundo nivel';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencias_relaciones`
--

LOCK TABLES `referencias_relaciones` WRITE;
/*!40000 ALTER TABLE `referencias_relaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `referencias_relaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scores` (
  `score_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cia_id` varchar(4) DEFAULT NULL,
  `score_descripcion` varchar(50) DEFAULT NULL,
  `score_variable` varchar(50) DEFAULT NULL,
  `score_validacion` varchar(50) DEFAULT NULL,
  `score_puntaje` int(11) DEFAULT NULL,
  `score_abreviatura` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`score_id`),
  KEY `FK_scores_cia_id_idx` (`cia_id`),
  CONSTRAINT `FK_scores_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran las configuraciones de los Scores de cada compañia en el sistema CrediStar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitudes` (
  `solicitud_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cia_id` varchar(4) DEFAULT NULL,
  `solicitud_fecha_inicio` datetime DEFAULT NULL,
  `solicitud_fecha_cierre` datetime DEFAULT NULL,
  `solicitud_prioridad` int(11) DEFAULT NULL,
  `solicitud_tipo_id` bigint(20) DEFAULT NULL,
  `solicitud_canal_id` bigint(20) DEFAULT NULL,
  `solicitud_monto` decimal(10,2) DEFAULT NULL,
  `solicitud_cuota` decimal(10,2) DEFAULT NULL,
  `solicitud_plazo` decimal(10,2) DEFAULT NULL,
  `soliciutd_comentario` varchar(50) DEFAULT NULL,
  `soliciutd_score` int(11) DEFAULT NULL,
  `soliciutd_forzada` int(11) DEFAULT '0',
  `estatus_id` varchar(2) DEFAULT NULL,
  `subestatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`solicitud_id`),
  KEY `FK_solicitudes_cia_id_idx` (`cia_id`),
  KEY `FK_solicitudes_solicitud_tipo_id_idx` (`solicitud_tipo_id`),
  KEY `FK_solicitudes_solicitud_canal_id_idx` (`solicitud_canal_id`),
  CONSTRAINT `FK_solicitudes_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_solicitudes_solicitud_canal_id` FOREIGN KEY (`solicitud_canal_id`) REFERENCES `solicitudes_canales` (`solicitud_canal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_solicitudes_solicitud_tipo_id` FOREIGN KEY (`solicitud_tipo_id`) REFERENCES `solicitudes_tipos` (`solicitud_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de transacciones, en esta tabla se guardara el registro que sera el que inicie la afetacion de un credtio para un cliente en especifico.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes`
--

LOCK TABLES `solicitudes` WRITE;
/*!40000 ALTER TABLE `solicitudes` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes_canales`
--

DROP TABLE IF EXISTS `solicitudes_canales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitudes_canales` (
  `solicitud_canal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cia_id` varchar(4) DEFAULT NULL,
  `solicitud_canal_descripcion` varchar(50) DEFAULT NULL,
  `solicitud_canal_abreviatura` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`solicitud_canal_id`),
  KEY `FK_solicitudes_canales_cia_id_idx` (`cia_id`),
  CONSTRAINT `FK_solicitudes_canales_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran que tipos de canales de solicitud pueden existir en la transaccion principal de solicitudes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes_canales`
--

LOCK TABLES `solicitudes_canales` WRITE;
/*!40000 ALTER TABLE `solicitudes_canales` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitudes_canales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes_docs`
--

DROP TABLE IF EXISTS `solicitudes_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitudes_docs` (
  `solicitud_doc_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `solicitud_id` bigint(20) NOT NULL,
  `solicitud_doc_comentario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`solicitud_doc_id`,`solicitud_id`),
  KEY `FK_solicitudes_docs_solicitud_id_idx` (`solicitud_id`),
  CONSTRAINT `FK_solicitudes_docs_solicitud_id` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`solicitud_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabla en donde se almacenaran los diferentes documentos graficos que seran ligados a una solicitud en particular por el cliente de primer nivel.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes_docs`
--

LOCK TABLES `solicitudes_docs` WRITE;
/*!40000 ALTER TABLE `solicitudes_docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitudes_docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes_limites_creditos`
--

DROP TABLE IF EXISTS `solicitudes_limites_creditos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitudes_limites_creditos` (
  `solicitud_id` bigint(20) NOT NULL,
  `cia_id` varchar(4) NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `limite_credito_id` bigint(20) DEFAULT NULL,
  `limite_credito_factor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`solicitud_id`,`cia_id`),
  KEY `FK_solicitudes_limites_creditos_cia_id_idx` (`cia_id`),
  KEY `FK_solicitudes_limites_creditos_cliente_id_idx` (`cliente_id`),
  CONSTRAINT `FK_solicitudes_limites_creditos_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_solicitudes_limites_creditos_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`entidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_solicitudes_limites_creditos_solicitud_id` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`solicitud_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se relacioanra la solicitud como afectara el limite de credito para un cliente en especifico.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes_limites_creditos`
--

LOCK TABLES `solicitudes_limites_creditos` WRITE;
/*!40000 ALTER TABLE `solicitudes_limites_creditos` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitudes_limites_creditos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes_scores`
--

DROP TABLE IF EXISTS `solicitudes_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitudes_scores` (
  `solicitud_id` bigint(20) NOT NULL,
  `cia_id` varchar(4) NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `score_id` bigint(20) DEFAULT NULL,
  `solicitud_score_puntaje` int(11) DEFAULT NULL,
  PRIMARY KEY (`solicitud_id`,`cia_id`),
  KEY `FK_solicitudes_scores_cia_id_idx` (`cia_id`),
  KEY `FK_solicitudes_scores_cliente_id_idx` (`cliente_id`),
  KEY `FK_solicitudes_scores_score_id_idx` (`score_id`),
  CONSTRAINT `FK_solicitudes_scores_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_solicitudes_scores_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`entidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_solicitudes_scores_score_id` FOREIGN KEY (`score_id`) REFERENCES `scores` (`score_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_solicitudes_scores_solicitud_id` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`solicitud_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran los scores que ha obtenido un cliente de segundo nivel vinculado a una solicitud creada en el sistema CrediStar.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes_scores`
--

LOCK TABLES `solicitudes_scores` WRITE;
/*!40000 ALTER TABLE `solicitudes_scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitudes_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes_tipos`
--

DROP TABLE IF EXISTS `solicitudes_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitudes_tipos` (
  `solicitud_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cia_id` varchar(4) DEFAULT NULL,
  `solicitud_tipo_descripcion` varchar(50) NOT NULL,
  `solicitud_tipo_abreviatura` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`solicitud_tipo_id`),
  KEY `FK_solicitudes_tipos_cia_id_idx` (`cia_id`),
  CONSTRAINT `FK_solicitudes_tipos_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran los diferentes tipos de solicitudes que puede llegar a ser la transaccion de solicitud propiamente.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes_tipos`
--

LOCK TABLES `solicitudes_tipos` WRITE;
/*!40000 ALTER TABLE `solicitudes_tipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitudes_tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_estatus`
--

DROP TABLE IF EXISTS `sub_estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_estatus` (
  `estatus_id` varchar(2) NOT NULL,
  `subestatus_id` varchar(2) NOT NULL,
  `subestatus_descripcion` varchar(25) NOT NULL,
  `subestatus_comentario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`estatus_id`,`subestatus_id`),
  CONSTRAINT `FK_estatus_id` FOREIGN KEY (`estatus_id`) REFERENCES `estatus` (`estatus_id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que contrenda los sub estados para cada uno de los estados principales que se definieron en la tabla [estatus], esto es para saber por que tipo de fase u operacion va un proceso que se encuentre en un estado iniciado.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_estatus`
--

LOCK TABLES `sub_estatus` WRITE;
/*!40000 ALTER TABLE `sub_estatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursales` (
  `sucursal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cia_id` varchar(4) DEFAULT NULL,
  `sucursal_descripcion` varchar(50) DEFAULT NULL,
  `sucursal_abreviatura` varchar(50) DEFAULT NULL,
  `pais_id` bigint(20) DEFAULT NULL,
  `depto_id` bigint(20) DEFAULT NULL,
  `municipio_id` bigint(20) DEFAULT NULL,
  `colonia_id` bigint(20) DEFAULT NULL,
  `sucursal_direccion` varchar(100) DEFAULT NULL,
  `sucrsal_telefono1` varchar(25) DEFAULT NULL,
  `sucrsal_telefono2` varchar(25) DEFAULT NULL,
  `sucrsal_encargado` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`sucursal_id`),
  KEY `FK_sucursales_cia_id_idx` (`cia_id`),
  KEY `FK_sucursales_pais_id_idx` (`pais_id`),
  KEY `departamento_id_idx` (`depto_id`),
  KEY `FK_sucursales_municipio_id_idx` (`municipio_id`),
  KEY `FK_sucursales_colonia_id_idx` (`colonia_id`),
  CONSTRAINT `FK_sucursales_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sucursales_colonia_id` FOREIGN KEY (`colonia_id`) REFERENCES `colonias` (`colonia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sucursales_deptos_id` FOREIGN KEY (`depto_id`) REFERENCES `departamentos` (`depto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sucursales_municipio_id` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`municipio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sucursales_pais_id` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`pais_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran las sucursales de las compañias clientes primer nivel del sistema CrediStar.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `sys_config_id` bigint(20) NOT NULL,
  `sys_config_nombre` varchar(50) DEFAULT NULL,
  `sys_config_descripcion` varchar(80) DEFAULT NULL,
  `sys_config_logo` varchar(80) DEFAULT NULL,
  `sys_config_mision` varchar(200) DEFAULT NULL,
  `sys_config_vision` varchar(200) DEFAULT NULL,
  `sys_config_valor` varchar(200) DEFAULT NULL,
  `sys_config_correo` varchar(50) DEFAULT NULL,
  `sys_config_ruta` varchar(50) DEFAULT NULL,
  `sys_confug_bd` varchar(50) DEFAULT NULL,
  `sys_config_llave` varchar(50) DEFAULT NULL COMMENT 'Campo en donde se guardara la llave encriptada del producto para que solo pueda ser generado desde un servidor web que ya previamente fue definido. (En estado de prototipo)',
  PRIMARY KEY (`sys_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran todas las configuraciones generales del programa CrediStar como tal, estos registros no tienen impacto sobre la informacion transaccional que se guarda y se aplicara por igual a todas compañias que lo utilicen.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_scores_cortes`
--

DROP TABLE IF EXISTS `sys_scores_cortes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_scores_cortes` (
  `cia_id` varchar(4) NOT NULL,
  `score_variable` varchar(50) NOT NULL,
  `sys_score_corte_puntaje` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cia_id`,`score_variable`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran las configuraciones globales para los cortes de un scores, como ser la edad >30 años, tiene un score meta de 300 el cual sera su valor de corte por compañia ya que diferentes compañias tendran diferentes cortes o metas.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_scores_cortes`
--

LOCK TABLES `sys_scores_cortes` WRITE;
/*!40000 ALTER TABLE `sys_scores_cortes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_scores_cortes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonos`
--

DROP TABLE IF EXISTS `telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefonos` (
  `telefono_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `telefono_tipo_id` bigint(20) DEFAULT NULL,
  `telefono_subtipo_id` bigint(20) DEFAULT NULL,
  `telefono_numero` bigint(20) NOT NULL,
  `telefono_extesnion` varchar(10) DEFAULT NULL,
  `telefono_abreviatura` varchar(25) DEFAULT NULL,
  `telefono_comentario` varchar(50) DEFAULT NULL,
  `telefono_blacklist` int(11) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`telefono_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que servira de registro maestro para los numeros de telefonos de las diferentes entidades del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonos`
--

LOCK TABLES `telefonos` WRITE;
/*!40000 ALTER TABLE `telefonos` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonos_subtipos`
--

DROP TABLE IF EXISTS `telefonos_subtipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefonos_subtipos` (
  `telefono_subtipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `telefono_subtipo_descripcion` varchar(25) NOT NULL,
  PRIMARY KEY (`telefono_subtipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se definiran los subtipos de telefonos que puede tener una entidad como ser de un telefono tipo [Celular] tiene un subtipo [Principal]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonos_subtipos`
--

LOCK TABLES `telefonos_subtipos` WRITE;
/*!40000 ALTER TABLE `telefonos_subtipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefonos_subtipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonos_tipos`
--

DROP TABLE IF EXISTS `telefonos_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefonos_tipos` (
  `telefono_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `telefono_descripcion` varchar(25) NOT NULL,
  PRIMARY KEY (`telefono_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se definiran los tipos de telefonos que puede llegar a tener una entidad y como se clasificaran';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonos_tipos`
--

LOCK TABLES `telefonos_tipos` WRITE;
/*!40000 ALTER TABLE `telefonos_tipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefonos_tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulos`
--

DROP TABLE IF EXISTS `titulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulos` (
  `titulo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo_descripcion` varchar(50) NOT NULL,
  `titulo_abreviatura` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`titulo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran los titulos de caracter educativo que puede llegar a tener un cliente de segundo nivel en el sistema	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulos`
--

LOCK TABLES `titulos` WRITE;
/*!40000 ALTER TABLE `titulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `titulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `usuario_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_alias` varchar(25) NOT NULL,
  `usuario_nombre` varchar(50) DEFAULT NULL,
  `usuario_apellido` varchar(50) DEFAULT NULL,
  `usuario_cel` varchar(50) DEFAULT NULL,
  `usuario_telefono` varchar(50) DEFAULT NULL,
  `usuario_foto` varchar(50) DEFAULT NULL,
  `usuario_isadmin` int(11) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se registraran todos los usuarios del sistema, con este registro y dependiendo de su nivel de acceso es donde se podra definir la seguridad a cada usuario.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_cias`
--

DROP TABLE IF EXISTS `usuarios_cias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_cias` (
  `usuario_id` bigint(20) NOT NULL,
  `cia_id` varchar(4) NOT NULL,
  PRIMARY KEY (`usuario_id`,`cia_id`),
  KEY `FK_usuarios_cias_cia_id_idx` (`cia_id`),
  CONSTRAINT `FK_usuarios_cias_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_usuarios_cias_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran los usuarios y a que compañias tienen accesos.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_cias`
--

LOCK TABLES `usuarios_cias` WRITE;
/*!40000 ALTER TABLE `usuarios_cias` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_cias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_grupos`
--

DROP TABLE IF EXISTS `usuarios_grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_grupos` (
  `usuario_id` bigint(20) NOT NULL,
  `grupo_id` bigint(20) NOT NULL,
  PRIMARY KEY (`usuario_id`,`grupo_id`),
  KEY `FK_usuarios_grupos_grupo_id_idx` (`grupo_id`),
  CONSTRAINT `FK_usuarios_grupos_grupo_id` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`grupo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_usuarios_grupos_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se registraran los usuarios a que grupo o perfil en particular peretenecen.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_grupos`
--

LOCK TABLES `usuarios_grupos` WRITE;
/*!40000 ALTER TABLE `usuarios_grupos` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_grupos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-28 21:44:19
