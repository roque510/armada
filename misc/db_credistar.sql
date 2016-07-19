-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-07-2016 a las 00:03:57
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
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
-- Estructura de tabla para la tabla `blacklist_identidad`
--

CREATE TABLE IF NOT EXISTS `blacklist_identidad` (
  `blacklist_id` int(11) NOT NULL AUTO_INCREMENT,
  `blacklist_identidad` varchar(30) NOT NULL,
  PRIMARY KEY (`blacklist_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `blacklist_identidad`
--

INSERT INTO `blacklist_identidad` (`blacklist_id`, `blacklist_identidad`) VALUES
(1, 'undefined'),
(2, 'undefined'),
(3, 'undefined'),
(4, ' 91919191919 '),
(5, '0501199109215');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla donde se almacenaran los tipos de cargos que puede llegar a tener un cliente de segundo nivel en su lugar de trabajo.' AUTO_INCREMENT=1000 ;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`cargo_id`, `cargo_descripcion`, `cargo_abreviatura`) VALUES
(1, 'Administrador', NULL),
(2, 'Vendedor', NULL),
(3, 'Supervisor', NULL),
(4, 'Jefe de Area', NULL),
(5, 'Contador', NULL),
(6, 'Director', NULL),
(200, 'Abogado', NULL),
(201, 'Acomodador', NULL),
(202, 'Actor', NULL),
(203, 'Agente de Viajes', NULL),
(204, 'Agricultor', NULL),
(205, 'Albañil', NULL),
(206, 'Almacenista', NULL),
(207, 'Ama de casa', NULL),
(208, 'Ama de Llaves', NULL),
(209, 'Analista', NULL),
(210, 'Analista de Credito', NULL),
(211, 'Anfitriona', NULL),
(212, 'Antropólogo', NULL),
(213, 'Arqueólogo', NULL),
(214, 'Arquitecto', NULL),
(215, 'Arsenalera', NULL),
(216, 'Artista', NULL),
(217, 'Asesor (profesional)', NULL),
(218, 'Asistente Administrativo', NULL),
(219, 'Asistente de Hospital', NULL),
(220, 'Asistente de Presidencia', NULL),
(221, 'Asistente de Vicepresidencia', NULL),
(222, 'Asistentes de Gerencia', NULL),
(223, 'Auditor', NULL),
(224, 'Auxiliar de Ventas', NULL),
(225, 'Auxiliar Paramédico', NULL),
(226, 'Auxiliares', NULL),
(227, 'Auxiliares Contables', NULL),
(228, 'Avaluador', NULL),
(229, 'Azafata', NULL),
(230, 'Bacteriólogo', NULL),
(231, 'Barbero', NULL),
(232, 'Bibliotecario', NULL),
(233, 'Biólogo', NULL),
(234, 'Biólogo Marino', NULL),
(235, 'Bombero', NULL),
(236, 'cajeross', NULL),
(237, 'Camarero/Camarera', NULL),
(238, 'Carnicero', NULL),
(239, 'Carpintero', NULL),
(240, 'Cartero', NULL),
(241, 'Clero', NULL),
(242, 'Cobrador', NULL),
(243, 'Cocinero', NULL),
(244, 'Comerciante', NULL),
(245, 'Comerciante Internacional', NULL),
(246, 'Comunicador', NULL),
(247, 'Conductor de Caponera', NULL),
(248, 'Conductores', NULL),
(249, 'Confeccionista', NULL),
(250, 'Contador', NULL),
(251, 'Contralor', NULL),
(252, 'Contratista', NULL),
(253, 'Copiloto', NULL),
(254, 'Coronel', NULL),
(255, 'Corredor Bolsa', NULL),
(256, 'Cosmetólogo', NULL),
(257, 'Costurera', NULL),
(258, 'Decano de Universidad', NULL),
(259, 'Decorador de Interiores', NULL),
(260, 'Delineante', NULL),
(261, 'Dentista', NULL),
(262, 'Deportista', NULL),
(263, 'Desempleado', NULL),
(264, 'Detective', NULL),
(265, 'Dibujante', NULL),
(266, 'Dietista', NULL),
(267, 'Digitador', NULL),
(268, 'Director', NULL),
(269, 'Diseñador', NULL),
(270, 'Ebanista', NULL),
(271, 'Economista', NULL),
(272, 'Editor', NULL),
(273, 'Educador', NULL),
(274, 'Electricista', NULL),
(275, 'Empleado Bancario', NULL),
(276, 'Encargado de Compras', NULL),
(277, 'Enfermero', NULL),
(278, 'Ensamblador', NULL),
(279, 'Escritor', NULL),
(280, 'Estadístico', NULL),
(281, 'Estampador', NULL),
(282, 'Estilista', NULL),
(283, 'Estudiante', NULL),
(284, 'Farmaceuta', NULL),
(285, 'Finquero', NULL),
(286, 'Fotógrafo', NULL),
(287, 'Ganadero', NULL),
(288, 'General', NULL),
(289, 'Geólogo', NULL),
(290, 'Gerente', NULL),
(291, 'Gerente de Viajes', NULL),
(292, 'Granjero', NULL),
(293, 'Guardalínea', NULL),
(294, 'Guardia de Tránsito', NULL),
(295, 'Guardias', NULL),
(296, 'Hogar', NULL),
(297, 'Impresor', NULL),
(298, 'Ingeniero', NULL),
(299, 'Ingeniero de Vuelo (profesional)', NULL),
(300, 'Inspector', NULL),
(301, 'Instaladores', NULL),
(302, 'Instructor de Conducción', NULL),
(303, 'Instrumentador', NULL),
(304, 'Inversionista', NULL),
(305, 'Investigador', NULL),
(306, 'Jardinero', NULL),
(307, 'Jefes de Personal', NULL),
(308, 'Joyero', NULL),
(309, 'Jubilado', NULL),
(310, 'Laboratorista', NULL),
(311, 'Lavandero', NULL),
(312, 'Litógrafo', NULL),
(313, 'Maestro', NULL),
(314, 'Maestro de Obra', NULL),
(315, 'Matemático', NULL),
(316, 'Mecánico', NULL),
(317, 'Médico', NULL),
(318, 'Mensajero', NULL),
(319, 'Mercadotecnia', NULL),
(320, 'Meteorólogo', NULL),
(321, 'Militares', NULL),
(322, 'Minero', NULL),
(323, 'Músico', NULL),
(324, 'Nutricionista', NULL),
(325, 'Odontólogo', NULL),
(326, 'Oficial de Seguridad', NULL),
(327, 'Oficio Domestico', NULL),
(328, 'Oficios Varios', NULL),
(329, 'Operador Computadora', NULL),
(330, 'Operador de Equipo', NULL),
(331, 'Operador de Fábrica', NULL),
(332, 'Operador de Máquina', NULL),
(333, 'Optómetra', NULL),
(334, 'Otro', NULL),
(335, 'Panadero', NULL),
(336, 'Pensionado', NULL),
(337, 'Peon de Zafra', NULL),
(338, 'Periodista', NULL),
(339, 'Pescador', NULL),
(340, 'Piloto', NULL),
(341, 'Pintor de casa', NULL),
(342, 'Plomero', NULL),
(343, 'Policía', NULL),
(344, 'Policía - Militar', NULL),
(345, 'Portero', NULL),
(346, 'Presidente', NULL),
(347, 'Prestamista', NULL),
(348, 'Profesor', NULL),
(349, 'Programador', NULL),
(350, 'Propietarios de Negocios', NULL),
(351, 'Publicista', NULL),
(352, 'Químico', NULL),
(353, 'Químico Farmaceuta', NULL),
(354, 'Recepcionista', NULL),
(355, 'Recibe Remesas', NULL),
(356, 'Relioso', NULL),
(357, 'Rentista de Capital', NULL),
(358, 'Reparadores', NULL),
(359, 'Representante de Ventas', NULL),
(360, 'Sacerdote', NULL),
(361, 'Sargento', NULL),
(362, 'Sastre', NULL),
(363, 'Secretaria', NULL),
(364, 'Sicólogo', NULL),
(365, 'Sociólogo', NULL),
(366, 'Soldador', NULL),
(367, 'Subgerente', NULL),
(368, 'Supermercario', NULL),
(369, 'Supervisor de Fábrica', NULL),
(370, 'Supervisor de Ventas', NULL),
(371, 'Supervisores', NULL),
(372, 'Tapicería', NULL),
(373, 'Taxista', NULL),
(374, 'Técnico ', NULL),
(375, 'Técnico Naval', NULL),
(376, 'Tecnólogo', NULL),
(377, 'Tesorero', NULL),
(378, 'Topógrafo', NULL),
(379, 'Tornero', NULL),
(380, 'Trabajador Social', NULL),
(381, 'Transportador de Carga', NULL),
(382, 'Transportador de Pasajeros', NULL),
(383, 'Transporte Escolar', NULL),
(384, 'Vendedor de Manufacturas', NULL),
(385, 'Vendedor de Seguros', NULL),
(386, 'Veterinario', NULL),
(387, 'Vicedecano', NULL),
(388, 'Vicepresidente', NULL),
(389, 'Visitador Médico', NULL),
(390, 'Zapatero', NULL),
(391, 'Zootécnico', NULL),
(999, 'Otro', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cias`
--

CREATE TABLE IF NOT EXISTS `cias` (
  `cia_id` bigint(20) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran todas las compañias y sus datos generales, los cuales seran los clientes internos directos del sistema CrediStar. Dicha tabla es la escencia cuando se se desee agregar un nuevo cliente de primer nivel.' AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cias`
--

INSERT INTO `cias` (`cia_id`, `cia_descripcion`, `cia_abreviatura`, `cia_rtn`, `cia_rubro`, `cia_mision`, `cia_vision`, `cia_valores`, `cia_logo`, `cia_direccion`, `cia_direccion1`, `cia_telefono`, `cia_telefono1`, `cia_contacto`, `cia_generico1`, `cia_generico2`, `estatus_id`) VALUES
(1, 'GALLO', 'GALLO', '92928', 'OJOIJO', NULL, NULL, NULL, NULL, 'COL COL', NULL, '25593279', '', 'ARMANDO', '', '', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `cliente_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cliente_tipo` int(11) NOT NULL,
  `nivel_edu_id` bigint(20) DEFAULT NULL,
  `profesion_id` bigint(20) DEFAULT NULL,
  `cliente_score` int(11) DEFAULT NULL,
  `cliente_limite_credito` decimal(10,2) DEFAULT NULL,
  `cliente_cuota` decimal(10,2) DEFAULT NULL,
  `cliente_cuota_sugerida` bigint(20) NOT NULL,
  `cliente_limite_sugerido` bigint(20) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran las entidades que sean clasificadas como tipo clientes en el sistema CrediStar' AUTO_INCREMENT=53 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `cliente_tipo`, `nivel_edu_id`, `profesion_id`, `cliente_score`, `cliente_limite_credito`, `cliente_cuota`, `cliente_cuota_sugerida`, `cliente_limite_sugerido`, `cliente_usuario_creacion`, `cliente_fecha_creacion`, `cliente_usuario_modificacion`, `cliente_fecha_modificacion`, `estatus_id`, `entidad_id`, `cliente_plazo`) VALUES
(11, 0, NULL, NULL, NULL, '30000.00', '1000.00', 0, 0, 'admin', '2016-06-22 23:36:41', NULL, NULL, NULL, 88, '500.00'),
(12, 1, 1, NULL, NULL, '50000.00', '1000.00', 0, 0, 'admin', '2016-06-23 01:22:40', NULL, NULL, NULL, 89, '7.00'),
(13, 0, NULL, NULL, NULL, '50000.00', '1000.00', 0, 0, 'admin', '2016-06-23 22:39:40', NULL, NULL, NULL, 90, '5.00'),
(14, 0, NULL, NULL, NULL, '0.00', '0.00', 0, 0, 'admin', '2016-06-23 23:06:31', NULL, NULL, NULL, 91, '0.00'),
(15, 0, NULL, NULL, NULL, '30000.00', '1000.00', 0, 0, 'admin', '2016-06-25 00:46:04', NULL, NULL, NULL, 92, '30.00'),
(16, 0, NULL, NULL, NULL, '0.00', '0.00', 0, 0, 'admin', '2016-06-25 19:08:55', NULL, NULL, NULL, 93, '0.00'),
(17, 0, NULL, NULL, NULL, '0.00', '0.00', 0, 0, 'admin', '2016-06-25 23:33:59', NULL, NULL, NULL, 94, '0.00'),
(18, 0, NULL, NULL, NULL, '80000.00', '8000.00', 0, 0, 'admin', '2016-07-01 21:54:43', NULL, NULL, NULL, 95, '10.00'),
(19, 0, NULL, NULL, NULL, '80000.00', '8000.00', 0, 0, 'admin', '2016-07-01 21:58:41', NULL, NULL, NULL, 96, '10.00'),
(20, 0, NULL, NULL, NULL, '80000.00', '8000.00', 0, 0, 'admin', '2016-07-01 22:01:31', NULL, NULL, NULL, 97, '8.00'),
(21, 0, NULL, NULL, NULL, '70000.00', '7000.00', 0, 0, 'admin', '2016-07-01 22:04:38', NULL, NULL, NULL, 98, '10.00'),
(22, 0, NULL, NULL, NULL, '70000.00', '7000.00', 0, 0, 'admin', '2016-07-01 22:05:59', NULL, NULL, NULL, 99, '10.00'),
(23, 0, NULL, NULL, NULL, '50000.00', '5000.00', 0, 0, 'admin', '2016-07-01 22:11:47', NULL, NULL, NULL, 100, '10.00'),
(24, 0, NULL, NULL, NULL, '80000.00', '8000.00', 0, 0, 'admin', '2016-07-01 22:24:14', NULL, NULL, NULL, 101, '10.00'),
(25, 0, NULL, NULL, NULL, '10000.00', '1000.00', 0, 0, 'admin', '2016-07-01 22:26:04', NULL, NULL, NULL, 102, '10.00'),
(26, 0, NULL, NULL, NULL, '20000.00', '2000.00', 0, 0, 'admin', '2016-07-01 22:32:22', NULL, NULL, NULL, 103, '20.00'),
(27, 0, NULL, NULL, NULL, '90000.00', '9000.00', 0, 0, 'admin', '2016-07-01 16:38:38', NULL, NULL, NULL, 104, '10.00'),
(28, 1, NULL, NULL, NULL, '20000.00', '2000.00', 0, 0, 'admin', '2016-07-01 16:51:49', NULL, NULL, NULL, 105, '10.00'),
(29, 1, NULL, NULL, NULL, '30000.00', '3000.00', 0, 0, 'admin', '2016-07-02 08:50:04', NULL, NULL, NULL, 106, '10.00'),
(30, 1, 4, NULL, NULL, '80000.00', '8000.00', 0, 0, 'admin', '2016-07-02 14:02:56', '0', '2016-07-04 00:44:02', NULL, 107, '10.00'),
(31, 1, NULL, NULL, NULL, '90000.00', '9000.00', 0, 0, 'admin', '2016-07-02 14:06:23', NULL, NULL, NULL, 108, '10.00'),
(32, 2, NULL, NULL, NULL, '70000.00', '7000.00', 0, 0, 'admin', '2016-07-02 14:54:27', NULL, NULL, NULL, 109, '10.00'),
(33, 1, NULL, NULL, NULL, '50000.00', '5000.00', 0, 0, 'admin', '2016-07-03 18:08:16', NULL, NULL, NULL, 110, '10.00'),
(34, 2, 4, NULL, NULL, '70000.00', '7000.00', 0, 0, 'admin', '2016-07-03 18:46:34', 'admin', '2016-07-04 01:00:17', NULL, 111, '10.00'),
(35, 1, 1, NULL, NULL, '30000.00', '3000.00', 0, 0, 'admin', '2016-07-04 09:50:21', '0', '2016-07-04 17:01:52', NULL, 112, '10.00'),
(36, 2, 4, NULL, NULL, '70000.00', '7000.00', 0, 0, 'vende', '2016-07-04 11:15:36', 'aroque', '2016-07-04 17:42:38', NULL, 113, '10.00'),
(37, 2, 4, NULL, NULL, '70000.00', '7000.00', 0, 0, 'vende', '2016-07-05 12:30:42', 'aroque', '2016-07-05 18:36:47', NULL, 114, '10.00'),
(38, 1, NULL, NULL, NULL, '79879.00', '87987.00', 0, 0, 'vende', '2016-07-05 14:27:15', NULL, NULL, NULL, 115, '98.00'),
(39, 1, NULL, NULL, NULL, '50000.00', '5000.00', 0, 0, NULL, '2016-07-08 18:00:52', NULL, NULL, NULL, 116, '10.00'),
(40, 1, NULL, NULL, NULL, '50000.00', '5000.00', 0, 0, NULL, '2016-07-08 18:02:33', NULL, NULL, NULL, 117, '10.00'),
(41, 1, NULL, NULL, NULL, '70000.00', '7000.00', 0, 0, NULL, '2016-07-08 18:03:35', NULL, NULL, NULL, 118, '10.00'),
(42, 1, NULL, NULL, NULL, '70000.00', '7000.00', 0, 0, '', '2016-07-08 18:08:36', NULL, NULL, NULL, 119, '10.00'),
(43, 1, NULL, NULL, NULL, '70000.00', '7000.00', 0, 0, 'vende', '2016-07-08 18:10:19', NULL, NULL, NULL, 120, '10.00'),
(44, 1, NULL, NULL, NULL, '80000.00', '8000.00', 0, 0, 'vende', '2016-07-09 11:42:44', NULL, NULL, NULL, 121, '10.00'),
(45, 1, NULL, NULL, NULL, '4000.00', '4000.00', 0, 0, 'vende', '2016-07-09 11:43:41', NULL, NULL, NULL, 122, '10.00'),
(46, 2, 4, NULL, NULL, '10000.00', '1000.00', 0, 0, 'vende', '2016-07-09 11:55:31', 'aroque', '2016-07-11 16:55:01', NULL, 123, '10.00'),
(47, 2, 5, NULL, NULL, '65000.00', '6500.00', 0, 0, 'vende', '2016-07-09 11:57:19', 'aroque', '2016-07-11 17:04:16', NULL, 124, '10.00'),
(48, 3, NULL, NULL, NULL, '31000.00', '3100.00', 0, 0, 'vende', '2016-07-12 11:34:41', NULL, NULL, NULL, 125, '10.00'),
(49, 1, NULL, NULL, NULL, '80000.00', '90999.00', 0, 0, 'aroque', '2016-07-16 09:05:44', NULL, NULL, NULL, 126, '10.00'),
(50, 1, NULL, NULL, NULL, '80000.00', '90999.00', 0, 0, 'aroque', '2016-07-16 09:12:20', NULL, NULL, NULL, 127, '10.00'),
(51, 1, NULL, NULL, NULL, '60000.00', '972829.00', 0, 0, 'aroque', '2016-07-16 09:22:42', NULL, NULL, NULL, 128, '10.00'),
(52, 1, NULL, NULL, NULL, '60000.00', '6000.00', 0, 0, 'vende', '2016-07-18 13:30:25', NULL, NULL, NULL, 129, '10.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_empleos`
--

CREATE TABLE IF NOT EXISTS `clientes_empleos` (
  `cliente_id` bigint(20) NOT NULL,
  `empleo_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cliente_id`,`empleo_id`),
  KEY `FK_clientes_empleados_empleo_id_idx` (`empleo_id`),
  KEY `cliente_id` (`cliente_id`)
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran los tipos de contratos (semana, quincenal, mensual, etc.) que puede tener un cliente de segundo nivel en su lugar de trabajo.' AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `contratos_tipos`
--

INSERT INTO `contratos_tipos` (`contrato_tipo_id`, `contrato_tipo_descripcion`) VALUES
(2, 'Independiente Informal'),
(3, 'Independiente Formal'),
(4, 'Asalariado Privado'),
(5, 'Gobierno');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla que contendra los departamentos de los cuales se compone un pais en especifico.' AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`depto_id`, `pais_id`, `depto_nombre`, `departamentos_COL`) VALUES
(1, 1, 'Cortes', NULL),
(20, 0, 'Atlantida', NULL),
(21, 0, 'Colon', NULL),
(22, 0, 'Comayagua', NULL),
(23, 0, 'Copan', NULL),
(25, 0, 'Choluteca', NULL),
(26, 0, 'El Paraiso', NULL),
(27, 0, 'Francisco Morazan', NULL),
(28, 0, 'Gracias a Dios', NULL),
(29, 0, 'Intibuca', NULL),
(30, 0, 'Islas de la Bahia', NULL),
(31, 0, 'La Paz', NULL),
(32, 0, 'Lempira', NULL),
(33, 0, 'Ocotepeque', NULL),
(34, 0, 'Olancho', NULL),
(35, 0, 'Santa Barbara', NULL),
(36, 0, 'Valle', NULL),
(37, 0, 'Yoro', NULL);

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
  `direccion_antiguedad` date DEFAULT '0000-00-00',
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla general de las direcciones, es la tabla que contendra la relacion de todas las tablas de ubicaciones como pais, departamentos, ciuidades y colonias para que el sistema vaya generando una base de conocimiento de las direcciones.' AUTO_INCREMENT=136 ;

--
-- Volcado de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`direccion_id`, `direccion_descripcion`, `direccion_tipo_id`, `direccion_antiguedad`, `pais_id`, `depto_id`, `municipio_id`, `colonia_id`, `direccion_codigo_postal`, `direccion_calle_avenida`, `direccion_punto_referencia`, `direccion_numero_casa`, `direccion_riesgo`, `estatus_id`) VALUES
(16, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(17, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(18, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(19, 'Col. Juan Lindo', 1, '1899-11-30', 1, 1, 1, NULL, '0000', NULL, 'Canchita', '5', 0, '4'),
(20, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(21, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(22, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(23, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(24, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(25, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(26, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(27, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(28, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(29, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(30, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(31, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(32, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(33, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(34, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(35, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(36, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(37, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(38, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(39, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(40, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(41, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(42, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(43, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(44, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(45, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(46, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(47, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(48, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(49, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(50, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(51, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(52, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(53, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(54, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(55, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(56, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(57, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(58, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(59, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(60, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(61, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(62, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(63, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(64, 'ojojojojo', 1, '2010-11-10', 1, 1, 1, NULL, '0000', NULL, 'aqui', '87', 0, '4'),
(65, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(66, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(67, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(68, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(69, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(70, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(71, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(72, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(73, 'Col. Juan Lindo', 1, '2009-11-10', 1, 1, 1, NULL, '0000', NULL, 'Col. laureles', '10A', 0, '4'),
(74, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(75, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(76, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(77, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(78, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(79, 'Col. Zeron', 1, '2005-11-08', 1, 1, 1, NULL, '0000', NULL, 'Canchita', '34', 0, '4'),
(80, 'Col. Col', 1, '0000-00-00', 1, 1, 1, NULL, '0000', NULL, 'frente a hospital catarino', NULL, 0, '4'),
(81, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(82, 'Col. Jhon Pretty', 1, '2007-11-13', 1, 1, 1, NULL, '0000', NULL, 'porton de madera', '10a', 0, '4'),
(83, 'Col Col Col', 1, '0000-00-00', 1, 1, 1, NULL, '9817', NULL, 'odhjkshj', NULL, 0, '4'),
(84, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(85, 'Col. Juan lindo', 1, '2014-07-18', 1, 1, 1, NULL, '0000', NULL, 'porton de madera', '56', 0, '4'),
(86, 'si si s i', 1, '0000-00-00', 1, 1, 1, NULL, '9999', NULL, 'hshdooijji', NULL, 0, '4'),
(87, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(88, 'Col. Jhon Pretty', 1, '2010-11-23', 1, 1, 1, NULL, '000', NULL, 'porton negro', '82', 0, '4'),
(89, 'Col matarino', 1, '0000-00-00', 1, 1, 1, NULL, '81818', NULL, 'Col. laureles', NULL, 0, '4'),
(90, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(91, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(92, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(93, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(94, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(95, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(96, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(97, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(98, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(99, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(100, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(101, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(102, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(103, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(104, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(105, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(106, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(107, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(108, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(109, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(110, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(111, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(112, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(113, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(114, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(115, 'La lima', 1, '1991-11-21', 1, 1, 410, NULL, '7628', NULL, '', '19', 0, '4'),
(116, 'altia', 1, '0000-00-00', 1, 1, 399, NULL, '378', NULL, 'buisness park', NULL, 0, '4'),
(117, 'Tepanyaki', 1, '0000-00-00', 1, 27, 304, NULL, '72628', NULL, 'casa de sula', '82', 0, '4'),
(118, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(119, 'iosijo', 1, '0000-00-00', 1, 1, 1, NULL, '879', NULL, 'jisoij', NULL, 0, '4'),
(120, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(121, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(122, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(123, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(124, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(125, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(126, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(127, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(128, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(129, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(130, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(131, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(132, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(133, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(134, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(135, NULL, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones_tipos`
--

CREATE TABLE IF NOT EXISTS `direcciones_tipos` (
  `direccion_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `direccion_tipo_descripcion` varchar(50) NOT NULL,
  `direccion_tipo_abreviatura` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`direccion_tipo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla la cual contendra los tipos de direcciones que se le pueden definir a la tabla maestra de direcciones.' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `direcciones_tipos`
--

INSERT INTO `direcciones_tipos` (`direccion_tipo_id`, `direccion_tipo_descripcion`, `direccion_tipo_abreviatura`) VALUES
(1, 'Principal', NULL),
(2, 'Secundaria', NULL);

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
  `empleo_nombre` varchar(50) NOT NULL,
  `empleo_cargo_id` int(11) NOT NULL,
  `entidad_id` bigint(20) NOT NULL,
  `empleo_tipo_id` bigint(20) DEFAULT NULL,
  `empleo_antiguedad` date DEFAULT NULL,
  `empleo_jefe_nombre` varchar(50) DEFAULT NULL,
  `empleo_jefe_cargo_id` int(11) DEFAULT NULL,
  `contrato_tipo_id` bigint(20) DEFAULT NULL,
  `frecuencia_pago_id` bigint(20) DEFAULT NULL,
  `moneda_id` bigint(20) DEFAULT NULL,
  `empleo_ingreso_neto` decimal(10,2) DEFAULT '0.00',
  `empleo_ingreso_declarado` decimal(10,2) DEFAULT NULL,
  `empleo_ingreso_bruto` decimal(10,2) NOT NULL,
  `empleo_comsiones_extras` decimal(10,2) DEFAULT NULL,
  `empleo_imp_deduciones` decimal(10,2) DEFAULT NULL,
  `empleo_hora_contactar` varchar(10) DEFAULT NULL,
  `direccion_id` int(11) NOT NULL,
  `telefono_id` int(11) NOT NULL,
  `estatus_id` int(11) NOT NULL,
  PRIMARY KEY (`empleo_id`),
  KEY `FK_empleos_empleo_tipo_id_idx` (`empleo_tipo_id`),
  KEY `FK_empleos_contrato_tipo_id_idx` (`contrato_tipo_id`),
  KEY `FK_empleos_frecuencia_pago_id_idx` (`frecuencia_pago_id`),
  KEY `FK_empleos_moneda_id_idx` (`moneda_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenara los empleos que actualmente tienen cada uno de los clientes de segundo nivel ingresados, los cuales se realacionaran directmaente con una empresa.' AUTO_INCREMENT=45 ;

--
-- Volcado de datos para la tabla `empleos`
--

INSERT INTO `empleos` (`empleo_id`, `empleo_nombre`, `empleo_cargo_id`, `entidad_id`, `empleo_tipo_id`, `empleo_antiguedad`, `empleo_jefe_nombre`, `empleo_jefe_cargo_id`, `contrato_tipo_id`, `frecuencia_pago_id`, `moneda_id`, `empleo_ingreso_neto`, `empleo_ingreso_declarado`, `empleo_ingreso_bruto`, `empleo_comsiones_extras`, `empleo_imp_deduciones`, `empleo_hora_contactar`, `direccion_id`, `telefono_id`, `estatus_id`) VALUES
(5, '', 0, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 17, 15, 0),
(6, '', 0, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 20, 17, 0),
(7, '', 0, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 23, 19, 0),
(8, '', 0, 91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 26, 21, 0),
(9, '', 0, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 29, 23, 0),
(10, '', 0, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 32, 25, 0),
(11, '', 0, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 35, 27, 0),
(12, '', 0, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 38, 29, 0),
(13, '', 0, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 41, 31, 0),
(14, '', 0, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 44, 33, 0),
(15, '', 0, 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 47, 35, 0),
(16, '', 0, 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 50, 37, 0),
(17, '', 0, 102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 53, 39, 0),
(18, '', 0, 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 56, 41, 0),
(19, '', 0, 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 59, 43, 0),
(20, '', 0, 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 62, 45, 0),
(21, '', 0, 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 65, 47, 0),
(22, '', 0, 107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 68, 49, 0),
(23, '', 0, 108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 71, 51, 0),
(24, '', 0, 109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 74, 55, 0),
(25, '', 0, 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 77, 59, 0),
(26, 'Eis', 7, 111, 2, '2008-07-16', 'Martha Zeron', 1, 2, 2, 1, '7000.00', '8000.00', '8000.00', '0.00', '1000.00', '12PM', 80, 63, 4),
(27, 'Eis', 7, 112, 2, '2012-07-12', 'zeron', 1, 2, 2, 1, '7000.00', '8000.00', '9000.00', '0.00', '1000.00', '8pm', 83, 67, 4),
(28, 'Eis', 2, 113, 1, '2012-07-12', 'marco', 2, 2, 1, 1, '10000.00', '12000.00', '12000.00', '0.00', '2000.00', '8pm', 86, 71, 4),
(29, 'Eis', 1, 114, 2, '2009-07-21', 'Zeron', 1, 2, 1, 1, '17000.00', '18000.00', '18000.00', '0.00', '1000.00', '7', 89, 75, 4),
(30, '', 0, 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 92, 79, 0),
(31, '', 0, 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 95, 83, 0),
(32, '', 0, 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 98, 87, 0),
(33, '', 0, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 101, 91, 0),
(34, '', 0, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 104, 95, 0),
(35, '', 0, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 107, 99, 0),
(36, '', 0, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 110, 103, 0),
(37, '', 0, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 113, 107, 0),
(38, 'San Service', 1, 123, 1, '2013-07-17', 'Ramon', 1, 2, 1, 1, '9000.00', NULL, '0.00', NULL, NULL, '7pm', 116, 111, 4),
(39, 'Eis', 1, 124, 1, '2016-07-05', 'hidalgo', 1, 3, 1, 1, '89000.00', NULL, '0.00', NULL, NULL, '9', 119, 115, 4),
(40, '', 0, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 122, 119, 0),
(41, '', 0, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 125, 123, 0),
(42, '', 0, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 128, 127, 0),
(43, '', 0, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 131, 131, 0),
(44, '', 0, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '0.00', NULL, NULL, NULL, 134, 135, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se registraran los tipos de empleos en donde se clasifica el lugar de trabajo para un cliente de segundo nivel.' AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `empleos_tipos`
--

INSERT INTO `empleos_tipos` (`empleo_tipo_id`, `empleo_tipo_descripcion`, `empleo_tipo_abreviatura`, `estatus_id`) VALUES
(1, 'Tiempo Completo', NULL, NULL),
(2, 'Medio tiempo', NULL, NULL),
(3, '4 por 4', NULL, NULL);

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
  `entidad_nacionalidad` int(11) NOT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`entidad_id`),
  KEY `FK_entidades_estado_civil_id_idx` (`estado_civil_id`),
  KEY `FK_entidades_direccion_id_idx` (`direccion_id`),
  KEY `FK_entidades_entidad_tipo_id_idx` (`entidad_tipo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla general en donde se almacenaran las entidades tanto de: clientes de segundo nivel, referencias personales, jefes de empleos, etc. la idea es que esta tabla almacene cualquier dato que se pueda reutilizar luego.' AUTO_INCREMENT=130 ;

--
-- Volcado de datos para la tabla `entidades`
--

INSERT INTO `entidades` (`entidad_id`, `entidad_primer_nombre`, `entidad_segundo_nombre`, `entidad_primer_apellido`, `entidad_segund_apellido`, `entidad_genero`, `estado_civil_id`, `entidad_correo`, `entidad_fecha_nacimiento`, `entidad_identidad_principal`, `entidad_rtn`, `entidad_imagen`, `direccion_id`, `entidad_tipo_id`, `entidad_generado`, `entidad_usuario_creacion`, `entidad_fecha_creacion`, `entidad_nacionalidad`, `estatus_id`) VALUES
(88, 'Armando', 'Roque', 'Roque', 'Barahona', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-06-22 00:00:00', 0, ''),
(89, 'Generico', 'Generico 1', 'Generico 2', 'Generico 3', 'Femenino', 1, 'generico@hotmail.com', '1899-11-08', 0, '', '', NULL, 1, '', '', '2016-06-22 00:00:00', 1, ''),
(90, 'probando', 'probando 2', 'probando 3', 'probando 4', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-06-23 00:00:00', 0, ''),
(91, '', '', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '2016-06-23 00:00:00', 0, ''),
(92, 'generico 2', 'generico 2', 'Generico 2', 'Generico 2', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-06-24 00:00:00', 0, ''),
(93, 'dddd', '', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '2016-06-25 00:00:00', 0, ''),
(94, '', '', '', '', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, NULL, '', '', '2016-06-25 00:00:00', 0, ''),
(95, 'Mario', 'Alberto', 'Roque', 'Barahona', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-01 00:00:00', 0, ''),
(96, 'kpokpok', 'pokpok', 'pokpokp', 'pokpokp', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-01 00:00:00', 0, ''),
(97, 'lkmlkm', 'lkmlkm', 'lkmlkm', 'lkmlkm', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-01 00:00:00', 0, ''),
(98, 'trewtrew', 'tretre', 'tretretre', 'tretretre', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-01 00:00:00', 0, ''),
(99, 'zscvz', 'xcvxcv', 'xcvxcv', 'xcvxcv', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-01 00:00:00', 0, ''),
(100, 'vfrvrfvfvrv', 'vfrvf', 'vfrvfrvfr', 'vfrvfr', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-01 00:00:00', 0, ''),
(101, 'dewdwe', 'dwewed', 'wedwed', 'jiojijo', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-01 00:00:00', 0, ''),
(102, 'dewwedwed', 'wedwewdew', 'dewdewde', 'dewdewdew', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-01 00:00:00', 0, ''),
(103, 'zazazazaz', 'zazzazazaza', 'zazazazazazaz', 'zaazazazazz', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-01 00:00:00', 0, ''),
(104, 'bvcbvcbc', 'bvbvvbvbvvbv', 'bvbvbvvbvb', 'vbbvvbvbvvb', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-01 00:00:00', 0, ''),
(105, 'nunununu', 'nununun', 'nununu', 'nununun', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-01 00:00:00', 0, ''),
(106, 'bcbnc', 'fdgfdgd', 'tretre', 'tretretretr', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-02 00:00:00', 0, ''),
(107, 'Rocco', 'rocco', 'roque', 'barahona', 'Masculino', 1, 'rocco@hotmail.com', '1991-11-11', 0, '', '', NULL, 1, '', '', '2016-07-02 00:00:00', 1, ''),
(108, 'jojojojojo', 'jojojojoj', 'ojojojojo', 'jojojojoj', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-02 00:00:00', 0, ''),
(109, 'popopopopo', 'popopopo', 'popopop', 'opopopo', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-02 00:00:00', 0, ''),
(110, 'leroy', 'leroy', 'leroy', 'leroy', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-03 00:00:00', 0, ''),
(111, 'Javier', 'Armando ', 'Roque', 'Barahona', 'Masculino', 1, 'javier@gmail.com', '1899-11-16', 0, '', '', NULL, 1, '', '', '2016-07-03 00:00:00', 1, ''),
(112, 'martin', 'manuel', 'garrix', 'perez', '', 1, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-04 00:00:00', 1, ''),
(113, 'Pedro', 'Pablo', 'perez', 'de la mar', 'Masculino', 3, 'pedro@hotmail.com', '1991-09-11', 0, '', '', NULL, 1, '', '', '2016-07-04 00:00:00', 1, ''),
(114, 'Javier', 'Armando', 'Roque', 'Barahona', 'Masculino', 1, 'ja-roque@hotmail.com', '1994-03-14', 0, '', '', NULL, 1, '', '', '2016-07-05 00:00:00', 1, ''),
(115, 'oiho', 'ihoiho', 'ihoiho', 'ihoi', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-05 00:00:00', 0, ''),
(116, 'Armandor', 'Roqur', 'barahonar', 'barahonahar', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-08 00:00:00', 0, ''),
(117, 'Armandor', 'Roqur', 'barahonar', 'barahonahar', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-08 00:00:00', 0, ''),
(118, 'Rolando', 'manuel', 'ortega', 'perez', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-08 00:00:00', 0, ''),
(119, 'Rolando', 'manuel', 'ortega', 'perez', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-08 00:00:00', 0, ''),
(120, 'marco', 'manuel', 'perez', 'ortega', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-08 00:00:00', 0, ''),
(121, 'Diego', 'Manuel', 'Zeron', 'Roque', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-09 00:00:00', 0, ''),
(122, 'maria', 'manuela', 'perez', 'leiva', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-09 00:00:00', 0, ''),
(123, 'gysgsy', 'snbhxyb', 'iuhsiuuhs', 'ijsjnksj', 'Femenino', 1, 'roque@gmail.com', '1899-11-15', 0, '', '', NULL, 1, '', '', '2016-07-09 00:00:00', 1, ''),
(124, 'oiosijosojoj', 'jojojojojoj', 'isksisksisk', 'isksisksisksi', 'Masculino', 1, 'ja-roque@correo.com', '2000-11-24', 0, '', '', NULL, 1, '', '', '2016-07-09 00:00:00', 1, ''),
(125, 'lkjdjlklj', 'jooij', 'iojjoi', 'oijjoi', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-12 00:00:00', 0, ''),
(126, 'Geronimo', 'vanhues', 'persie', 'nutirames', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-16 00:00:00', 0, ''),
(127, 'Geronimoa', 'vanhues', 'persie', 'nutirames', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-16 00:00:00', 0, ''),
(128, 'mario', 'marco', 'martinez', 'sanchez', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-16 00:00:00', 0, ''),
(129, 'Allan', 'Edgardo', 'Torres', 'Juarez', NULL, NULL, '', '0000-00-00', 0, '', '', NULL, 1, '', '', '2016-07-18 00:00:00', 0, '');

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

--
-- Volcado de datos para la tabla `entidades_direcciones`
--

INSERT INTO `entidades_direcciones` (`entidad_id`, `direccion_id`) VALUES
(88, 16),
(89, 19),
(90, 22),
(91, 25),
(92, 28),
(93, 31),
(94, 34),
(95, 37),
(96, 40),
(97, 43),
(98, 46),
(99, 49),
(102, 52),
(103, 55),
(104, 58),
(105, 61),
(106, 64),
(107, 67),
(108, 70),
(109, 73),
(110, 76),
(111, 79),
(112, 82),
(113, 85),
(114, 88),
(115, 91),
(116, 94),
(117, 97),
(118, 100),
(119, 103),
(120, 106),
(121, 109),
(122, 112),
(123, 115),
(124, 118),
(125, 121),
(126, 124),
(127, 127),
(128, 130),
(129, 133);

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
(88, 84, 1),
(89, 85, 1),
(90, 86, 1),
(91, 87, NULL),
(92, 88, 1),
(93, 89, NULL),
(94, 90, NULL),
(95, 91, 1),
(96, 92, 1),
(97, 93, 1),
(98, 94, 1),
(99, 95, 1),
(100, 96, 1),
(101, 97, 1),
(102, 98, 1),
(103, 99, 1),
(104, 100, 1),
(105, 101, 1),
(106, 102, 1),
(107, 103, 1),
(108, 104, 1),
(109, 105, 1),
(110, 106, 1),
(111, 107, 1),
(112, 108, 1),
(113, 109, 1),
(114, 110, 1),
(115, 111, 1),
(116, 112, 1),
(117, 113, 1),
(118, 114, 1),
(119, 115, 1),
(120, 116, 1),
(121, 117, 1),
(122, 118, 1),
(123, 119, 1),
(124, 120, 1),
(125, 121, 1),
(126, 122, 1),
(127, 123, 1),
(128, 124, 1),
(129, 125, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidades_telefonos`
--

CREATE TABLE IF NOT EXISTS `entidades_telefonos` (
  `entidad_id` bigint(20) NOT NULL,
  `telefono_id` bigint(20) NOT NULL,
  `telefono_id2` bigint(20) NOT NULL,
  `telefono_id3` bigint(20) NOT NULL,
  `estatus_id` varchar(2) NOT NULL,
  `subestatus_id` varchar(2) NOT NULL,
  PRIMARY KEY (`entidad_id`,`telefono_id`,`estatus_id`,`subestatus_id`),
  KEY `FK_entidades_telefonos_telefono_id_idx` (`telefono_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran los multiples telefonos que le pueden pertenecer a una entidad.';

--
-- Volcado de datos para la tabla `entidades_telefonos`
--

INSERT INTO `entidades_telefonos` (`entidad_id`, `telefono_id`, `telefono_id2`, `telefono_id3`, `estatus_id`, `subestatus_id`) VALUES
(88, 14, 0, 0, '', ''),
(89, 16, 0, 0, '', ''),
(90, 18, 0, 0, '', ''),
(91, 20, 0, 0, '', ''),
(92, 22, 0, 0, '', ''),
(93, 24, 0, 0, '', ''),
(94, 26, 0, 0, '', ''),
(95, 28, 0, 0, '', ''),
(96, 30, 0, 0, '', ''),
(97, 32, 0, 0, '', ''),
(98, 34, 0, 0, '', ''),
(99, 36, 0, 0, '', ''),
(102, 38, 0, 0, '', ''),
(103, 40, 0, 0, '', ''),
(104, 42, 0, 0, '', ''),
(105, 44, 0, 0, '', ''),
(106, 46, 0, 0, '', ''),
(107, 48, 0, 0, '', ''),
(108, 50, 0, 0, '', ''),
(109, 52, 53, 54, '', ''),
(110, 56, 57, 58, '', ''),
(111, 60, 61, 62, '', ''),
(112, 64, 65, 66, '', ''),
(113, 68, 69, 70, '', ''),
(114, 72, 73, 74, '', ''),
(115, 76, 77, 78, '', ''),
(116, 80, 81, 82, '', ''),
(117, 84, 85, 86, '', ''),
(118, 88, 89, 90, '', ''),
(119, 92, 93, 94, '', ''),
(120, 96, 97, 98, '', ''),
(121, 100, 101, 102, '', ''),
(122, 104, 105, 106, '', ''),
(123, 108, 109, 110, '', ''),
(124, 112, 113, 114, '', ''),
(125, 116, 117, 118, '', ''),
(126, 120, 121, 122, '', ''),
(127, 124, 125, 126, '', ''),
(128, 128, 129, 130, '', ''),
(129, 132, 133, 134, '', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se definen los diferentes tipos de estados civiles que puede tener una entidad en el sistema.' AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `estados_civiles`
--

INSERT INTO `estados_civiles` (`estado_civil_id`, `estado_civil_descripcion`, `estado_civil_abreviatura`) VALUES
(1, 'Soltero', NULL),
(2, 'Viudo', NULL),
(3, 'Divorciado', NULL),
(4, 'Union Libre', NULL),
(5, 'Casado', NULL);

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
('1', 'Pendiente', 'solicitud'),
('10', 'positiva', 'telefono'),
('11', 'negativa', 'telefono'),
('12', 'sin telefono', 'telefono'),
('2', 'Aprobada', 'solicitud'),
('3', 'Denegada', 'solicitud'),
('4', 'Actual', 'direccion'),
('5', 'Anterior', 'direccion'),
('6', 'Provicional', 'direccion'),
('7', 'Activo', 'Activo'),
('8', 'devuelta', 'solicitud'),
('9', 'Atendiendo', 'solicitud');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frecuencias_pagos`
--

CREATE TABLE IF NOT EXISTS `frecuencias_pagos` (
  `frecuencia_pago_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `frecuencia_pago_descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`frecuencia_pago_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran los tipos de frecuencias de pagos que puede tener un cliente de segundo nivel en su lugar de trabajo.' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `frecuencias_pagos`
--

INSERT INTO `frecuencias_pagos` (`frecuencia_pago_id`, `frecuencia_pago_descripcion`) VALUES
(1, 'Mensual'),
(2, 'Quincenal'),
(3, 'Semanal'),
(4, 'Diario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE IF NOT EXISTS `grupos` (
  `grupo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `grupo_nombre` varchar(50) NOT NULL,
  `grupo_abreviatura` varchar(50) DEFAULT NULL,
  `grupo_limite_credito` decimal(10,2) DEFAULT NULL,
  `grupo_limite_score` int(11) DEFAULT NULL,
  `grupo_limite_cuota` decimal(10,2) DEFAULT NULL,
  `grupo_cambio_estatus` int(11) DEFAULT NULL,
  `grupo_modificar` int(11) DEFAULT NULL,
  `grupo_acceso` int(11) DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`grupo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se registraran los grupos principales de usuarios, esto nos srevira para poder definir los perfiles de accesos y grupos de pantallas' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`grupo_id`, `grupo_nombre`, `grupo_abreviatura`, `grupo_limite_credito`, `grupo_limite_score`, `grupo_limite_cuota`, `grupo_cambio_estatus`, `grupo_modificar`, `grupo_acceso`, `estatus_id`) VALUES
(1, 'vendedor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'analista', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Jefe de Tienda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Supervisor de Zona', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla la cual almacenara todas las diferentes identificaciones que una sola entidad puede llegar a manejar.' AUTO_INCREMENT=126 ;

--
-- Volcado de datos para la tabla `identificaciones`
--

INSERT INTO `identificaciones` (`identificacion_id`, `identificacion_tipo_id`, `identificacion_numero`, `identificacion_registro`, `identificacion_dato1`, `identificacion_dato2`, `identificacion_dato3`, `identificacion_comentario`, `entidad_id`) VALUES
(84, 1, '0501199109215', NULL, NULL, NULL, NULL, NULL, 88),
(85, 1, '   0501199109215   ', NULL, NULL, NULL, NULL, NULL, 89),
(86, 1, '0501199109215', NULL, NULL, NULL, NULL, NULL, 90),
(87, NULL, '', NULL, NULL, NULL, NULL, NULL, 91),
(88, 1, '0501199109215', NULL, NULL, NULL, NULL, NULL, 92),
(89, NULL, '', NULL, NULL, NULL, NULL, NULL, 93),
(90, NULL, '', NULL, NULL, NULL, NULL, NULL, 94),
(91, 1, '0501199109215', NULL, NULL, NULL, NULL, NULL, 95),
(92, 1, '0980980980', NULL, NULL, NULL, NULL, NULL, 96),
(93, 1, '098098098098', NULL, NULL, NULL, NULL, NULL, 97),
(94, 1, '567567567567', NULL, NULL, NULL, NULL, NULL, 98),
(95, 1, '3456456456', NULL, NULL, NULL, NULL, NULL, 99),
(96, 1, '1322344', NULL, NULL, NULL, NULL, NULL, 100),
(97, 1, '90989089809890', NULL, NULL, NULL, NULL, NULL, 101),
(98, 1, '34534563465', NULL, NULL, NULL, NULL, NULL, 102),
(99, 1, '5675656757', NULL, NULL, NULL, NULL, NULL, 103),
(100, 1, '123412341234', NULL, NULL, NULL, NULL, NULL, 104),
(101, 1, '0998098098098', NULL, NULL, NULL, NULL, NULL, 105),
(102, 1, '56789087654', NULL, NULL, NULL, NULL, NULL, 106),
(103, 1, '0501199109215', NULL, NULL, NULL, NULL, NULL, 107),
(104, 1, '0501199109215', NULL, NULL, NULL, NULL, NULL, 108),
(105, 1, '0501199109215', NULL, NULL, NULL, NULL, NULL, 109),
(106, 1, '0501199109215', NULL, NULL, NULL, NULL, NULL, 110),
(107, 1, '0501199109215', NULL, NULL, NULL, NULL, NULL, 111),
(108, 1, '0501199109217', NULL, NULL, NULL, NULL, NULL, 112),
(109, 1, '0501199109324', NULL, NULL, NULL, NULL, NULL, 113),
(110, 1, '0501199600199', NULL, NULL, NULL, NULL, NULL, 114),
(111, 1, '0087097097', NULL, NULL, NULL, NULL, NULL, 115),
(112, 1, '0501199109215', NULL, NULL, NULL, NULL, NULL, 116),
(113, 1, '0501199109215', NULL, NULL, NULL, NULL, NULL, 117),
(114, 1, '0501199109215', NULL, NULL, NULL, NULL, NULL, 118),
(115, 1, '0501199109215', NULL, NULL, NULL, NULL, NULL, 119),
(116, 1, '68867584657', NULL, NULL, NULL, NULL, NULL, 120),
(117, 1, '0501199109215', NULL, NULL, NULL, NULL, NULL, 121),
(118, 1, '0501199910827', NULL, NULL, NULL, NULL, NULL, 122),
(119, 1, '7373678', NULL, NULL, NULL, NULL, NULL, 123),
(120, 1, '8889888989898', NULL, NULL, NULL, NULL, NULL, 124),
(121, 1, '9879879', NULL, NULL, NULL, NULL, NULL, 125),
(122, 1, '79197939889', NULL, NULL, NULL, NULL, NULL, 126),
(123, 1, '79197939889', NULL, NULL, NULL, NULL, NULL, 127),
(124, 1, '8785746371625', NULL, NULL, NULL, NULL, NULL, 128),
(125, 1, '0501199208278', NULL, NULL, NULL, NULL, NULL, 129);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenara el tipo de moneda con el cual se trabajara en CrediStar' AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `monedas`
--

INSERT INTO `monedas` (`moneda_id`, `moneda_descripcion`, `moneda_simbolo`) VALUES
(1, 'Lempiras', NULL),
(2, 'Dolares', NULL),
(3, 'Euros', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla la cual contendra los municipios de cada departamento registrado en el sistema.' AUTO_INCREMENT=606 ;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`municipio_id`, `depto_id`, `municipio_nombre`) VALUES
(1, NULL, 'San Pedro Sula'),
(304, 27, 'Tegucigalpa'),
(305, 27, 'Distrito Central'),
(306, 27, 'Alubaren'),
(307, 27, 'Cedros '),
(308, 27, 'Curaren '),
(309, 27, 'El Porvenir '),
(310, 27, 'Guaimaca '),
(311, 27, 'La Libertad '),
(312, 27, 'La Venta '),
(313, 27, 'Lepaterique '),
(314, 27, 'Maraita '),
(315, 27, 'Marale '),
(316, 27, 'Nueva Armenia '),
(317, 27, 'Ojojona '),
(318, 27, 'Orica '),
(319, 27, 'Reitoca '),
(320, 27, 'Sabanagrande San Antonio de Oriente '),
(321, 27, 'San Buenaventura '),
(322, 27, 'San Ignacio '),
(323, 27, 'San Juan de Flores '),
(324, 27, 'San Miguelito '),
(325, 27, 'Santa Ana '),
(326, 27, 'Santa Lucía '),
(327, 27, 'Talanga '),
(328, 27, 'Tatumbla '),
(329, 27, 'Valle de Angeles '),
(330, 27, 'Villa de San Francisco '),
(331, 27, 'Vallecillo '),
(332, 20, 'La Ceiba* '),
(333, 20, 'El Porvenir '),
(334, 20, 'Esparta '),
(335, 20, 'Jutiapa '),
(336, 20, 'La Masica '),
(337, 20, 'San Francisco '),
(338, 20, 'Tela '),
(339, 20, 'Arizona '),
(340, 21, 'Colón '),
(341, 21, 'Chagres '),
(342, 21, 'Donoso '),
(343, 21, 'Portobelo '),
(344, 21, 'Santa Isabel '),
(345, 21, 'Trujillo* '),
(346, 21, 'Balfate '),
(347, 21, 'Iriona '),
(348, 21, 'Limón '),
(349, 21, 'Saba '),
(350, 21, 'Santa Fé '),
(351, 21, 'Santa Rosa de Aguan '),
(352, 21, 'Sonaguera '),
(353, 21, 'Tocoa '),
(354, 21, 'Bonito Oriental '),
(355, 22, 'Comayagua* '),
(356, 22, 'Ajuterique '),
(357, 22, 'El Rosario '),
(358, 22, 'Esquias '),
(359, 22, 'Humuya '),
(360, 22, 'La Libertad '),
(361, 22, 'Lamani '),
(362, 22, 'La Trinidad '),
(363, 22, 'Lejamani '),
(364, 22, 'Meambar '),
(365, 22, 'Minas de Oro '),
(366, 22, 'Ojos de AGua '),
(367, 22, 'San Jerónimo '),
(368, 22, 'San José Comayagua '),
(369, 22, 'San José del Potrero '),
(370, 22, 'San Luis '),
(371, 22, 'San Sebastián '),
(372, 22, 'Siguatepeque '),
(373, 22, 'Villa de San Antonio '),
(374, 22, 'Las Lajas '),
(375, 22, 'Taulabe '),
(376, 23, 'Santa Rosa de Copán*'),
(377, 23, 'Cabañas '),
(378, 23, 'Concepción '),
(379, 23, 'Copán Ruinas '),
(380, 23, 'Corquin '),
(381, 23, 'Cucuyagua '),
(382, 23, 'Dolores '),
(383, 23, 'Dulce Nombre '),
(384, 23, 'El Paraíso '),
(385, 23, 'Florida '),
(386, 23, 'La Jigua '),
(387, 23, 'La Unión '),
(388, 23, 'Nueva Arcadia '),
(389, 23, 'San Agustín '),
(390, 23, 'San Antonio'),
(391, 23, 'San Jerónimo '),
(392, 23, 'San José '),
(393, 23, 'San Juan de Opoa '),
(394, 23, 'San Nicolás '),
(395, 23, 'San Pedro '),
(396, 23, 'Santa Rita'),
(397, 23, 'Trinidad '),
(398, 23, 'Veracruz '),
(399, 1, 'San Pedro Sula* '),
(400, 1, 'Choloma '),
(401, 1, 'Omoa '),
(402, 1, 'Pimienta '),
(403, 1, 'Potrerillos '),
(404, 1, 'Puerto Cortés '),
(405, 1, 'San Antonio de Cortés '),
(406, 1, 'San Francisco de Yojoa '),
(407, 1, 'San Manuel '),
(408, 1, 'Santa Cruz de Yojoa '),
(409, 1, 'Villanueva '),
(410, 1, 'La Lima '),
(411, 25, 'Choluteca* '),
(412, 25, 'Apacilagua '),
(413, 25, 'Concepción de María '),
(414, 25, 'Duyure '),
(415, 25, 'El Corpus '),
(416, 25, 'El Triunfo '),
(417, 25, 'Marcovia '),
(418, 25, 'Morolica '),
(419, 25, 'Namasigue '),
(420, 25, 'Orocuina '),
(421, 25, 'Pespire '),
(422, 25, 'San Antonio de Flores '),
(423, 25, 'San Isidro '),
(424, 25, 'San José '),
(425, 25, 'San Marcos de Colón '),
(426, 25, 'Santa Ana de Yusguare '),
(427, 26, 'Yuscaran '),
(428, 26, 'Alauca '),
(429, 26, 'Danli '),
(430, 26, 'El Paraíso*'),
(431, 26, 'Guinope '),
(432, 26, 'Jacaleapa '),
(433, 26, 'Liure '),
(434, 26, 'Moroceli '),
(435, 26, 'Oropoli '),
(436, 26, 'Potrerillos '),
(437, 26, 'San Antonio de Flores '),
(438, 26, 'San Lucas '),
(439, 26, 'San Matías '),
(440, 26, 'Soledad '),
(441, 26, 'Teupasenti '),
(442, 26, 'Texiguat '),
(443, 26, 'Vado Ancho '),
(444, 26, 'Yauyupe '),
(445, 26, 'Trojes '),
(446, 28, 'Puerto Lempira*'),
(447, 28, 'Brus Laguna'),
(448, 28, 'Ahuas '),
(449, 28, 'Juan Francisco Bulnes '),
(450, 28, 'Villeda Morales '),
(451, 28, 'Wampusirpi '),
(452, 29, 'La Esperanza*'),
(453, 29, 'Camasca'),
(454, 29, 'Colomoncagua '),
(455, 29, 'Concepción '),
(456, 29, 'Dolores '),
(457, 29, 'Intibuca'),
(458, 29, 'Jesús de Otoro '),
(459, 29, 'Magdalena '),
(460, 29, 'Masaguara '),
(461, 29, 'San Antonio '),
(462, 29, 'San Isidro '),
(463, 29, 'San Juan '),
(464, 29, 'San Marcos de La Sierra '),
(465, 29, 'San Miguelito '),
(466, 29, 'Santa Lucía '),
(467, 29, 'Yamaranguila '),
(468, 29, 'San Francisco de Opalaca '),
(469, 30, 'Roatán*'),
(470, 30, 'Guanaja '),
(471, 30, 'José Santos Guardiola '),
(472, 30, 'Utila '),
(473, 31, 'La Paz* '),
(474, 31, 'Aguantequerique '),
(475, 31, 'Cabañas '),
(476, 31, 'Cane '),
(477, 31, 'Chinacla '),
(478, 31, 'Guajiquiro '),
(479, 31, 'Lauterique'),
(480, 31, 'Marcala '),
(481, 31, 'Mercedes de Oriente '),
(482, 31, 'Opatoro '),
(483, 31, 'San Antonio del Norte '),
(484, 31, 'San José '),
(485, 31, 'San Juan '),
(486, 31, 'San pedro de Tutule Santa Ana '),
(487, 31, 'Santa Elena '),
(488, 31, 'Santa María '),
(489, 31, 'Santiago de Puringla '),
(490, 31, 'Yarula '),
(491, 32, 'Gracias*'),
(492, 32, 'Belén '),
(493, 32, 'Candelaria '),
(494, 32, 'Cololaca '),
(495, 32, 'Erandique'),
(496, 32, 'Gualcince '),
(497, 32, 'Guarita '),
(498, 32, 'La Campa '),
(499, 32, 'La Iguala '),
(500, 32, 'Las Flores '),
(501, 32, 'La Unión '),
(502, 32, 'La Virtud '),
(503, 32, 'Lepaera '),
(504, 32, 'Mapulaca '),
(505, 32, 'Piraera '),
(506, 32, 'San Andrés'),
(507, 32, 'San Francisco '),
(508, 32, 'San Juan Guarita '),
(509, 32, 'San Manuel de Colohete '),
(510, 32, 'San Rafael '),
(511, 32, 'San Sebastián '),
(512, 32, 'Santa Cruz '),
(513, 32, 'Talgua'),
(514, 32, 'Tambla '),
(515, 32, 'Tomala '),
(516, 32, 'Valladolid '),
(517, 32, 'Virginia '),
(518, 32, 'San Marcos de Caiquin '),
(519, 33, 'Ocotepeque*'),
(520, 33, 'Belén Gualcho '),
(521, 33, 'Concepción '),
(522, 33, 'Dolores Merendón '),
(523, 33, 'Fraternidad '),
(524, 33, 'La Encarnación'),
(525, 33, 'La Labor'),
(526, 33, 'Lucema '),
(527, 33, 'Mercedes '),
(528, 33, 'San Fernando '),
(529, 33, 'San Francisco del Valle '),
(530, 33, 'San Jorge '),
(531, 33, 'San Marcos '),
(532, 33, 'Santa Fé '),
(533, 33, 'Sensenti '),
(534, 33, 'Sinuapa '),
(535, 34, 'Juticalpa* '),
(536, 34, 'Campamento'),
(537, 34, 'Catacamas '),
(538, 34, 'Concordia '),
(539, 34, 'Dulce Nombre de Culmi '),
(540, 34, 'El Rosario '),
(541, 34, 'Esquipulas del Norte'),
(542, 34, 'Gualaco '),
(543, 34, 'Guarizama '),
(544, 34, 'Guata '),
(545, 34, 'Guayape'),
(546, 34, 'Jano '),
(547, 34, 'La Unión'),
(548, 34, 'Mangulile'),
(549, 34, 'Manto '),
(550, 34, 'Salama '),
(551, 34, 'San Esteban '),
(552, 34, 'San Francisco de Becerra '),
(553, 34, 'San Francisco de La Paz '),
(554, 34, 'Santa María del Real '),
(555, 34, 'Silca '),
(556, 34, 'Yocon '),
(557, 34, 'Patuca '),
(558, 35, 'Santa Bárbara* '),
(559, 35, 'Arada '),
(560, 35, 'Atima '),
(561, 35, 'Azacualpa'),
(562, 35, 'Ceguaca '),
(563, 35, 'San José de Colinas '),
(564, 35, 'Concepción del Norte '),
(565, 35, 'Concepción del Sur '),
(566, 35, 'Chinda '),
(567, 35, 'El Níspero '),
(568, 35, 'Gualala '),
(569, 35, 'Llama '),
(570, 35, 'Macuelizo'),
(571, 35, 'Naranjito '),
(572, 35, 'Nuevo Celilac'),
(573, 35, 'Petoa '),
(574, 35, 'Protección'),
(575, 35, 'Quimistan '),
(576, 35, 'San Francisco de Ojuera '),
(577, 35, 'San Luis '),
(578, 35, 'San Marcos '),
(579, 35, 'San Nicolás '),
(580, 35, 'San Pedro de Zacapa '),
(581, 35, 'Santa Rita '),
(582, 35, 'San Vicente Centenario '),
(583, 35, 'Trinidad '),
(584, 35, 'Las Vegas '),
(585, 35, 'Nueva Frontera '),
(586, 36, 'Nacaome*'),
(587, 36, 'Alianza '),
(588, 36, 'Amapala'),
(589, 36, 'Aramecina '),
(590, 36, 'Caridad '),
(591, 36, 'Goascoran'),
(592, 36, 'Langue '),
(593, 36, 'San Francisco de Coray '),
(594, 36, 'San Lorenzo '),
(595, 37, 'Yoro* '),
(596, 37, 'Arenal '),
(597, 37, 'El Negrito '),
(598, 37, 'El Progreso '),
(599, 37, 'Jocon '),
(600, 37, 'Morazan '),
(601, 37, 'Olanchito '),
(602, 37, 'Santa Rita '),
(603, 37, 'Sulaco '),
(604, 37, 'Victoria '),
(605, 37, 'Yorito');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se registraran los diferentes tipos de niveles educativos que puede llegar a tener un cliente de segundo nivel' AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `nivel_educativo`
--

INSERT INTO `nivel_educativo` (`nivel_edu_id`, `nivel_edu_descrip`, `nivel_edu_abreviatura`, `estatus_id`) VALUES
(1, 'Medio/Basico', NULL, NULL),
(2, 'Bachiller', NULL, NULL),
(3, 'Tecnico', NULL, NULL),
(4, 'Universitario', NULL, NULL),
(5, 'Postgrado', NULL, NULL),
(6, 'Sin Estudios', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `pais_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pais_nombre` varchar(50) NOT NULL,
  `flag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pais_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se guardaran los paises de los cuales manejera el sistema.' AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`pais_id`, `pais_nombre`, `flag`) VALUES
(1, 'Honduras', 'flag_hnd'),
(2, 'Guatemala', 'flag_gtm'),
(3, 'El Salvador', 'flag_sal'),
(4, 'Nicaragua', 'flag_nic'),
(5, 'Costa Rica', 'flag_crc'),
(6, 'Panama', 'flag_pan');

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
  `propiedad_antiguedad` date NOT NULL,
  `direccion_id` bigint(20) DEFAULT NULL,
  `entidad_id` int(11) NOT NULL,
  PRIMARY KEY (`propiedad_id`),
  KEY `FK_propiedades_propiedad_tipo_id_idx` (`propiedad_tipo_id`),
  KEY `FK_propiedades_direccion_id_idx` (`direccion_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se ingresaran las propiedades que puede llegar a tener un cliente de segun do nivel registrado en el sistema CrediStar.' AUTO_INCREMENT=93 ;

--
-- Volcado de datos para la tabla `propiedades`
--

INSERT INTO `propiedades` (`propiedad_id`, `propiedad_descripcion`, `propiedad_tipo_id`, `propiedad_comentario`, `propiedad_valor`, `propiedad_registro`, `propiedad_antiguedad`, `direccion_id`, `entidad_id`) VALUES
(13, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 16, 0),
(14, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 18, 88),
(15, NULL, 1, NULL, NULL, NULL, '0000-00-00', 19, 0),
(16, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 21, 89),
(17, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 22, 0),
(18, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 24, 90),
(19, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 25, 0),
(20, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 27, 91),
(21, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 28, 0),
(22, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 30, 92),
(23, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 31, 0),
(24, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 33, 93),
(25, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 34, 0),
(26, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 36, 94),
(27, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 37, 0),
(28, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 39, 95),
(29, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 40, 0),
(30, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 42, 96),
(31, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 43, 0),
(32, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 45, 97),
(33, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 46, 0),
(34, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 48, 98),
(35, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 49, 0),
(36, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 51, 99),
(37, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 52, 0),
(38, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 54, 102),
(39, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 55, 0),
(40, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 57, 103),
(41, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 58, 0),
(42, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 60, 104),
(43, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 61, 0),
(44, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 63, 105),
(45, NULL, 1, NULL, NULL, NULL, '0000-00-00', 64, 0),
(46, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 66, 106),
(47, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 67, 0),
(48, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 69, 107),
(49, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 70, 0),
(50, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 72, 108),
(51, NULL, 1, NULL, NULL, NULL, '0000-00-00', 73, 0),
(52, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 75, 109),
(53, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 76, 0),
(54, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 78, 110),
(55, NULL, 1, NULL, NULL, NULL, '0000-00-00', 79, 0),
(56, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 81, 111),
(57, NULL, 2, NULL, NULL, NULL, '0000-00-00', 82, 0),
(58, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 84, 112),
(59, NULL, 2, NULL, NULL, NULL, '0000-00-00', 85, 0),
(60, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 87, 113),
(61, NULL, 1, NULL, NULL, NULL, '0000-00-00', 88, 0),
(62, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 90, 114),
(63, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 91, 0),
(64, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 93, 115),
(65, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 94, 0),
(66, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 96, 116),
(67, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 97, 0),
(68, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 99, 117),
(69, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 100, 0),
(70, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 102, 118),
(71, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 103, 0),
(72, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 105, 119),
(73, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 106, 0),
(74, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 108, 120),
(75, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 109, 0),
(76, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 111, 121),
(77, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 112, 0),
(78, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 114, 122),
(79, NULL, 1, NULL, NULL, NULL, '0000-00-00', 115, 0),
(80, NULL, 6, '', '2000000.00', '6272576', '0000-00-00', 117, 123),
(81, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 118, 0),
(82, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 120, 124),
(83, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 121, 0),
(84, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 123, 125),
(85, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 124, 0),
(86, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 126, 126),
(87, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 127, 0),
(88, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 129, 127),
(89, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 130, 0),
(90, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 132, 128),
(91, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 133, 0),
(92, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 135, 129);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedades_tipos`
--

CREATE TABLE IF NOT EXISTS `propiedades_tipos` (
  `propiedad_tipo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `propiedad_tipo_descripcion` varchar(50) DEFAULT NULL,
  `propiedad_descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`propiedad_tipo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se definiran los tipos de propiedades que puede llegar a tener una entidad general de propiedades.' AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `propiedades_tipos`
--

INSERT INTO `propiedades_tipos` (`propiedad_tipo_id`, `propiedad_tipo_descripcion`, `propiedad_descripcion`) VALUES
(1, 'Familia', 'domicilio'),
(2, 'Alquila', 'domicilio'),
(3, 'Hipoteca', 'domicilio'),
(4, 'Propia', 'domicilio'),
(5, 'Otros', 'domicilio'),
(6, 'Casa', 'propiedades'),
(7, 'Carro', 'propiedades'),
(8, 'Terreno', 'propiedades'),
(9, 'Negocio', 'propiedades');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referencias_personales`
--

CREATE TABLE IF NOT EXISTS `referencias_personales` (
  `referencia_personal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entidad_id` bigint(20) DEFAULT NULL,
  `referencia_relacion_id` bigint(20) DEFAULT NULL,
  `referencias_personales_antiguedad` date DEFAULT NULL,
  `estatus_id` varchar(2) DEFAULT NULL,
  `referencia_pnombre` varchar(50) NOT NULL,
  `referencia_snombre` varchar(50) NOT NULL,
  `referencia_papellido` varchar(50) NOT NULL,
  `referencia_sapellido` varchar(50) NOT NULL,
  `referencia_tipo_tel` int(11) NOT NULL,
  `referencia_telefono` int(11) NOT NULL,
  `referencia_extension` int(11) NOT NULL,
  `referencia_hora_contacto` int(11) NOT NULL,
  `referencia_generico1` int(11) NOT NULL,
  `referencia_nid` int(11) NOT NULL,
  `referencia_fechanac` date NOT NULL,
  PRIMARY KEY (`referencia_personal_id`),
  KEY `FK_referencias_personales_entidad_id_idx` (`entidad_id`),
  KEY `FK_referencias_personales_referencia_relacion_id_idx` (`referencia_relacion_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se relacionaran las diferentes  referencias personales que puede llegar a tener una entidad.' AUTO_INCREMENT=89 ;

--
-- Volcado de datos para la tabla `referencias_personales`
--

INSERT INTO `referencias_personales` (`referencia_personal_id`, `entidad_id`, `referencia_relacion_id`, `referencias_personales_antiguedad`, `estatus_id`, `referencia_pnombre`, `referencia_snombre`, `referencia_papellido`, `referencia_sapellido`, `referencia_tipo_tel`, `referencia_telefono`, `referencia_extension`, `referencia_hora_contacto`, `referencia_generico1`, `referencia_nid`, `referencia_fechanac`) VALUES
(9, 88, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(10, 88, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(11, 89, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(12, 89, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(13, 90, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(14, 90, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(15, 91, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(16, 91, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(17, 92, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(18, 92, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(19, 93, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(20, 93, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(21, 94, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(22, 94, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(23, 95, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(24, 95, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(25, 96, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(26, 96, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(27, 97, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(28, 97, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(29, 98, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(30, 98, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(31, 99, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(32, 99, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(33, 102, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(34, 102, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(35, 103, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(36, 103, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(37, 104, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(38, 104, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(39, 105, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(40, 105, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(41, 106, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(42, 106, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(43, 107, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(44, 107, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(45, 108, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(46, 108, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(47, 109, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(48, 109, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(49, 110, NULL, '0000-00-00', '1', '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(50, 110, NULL, '0000-00-00', '1', '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(51, 111, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(52, 111, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(53, 112, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(54, 112, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(55, 113, 1, '2010-07-16', '1', 'Maria', 'magdalena', 'reyes', 'juarez', 2, 234234234, 800, 8, 0, 0, '0000-00-00'),
(56, 113, 2, '2016-07-14', '1', 'ajaja', 'ojojojoj', 'pokpokj', 'pojpojp', 2, 765875875, 8756587, 4, 0, 0, '0000-00-00'),
(57, 114, 2, '1991-07-24', '1', 'Armando', '', 'Roque', 'Barahona', 2, 33096700, 0, 12, 0, 0, '0000-00-00'),
(58, 114, 1, '2009-07-22', '1', 'Allan', 'Edgardo', 'Torres', 'Juarez', 2, 33096787, 87, 7, 0, 0, '0000-00-00'),
(59, 115, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(60, 115, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(61, 116, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(62, 116, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(63, 117, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(64, 117, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(65, 118, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(66, 118, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(67, 119, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(68, 119, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(69, 120, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(70, 120, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(71, 121, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(72, 121, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(73, 122, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(74, 122, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(75, 123, 2, '1991-09-11', '1', 'Mario', 'Juanes', 'martinez', 'perez', 1, 25571755, 839, 6, 0, 0, '0000-00-00'),
(76, 123, 3, '2002-09-10', '1', 'Damian', 'Alberto', 'nunez', 'galvez', 1, 25566754, 7726, 6, 0, 0, '0000-00-00'),
(77, 124, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(78, 124, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(79, 125, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(80, 125, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(81, 126, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(82, 126, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(83, 127, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(84, 127, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(85, 128, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(86, 128, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(87, 129, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00'),
(88, 129, NULL, NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referencias_relaciones`
--

CREATE TABLE IF NOT EXISTS `referencias_relaciones` (
  `referencia_relacion_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `referencia_relacion_descripcion` varchar(50) NOT NULL,
  `referencia_relacion_abreviatura` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`referencia_relacion_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se definiaran los tipos de relaciones que se puede tener ante una referencia personal que haya brindado un cliente de segundo nivel' AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `referencias_relaciones`
--

INSERT INTO `referencias_relaciones` (`referencia_relacion_id`, `referencia_relacion_descripcion`, `referencia_relacion_abreviatura`) VALUES
(1, 'Amigo', NULL),
(2, 'Familiar', NULL),
(3, 'Compañero de Trabajo', NULL);

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
  PRIMARY KEY (`score_id`)
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
  `soliciutd_comentario` varchar(2000) DEFAULT NULL,
  `solicitud_comentario_analista` text NOT NULL,
  `soliciutd_score` int(11) DEFAULT NULL,
  `soliciutd_forzada` int(11) DEFAULT '0',
  `estatus_id` varchar(2) DEFAULT NULL,
  `subestatus_id` varchar(2) DEFAULT NULL,
  `entidad_id` bigint(20) NOT NULL,
  PRIMARY KEY (`solicitud_id`),
  KEY `FK_solicitudes_solicitud_tipo_id_idx` (`solicitud_tipo_id`),
  KEY `FK_solicitudes_solicitud_canal_id_idx` (`solicitud_canal_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla de transacciones, en esta tabla se guardara el registro que sera el que inicie la afetacion de un credtio para un cliente en especifico.' AUTO_INCREMENT=58 ;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`solicitud_id`, `cia_id`, `solicitud_fecha_inicio`, `solicitud_fecha_cierre`, `solicitud_prioridad`, `solicitud_tipo_id`, `solicitud_canal_id`, `solicitud_monto`, `solicitud_cuota`, `solicitud_plazo`, `soliciutd_comentario`, `solicitud_comentario_analista`, `soliciutd_score`, `soliciutd_forzada`, `estatus_id`, `subestatus_id`, `entidad_id`) VALUES
(18, NULL, '2016-06-22 23:36:41', NULL, NULL, NULL, 3, '30000.00', '1000.00', '500.00', 'loading modal', '', NULL, 0, '8', NULL, 88),
(19, NULL, '2016-06-23 01:22:40', NULL, NULL, NULL, 4, '50000.00', '1000.00', '7.00', 'si', '', NULL, 0, '8', NULL, 89),
(20, NULL, '2016-06-23 22:39:40', NULL, NULL, NULL, 3, '50000.00', '1000.00', '5.00', NULL, '', NULL, 0, '1', NULL, 90),
(21, NULL, '2016-06-23 23:06:31', NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '', NULL, 0, '1', NULL, 91),
(22, NULL, '2016-06-25 00:46:04', NULL, NULL, NULL, 3, '30000.00', '1000.00', '30.00', NULL, '', NULL, 0, '1', NULL, 92),
(23, NULL, '2016-06-25 19:08:55', NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '', NULL, 0, '1', NULL, 93),
(24, NULL, '2016-06-25 23:33:59', NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '', NULL, 0, '1', NULL, 94),
(25, NULL, '2016-07-01 21:54:43', NULL, NULL, NULL, 3, '80000.00', '8000.00', '10.00', NULL, '', NULL, 0, '1', NULL, 95),
(26, NULL, '2016-07-01 21:58:41', NULL, NULL, NULL, 3, '80000.00', '8000.00', '10.00', NULL, '', NULL, 0, '1', NULL, 96),
(27, NULL, '2016-07-01 22:01:31', NULL, NULL, NULL, 3, '80000.00', '8000.00', '8.00', NULL, '', NULL, 0, '1', NULL, 97),
(28, NULL, '2016-07-01 22:04:38', NULL, NULL, NULL, 3, '70000.00', '7000.00', '10.00', NULL, '', NULL, 0, '1', NULL, 98),
(29, NULL, '2016-07-01 22:05:59', NULL, NULL, NULL, 3, '70000.00', '7000.00', '10.00', NULL, '', NULL, 0, '1', NULL, 99),
(30, NULL, '2016-07-01 22:26:04', NULL, NULL, NULL, 3, '10000.00', '1000.00', '10.00', NULL, '', NULL, 0, '1', NULL, 102),
(31, NULL, '2016-07-01 22:32:22', NULL, NULL, NULL, 3, '20000.00', '2000.00', '20.00', NULL, '', NULL, 0, '1', NULL, 103),
(32, NULL, '2016-07-01 16:38:38', NULL, NULL, NULL, 3, '90000.00', '9000.00', '10.00', NULL, '', NULL, 0, '9', NULL, 104),
(33, NULL, '2016-07-01 16:51:49', NULL, NULL, NULL, 3, '20000.00', '2000.00', '10.00', NULL, '', NULL, 0, '9', NULL, 105),
(34, NULL, '2016-07-02 08:50:04', NULL, NULL, NULL, 4, '30000.00', '3000.00', '10.00', NULL, '', NULL, 0, '1', NULL, 106),
(35, NULL, '2016-07-02 14:02:56', NULL, NULL, NULL, 3, '80000.00', '8000.00', '10.00', 'La solicitud ah sido DENEGADA por el siguiente motivo: ''ANTIGUEDAD LABORAL INSUFICIENTE''. ', '', NULL, 0, '9', '1', 107),
(36, NULL, '2016-07-02 14:06:23', NULL, NULL, NULL, 3, '90000.00', '9000.00', '10.00', NULL, '', NULL, 0, '1', NULL, 108),
(37, NULL, '2016-07-02 14:54:27', NULL, NULL, NULL, 3, '70000.00', '7000.00', '10.00', NULL, '', NULL, 0, '1', NULL, 109),
(38, NULL, '2016-07-03 18:08:16', NULL, NULL, NULL, 3, '50000.00', '5000.00', '10.00', NULL, '', NULL, 0, '1', NULL, 110),
(39, NULL, '2016-07-03 18:46:34', NULL, NULL, NULL, 4, '70000.00', '7000.00', '10.00', 'La solicitud ah sido DENEGADA por el siguiente motivo: ''Lista Negra de cedulas''. ', '', NULL, 0, '3', '1', 111),
(40, NULL, '2016-07-04 09:50:21', NULL, NULL, NULL, 3, '30000.00', '3000.00', '10.00', 'La solicitud ah sido DENEGADA por el siguiente motivo: ''EDAD INSUFICIENTE''. ', 'no hay ningun problema :D', NULL, 0, '9', '1', 112),
(41, NULL, '2016-07-04 11:15:36', NULL, NULL, NULL, 3, '70000.00', '7000.00', '10.00', 'La solicitud en verificacion ah terminado Exitosamente sin ningun problema.', 'todo estuvo bien... faltan validaciones...', NULL, 0, '2', '1', 113),
(42, NULL, '2016-07-05 12:30:42', NULL, NULL, NULL, 3, '70000.00', '7000.00', '10.00', 'La solicitud en verificacion ah terminado Exitosamente sin ningun problema.', 'Todo estuvo bien', NULL, 0, '2', '1', 114),
(43, NULL, '2016-07-05 14:27:15', NULL, NULL, NULL, 3, '79879.00', '87987.00', '98.00', NULL, '', NULL, 0, '1', NULL, 115),
(44, NULL, '2016-07-08 18:00:52', NULL, NULL, NULL, 3, '50000.00', '5000.00', '10.00', NULL, '', NULL, 0, '1', NULL, 116),
(45, NULL, '2016-07-08 18:02:33', NULL, NULL, NULL, 3, '50000.00', '5000.00', '10.00', NULL, '', NULL, 0, '1', NULL, 117),
(46, NULL, '2016-07-08 18:03:36', NULL, NULL, NULL, 3, '70000.00', '7000.00', '10.00', NULL, '', NULL, 0, '1', NULL, 118),
(47, NULL, '2016-07-08 18:08:36', NULL, NULL, NULL, 3, '70000.00', '7000.00', '10.00', NULL, '', NULL, 0, '1', NULL, 119),
(48, NULL, '2016-07-08 18:10:19', NULL, NULL, NULL, 3, '70000.00', '7000.00', '10.00', NULL, '', NULL, 0, '1', NULL, 120),
(49, NULL, '2016-07-09 11:42:44', NULL, NULL, NULL, 3, '80000.00', '8000.00', '10.00', 'Referencias Negativas', '', NULL, 0, '3', NULL, 121),
(50, NULL, '2016-07-09 11:43:41', NULL, NULL, NULL, 3, '4000.00', '4000.00', '10.00', 'Mala referencia externa', '', NULL, 0, '8', NULL, 122),
(51, NULL, '2016-07-09 11:55:31', NULL, NULL, NULL, 3, '10000.00', '1000.00', '10.00', 'La solicitud en verificacion ah terminado Exitosamente sin ningun problema.', '', NULL, 0, '2', '1', 123),
(52, NULL, '2016-07-09 11:57:19', NULL, NULL, NULL, 3, '65000.00', '6500.00', '10.00', 'La solicitud a sido DENEGADA por el siguiente motivo: ''EDAD INSUFICIENTE'',''ANTIGUEDAD LABORAL INSUFICIENTE''.', '', NULL, 0, '3', NULL, 124),
(53, NULL, '2016-07-12 11:34:41', NULL, NULL, NULL, 3, '31000.00', '3100.00', '10.00', 'Edad Insuficiente', '', NULL, 0, '8', NULL, 125),
(54, NULL, '2016-07-16 09:05:44', NULL, NULL, NULL, 3, '80000.00', '90999.00', '10.00', NULL, '', NULL, 0, '1', NULL, 126),
(55, NULL, '2016-07-16 09:12:20', NULL, NULL, NULL, 3, '80000.00', '90999.00', '10.00', NULL, '', NULL, 0, '1', NULL, 127),
(56, NULL, '2016-07-16 09:22:42', NULL, NULL, NULL, 3, '60000.00', '972829.00', '10.00', NULL, '', NULL, 0, '9', NULL, 128),
(57, NULL, '2016-07-18 13:30:25', NULL, NULL, NULL, 3, '60000.00', '6000.00', '10.00', 'Escaneo de Documentos', '', NULL, 0, '1', NULL, 129);

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
  PRIMARY KEY (`solicitud_canal_id`)
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
  PRIMARY KEY (`solicitud_tipo_id`)
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla que servira de registro maestro para los numeros de telefonos de las diferentes entidades del sistema' AUTO_INCREMENT=136 ;

--
-- Volcado de datos para la tabla `telefonos`
--

INSERT INTO `telefonos` (`telefono_id`, `telefono_tipo_id`, `telefono_subtipo_id`, `telefono_numero`, `telefono_extesnion`, `telefono_abreviatura`, `telefono_comentario`, `telefono_blacklist`, `estatus_id`) VALUES
(14, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(15, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(16, 1, NULL, 23234234, '0', NULL, NULL, NULL, '7'),
(17, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(18, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(19, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(20, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(21, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(22, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(23, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(24, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(25, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(26, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(27, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(28, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(29, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(30, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(31, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(32, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(33, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(34, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(35, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(36, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(37, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(38, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(39, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(40, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(41, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(42, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(43, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(44, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(45, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(46, 1, NULL, 559327, '546', NULL, NULL, NULL, '7'),
(47, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(48, 0, NULL, 0, '', NULL, NULL, NULL, '7'),
(49, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(50, 2, NULL, 33096700, '99', NULL, NULL, NULL, '7'),
(51, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(52, 2, NULL, 33576985, '000', NULL, NULL, NULL, '7'),
(53, 2, NULL, 33096700, '000', NULL, NULL, NULL, '7'),
(54, 2, NULL, 33145796, '000', NULL, NULL, NULL, '7'),
(55, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(56, 1, NULL, 5593279, '0000', NULL, NULL, NULL, '7'),
(57, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(58, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(59, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(60, 2, NULL, 33096700, '0000', NULL, NULL, NULL, '7'),
(61, 1, NULL, 5593279, '304', NULL, NULL, NULL, '7'),
(62, 1, NULL, 338976, '000', NULL, NULL, NULL, '7'),
(63, 1, NULL, 25699827, '000', NULL, NULL, NULL, '7'),
(64, 2, NULL, 78928711, '0000', NULL, NULL, NULL, '7'),
(65, 2, NULL, 66666666, '666', NULL, NULL, NULL, '7'),
(66, 1, NULL, 77777777, '777', NULL, NULL, NULL, '7'),
(67, 1, NULL, 5656565656, '546', NULL, NULL, NULL, '7'),
(68, 1, NULL, 25571755, '123', NULL, NULL, NULL, '7'),
(69, 2, NULL, 33907600, '000', NULL, NULL, NULL, '7'),
(70, 1, NULL, 3534434, '433434', NULL, NULL, NULL, '7'),
(71, 1, NULL, 65242656, '78', NULL, NULL, NULL, '7'),
(72, 1, NULL, 25571755, '123', NULL, NULL, NULL, '7'),
(73, 0, NULL, 0, '', NULL, NULL, NULL, '7'),
(74, 0, NULL, 0, '', NULL, NULL, NULL, '7'),
(75, 2, NULL, 33096700, '0129', NULL, NULL, NULL, '7'),
(76, 1, NULL, 9223372036854775807, '987987', NULL, NULL, NULL, '7'),
(77, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(78, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(79, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(80, 0, NULL, 0, '', NULL, NULL, NULL, '7'),
(81, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(82, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(83, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(84, 0, NULL, 0, '', NULL, NULL, NULL, '7'),
(85, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(86, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(87, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(88, 0, NULL, 0, '', NULL, NULL, NULL, '7'),
(89, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(90, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(91, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(92, 0, NULL, 0, '', NULL, NULL, NULL, '7'),
(93, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(94, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(95, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(96, 0, NULL, 0, '', NULL, NULL, NULL, '7'),
(97, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(98, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(99, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(100, 0, NULL, 0, '', NULL, NULL, NULL, '7'),
(101, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(102, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(103, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(104, 0, NULL, 0, '', NULL, NULL, NULL, '7'),
(105, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(106, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(107, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(108, 2, NULL, 33096700, '090', NULL, NULL, NULL, '7'),
(109, 2, NULL, 33096811, '189', NULL, NULL, NULL, '7'),
(110, 1, NULL, 25571755, '761', NULL, NULL, NULL, '7'),
(111, 1, NULL, 25593279, '726', NULL, NULL, NULL, '7'),
(112, 1, NULL, 33096700, '0123', NULL, NULL, NULL, '7'),
(113, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(114, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(115, 1, NULL, 6778768778, '87', NULL, NULL, NULL, '7'),
(116, 0, NULL, 0, '', NULL, NULL, NULL, '7'),
(117, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(118, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(119, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(120, 0, NULL, 0, '', NULL, NULL, NULL, '7'),
(121, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(122, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(123, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(124, 0, NULL, 0, '', NULL, NULL, NULL, '7'),
(125, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(126, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(127, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(128, 0, NULL, 0, '', NULL, NULL, NULL, '7'),
(129, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(130, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(131, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(132, 0, NULL, 0, '', NULL, NULL, NULL, '7'),
(133, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(134, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(135, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se definiran los tipos de telefonos que puede llegar a tener una entidad y como se clasificaran' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `telefonos_tipos`
--

INSERT INTO `telefonos_tipos` (`telefono_tipo_id`, `telefono_descripcion`) VALUES
(1, 'Fijo'),
(2, 'Celular');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se registraran todos los usuarios del sistema, con este registro y dependiendo de su nivel de acceso es donde se podra definir la seguridad a cada usuario.' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `usuario_alias`, `usuario_nombre`, `usuario_apellido`, `usuario_cel`, `usuario_telefono`, `usuario_foto`, `usuario_isadmin`, `estatus_id`, `usuario_pass`) VALUES
(1, 'admin', 'admin', 'admin', '0', '', NULL, 1, '1', 'eb2be918f3540e71b213f2d9b13c5687'),
(2, 'aroque', 'ARMANDO', 'ROQUE', '33096700', '', NULL, 0, '1', 'eb2be918f3540e71b213f2d9b13c5687'),
(4, 'vende', 'VENDEDOR', 'VENDEDOR', '33096700', '', NULL, 0, '1', 'eb2be918f3540e71b213f2d9b13c5687');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_cias`
--

CREATE TABLE IF NOT EXISTS `usuarios_cias` (
  `usuario_id` bigint(20) NOT NULL,
  `cia_id` varchar(4) NOT NULL,
  PRIMARY KEY (`usuario_id`,`cia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en donde se almacenaran los usuarios y a que compañias tienen accesos.';

--
-- Volcado de datos para la tabla `usuarios_cias`
--

INSERT INTO `usuarios_cias` (`usuario_id`, `cia_id`) VALUES
(4, '1');

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
-- Volcado de datos para la tabla `usuarios_grupos`
--

INSERT INTO `usuarios_grupos` (`usuario_id`, `grupo_id`) VALUES
(4, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_solicitudes`
--

CREATE TABLE IF NOT EXISTS `usuarios_solicitudes` (
  `usuario_id` bigint(20) NOT NULL,
  `solicitud_id` bigint(20) NOT NULL,
  `estatus_id` bigint(20) NOT NULL,
  `entidad_id` bigint(20) NOT NULL,
  `fecha_solicitud_tomada` date NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Volcado de datos para la tabla `usuarios_solicitudes`
--

INSERT INTO `usuarios_solicitudes` (`usuario_id`, `solicitud_id`, `estatus_id`, `entidad_id`, `fecha_solicitud_tomada`, `id`) VALUES
(1, 18, 1, 88, '2016-06-22', 20),
(1, 19, 1, 89, '2016-06-22', 21),
(1, 32, 1, 104, '2016-07-01', 22),
(1, 33, 1, 105, '2016-07-01', 23),
(1, 35, 3, 107, '2016-07-03', 24),
(1, 39, 1, 111, '2016-07-03', 25),
(2, 41, 1, 113, '2016-07-04', 26),
(2, 40, 3, 112, '2016-07-04', 27),
(2, 42, 1, 114, '2016-07-05', 28),
(2, 52, 1, 124, '2016-07-09', 29),
(2, 51, 1, 123, '2016-07-11', 30),
(2, 53, 1, 125, '2016-07-13', 31),
(2, 50, 1, 122, '2016-07-15', 32),
(2, 49, 1, 121, '2016-07-15', 33),
(2, 56, 1, 128, '2016-07-18', 34),
(2, 57, 1, 129, '2016-07-18', 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `verificacion_telefonos`
--

CREATE TABLE IF NOT EXISTS `verificacion_telefonos` (
  `entidad_id` int(11) NOT NULL,
  `telpersonal1` varchar(32) NOT NULL,
  `telpersonal2` varchar(32) NOT NULL,
  `telspersonales` varchar(32) NOT NULL,
  `teltrabajo` varchar(32) NOT NULL,
  `telref1` varchar(32) NOT NULL,
  `telref2` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `verificacion_telefonos`
--

INSERT INTO `verificacion_telefonos` (`entidad_id`, `telpersonal1`, `telpersonal2`, `telspersonales`, `teltrabajo`, `telref1`, `telref2`) VALUES
(112, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado'),
(113, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado'),
(114, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado'),
(115, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado'),
(116, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado'),
(117, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado'),
(118, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado'),
(119, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado'),
(120, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado'),
(121, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado'),
(122, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado'),
(123, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado'),
(124, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado'),
(125, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado'),
(126, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado'),
(127, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado'),
(128, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado'),
(129, 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado', 'No Revisado');

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
-- Filtros para la tabla `colonias`
--
ALTER TABLE `colonias`
  ADD CONSTRAINT `FK_colonias_municipio_id` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`municipio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Filtros para la tabla `grupos_pantallas`
--
ALTER TABLE `grupos_pantallas`
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
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `FK_solicitudes_solicitud_canal_id` FOREIGN KEY (`solicitud_canal_id`) REFERENCES `solicitudes_canales` (`solicitud_canal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_solicitudes_solicitud_tipo_id` FOREIGN KEY (`solicitud_tipo_id`) REFERENCES `solicitudes_tipos` (`solicitud_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudes_docs`
--
ALTER TABLE `solicitudes_docs`
  ADD CONSTRAINT `FK_solicitudes_docs_solicitud_id` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`solicitud_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudes_limites_creditos`
--
ALTER TABLE `solicitudes_limites_creditos`
  ADD CONSTRAINT `FK_solicitudes_limites_creditos_solicitud_id` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`solicitud_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudes_scores`
--
ALTER TABLE `solicitudes_scores`
  ADD CONSTRAINT `FK_solicitudes_scores_score_id` FOREIGN KEY (`score_id`) REFERENCES `scores` (`score_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_solicitudes_scores_solicitud_id` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`solicitud_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sub_estatus`
--
ALTER TABLE `sub_estatus`
  ADD CONSTRAINT `FK_estatus_id` FOREIGN KEY (`estatus_id`) REFERENCES `estatus` (`estatus_id`) ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD CONSTRAINT `FK_sucursales_colonia_id` FOREIGN KEY (`colonia_id`) REFERENCES `colonias` (`colonia_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_sucursales_deptos_id` FOREIGN KEY (`depto_id`) REFERENCES `departamentos` (`depto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_sucursales_municipio_id` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`municipio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_sucursales_pais_id` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`pais_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios_cias`
--
ALTER TABLE `usuarios_cias`
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
