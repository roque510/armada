-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-04-2016 a las 02:48:21
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `db_credistar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blacklist_direcciones`
--

CREATE TABLE IF NOT EXISTS `blacklist_direcciones` (
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blacklist_telefonos`
--

CREATE TABLE IF NOT EXISTS `blacklist_telefonos` (
  `blacklist_telefono_id` bigint(20) NOT NULL,
  `blacklist_fecha` date DEFAULT NULL,
  `blacklist_telefono_numero` varchar(50) DEFAULT NULL,
  `blacklist_telefono_comentario` varchar(80) DEFAULT NULL,
  `blacklist_telefono_tipo` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`blacklist_telefono_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guaradara una lista negra de todos los telefonos que sean riesgosos su referencia en alguna solicitud del sistema.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE IF NOT EXISTS `cargos` (
  `cargo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cargo_descripcion` varchar(50) NOT NULL,
  `cargo_abreviatura` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cargo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla donde se almacenaran los tipos de cargos que puede llegar a tener un cliente de segundo nivel en su lugar de trabajo.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cias`
--

CREATE TABLE IF NOT EXISTS `cias` (
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `cliente_id` bigint(20) NOT NULL,
  `nivel_edu_id` bigint(20) DEFAULT NULL,
  `profesion_id` bigint(20) DEFAULT NULL,
  `cliente_score` int(11) DEFAULT NULL,
  `cliente_limite_credito` decimal(10,2) DEFAULT NULL,
  `cliente_cuota` decimal(10,2) DEFAULT NULL,
  `cliente_usuario_creacion` varchar(25) DEFAULT NULL,
  `cliente_fecha_creacion` datetime DEFAULT NULL,
  `cliente_usuario_modificacion` varchar(25) DEFAULT NULL,
  `cliente_fecha_modificacion` datetime DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  `entidad_id` bigint(20) NOT NULL,
  `cliente_plazo` decimal(10,2) NOT NULL,
  PRIMARY KEY (`cliente_id`),
  KEY `FK_clientes_nivel_edu_id_idx` (`nivel_edu_id`),
  KEY `FK_clientes_profesion_id_idx` (`profesion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran las entidades que sean clasificadas como tipo clientes en el sistema CrediStar';

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `nivel_edu_id`, `profesion_id`, `cliente_score`, `cliente_limite_credito`, `cliente_cuota`, `cliente_usuario_creacion`, `cliente_fecha_creacion`, `cliente_usuario_modificacion`, `cliente_fecha_modificacion`, `estatus_id`, `entidad_id`, `cliente_plazo`) VALUES
(0, NULL, NULL, NULL, '20000.00', '1000.00', NULL, NULL, NULL, NULL, NULL, 27, '20.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_empleos`
--

CREATE TABLE IF NOT EXISTS `clientes_empleos` (
  `cliente_id` bigint(20) NOT NULL,
  `empleo_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cliente_id`,`empleo_id`),
  KEY `FK_clientes_empleados_empleo_id_idx` (`empleo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenara todos los diferentes empleos para las diferentes entidades inclusive si la entidad maneja multiples empleos a la vez.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colonias`
--

CREATE TABLE IF NOT EXISTS `colonias` (
  `colonia_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `municipio_id` bigint(20) DEFAULT NULL,
  `colonia_descripcion` varchar(50) DEFAULT NULL,
  `colonia_riesgo` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`colonia_id`),
  KEY `FK_colonias_municipio_id_idx` (`municipio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla la cual contendra las colonias de un cierto municipio en especifico.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos_tipos`
--

CREATE TABLE IF NOT EXISTS `contratos_tipos` (
  `contrato_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contrato_tipo_descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`contrato_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran los tipos de contratos (semana, quincenal, mensual, etc.) que puede tener un cliente de segundo nivel en su lugar de trabajo.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE IF NOT EXISTS `departamentos` (
  `depto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pais_id` bigint(20) NOT NULL,
  `depto_nombre` varchar(50) DEFAULT NULL,
  `departamentos_COL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`depto_id`),
  KEY `FK_deptos_pais_id_idx` (`pais_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que contendra los departamentos de los cuales se compone un pais en especifico.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependientes`
--

CREATE TABLE IF NOT EXISTS `dependientes` (
  `cliente_id` bigint(20) NOT NULL,
  `entidad_id` bigint(20) NOT NULL,
  `dependiente_comentario` varchar(100) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  `subestatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`cliente_id`,`entidad_id`),
  KEY `FK_dependientes_entidad_id_idx` (`entidad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran los dependientes que puede llegar a tener una entidad.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE IF NOT EXISTS `direcciones` (
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
  KEY `FK_direcciones_colonia_id_idx` (`colonia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla general de las direcciones, es la tabla que contendra la relacion de todas las tablas de ubicaciones como pais, departamentos, ciuidades y colonias para que el sistema vaya generando una base de conocimiento de las direcciones.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones_tipos`
--

CREATE TABLE IF NOT EXISTS `direcciones_tipos` (
  `direccion_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `direccion_tipo_descripcion` varchar(50) NOT NULL,
  `direccion_tipo_abreviatura` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`direccion_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla la cual contendra los tipos de direcciones que se le pueden definir a la tabla maestra de direcciones.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docs_graficos`
--

CREATE TABLE IF NOT EXISTS `docs_graficos` (
  `doc_grafico_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entidad_id` bigint(20) DEFAULT NULL,
  `doc_grafico_registro` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`doc_grafico_id`),
  KEY `FK_docs_graficos_entidad_id_idx` (`entidad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se relacionaran los documentos graficos que tiene cada una de las entidades.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleos`
--

CREATE TABLE IF NOT EXISTS `empleos` (
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
  KEY `FK_empleos_moneda_id_idx` (`moneda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenara los empleos que actualmente tienen cada uno de los clientes de segundo nivel ingresados, los cuales se realacionaran directmaente con una empresa.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleos_tipos`
--

CREATE TABLE IF NOT EXISTS `empleos_tipos` (
  `empleo_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `empleo_tipo_descripcion` varchar(50) NOT NULL,
  `empleo_tipo_abreviatura` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`empleo_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se registraran los tipos de empleos en donde se clasifica el lugar de trabajo para un cliente de segundo nivel.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE IF NOT EXISTS `empresas` (
  `empresa_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `empresa_nombre` varchar(50) NOT NULL,
  `empresa_abreviatura` varchar(50) DEFAULT NULL,
  `empresa_rtn` varchar(50) DEFAULT NULL,
  `empresa_correo` varchar(50) DEFAULT NULL,
  `direccion_id` bigint(20) DEFAULT NULL,
  `estatus_id` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`empresa_id`),
  KEY `FK_empresas_direccion_id_idx` (`direccion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenara  las diferentes empresas en donde pueden llegar a laborar o laboran  actualmente los clientes de segundo nivel.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidades`
--

CREATE TABLE IF NOT EXISTS `entidades` (
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
  KEY `FK_entidades_entidad_tipo_id_idx` (`entidad_tipo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla general en donde se almacenaran las entidades tanto de: clientes de segundo nivel, referencias personales, jefes de empleos, etc. la idea es que esta tabla almacene cualquier dato que se pueda reutilizar luego.' AUTO_INCREMENT=77 ;

--
-- Volcado de datos para la tabla `entidades`
--

INSERT INTO `entidades` (`entidad_id`, `entidad_primer_nombre`, `entidad_segundo_nombre`, `entidad_primer_apellido`, `entidad_segund_apellido`, `entidad_genero`, `estado_civil_id`, `entidad_correo`, `entidad_fecha_nacimiento`, `entidad_identidad_principal`, `entidad_rtn`, `entidad_imagen`, `direccion_id`, `entidad_tipo_id`, `entidad_generado`, `entidad_usuario_creacion`, `entidad_fecha_creacion`, `estatus_id`) VALUES
(1, 'INIT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'sdfsdf', 'sdfsdf', 'sdfsdf', 'sdfsdf', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(6, 'Armando', '', 'Roque', 'Barahona', '2', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(7, 'Damian', 'Alberto', 'Nu?ez', 'Guzman', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(8, 'Damian', 'Alberto', 'Nu?ez', 'Guzman', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(9, 'sddfgsdfg', 'sdfgsdfg', 'sdfgsdfg', '', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(10, 'sddfgsdfg', 'sdfgsdfg', 'sdfgsdfg', '', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(11, 'LOL', 'lalala', 'lalalal', 'lalalal', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(12, 'dd', 'dd', 'dd', 'dd', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(13, 'okok', '', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(14, 'asdasd', 'kokokok', 'okokok', 'okokok', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(15, 'dotot', 'wot', 'say', 'wat', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(16, 'ihusadklhjasdhkjlasd', 'iouhhiuhiu', 'ihuhui', 'ihuhiu', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(17, 'Damian', 'Alberto', 'Gay', 'Lord', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(18, 'probando', 'a ver', 'jo', 'pedo', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(19, 'asdfasdfasdf', 'asdfasdf', 'asdfasdf', 'asdfasdf', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(20, 'prueba', 'ultima', 'a ', 'ver', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(21, 'prueba', 'ultima', 'a ', 'ver', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(22, 'prueba', 'ultima', 'a ', 'ver', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(23, 'prueba', 'ultima', 'a ', 'ver', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(24, 'werfwefwefwwefr', 'wefwef', 'wefrwef', 'wefwef', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(25, 'werfwefwefwwefr', 'wefwef', 'wefrwef', 'wefwef', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(26, 'no', 'no', 'no', 'no', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(27, 'Javier', 'Armando', 'Roque', 'Barahona', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(28, 'aa', 'aa', 'aa', 'aa', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(29, 'aa', 'aa', 'aa', 'aa', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(30, 'aa', 'aa', 'aa', 'aa', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(31, 'e4rsd', 'sdf', 'sdf', 'sdddd', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(32, 'e4rsd', 'sdf', 'sdf', 'sdddd', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(33, 'e4rsd', 'sdf', 'sdf', 'sdddd', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(34, 'wee', 'w', 'w', 'q', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(35, 'wee', 'w', 'w', 'q', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(36, 'sdfsdf', 'sdfsd', 'sdfs', 'sdfsd', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(37, 'sddfsdf', 'asdfasdf', 'asdf', 'asdfasdf', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(38, 'sddfsdf', 'asdfasdf', 'asdf', 'asdfasdf', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(39, 'hey', 'we', 'got', 'em', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(40, 'hey', 'we', 'got', 'em', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(41, 'dss', 'sss', 'ss', 'fsdf', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(42, 'xc', 'xcv', 'vcx', 'vcx', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(43, 'xc', 'xcv', 'vcx', 'vcx', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(44, 'hhhhoooe', 'sdfg', 'dd', 'dd', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(45, 'probando', 'a ver', 'que ', 'me', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(46, 'probando', 'a ver', 'que ', 'me', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(47, 'probando', 'a ver', 'que ', 'me', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(48, '44', 'sdf', '22', '33', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(49, '44', 'sdf', '22', '33', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(50, '', '', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(51, '', '', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(52, '', '', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(53, '', '', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(54, 'ff', 'ffg', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(55, '', '', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(56, '', '', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(57, '', '', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(58, 'sdfg', '', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(59, '', '', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(60, 'Wilmer', 'Mario', 'Dubon', 'Caceres', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(61, 'Wilmer', 'Mario', 'Dubon', 'Caceres', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(62, 'asdddfasdaasda', 'asdasd', 'asdasd', 'asdasd', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(63, 'asdddfasdaasda', 'asdasd', 'asdasd', 'asdasd', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(64, '', '', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(65, 'sdfg', 'sdfg', 'sdfg', 'sdfg', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(66, 'sdfsdfsdfs', 'bbbbbbbb', 'bbbbbbbbbbbb', 'bbbbbbbbbbbbbbbbbbbbbbbbb', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(67, '', '', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(68, '', '', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(69, 'Bau', 'wow', 'Uoh', 'YEh', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(70, 'dsfgsdfdgdfgdfg', 'dsfgdfg', 'dfgdfg', 'wottaa', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(71, 'Mirna', '', 'Barahona', 'Barahona', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(72, 'asfdg', 'asfdg', 'asdfg', 'asdg', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(73, 'Mago', 'Martinez', 'Roque', 'Perez', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(74, 'Yohana', 'Lorena', 'Rosales', 'Barahona', 'Femenino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(75, 'Margaret', '', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', ''),
(76, 'rocco', 'roco', 'roque', 'roqueklo', 'Masculino', NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidades_direcciones`
--

CREATE TABLE IF NOT EXISTS `entidades_direcciones` (
  `entidad_id` bigint(20) NOT NULL,
  `direccion_id` bigint(20) NOT NULL,
  PRIMARY KEY (`entidad_id`,`direccion_id`),
  KEY `FK_entidades_direcciones_direccion_id_idx` (`direccion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se registraran las diferentes direcciones de las diferentes entidades, incluso si la entidad maneja varias direcciones.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidades_identificaciones`
--

CREATE TABLE IF NOT EXISTS `entidades_identificaciones` (
  `entidad_id` bigint(20) NOT NULL,
  `identificacion_id` bigint(20) NOT NULL,
  `identificacion_principal` int(11) DEFAULT NULL,
  PRIMARY KEY (`entidad_id`,`identificacion_id`),
  KEY `FK_entidades_identificaciones_identificacion_id_idx` (`identificacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se relacionaran todas lass identificaciones que puede llegar a poseer una entidad.';

--
-- Volcado de datos para la tabla `entidades_identificaciones`
--

INSERT INTO `entidades_identificaciones` (`entidad_id`, `identificacion_id`, `identificacion_principal`) VALUES
(6, 1, 1),
(7, 1, 1),
(8, 1, 1),
(11, 1, 1),
(12, 1, 1),
(14, 2, 2),
(16, 2, 2),
(17, 1, 1),
(18, 2, 2),
(19, 2, 2),
(21, 2, 2),
(22, 2, 2),
(23, 2, 2),
(24, 2, 2),
(25, 2, 2),
(26, 2, 2),
(27, 1, 1),
(28, 1, 1),
(29, 1, 1),
(30, 1, 1),
(31, 2, 2),
(32, 2, 2),
(33, 2, 2),
(34, 2, 2),
(35, 2, 2),
(37, 2, 2),
(38, 2, 2),
(41, 1, 1),
(45, 6, 6),
(46, 6, 6),
(47, 6, 6),
(48, 2, 2),
(49, 2, 2),
(60, 1, 1),
(61, 1, 1),
(62, 3, 3),
(63, 3, 3),
(69, 1, 1),
(70, 3, 3),
(71, 1, 1),
(72, 2, 2),
(73, 1, 1),
(74, 70, NULL),
(75, 71, NULL),
(76, 72, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidades_telefonos`
--

CREATE TABLE IF NOT EXISTS `entidades_telefonos` (
  `entidad_id` bigint(20) NOT NULL,
  `telefono_id` bigint(20) NOT NULL,
  `estatus_id` varchar(2) NOT NULL,
  `subestatus_id` varchar(2) NOT NULL,
  PRIMARY KEY (`entidad_id`,`telefono_id`,`estatus_id`,`subestatus_id`),
  KEY `FK_entidades_telefonos_telefono_id_idx` (`telefono_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran los multiples telefonos que le pueden pertenecer a una entidad.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidades_tipos`
--

CREATE TABLE IF NOT EXISTS `entidades_tipos` (
  `entidad_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entidad_tipo_descripcion` varchar(50) NOT NULL,
  `entidad_tipo_abreviatura` varchar(50) DEFAULT NULL,
  `entidad_tipo_generado` varchar(25) DEFAULT NULL,
  `estatus_id` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`entidad_tipo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla la cual contendra los tipos de entidades que puede ser una entidad, como ser: Juridica, Natural, etc.' AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `entidades_tipos`
--

INSERT INTO `entidades_tipos` (`entidad_tipo_id`, `entidad_tipo_descripcion`, `entidad_tipo_abreviatura`, `entidad_tipo_generado`, `estatus_id`) VALUES
(1, 'Nuevo', NULL, NULL, NULL),
(2, 'Activo', NULL, NULL, NULL),
(3, 'Inactivo', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_civiles`
--

CREATE TABLE IF NOT EXISTS `estados_civiles` (
  `estado_civil_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado_civil_descripcion` varchar(25) NOT NULL,
  `estado_civil_abreviatura` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`estado_civil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se definen los diferentes tipos de estados civiles que puede tener una entidad en el sistema.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus`
--

CREATE TABLE IF NOT EXISTS `estatus` (
  `estatus_id` varchar(2) NOT NULL,
  `estatus_desripcion` varchar(25) NOT NULL,
  `estatus_comentario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla la cual contendra los valores de todos los tipos de estados a ser usado a lo largo de las transacciones y mantenimientos del sistema CrediStar.';

--
-- Volcado de datos para la tabla `estatus`
--

INSERT INTO `estatus` (`estatus_id`, `estatus_desripcion`, `estatus_comentario`) VALUES
('1', 'Pendiente', NULL),
('2', 'Aprobada', NULL),
('3', 'Denegada', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frecuencias_pagos`
--

CREATE TABLE IF NOT EXISTS `frecuencias_pagos` (
  `frecuencia_pago_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `frecuencia_pago_descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`frecuencia_pago_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran los tipos de frecuencias de pagos que puede tener un cliente de segundo nivel en su lugar de trabajo.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE IF NOT EXISTS `grupos` (
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
  KEY `FK_grupos_cia_id_idx` (`cia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se registraran los grupos principales de usuarios, esto nos srevira para poder definir los perfiles de accesos y grupos de pantallas' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos_pantallas`
--

CREATE TABLE IF NOT EXISTS `grupos_pantallas` (
  `cia_id` varchar(4) NOT NULL,
  `grupo_id` bigint(20) NOT NULL,
  `pantalla_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cia_id`,`pantalla_id`,`grupo_id`),
  KEY `FK_grupos_pantallas_grupo_id_idx` (`grupo_id`),
  KEY `FK_grupos_pantallas_pantalla_id_idx` (`pantalla_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se definiran cada grupo acceso a que pantallas son las que debera tener, esta asignacion se realizara por compañia.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `identificaciones`
--

CREATE TABLE IF NOT EXISTS `identificaciones` (
  `identificacion_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identificacion_tipo_id` bigint(20) DEFAULT NULL,
  `identificacion_numero` varchar(50) DEFAULT NULL,
  `identificacion_registro` varchar(50) DEFAULT NULL,
  `identificacion_dato1` varchar(50) DEFAULT NULL,
  `identificacion_dato2` varchar(50) DEFAULT NULL,
  `identificacion_dato3` varchar(50) DEFAULT NULL,
  `identificacion_comentario` int(11) DEFAULT NULL,
  `entidad_id` int(11) NOT NULL,
  PRIMARY KEY (`identificacion_id`),
  KEY `FK_identificaciones_identificacion_tipo_id_idx` (`identificacion_tipo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla la cual almacenara todas las diferentes identificaciones que una sola entidad puede llegar a manejar.' AUTO_INCREMENT=73 ;

--
-- Volcado de datos para la tabla `identificaciones`
--

INSERT INTO `identificaciones` (`identificacion_id`, `identificacion_tipo_id`, `identificacion_numero`, `identificacion_registro`, `identificacion_dato1`, `identificacion_dato2`, `identificacion_dato3`, `identificacion_comentario`, `entidad_id`) VALUES
(1, 2, '', NULL, NULL, NULL, NULL, NULL, 0),
(2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 6),
(3, 1, NULL, NULL, NULL, NULL, NULL, NULL, 7),
(4, 1, NULL, NULL, NULL, NULL, NULL, NULL, 8),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9),
(6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10),
(7, 1, NULL, NULL, NULL, NULL, NULL, NULL, 11),
(8, 1, NULL, NULL, NULL, NULL, NULL, NULL, 12),
(9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13),
(10, 2, NULL, NULL, NULL, NULL, NULL, NULL, 14),
(11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15),
(12, 2, NULL, NULL, NULL, NULL, NULL, NULL, 16),
(13, 1, NULL, NULL, NULL, NULL, NULL, NULL, 17),
(14, 2, NULL, NULL, NULL, NULL, NULL, NULL, 18),
(15, 2, NULL, NULL, NULL, NULL, NULL, NULL, 19),
(16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20),
(17, 2, NULL, NULL, NULL, NULL, NULL, NULL, 21),
(18, 2, NULL, NULL, NULL, NULL, NULL, NULL, 22),
(19, 2, NULL, NULL, NULL, NULL, NULL, NULL, 23),
(20, 2, NULL, NULL, NULL, NULL, NULL, NULL, 24),
(21, 2, NULL, NULL, NULL, NULL, NULL, NULL, 25),
(22, 2, NULL, NULL, NULL, NULL, NULL, NULL, 26),
(23, 1, NULL, NULL, NULL, NULL, NULL, NULL, 27),
(24, 1, NULL, NULL, NULL, NULL, NULL, NULL, 28),
(25, 1, NULL, NULL, NULL, NULL, NULL, NULL, 29),
(26, 1, NULL, NULL, NULL, NULL, NULL, NULL, 30),
(27, 2, NULL, NULL, NULL, NULL, NULL, NULL, 31),
(28, 2, NULL, NULL, NULL, NULL, NULL, NULL, 32),
(29, 2, NULL, NULL, NULL, NULL, NULL, NULL, 33),
(30, 2, NULL, NULL, NULL, NULL, NULL, NULL, 34),
(31, 2, NULL, NULL, NULL, NULL, NULL, NULL, 35),
(32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36),
(33, 2, NULL, NULL, NULL, NULL, NULL, NULL, 37),
(34, 2, NULL, NULL, NULL, NULL, NULL, NULL, 38),
(35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39),
(36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40),
(37, 1, NULL, NULL, NULL, NULL, NULL, NULL, 41),
(38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42),
(39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43),
(40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44),
(41, 6, NULL, NULL, NULL, NULL, NULL, NULL, 45),
(42, 6, NULL, NULL, NULL, NULL, NULL, NULL, 46),
(43, 6, NULL, NULL, NULL, NULL, NULL, NULL, 47),
(44, 2, NULL, NULL, NULL, NULL, NULL, NULL, 48),
(45, 2, NULL, NULL, NULL, NULL, NULL, NULL, 49),
(46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50),
(47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 51),
(48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52),
(49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 53),
(50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54),
(51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55),
(52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56),
(53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 57),
(54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58),
(55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 59),
(56, 1, NULL, NULL, NULL, NULL, NULL, NULL, 60),
(57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 61),
(58, 3, NULL, NULL, NULL, NULL, NULL, NULL, 62),
(59, 3, NULL, NULL, NULL, NULL, NULL, NULL, 63),
(60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 64),
(61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65),
(62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 66),
(63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 67),
(64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68),
(65, 1, NULL, NULL, NULL, NULL, NULL, NULL, 69),
(66, 3, NULL, NULL, NULL, NULL, NULL, NULL, 70),
(67, 1, NULL, NULL, NULL, NULL, NULL, NULL, 71),
(68, 2, NULL, NULL, NULL, NULL, NULL, NULL, 72),
(69, 1, NULL, NULL, NULL, NULL, NULL, NULL, 73),
(70, NULL, '0501199109215', NULL, NULL, NULL, NULL, NULL, 74),
(71, NULL, '', NULL, NULL, NULL, NULL, NULL, 75),
(72, 1, '0501199109215', NULL, NULL, NULL, NULL, NULL, 76);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `identificaciones_tipos`
--

CREATE TABLE IF NOT EXISTS `identificaciones_tipos` (
  `identificacion_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identificacion_tipo_descripcion` varchar(50) NOT NULL,
  `identificacion_tipo_abreviaturas` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`identificacion_tipo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se clasificaran las identificaciones comos ser: cedulas, licencias, pasaportes, etc.' AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `identificaciones_tipos`
--

INSERT INTO `identificaciones_tipos` (`identificacion_tipo_id`, `identificacion_tipo_descripcion`, `identificacion_tipo_abreviaturas`, `estatus_id`) VALUES
(1, 'Cedula', NULL, NULL),
(2, 'Pasaporte', NULL, NULL),
(3, 'Licencia de Conducir', NULL, NULL),
(4, 'Carnet de Trabajo', NULL, NULL),
(5, 'Carnet de Residencia', NULL, NULL),
(6, 'Carnet de Seguro Social', NULL, NULL),
(7, 'RTN', NULL, NULL),
(8, 'Otro', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `limites_creditos`
--

CREATE TABLE IF NOT EXISTS `limites_creditos` (
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
  `solicitudes_limites_creditos_solicitud_id` bigint(20) NOT NULL,
  `solicitudes_limites_creditos_cia_id` varchar(4) NOT NULL,
  PRIMARY KEY (`limite_credito_id`),
  KEY `FK_limites_creditos_cia_id_idx` (`cia_id`),
  KEY `FK_limites_creditos_solicitudes_limites_creditos1_idx` (`solicitudes_limites_creditos_solicitud_id`,`solicitudes_limites_creditos_cia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran los calculos para las afectaciones de los limites de credito segun sea la afectacion  resultante del score que se haya determinado por el sistema  CrediStar.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedas`
--

CREATE TABLE IF NOT EXISTS `monedas` (
  `moneda_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `moneda_descripcion` varchar(50) DEFAULT NULL,
  `moneda_simbolo` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`moneda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenara el tipo de moneda con el cual se trabajara en CrediStar' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE IF NOT EXISTS `municipios` (
  `municipio_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `depto_id` bigint(20) DEFAULT NULL,
  `municipio_nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`municipio_id`),
  KEY `FK_municipios_depto_id_idx` (`depto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla la cual contendra los municipios de cada departamento registrado en el sistema.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_educativo`
--

CREATE TABLE IF NOT EXISTS `nivel_educativo` (
  `nivel_edu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nivel_edu_descrip` varchar(50) NOT NULL,
  `nivel_edu_abreviatura` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`nivel_edu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se registraran los diferentes tipos de niveles educativos que puede llegar a tener un cliente de segundo nivel' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `pais_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pais_nombre` varchar(50) NOT NULL,
  `pais_region` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pais_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran los paises de los cuales manejera el sistema.' AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`pais_id`, `pais_nombre`, `pais_region`) VALUES
(1, 'Honduras', NULL),
(2, 'Guatemala', NULL),
(3, 'El Salvador', NULL),
(4, 'Nicaragua', NULL),
(5, 'Costa Rica', NULL),
(6, 'Panama', NULL),
(7, 'Norteamerica', NULL),
(8, 'suramerica', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pantallas`
--

CREATE TABLE IF NOT EXISTS `pantallas` (
  `pantalla_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pantalla_nombre` varchar(50) NOT NULL,
  `pantalla_abreviatura` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`pantalla_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran todas las pantallas, funciones y consultas del sistema CrediStar, solo para registrar que objetos se desean controlar en el mismo.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesiones`
--

CREATE TABLE IF NOT EXISTS `profesiones` (
  `profesion_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profesion_descripcion` varchar(50) NOT NULL,
  `profesion_relacion` varchar(50) DEFAULT NULL,
  `profesion_abreviatura` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`profesion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran las profesiones que puede llegar a tener un cliente de segundo nivel en CrediStar' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedades`
--

CREATE TABLE IF NOT EXISTS `propiedades` (
  `propiedad_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `propiedad_descripcion` varchar(50) DEFAULT NULL,
  `propiedad_tipo_id` bigint(20) DEFAULT NULL,
  `propiedad_comentario` varchar(100) DEFAULT NULL,
  `propiedad_valor` decimal(10,2) DEFAULT NULL,
  `propiedad_registro` varchar(50) DEFAULT NULL,
  `direccion_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`propiedad_id`),
  KEY `FK_propiedades_propiedad_tipo_id_idx` (`propiedad_tipo_id`),
  KEY `FK_propiedades_direccion_id_idx` (`direccion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se ingresaran las propiedades que puede llegar a tener un cliente de segun do nivel registrado en el sistema CrediStar.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedades_tipos`
--

CREATE TABLE IF NOT EXISTS `propiedades_tipos` (
  `propiedad_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `propiedad_tipo_descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`propiedad_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se definiran los tipos de propiedades que puede llegar a tener una entidad general de propiedades.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referencias_personales`
--

CREATE TABLE IF NOT EXISTS `referencias_personales` (
  `referencia_personal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entidad_id` bigint(20) DEFAULT NULL,
  `referencia_relacion_id` bigint(20) DEFAULT NULL,
  `referencias_personales_antiguedad` decimal(10,2) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`referencia_personal_id`),
  KEY `FK_referencias_personales_entidad_id_idx` (`entidad_id`),
  KEY `FK_referencias_personales_referencia_relacion_id_idx` (`referencia_relacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se relacionaran las diferentes  referencias personales que puede llegar a tener una entidad.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referencias_relaciones`
--

CREATE TABLE IF NOT EXISTS `referencias_relaciones` (
  `referencia_relacion_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `referencia_relacion_descripcion` varchar(50) NOT NULL,
  `referencia_relacion_abreviatura` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`referencia_relacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se definiaran los tipos de relaciones que se puede tener ante una referencia personal que haya brindado un cliente de segundo nivel' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `scores`
--

CREATE TABLE IF NOT EXISTS `scores` (
  `score_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cia_id` varchar(4) DEFAULT NULL,
  `score_descripcion` varchar(50) DEFAULT NULL,
  `score_variable` varchar(50) DEFAULT NULL,
  `score_validacion` varchar(50) DEFAULT NULL,
  `score_puntaje` int(11) DEFAULT NULL,
  `score_abreviatura` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`score_id`),
  KEY `FK_scores_cia_id_idx` (`cia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran las configuraciones de los Scores de cada compañia en el sistema CrediStar' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE IF NOT EXISTS `solicitudes` (
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
  `entidad_id` bigint(20) NOT NULL,
  PRIMARY KEY (`solicitud_id`),
  KEY `FK_solicitudes_cia_id_idx` (`cia_id`),
  KEY `FK_solicitudes_solicitud_tipo_id_idx` (`solicitud_tipo_id`),
  KEY `FK_solicitudes_solicitud_canal_id_idx` (`solicitud_canal_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla de transacciones, en esta tabla se guardara el registro que sera el que inicie la afetacion de un credtio para un cliente en especifico.' AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`solicitud_id`, `cia_id`, `solicitud_fecha_inicio`, `solicitud_fecha_cierre`, `solicitud_prioridad`, `solicitud_tipo_id`, `solicitud_canal_id`, `solicitud_monto`, `solicitud_cuota`, `solicitud_plazo`, `soliciutd_comentario`, `soliciutd_score`, `soliciutd_forzada`, `estatus_id`, `subestatus_id`, `entidad_id`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, '25000.00', '6000.00', '25.00', NULL, NULL, 0, '1', NULL, 71),
(2, NULL, NULL, NULL, NULL, NULL, NULL, '23452345.00', '2345.00', '4.00', NULL, NULL, 0, '3', NULL, 72),
(3, NULL, '2016-03-15 22:54:10', NULL, NULL, NULL, NULL, '300000.00', '3000.00', '25.00', NULL, NULL, 0, '2', NULL, 73),
(4, NULL, '2016-03-16 02:10:09', NULL, NULL, NULL, NULL, '250000.00', '25000.00', '2.00', NULL, NULL, 0, '1', NULL, 74),
(5, NULL, '2016-03-17 02:56:30', NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, NULL, 0, '1', NULL, 75),
(6, NULL, '2016-04-23 02:53:00', NULL, NULL, NULL, NULL, '50000.00', '3000.00', '12.00', NULL, NULL, 0, '3', NULL, 76);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_canales`
--

CREATE TABLE IF NOT EXISTS `solicitudes_canales` (
  `solicitud_canal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cia_id` varchar(4) DEFAULT NULL,
  `solicitud_canal_descripcion` varchar(50) DEFAULT NULL,
  `solicitud_canal_abreviatura` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`solicitud_canal_id`),
  KEY `FK_solicitudes_canales_cia_id_idx` (`cia_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran que tipos de canales de solicitud pueden existir en la transaccion principal de solicitudes.' AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `solicitudes_canales`
--

INSERT INTO `solicitudes_canales` (`solicitud_canal_id`, `cia_id`, `solicitud_canal_descripcion`, `solicitud_canal_abreviatura`, `estatus_id`) VALUES
(3, NULL, 'Piso de Venta', NULL, NULL),
(4, NULL, 'Tele-Venta', NULL, NULL),
(5, NULL, 'Extra piso', NULL, NULL),
(6, NULL, 'Ferias', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_docs`
--

CREATE TABLE IF NOT EXISTS `solicitudes_docs` (
  `solicitud_doc_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `solicitud_id` bigint(20) NOT NULL,
  `solicitud_doc_comentario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`solicitud_doc_id`,`solicitud_id`),
  KEY `FK_solicitudes_docs_solicitud_id_idx` (`solicitud_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabla en donde se almacenaran los diferentes documentos graficos que seran ligados a una solicitud en particular por el cliente de primer nivel.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_limites_creditos`
--

CREATE TABLE IF NOT EXISTS `solicitudes_limites_creditos` (
  `solicitud_id` bigint(20) NOT NULL,
  `cia_id` varchar(4) NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `limite_credito_id` bigint(20) DEFAULT NULL,
  `limite_credito_factor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`solicitud_id`,`cia_id`),
  KEY `FK_solicitudes_limites_creditos_cia_id_idx` (`cia_id`),
  KEY `FK_solicitudes_limites_creditos_cliente_id_idx` (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se relacioanra la solicitud como afectara el limite de credito para un cliente en especifico.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_scores`
--

CREATE TABLE IF NOT EXISTS `solicitudes_scores` (
  `solicitud_id` bigint(20) NOT NULL,
  `cia_id` varchar(4) NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `score_id` bigint(20) DEFAULT NULL,
  `solicitud_score_puntaje` int(11) DEFAULT NULL,
  PRIMARY KEY (`solicitud_id`,`cia_id`),
  KEY `FK_solicitudes_scores_cia_id_idx` (`cia_id`),
  KEY `FK_solicitudes_scores_cliente_id_idx` (`cliente_id`),
  KEY `FK_solicitudes_scores_score_id_idx` (`score_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran los scores que ha obtenido un cliente de segundo nivel vinculado a una solicitud creada en el sistema CrediStar.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_tipos`
--

CREATE TABLE IF NOT EXISTS `solicitudes_tipos` (
  `solicitud_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cia_id` varchar(4) DEFAULT NULL,
  `solicitud_tipo_descripcion` varchar(50) NOT NULL,
  `solicitud_tipo_abreviatura` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`solicitud_tipo_id`),
  KEY `FK_solicitudes_tipos_cia_id_idx` (`cia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran los diferentes tipos de solicitudes que puede llegar a ser la transaccion de solicitud propiamente.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sub_estatus`
--

CREATE TABLE IF NOT EXISTS `sub_estatus` (
  `estatus_id` varchar(2) NOT NULL,
  `subestatus_id` varchar(2) NOT NULL,
  `subestatus_descripcion` varchar(25) NOT NULL,
  `subestatus_comentario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`estatus_id`,`subestatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que contrenda los sub estados para cada uno de los estados principales que se definieron en la tabla [estatus], esto es para saber por que tipo de fase u operacion va un proceso que se encuentre en un estado iniciado.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE IF NOT EXISTS `sucursales` (
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
  KEY `FK_sucursales_colonia_id_idx` (`colonia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran las sucursales de las compañias clientes primer nivel del sistema CrediStar.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_config`
--

CREATE TABLE IF NOT EXISTS `sys_config` (
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_scores_cortes`
--

CREATE TABLE IF NOT EXISTS `sys_scores_cortes` (
  `cia_id` varchar(4) NOT NULL,
  `score_variable` varchar(50) NOT NULL,
  `sys_score_corte_puntaje` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cia_id`,`score_variable`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran las configuraciones globales para los cortes de un scores, como ser la edad >30 años, tiene un score meta de 300 el cual sera su valor de corte por compañia ya que diferentes compañias tendran diferentes cortes o metas.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE IF NOT EXISTS `telefonos` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que servira de registro maestro para los numeros de telefonos de las diferentes entidades del sistema' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos_subtipos`
--

CREATE TABLE IF NOT EXISTS `telefonos_subtipos` (
  `telefono_subtipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `telefono_subtipo_descripcion` varchar(25) NOT NULL,
  PRIMARY KEY (`telefono_subtipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se definiran los subtipos de telefonos que puede tener una entidad como ser de un telefono tipo [Celular] tiene un subtipo [Principal]' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos_tipos`
--

CREATE TABLE IF NOT EXISTS `telefonos_tipos` (
  `telefono_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `telefono_descripcion` varchar(25) NOT NULL,
  PRIMARY KEY (`telefono_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se definiran los tipos de telefonos que puede llegar a tener una entidad y como se clasificaran' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulos`
--

CREATE TABLE IF NOT EXISTS `titulos` (
  `titulo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo_descripcion` varchar(50) NOT NULL,
  `titulo_abreviatura` varchar(50) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`titulo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran los titulos de caracter educativo que puede llegar a tener un cliente de segundo nivel en el sistema	' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_alias` varchar(25) NOT NULL,
  `usuario_nombre` varchar(50) DEFAULT NULL,
  `usuario_apellido` varchar(50) DEFAULT NULL,
  `usuario_cel` varchar(50) DEFAULT NULL,
  `usuario_telefono` varchar(50) DEFAULT NULL,
  `usuario_foto` varchar(50) DEFAULT NULL,
  `usuario_isadmin` int(11) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  `usuario_pass` varchar(128) NOT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se registraran todos los usuarios del sistema, con este registro y dependiendo de su nivel de acceso es donde se podra definir la seguridad a cada usuario.' AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `usuario_alias`, `usuario_nombre`, `usuario_apellido`, `usuario_cel`, `usuario_telefono`, `usuario_foto`, `usuario_isadmin`, `estatus_id`, `usuario_pass`) VALUES
(1, 'aroque', 'ARMANDO', 'ROQUE', '33096700', '', NULL, 1, '1', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_cias`
--

CREATE TABLE IF NOT EXISTS `usuarios_cias` (
  `usuario_id` bigint(20) NOT NULL,
  `cia_id` varchar(4) NOT NULL,
  PRIMARY KEY (`usuario_id`,`cia_id`),
  KEY `FK_usuarios_cias_cia_id_idx` (`cia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran los usuarios y a que compañias tienen accesos.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_grupos`
--

CREATE TABLE IF NOT EXISTS `usuarios_grupos` (
  `usuario_id` bigint(20) NOT NULL,
  `grupo_id` bigint(20) NOT NULL,
  PRIMARY KEY (`usuario_id`,`grupo_id`),
  KEY `FK_usuarios_grupos_grupo_id_idx` (`grupo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se registraran los usuarios a que grupo o perfil en particular peretenecen.';

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `FK_clientes_nivel_edu_id` FOREIGN KEY (`nivel_edu_id`) REFERENCES `nivel_educativo` (`nivel_edu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_clientes_profesion_id` FOREIGN KEY (`profesion_id`) REFERENCES `profesiones` (`profesion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clientes_empleos`
--
ALTER TABLE `clientes_empleos`
  ADD CONSTRAINT `FK_clientes_empleados_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_clientes_empleados_empleo_id` FOREIGN KEY (`empleo_id`) REFERENCES `empleos` (`empleo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `colonias`
--
ALTER TABLE `colonias`
  ADD CONSTRAINT `FK_colonias_municipio_id` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`municipio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `FK_deptos_pais_id` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`pais_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `dependientes`
--
ALTER TABLE `dependientes`
  ADD CONSTRAINT `FK_dependientes_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_dependientes_entidad_id` FOREIGN KEY (`entidad_id`) REFERENCES `entidades` (`entidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `FK_direcciones_colonia_id` FOREIGN KEY (`colonia_id`) REFERENCES `colonias` (`colonia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_direcciones_depto_id` FOREIGN KEY (`depto_id`) REFERENCES `departamentos` (`depto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_direcciones_direccion_tipo` FOREIGN KEY (`direccion_tipo_id`) REFERENCES `direcciones_tipos` (`direccion_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_direcciones_municipio_id` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`municipio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_direcciones_pais_id` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`pais_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `docs_graficos`
--
ALTER TABLE `docs_graficos`
  ADD CONSTRAINT `FK_docs_graficos_entidad_id` FOREIGN KEY (`entidad_id`) REFERENCES `entidades` (`entidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleos`
--
ALTER TABLE `empleos`
  ADD CONSTRAINT `FK_empleos_contrato_tipo_id` FOREIGN KEY (`contrato_tipo_id`) REFERENCES `contratos_tipos` (`contrato_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_empleos_empleo_tipo_id` FOREIGN KEY (`empleo_tipo_id`) REFERENCES `empleos_tipos` (`empleo_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_empleos_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_empleos_frecuencia_pago_id` FOREIGN KEY (`frecuencia_pago_id`) REFERENCES `frecuencias_pagos` (`frecuencia_pago_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_empleos_moneda_id` FOREIGN KEY (`moneda_id`) REFERENCES `monedas` (`moneda_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `FK_empresas_direccion_id` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones` (`direccion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entidades`
--
ALTER TABLE `entidades`
  ADD CONSTRAINT `FK_entidades_direccion_id` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones` (`direccion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_entidades_entidad_tipo_id` FOREIGN KEY (`entidad_tipo_id`) REFERENCES `entidades_tipos` (`entidad_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_entidades_estado_civil_id` FOREIGN KEY (`estado_civil_id`) REFERENCES `estados_civiles` (`estado_civil_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entidades_direcciones`
--
ALTER TABLE `entidades_direcciones`
  ADD CONSTRAINT `FK_entidades_direcciones_direccion_id` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones` (`direccion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_entidades_direcciones_entidad_id` FOREIGN KEY (`entidad_id`) REFERENCES `entidades` (`entidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entidades_identificaciones`
--
ALTER TABLE `entidades_identificaciones`
  ADD CONSTRAINT `FK_entidades_identificaciones_entidad_id` FOREIGN KEY (`entidad_id`) REFERENCES `entidades` (`entidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_entidades_identificaciones_identificacion_id` FOREIGN KEY (`identificacion_id`) REFERENCES `identificaciones` (`identificacion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entidades_telefonos`
--
ALTER TABLE `entidades_telefonos`
  ADD CONSTRAINT `FK_entidades_telefonos_entidad_id` FOREIGN KEY (`entidad_id`) REFERENCES `entidades` (`entidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_entidades_telefonos_telefono_id` FOREIGN KEY (`telefono_id`) REFERENCES `telefonos` (`telefono_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `FK_grupos_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grupos_pantallas`
--
ALTER TABLE `grupos_pantallas`
  ADD CONSTRAINT `FK_grupos_pantallas_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_grupos_pantallas_grupo_id` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`grupo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_grupos_pantallas_pantalla_id` FOREIGN KEY (`pantalla_id`) REFERENCES `pantallas` (`pantalla_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `identificaciones`
--
ALTER TABLE `identificaciones`
  ADD CONSTRAINT `FK_identificaciones_identificacion_tipo_id` FOREIGN KEY (`identificacion_tipo_id`) REFERENCES `identificaciones_tipos` (`identificacion_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `limites_creditos`
--
ALTER TABLE `limites_creditos`
  ADD CONSTRAINT `FK_limites_creditos_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_limites_creditos_solicitudes_limites_creditos1` FOREIGN KEY (`solicitudes_limites_creditos_solicitud_id`, `solicitudes_limites_creditos_cia_id`) REFERENCES `solicitudes_limites_creditos` (`solicitud_id`, `cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `FK_municipios_depto_id` FOREIGN KEY (`depto_id`) REFERENCES `departamentos` (`depto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `propiedades`
--
ALTER TABLE `propiedades`
  ADD CONSTRAINT `FK_propiedades_direccion_id` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones` (`direccion_id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_propiedades_propiedad_tipo_id` FOREIGN KEY (`propiedad_tipo_id`) REFERENCES `propiedades_tipos` (`propiedad_tipo_id`) ON UPDATE NO ACTION;

--
-- Filtros para la tabla `referencias_personales`
--
ALTER TABLE `referencias_personales`
  ADD CONSTRAINT `FK_referencias_personales_entidad_id` FOREIGN KEY (`entidad_id`) REFERENCES `entidades` (`entidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_referencias_personales_referencia_relacion_id` FOREIGN KEY (`referencia_relacion_id`) REFERENCES `referencias_relaciones` (`referencia_relacion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `FK_scores_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `FK_solicitudes_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_solicitudes_solicitud_canal_id` FOREIGN KEY (`solicitud_canal_id`) REFERENCES `solicitudes_canales` (`solicitud_canal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_solicitudes_solicitud_tipo_id` FOREIGN KEY (`solicitud_tipo_id`) REFERENCES `solicitudes_tipos` (`solicitud_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudes_canales`
--
ALTER TABLE `solicitudes_canales`
  ADD CONSTRAINT `FK_solicitudes_canales_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudes_docs`
--
ALTER TABLE `solicitudes_docs`
  ADD CONSTRAINT `FK_solicitudes_docs_solicitud_id` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`solicitud_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudes_limites_creditos`
--
ALTER TABLE `solicitudes_limites_creditos`
  ADD CONSTRAINT `FK_solicitudes_limites_creditos_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_solicitudes_limites_creditos_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_solicitudes_limites_creditos_solicitud_id` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`solicitud_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudes_scores`
--
ALTER TABLE `solicitudes_scores`
  ADD CONSTRAINT `FK_solicitudes_scores_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_solicitudes_scores_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_solicitudes_scores_score_id` FOREIGN KEY (`score_id`) REFERENCES `scores` (`score_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_solicitudes_scores_solicitud_id` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`solicitud_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudes_tipos`
--
ALTER TABLE `solicitudes_tipos`
  ADD CONSTRAINT `FK_solicitudes_tipos_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sub_estatus`
--
ALTER TABLE `sub_estatus`
  ADD CONSTRAINT `FK_estatus_id` FOREIGN KEY (`estatus_id`) REFERENCES `estatus` (`estatus_id`) ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD CONSTRAINT `FK_sucursales_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_sucursales_colonia_id` FOREIGN KEY (`colonia_id`) REFERENCES `colonias` (`colonia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_sucursales_deptos_id` FOREIGN KEY (`depto_id`) REFERENCES `departamentos` (`depto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_sucursales_municipio_id` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`municipio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_sucursales_pais_id` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`pais_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios_cias`
--
ALTER TABLE `usuarios_cias`
  ADD CONSTRAINT `FK_usuarios_cias_cia_id` FOREIGN KEY (`cia_id`) REFERENCES `cias` (`cia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_usuarios_cias_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios_grupos`
--
ALTER TABLE `usuarios_grupos`
  ADD CONSTRAINT `FK_usuarios_grupos_grupo_id` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`grupo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_usuarios_grupos_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
