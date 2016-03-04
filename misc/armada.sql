SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `db_credistar` DEFAULT CHARACTER SET latin1 ;
USE `db_credistar` ;

-- -----------------------------------------------------
-- Table `db_credistar`.`blacklist_direcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`blacklist_direcciones` (
  `blacklist_dir_id` BIGINT(20) NOT NULL,
  `blacklist_dir_fecha` DATE NULL DEFAULT NULL,
  `blacklist_dir_pais` VARCHAR(50) NULL DEFAULT NULL,
  `blacklist_dir_departamento` VARCHAR(50) NULL DEFAULT NULL,
  `blacklist_dir_municipio` VARCHAR(50) NULL DEFAULT NULL,
  `blacklist_dir_colonia` VARCHAR(80) NULL DEFAULT NULL,
  `blacklist_dir_comentario` VARCHAR(100) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`blacklist_dir_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se registraran un listado de direcciones que sean de alto riesgo para que el sistema haga una restriccion de las mismas.';


-- -----------------------------------------------------
-- Table `db_credistar`.`blacklist_telefonos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`blacklist_telefonos` (
  `blacklist_telefono_id` BIGINT(20) NOT NULL,
  `blacklist_fecha` DATE NULL DEFAULT NULL,
  `blacklist_telefono_numero` VARCHAR(50) NULL DEFAULT NULL,
  `blacklist_telefono_comentario` VARCHAR(80) NULL DEFAULT NULL,
  `blacklist_telefono_tipo` VARCHAR(50) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`blacklist_telefono_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se guaradara una lista negra de todos los telefonos que sean riesgosos su referencia en alguna solicitud del sistema.';


-- -----------------------------------------------------
-- Table `db_credistar`.`cargos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`cargos` (
  `cargo_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `cargo_descripcion` VARCHAR(50) NOT NULL,
  `cargo_abreviatura` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`cargo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla donde se almacenaran los tipos de cargos que puede llegar a tener un cliente de segundo nivel en su lugar de trabajo.';


-- -----------------------------------------------------
-- Table `db_credistar`.`cias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`cias` (
  `cia_id` VARCHAR(4) NOT NULL,
  `cia_descripcion` VARCHAR(50) NOT NULL,
  `cia_abreviatura` VARCHAR(50) NULL DEFAULT NULL,
  `cia_rtn` VARCHAR(25) NULL DEFAULT NULL,
  `cia_rubro` VARCHAR(25) NULL DEFAULT NULL,
  `cia_mision` VARCHAR(200) NULL DEFAULT NULL,
  `cia_vision` VARCHAR(200) NULL DEFAULT NULL,
  `cia_valores` VARCHAR(200) NULL DEFAULT NULL,
  `cia_logo` VARCHAR(50) NULL DEFAULT NULL,
  `cia_direccion` VARCHAR(100) NULL DEFAULT NULL,
  `cia_direccion1` VARCHAR(100) NULL DEFAULT NULL,
  `cia_telefono` VARCHAR(25) NULL DEFAULT NULL,
  `cia_telefono1` VARCHAR(25) NULL DEFAULT NULL,
  `cia_contacto` VARCHAR(50) NULL DEFAULT NULL,
  `cia_generico1` VARCHAR(50) NULL DEFAULT NULL,
  `cia_generico2` VARCHAR(50) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`cia_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se guardaran todas las compañias y sus datos generales, los cuales seran los clientes internos directos del sistema CrediStar. Dicha tabla es la escencia cuando se se desee agregar un nuevo cliente de primer nivel.';


-- -----------------------------------------------------
-- Table `db_credistar`.`nivel_educativo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`nivel_educativo` (
  `nivel_edu_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nivel_edu_descrip` VARCHAR(50) NOT NULL,
  `nivel_edu_abreviatura` VARCHAR(50) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`nivel_edu_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se registraran los diferentes tipos de niveles educativos que puede llegar a tener un cliente de segundo nivel';


-- -----------------------------------------------------
-- Table `db_credistar`.`profesiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`profesiones` (
  `profesion_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `profesion_descripcion` VARCHAR(50) NOT NULL,
  `profesion_relacion` VARCHAR(50) NULL DEFAULT NULL,
  `profesion_abreviatura` VARCHAR(50) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`profesion_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se guardaran las profesiones que puede llegar a tener un cliente de segundo nivel en CrediStar';


-- -----------------------------------------------------
-- Table `db_credistar`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`clientes` (
  `entidad_id` BIGINT(20) NOT NULL,
  `nivel_edu_id` BIGINT(20) NULL DEFAULT NULL,
  `profesion_id` BIGINT(20) NULL DEFAULT NULL,
  `cliente_score` INT(11) NULL DEFAULT NULL,
  `cliente_limite_credito` DECIMAL(10,2) NULL DEFAULT NULL,
  `clliente_cuota` DECIMAL(10,2) NULL DEFAULT NULL,
  `cliente_usuario_creacion` VARCHAR(25) NULL DEFAULT NULL,
  `cliente_fecha_creacion` DATETIME NULL DEFAULT NULL,
  `cliente_usuario_modificacion` VARCHAR(25) NULL DEFAULT NULL,
  `cliente_fecha_modificacion` DATETIME NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`entidad_id`),
  INDEX `FK_clientes_nivel_edu_id_idx` (`nivel_edu_id` ASC),
  INDEX `FK_clientes_profesion_id_idx` (`profesion_id` ASC),
  CONSTRAINT `FK_clientes_nivel_edu_id`
    FOREIGN KEY (`nivel_edu_id`)
    REFERENCES `db_credistar`.`nivel_educativo` (`nivel_edu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_clientes_profesion_id`
    FOREIGN KEY (`profesion_id`)
    REFERENCES `db_credistar`.`profesiones` (`profesion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se guardaran las entidades que sean clasificadas como tipo clientes en el sistema CrediStar';


-- -----------------------------------------------------
-- Table `db_credistar`.`contratos_tipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`contratos_tipos` (
  `contrato_tipo_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `contrato_tipo_descripcion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`contrato_tipo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se almacenaran los tipos de contratos (semana, quincenal, mensual, etc.) que puede tener un cliente de segundo nivel en su lugar de trabajo.';


-- -----------------------------------------------------
-- Table `db_credistar`.`empleos_tipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`empleos_tipos` (
  `empleo_tipo_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `empleo_tipo_descripcion` VARCHAR(50) NOT NULL,
  `empleo_tipo_abreviatura` VARCHAR(50) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`empleo_tipo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se registraran los tipos de empleos en donde se clasifica el lugar de trabajo para un cliente de segundo nivel.';


-- -----------------------------------------------------
-- Table `db_credistar`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`pais` (
  `pais_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `pais_nombre` VARCHAR(50) NOT NULL,
  `pais_region` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`pais_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se guardaran los paises de los cuales manejera el sistema.';


-- -----------------------------------------------------
-- Table `db_credistar`.`departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`departamentos` (
  `depto_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `pais_id` BIGINT(20) NOT NULL,
  `depto_nombre` VARCHAR(50) NULL DEFAULT NULL,
  `departamentos_COL` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`depto_id`),
  INDEX `FK_deptos_pais_id_idx` (`pais_id` ASC),
  CONSTRAINT `FK_deptos_pais_id`
    FOREIGN KEY (`pais_id`)
    REFERENCES `db_credistar`.`pais` (`pais_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla que contendra los departamentos de los cuales se compone un pais en especifico.';


-- -----------------------------------------------------
-- Table `db_credistar`.`municipios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`municipios` (
  `municipio_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `depto_id` BIGINT(20) NULL DEFAULT NULL,
  `municipio_nombre` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`municipio_id`),
  INDEX `FK_municipios_depto_id_idx` (`depto_id` ASC),
  CONSTRAINT `FK_municipios_depto_id`
    FOREIGN KEY (`depto_id`)
    REFERENCES `db_credistar`.`departamentos` (`depto_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla la cual contendra los municipios de cada departamento registrado en el sistema.';


-- -----------------------------------------------------
-- Table `db_credistar`.`colonias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`colonias` (
  `colonia_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `municipio_id` BIGINT(20) NULL DEFAULT NULL,
  `colonia_descripcion` VARCHAR(50) NULL DEFAULT NULL,
  `colonia_riesgo` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`colonia_id`),
  INDEX `FK_colonias_municipio_id_idx` (`municipio_id` ASC),
  CONSTRAINT `FK_colonias_municipio_id`
    FOREIGN KEY (`municipio_id`)
    REFERENCES `db_credistar`.`municipios` (`municipio_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla la cual contendra las colonias de un cierto municipio en especifico.';


-- -----------------------------------------------------
-- Table `db_credistar`.`direcciones_tipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`direcciones_tipos` (
  `direccion_tipo_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `direccion_tipo_descripcion` VARCHAR(50) NOT NULL,
  `direccion_tipo_abreviatura` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`direccion_tipo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla la cual contendra los tipos de direcciones que se le pueden definir a la tabla maestra de direcciones.';


-- -----------------------------------------------------
-- Table `db_credistar`.`direcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`direcciones` (
  `direccion_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `direccion_descripcion` VARCHAR(50) NULL DEFAULT NULL,
  `direccion_tipo_id` BIGINT(20) NULL DEFAULT NULL,
  `direccion_antiguedad` DECIMAL(10,2) NULL DEFAULT '0.00',
  `pais_id` BIGINT(20) NULL DEFAULT NULL,
  `depto_id` BIGINT(20) NULL DEFAULT NULL,
  `municipio_id` BIGINT(20) NULL DEFAULT NULL,
  `colonia_id` BIGINT(20) NULL DEFAULT NULL,
  `direccion_codigo_postal` VARCHAR(10) NULL DEFAULT NULL,
  `direccion_calle_avenida` VARCHAR(100) NULL DEFAULT NULL,
  `direccion_punto_referencia` VARCHAR(100) NULL DEFAULT NULL,
  `direccion_numero_casa` VARCHAR(50) NULL DEFAULT NULL,
  `direccion_riesgo` INT(11) NULL DEFAULT '0',
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`direccion_id`),
  INDEX `FK_direcciones_direccion_tipo_idx` (`direccion_tipo_id` ASC),
  INDEX `FK_direcciones_pais_id_idx` (`pais_id` ASC),
  INDEX `FK_direcciones_depto_id_idx` (`depto_id` ASC),
  INDEX `FK_direcciones_municipio_id_idx` (`municipio_id` ASC),
  INDEX `FK_direcciones_colonia_id_idx` (`colonia_id` ASC),
  CONSTRAINT `FK_direcciones_colonia_id`
    FOREIGN KEY (`colonia_id`)
    REFERENCES `db_credistar`.`colonias` (`colonia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_direcciones_depto_id`
    FOREIGN KEY (`depto_id`)
    REFERENCES `db_credistar`.`departamentos` (`depto_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_direcciones_direccion_tipo`
    FOREIGN KEY (`direccion_tipo_id`)
    REFERENCES `db_credistar`.`direcciones_tipos` (`direccion_tipo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_direcciones_municipio_id`
    FOREIGN KEY (`municipio_id`)
    REFERENCES `db_credistar`.`municipios` (`municipio_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_direcciones_pais_id`
    FOREIGN KEY (`pais_id`)
    REFERENCES `db_credistar`.`pais` (`pais_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla general de las direcciones, es la tabla que contendra la relacion de todas las tablas de ubicaciones como pais, departamentos, ciuidades y colonias para que el sistema vaya generando una base de conocimiento de las direcciones.';


-- -----------------------------------------------------
-- Table `db_credistar`.`empresas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`empresas` (
  `empresa_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `empresa_nombre` VARCHAR(50) NOT NULL,
  `empresa_abreviatura` VARCHAR(50) NULL DEFAULT NULL,
  `empresa_rtn` VARCHAR(50) NULL DEFAULT NULL,
  `empresa_correo` VARCHAR(50) NULL DEFAULT NULL,
  `direccion_id` BIGINT(20) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(4) NULL DEFAULT NULL,
  PRIMARY KEY (`empresa_id`),
  INDEX `FK_empresas_direccion_id_idx` (`direccion_id` ASC),
  CONSTRAINT `FK_empresas_direccion_id`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `db_credistar`.`direcciones` (`direccion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se almacenara  las diferentes empresas en donde pueden llegar a laborar o laboran  actualmente los clientes de segundo nivel.';


-- -----------------------------------------------------
-- Table `db_credistar`.`frecuencias_pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`frecuencias_pagos` (
  `frecuencia_pago_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `frecuencia_pago_descripcion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`frecuencia_pago_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se almacenaran los tipos de frecuencias de pagos que puede tener un cliente de segundo nivel en su lugar de trabajo.';


-- -----------------------------------------------------
-- Table `db_credistar`.`monedas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`monedas` (
  `moneda_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `moneda_descripcion` VARCHAR(50) NULL DEFAULT NULL,
  `moneda_simbolo` VARCHAR(4) NULL DEFAULT NULL,
  PRIMARY KEY (`moneda_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se almacenara el tipo de moneda con el cual se trabajara en CrediStar';


-- -----------------------------------------------------
-- Table `db_credistar`.`empleos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`empleos` (
  `empleo_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `empleo_tipo_id` BIGINT(20) NULL DEFAULT NULL,
  `empresa_id` BIGINT(20) NULL DEFAULT NULL,
  `empleo_antiguedad` DECIMAL(10,2) NULL DEFAULT NULL,
  `empleo_jefe_nombre` VARCHAR(50) NULL DEFAULT NULL,
  `empleo_jefe_cargo` VARCHAR(50) NULL DEFAULT NULL,
  `contrato_tipo_id` BIGINT(20) NULL DEFAULT NULL,
  `frecuencia_pago_id` BIGINT(20) NULL DEFAULT NULL,
  `moneda_id` BIGINT(20) NULL DEFAULT NULL,
  `empleo_ingreso_neto` DECIMAL(10,2) NULL DEFAULT NULL,
  `empleo_ingreso_declarado` DECIMAL(10,2) NULL DEFAULT NULL,
  `empleo_comsiones_extras` DECIMAL(10,2) NULL DEFAULT NULL,
  `empleo_imp_deduciones` DECIMAL(10,2) NULL DEFAULT NULL,
  `empleo_hora_contactar` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`empleo_id`),
  INDEX `FK_empleos_empleo_tipo_id_idx` (`empleo_tipo_id` ASC),
  INDEX `FK_empleos_empresa_id_idx` (`empresa_id` ASC),
  INDEX `FK_empleos_contrato_tipo_id_idx` (`contrato_tipo_id` ASC),
  INDEX `FK_empleos_frecuencia_pago_id_idx` (`frecuencia_pago_id` ASC),
  INDEX `FK_empleos_moneda_id_idx` (`moneda_id` ASC),
  CONSTRAINT `FK_empleos_contrato_tipo_id`
    FOREIGN KEY (`contrato_tipo_id`)
    REFERENCES `db_credistar`.`contratos_tipos` (`contrato_tipo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_empleos_empleo_tipo_id`
    FOREIGN KEY (`empleo_tipo_id`)
    REFERENCES `db_credistar`.`empleos_tipos` (`empleo_tipo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_empleos_empresa_id`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `db_credistar`.`empresas` (`empresa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_empleos_frecuencia_pago_id`
    FOREIGN KEY (`frecuencia_pago_id`)
    REFERENCES `db_credistar`.`frecuencias_pagos` (`frecuencia_pago_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_empleos_moneda_id`
    FOREIGN KEY (`moneda_id`)
    REFERENCES `db_credistar`.`monedas` (`moneda_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se almacenara los empleos que actualmente tienen cada uno de los clientes de segundo nivel ingresados, los cuales se realacionaran directmaente con una empresa.';


-- -----------------------------------------------------
-- Table `db_credistar`.`clientes_empleos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`clientes_empleos` (
  `cliente_id` BIGINT(20) NOT NULL,
  `empleo_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`cliente_id`, `empleo_id`),
  INDEX `FK_clientes_empleados_empleo_id_idx` (`empleo_id` ASC),
  CONSTRAINT `FK_clientes_empleados_cliente_id`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `db_credistar`.`clientes` (`entidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_clientes_empleados_empleo_id`
    FOREIGN KEY (`empleo_id`)
    REFERENCES `db_credistar`.`empleos` (`empleo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se almacenara todos los diferentes empleos para las diferentes entidades inclusive si la entidad maneja multiples empleos a la vez.';


-- -----------------------------------------------------
-- Table `db_credistar`.`entidades_tipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`entidades_tipos` (
  `entidad_tipo_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `entidad_tipo_descripcion` VARCHAR(50) NOT NULL,
  `entidad_tipo_abreviatura` VARCHAR(50) NULL DEFAULT NULL,
  `entidad_tipo_generado` VARCHAR(25) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(4) NULL DEFAULT NULL,
  PRIMARY KEY (`entidad_tipo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla la cual contendra los tipos de entidades que puede ser una entidad, como ser: Juridica, Natural, etc.';


-- -----------------------------------------------------
-- Table `db_credistar`.`estados_civiles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`estados_civiles` (
  `estado_civil_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `estado_civil_descripcion` VARCHAR(25) NOT NULL,
  `estado_civil_abreviatura` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`estado_civil_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se definen los diferentes tipos de estados civiles que puede tener una entidad en el sistema.';


-- -----------------------------------------------------
-- Table `db_credistar`.`entidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`entidades` (
  `entidad_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `entidad_primer_nombre` VARCHAR(25) NULL DEFAULT NULL,
  `entidad_segundo_nombre` VARCHAR(25) NULL DEFAULT NULL,
  `entidad_primer_apellido` VARCHAR(25) NULL DEFAULT NULL,
  `entidad_segund_apellido` VARCHAR(25) NULL DEFAULT NULL,
  `entidad_genero` VARCHAR(25) NULL DEFAULT NULL,
  `estado_civil_id` BIGINT(20) NULL DEFAULT NULL,
  `entidad_correo` VARCHAR(50) NULL DEFAULT NULL,
  `entidad_fecha_nacimiento` DATE NULL DEFAULT NULL,
  `entidad_identidad_principal` INT(11) NULL DEFAULT NULL,
  `entidad_rtn` VARCHAR(50) NULL DEFAULT NULL,
  `entidad_imagen` VARCHAR(50) NULL DEFAULT NULL,
  `direccion_id` BIGINT(20) NULL DEFAULT NULL,
  `entidad_tipo_id` BIGINT(20) NULL DEFAULT NULL,
  `entidad_generado` VARCHAR(25) NULL DEFAULT NULL,
  `entidad_usuario_creacion` VARCHAR(25) NULL DEFAULT NULL,
  `entidad_fecha_creacion` DATETIME NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`entidad_id`),
  INDEX `FK_entidades_estado_civil_id_idx` (`estado_civil_id` ASC),
  INDEX `FK_entidades_direccion_id_idx` (`direccion_id` ASC),
  INDEX `FK_entidades_entidad_tipo_id_idx` (`entidad_tipo_id` ASC),
  CONSTRAINT `FK_entidades_direccion_id`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `db_credistar`.`direcciones` (`direccion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_entidades_entidad_tipo_id`
    FOREIGN KEY (`entidad_tipo_id`)
    REFERENCES `db_credistar`.`entidades_tipos` (`entidad_tipo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_entidades_estado_civil_id`
    FOREIGN KEY (`estado_civil_id`)
    REFERENCES `db_credistar`.`estados_civiles` (`estado_civil_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla general en donde se almacenaran las entidades tanto de: clientes de segundo nivel, referencias personales, jefes de empleos, etc. la idea es que esta tabla almacene cualquier dato que se pueda reutilizar luego.';


-- -----------------------------------------------------
-- Table `db_credistar`.`dependientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`dependientes` (
  `cliente_id` BIGINT(20) NOT NULL,
  `entidad_id` BIGINT(20) NOT NULL,
  `dependiente_comentario` VARCHAR(100) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  `subestatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`cliente_id`, `entidad_id`),
  INDEX `FK_dependientes_entidad_id_idx` (`entidad_id` ASC),
  CONSTRAINT `FK_dependientes_cliente_id`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `db_credistar`.`clientes` (`entidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_dependientes_entidad_id`
    FOREIGN KEY (`entidad_id`)
    REFERENCES `db_credistar`.`entidades` (`entidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se almacenaran los dependientes que puede llegar a tener una entidad.';


-- -----------------------------------------------------
-- Table `db_credistar`.`docs_graficos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`docs_graficos` (
  `doc_grafico_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `entidad_id` BIGINT(20) NULL DEFAULT NULL,
  `doc_grafico_registro` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`doc_grafico_id`),
  INDEX `FK_docs_graficos_entidad_id_idx` (`entidad_id` ASC),
  CONSTRAINT `FK_docs_graficos_entidad_id`
    FOREIGN KEY (`entidad_id`)
    REFERENCES `db_credistar`.`entidades` (`entidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se relacionaran los documentos graficos que tiene cada una de las entidades.';


-- -----------------------------------------------------
-- Table `db_credistar`.`entidades_direcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`entidades_direcciones` (
  `entidad_id` BIGINT(20) NOT NULL,
  `direccion_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`entidad_id`, `direccion_id`),
  INDEX `FK_entidades_direcciones_direccion_id_idx` (`direccion_id` ASC),
  CONSTRAINT `FK_entidades_direcciones_direccion_id`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `db_credistar`.`direcciones` (`direccion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_entidades_direcciones_entidad_id`
    FOREIGN KEY (`entidad_id`)
    REFERENCES `db_credistar`.`entidades` (`entidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se registraran las diferentes direcciones de las diferentes entidades, incluso si la entidad maneja varias direcciones.';


-- -----------------------------------------------------
-- Table `db_credistar`.`identificaciones_tipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`identificaciones_tipos` (
  `identificacion_tipo_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `identificacion_tipo_descripcion` VARCHAR(50) NOT NULL,
  `identificacion_tipo_abreviaturas` VARCHAR(50) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`identificacion_tipo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se clasificaran las identificaciones comos ser: cedulas, licencias, pasaportes, etc.';


-- -----------------------------------------------------
-- Table `db_credistar`.`identificaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`identificaciones` (
  `identificacion_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `identificacion_tipo_id` BIGINT(20) NULL DEFAULT NULL,
  `identificacion_numero` VARCHAR(50) NULL DEFAULT NULL,
  `identificacion_registro` VARCHAR(50) NULL DEFAULT NULL,
  `identificacion_dato1` VARCHAR(50) NULL DEFAULT NULL,
  `identificacion_dato2` VARCHAR(50) NULL DEFAULT NULL,
  `identificacion_dato3` VARCHAR(50) NULL DEFAULT NULL,
  `identificacion_comentario` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`identificacion_id`),
  INDEX `FK_identificaciones_identificacion_tipo_id_idx` (`identificacion_tipo_id` ASC),
  CONSTRAINT `FK_identificaciones_identificacion_tipo_id`
    FOREIGN KEY (`identificacion_tipo_id`)
    REFERENCES `db_credistar`.`identificaciones_tipos` (`identificacion_tipo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla la cual almacenara todas las diferentes identificaciones que una sola entidad puede llegar a manejar.';


-- -----------------------------------------------------
-- Table `db_credistar`.`entidades_identificaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`entidades_identificaciones` (
  `entidad_id` BIGINT(20) NOT NULL,
  `identificacion_id` BIGINT(20) NOT NULL,
  `identificacion_principal` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`entidad_id`, `identificacion_id`),
  INDEX `FK_entidades_identificaciones_identificacion_id_idx` (`identificacion_id` ASC),
  CONSTRAINT `FK_entidades_identificaciones_entidad_id`
    FOREIGN KEY (`entidad_id`)
    REFERENCES `db_credistar`.`entidades` (`entidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_entidades_identificaciones_identificacion_id`
    FOREIGN KEY (`identificacion_id`)
    REFERENCES `db_credistar`.`identificaciones` (`identificacion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se relacionaran todas lass identificaciones que puede llegar a poseer una entidad.';


-- -----------------------------------------------------
-- Table `db_credistar`.`telefonos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`telefonos` (
  `telefono_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `telefono_tipo_id` BIGINT(20) NULL DEFAULT NULL,
  `telefono_subtipo_id` BIGINT(20) NULL DEFAULT NULL,
  `telefono_numero` BIGINT(20) NOT NULL,
  `telefono_extesnion` VARCHAR(10) NULL DEFAULT NULL,
  `telefono_abreviatura` VARCHAR(25) NULL DEFAULT NULL,
  `telefono_comentario` VARCHAR(50) NULL DEFAULT NULL,
  `telefono_blacklist` INT(11) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`telefono_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla que servira de registro maestro para los numeros de telefonos de las diferentes entidades del sistema';


-- -----------------------------------------------------
-- Table `db_credistar`.`entidades_telefonos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`entidades_telefonos` (
  `entidad_id` BIGINT(20) NOT NULL,
  `telefono_id` BIGINT(20) NOT NULL,
  `estatus_id` VARCHAR(2) NOT NULL,
  `subestatus_id` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`entidad_id`, `telefono_id`, `estatus_id`, `subestatus_id`),
  INDEX `FK_entidades_telefonos_telefono_id_idx` (`telefono_id` ASC),
  CONSTRAINT `FK_entidades_telefonos_entidad_id`
    FOREIGN KEY (`entidad_id`)
    REFERENCES `db_credistar`.`entidades` (`entidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_entidades_telefonos_telefono_id`
    FOREIGN KEY (`telefono_id`)
    REFERENCES `db_credistar`.`telefonos` (`telefono_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se guardaran los multiples telefonos que le pueden pertenecer a una entidad.';


-- -----------------------------------------------------
-- Table `db_credistar`.`estatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`estatus` (
  `estatus_id` VARCHAR(2) NOT NULL,
  `estatus_desripcion` VARCHAR(25) NOT NULL,
  `estatus_comentario` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`estatus_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla la cual contendra los valores de todos los tipos de estados a ser usado a lo largo de las transacciones y mantenimientos del sistema CrediStar.';


-- -----------------------------------------------------
-- Table `db_credistar`.`grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`grupos` (
  `grupo_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `cia_id` VARCHAR(4) NULL DEFAULT NULL,
  `grupo_nombre` VARCHAR(50) NOT NULL,
  `grupo_abreviatura` VARCHAR(50) NULL DEFAULT NULL,
  `grupo_limite_credito` DECIMAL(10,2) NULL DEFAULT NULL,
  `grupo_limite_score` INT(11) NULL DEFAULT NULL,
  `grupo_limite_cuota` DECIMAL(10,2) NULL DEFAULT NULL,
  `grupo_cambio_estatus` INT(11) NULL DEFAULT NULL,
  `grupo_modificar` INT(11) NULL DEFAULT NULL,
  `grupo_acceso` INT(11) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`grupo_id`),
  INDEX `FK_grupos_cia_id_idx` (`cia_id` ASC),
  CONSTRAINT `FK_grupos_cia_id`
    FOREIGN KEY (`cia_id`)
    REFERENCES `db_credistar`.`cias` (`cia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se registraran los grupos principales de usuarios, esto nos srevira para poder definir los perfiles de accesos y grupos de pantallas';


-- -----------------------------------------------------
-- Table `db_credistar`.`pantallas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`pantallas` (
  `pantalla_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `pantalla_nombre` VARCHAR(50) NOT NULL,
  `pantalla_abreviatura` VARCHAR(50) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`pantalla_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se guardaran todas las pantallas, funciones y consultas del sistema CrediStar, solo para registrar que objetos se desean controlar en el mismo.';


-- -----------------------------------------------------
-- Table `db_credistar`.`grupos_pantallas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`grupos_pantallas` (
  `cia_id` VARCHAR(4) NOT NULL,
  `grupo_id` BIGINT(20) NOT NULL,
  `pantalla_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`cia_id`, `pantalla_id`, `grupo_id`),
  INDEX `FK_grupos_pantallas_grupo_id_idx` (`grupo_id` ASC),
  INDEX `FK_grupos_pantallas_pantalla_id_idx` (`pantalla_id` ASC),
  CONSTRAINT `FK_grupos_pantallas_cia_id`
    FOREIGN KEY (`cia_id`)
    REFERENCES `db_credistar`.`cias` (`cia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_grupos_pantallas_grupo_id`
    FOREIGN KEY (`grupo_id`)
    REFERENCES `db_credistar`.`grupos` (`grupo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_grupos_pantallas_pantalla_id`
    FOREIGN KEY (`pantalla_id`)
    REFERENCES `db_credistar`.`pantallas` (`pantalla_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se definiran cada grupo acceso a que pantallas son las que debera tener, esta asignacion se realizara por compañia.';


-- -----------------------------------------------------
-- Table `db_credistar`.`solicitudes_canales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`solicitudes_canales` (
  `solicitud_canal_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `cia_id` VARCHAR(4) NULL DEFAULT NULL,
  `solicitud_canal_descripcion` VARCHAR(50) NULL DEFAULT NULL,
  `solicitud_canal_abreviatura` VARCHAR(50) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`solicitud_canal_id`),
  INDEX `FK_solicitudes_canales_cia_id_idx` (`cia_id` ASC),
  CONSTRAINT `FK_solicitudes_canales_cia_id`
    FOREIGN KEY (`cia_id`)
    REFERENCES `db_credistar`.`cias` (`cia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se almacenaran que tipos de canales de solicitud pueden existir en la transaccion principal de solicitudes.';


-- -----------------------------------------------------
-- Table `db_credistar`.`solicitudes_tipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`solicitudes_tipos` (
  `solicitud_tipo_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `cia_id` VARCHAR(4) NULL DEFAULT NULL,
  `solicitud_tipo_descripcion` VARCHAR(50) NOT NULL,
  `solicitud_tipo_abreviatura` VARCHAR(50) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`solicitud_tipo_id`),
  INDEX `FK_solicitudes_tipos_cia_id_idx` (`cia_id` ASC),
  CONSTRAINT `FK_solicitudes_tipos_cia_id`
    FOREIGN KEY (`cia_id`)
    REFERENCES `db_credistar`.`cias` (`cia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se almacenaran los diferentes tipos de solicitudes que puede llegar a ser la transaccion de solicitud propiamente.';


-- -----------------------------------------------------
-- Table `db_credistar`.`solicitudes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`solicitudes` (
  `solicitud_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `cia_id` VARCHAR(4) NULL DEFAULT NULL,
  `solicitud_fecha_inicio` DATETIME NULL DEFAULT NULL,
  `solicitud_fecha_cierre` DATETIME NULL DEFAULT NULL,
  `solicitud_prioridad` INT(11) NULL DEFAULT NULL,
  `solicitud_tipo_id` BIGINT(20) NULL DEFAULT NULL,
  `solicitud_canal_id` BIGINT(20) NULL DEFAULT NULL,
  `solicitud_monto` DECIMAL(10,2) NULL DEFAULT NULL,
  `solicitud_cuota` DECIMAL(10,2) NULL DEFAULT NULL,
  `solicitud_plazo` DECIMAL(10,2) NULL DEFAULT NULL,
  `soliciutd_comentario` VARCHAR(50) NULL DEFAULT NULL,
  `soliciutd_score` INT(11) NULL DEFAULT NULL,
  `soliciutd_forzada` INT(11) NULL DEFAULT '0',
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  `subestatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`solicitud_id`),
  INDEX `FK_solicitudes_cia_id_idx` (`cia_id` ASC),
  INDEX `FK_solicitudes_solicitud_tipo_id_idx` (`solicitud_tipo_id` ASC),
  INDEX `FK_solicitudes_solicitud_canal_id_idx` (`solicitud_canal_id` ASC),
  CONSTRAINT `FK_solicitudes_cia_id`
    FOREIGN KEY (`cia_id`)
    REFERENCES `db_credistar`.`cias` (`cia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_solicitudes_solicitud_canal_id`
    FOREIGN KEY (`solicitud_canal_id`)
    REFERENCES `db_credistar`.`solicitudes_canales` (`solicitud_canal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_solicitudes_solicitud_tipo_id`
    FOREIGN KEY (`solicitud_tipo_id`)
    REFERENCES `db_credistar`.`solicitudes_tipos` (`solicitud_tipo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla de transacciones, en esta tabla se guardara el registro que sera el que inicie la afetacion de un credtio para un cliente en especifico.';


-- -----------------------------------------------------
-- Table `db_credistar`.`solicitudes_limites_creditos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`solicitudes_limites_creditos` (
  `solicitud_id` BIGINT(20) NOT NULL,
  `cia_id` VARCHAR(4) NOT NULL,
  `cliente_id` BIGINT(20) NULL DEFAULT NULL,
  `limite_credito_id` BIGINT(20) NULL DEFAULT NULL,
  `limite_credito_factor` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`solicitud_id`, `cia_id`),
  INDEX `FK_solicitudes_limites_creditos_cia_id_idx` (`cia_id` ASC),
  INDEX `FK_solicitudes_limites_creditos_cliente_id_idx` (`cliente_id` ASC),
  CONSTRAINT `FK_solicitudes_limites_creditos_cia_id`
    FOREIGN KEY (`cia_id`)
    REFERENCES `db_credistar`.`cias` (`cia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_solicitudes_limites_creditos_cliente_id`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `db_credistar`.`clientes` (`entidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_solicitudes_limites_creditos_solicitud_id`
    FOREIGN KEY (`solicitud_id`)
    REFERENCES `db_credistar`.`solicitudes` (`solicitud_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se relacioanra la solicitud como afectara el limite de credito para un cliente en especifico.';


-- -----------------------------------------------------
-- Table `db_credistar`.`limites_creditos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`limites_creditos` (
  `limite_credito_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `cia_id` VARCHAR(4) NULL DEFAULT NULL,
  `limite_credito_rango_score` INT(11) NULL DEFAULT NULL,
  `limite_credito_rango_ingreso` DECIMAL(10,2) NULL DEFAULT NULL,
  `limite_credito_tipo` VARCHAR(25) NULL DEFAULT NULL,
  `limite_credito_operacion` VARCHAR(25) NULL DEFAULT NULL,
  `limite_credito_afectacion` VARCHAR(25) NULL DEFAULT NULL,
  `limite_credito_valor` DECIMAL(10,2) NULL DEFAULT NULL,
  `limite_credito_dato1` VARCHAR(50) NULL DEFAULT NULL,
  `limite_credito_dato2` VARCHAR(50) NULL DEFAULT NULL,
  `limite_credito_factor` DECIMAL(10,2) NULL DEFAULT NULL,
  `limite_credito_estatus` VARCHAR(25) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  `solicitudes_limites_creditos_solicitud_id` BIGINT(20) NOT NULL,
  `solicitudes_limites_creditos_cia_id` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`limite_credito_id`),
  INDEX `FK_limites_creditos_cia_id_idx` (`cia_id` ASC),
  INDEX `FK_limites_creditos_solicitudes_limites_creditos1_idx` (`solicitudes_limites_creditos_solicitud_id` ASC, `solicitudes_limites_creditos_cia_id` ASC),
  CONSTRAINT `FK_limites_creditos_cia_id`
    FOREIGN KEY (`cia_id`)
    REFERENCES `db_credistar`.`cias` (`cia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_limites_creditos_solicitudes_limites_creditos1`
    FOREIGN KEY (`solicitudes_limites_creditos_solicitud_id` , `solicitudes_limites_creditos_cia_id`)
    REFERENCES `db_credistar`.`solicitudes_limites_creditos` (`solicitud_id` , `cia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se guardaran los calculos para las afectaciones de los limites de credito segun sea la afectacion  resultante del score que se haya determinado por el sistema  CrediStar.';


-- -----------------------------------------------------
-- Table `db_credistar`.`propiedades_tipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`propiedades_tipos` (
  `propiedad_tipo_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `propiedad_tipo_descripcion` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`propiedad_tipo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se definiran los tipos de propiedades que puede llegar a tener una entidad general de propiedades.';


-- -----------------------------------------------------
-- Table `db_credistar`.`propiedades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`propiedades` (
  `propiedad_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `propiedad_descripcion` VARCHAR(50) NULL DEFAULT NULL,
  `propiedad_tipo_id` BIGINT(20) NULL DEFAULT NULL,
  `propiedad_comentario` VARCHAR(100) NULL DEFAULT NULL,
  `propiedad_valor` DECIMAL(10,2) NULL DEFAULT NULL,
  `propiedad_registro` VARCHAR(50) NULL DEFAULT NULL,
  `direccion_id` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`propiedad_id`),
  INDEX `FK_propiedades_propiedad_tipo_id_idx` (`propiedad_tipo_id` ASC),
  INDEX `FK_propiedades_direccion_id_idx` (`direccion_id` ASC),
  CONSTRAINT `FK_propiedades_direccion_id`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `db_credistar`.`direcciones` (`direccion_id`)
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_propiedades_propiedad_tipo_id`
    FOREIGN KEY (`propiedad_tipo_id`)
    REFERENCES `db_credistar`.`propiedades_tipos` (`propiedad_tipo_id`)
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se ingresaran las propiedades que puede llegar a tener un cliente de segun do nivel registrado en el sistema CrediStar.';


-- -----------------------------------------------------
-- Table `db_credistar`.`referencias_relaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`referencias_relaciones` (
  `referencia_relacion_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `referencia_relacion_descripcion` VARCHAR(50) NOT NULL,
  `referencia_relacion_abreviatura` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`referencia_relacion_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se definiaran los tipos de relaciones que se puede tener ante una referencia personal que haya brindado un cliente de segundo nivel';


-- -----------------------------------------------------
-- Table `db_credistar`.`referencias_personales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`referencias_personales` (
  `referencia_personal_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `entidad_id` BIGINT(20) NULL DEFAULT NULL,
  `referencia_relacion_id` BIGINT(20) NULL DEFAULT NULL,
  `referencias_personales_antiguedad` DECIMAL(10,2) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`referencia_personal_id`),
  INDEX `FK_referencias_personales_entidad_id_idx` (`entidad_id` ASC),
  INDEX `FK_referencias_personales_referencia_relacion_id_idx` (`referencia_relacion_id` ASC),
  CONSTRAINT `FK_referencias_personales_entidad_id`
    FOREIGN KEY (`entidad_id`)
    REFERENCES `db_credistar`.`entidades` (`entidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_referencias_personales_referencia_relacion_id`
    FOREIGN KEY (`referencia_relacion_id`)
    REFERENCES `db_credistar`.`referencias_relaciones` (`referencia_relacion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se relacionaran las diferentes  referencias personales que puede llegar a tener una entidad.';


-- -----------------------------------------------------
-- Table `db_credistar`.`scores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`scores` (
  `score_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `cia_id` VARCHAR(4) NULL DEFAULT NULL,
  `score_descripcion` VARCHAR(50) NULL DEFAULT NULL,
  `score_variable` VARCHAR(50) NULL DEFAULT NULL,
  `score_validacion` VARCHAR(50) NULL DEFAULT NULL,
  `score_puntaje` INT(11) NULL DEFAULT NULL,
  `score_abreviatura` VARCHAR(50) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`score_id`),
  INDEX `FK_scores_cia_id_idx` (`cia_id` ASC),
  CONSTRAINT `FK_scores_cia_id`
    FOREIGN KEY (`cia_id`)
    REFERENCES `db_credistar`.`cias` (`cia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se guardaran las configuraciones de los Scores de cada compañia en el sistema CrediStar';


-- -----------------------------------------------------
-- Table `db_credistar`.`solicitudes_docs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`solicitudes_docs` (
  `solicitud_doc_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `solicitud_id` BIGINT(20) NOT NULL,
  `solicitud_doc_comentario` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`solicitud_doc_id`, `solicitud_id`),
  INDEX `FK_solicitudes_docs_solicitud_id_idx` (`solicitud_id` ASC),
  CONSTRAINT `FK_solicitudes_docs_solicitud_id`
    FOREIGN KEY (`solicitud_id`)
    REFERENCES `db_credistar`.`solicitudes` (`solicitud_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'tabla en donde se almacenaran los diferentes documentos graficos que seran ligados a una solicitud en particular por el cliente de primer nivel.';


-- -----------------------------------------------------
-- Table `db_credistar`.`solicitudes_scores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`solicitudes_scores` (
  `solicitud_id` BIGINT(20) NOT NULL,
  `cia_id` VARCHAR(4) NOT NULL,
  `cliente_id` BIGINT(20) NULL DEFAULT NULL,
  `score_id` BIGINT(20) NULL DEFAULT NULL,
  `solicitud_score_puntaje` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`solicitud_id`, `cia_id`),
  INDEX `FK_solicitudes_scores_cia_id_idx` (`cia_id` ASC),
  INDEX `FK_solicitudes_scores_cliente_id_idx` (`cliente_id` ASC),
  INDEX `FK_solicitudes_scores_score_id_idx` (`score_id` ASC),
  CONSTRAINT `FK_solicitudes_scores_cia_id`
    FOREIGN KEY (`cia_id`)
    REFERENCES `db_credistar`.`cias` (`cia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_solicitudes_scores_cliente_id`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `db_credistar`.`clientes` (`entidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_solicitudes_scores_score_id`
    FOREIGN KEY (`score_id`)
    REFERENCES `db_credistar`.`scores` (`score_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_solicitudes_scores_solicitud_id`
    FOREIGN KEY (`solicitud_id`)
    REFERENCES `db_credistar`.`solicitudes` (`solicitud_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se almacenaran los scores que ha obtenido un cliente de segundo nivel vinculado a una solicitud creada en el sistema CrediStar.';


-- -----------------------------------------------------
-- Table `db_credistar`.`sub_estatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`sub_estatus` (
  `estatus_id` VARCHAR(2) NOT NULL,
  `subestatus_id` VARCHAR(2) NOT NULL,
  `subestatus_descripcion` VARCHAR(25) NOT NULL,
  `subestatus_comentario` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`estatus_id`, `subestatus_id`),
  CONSTRAINT `FK_estatus_id`
    FOREIGN KEY (`estatus_id`)
    REFERENCES `db_credistar`.`estatus` (`estatus_id`)
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla que contrenda los sub estados para cada uno de los estados principales que se definieron en la tabla [estatus], esto es para saber por que tipo de fase u operacion va un proceso que se encuentre en un estado iniciado.';


-- -----------------------------------------------------
-- Table `db_credistar`.`sucursales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`sucursales` (
  `sucursal_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `cia_id` VARCHAR(4) NULL DEFAULT NULL,
  `sucursal_descripcion` VARCHAR(50) NULL DEFAULT NULL,
  `sucursal_abreviatura` VARCHAR(50) NULL DEFAULT NULL,
  `pais_id` BIGINT(20) NULL DEFAULT NULL,
  `depto_id` BIGINT(20) NULL DEFAULT NULL,
  `municipio_id` BIGINT(20) NULL DEFAULT NULL,
  `colonia_id` BIGINT(20) NULL DEFAULT NULL,
  `sucursal_direccion` VARCHAR(100) NULL DEFAULT NULL,
  `sucrsal_telefono1` VARCHAR(25) NULL DEFAULT NULL,
  `sucrsal_telefono2` VARCHAR(25) NULL DEFAULT NULL,
  `sucrsal_encargado` VARCHAR(50) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`sucursal_id`),
  INDEX `FK_sucursales_cia_id_idx` (`cia_id` ASC),
  INDEX `FK_sucursales_pais_id_idx` (`pais_id` ASC),
  INDEX `departamento_id_idx` (`depto_id` ASC),
  INDEX `FK_sucursales_municipio_id_idx` (`municipio_id` ASC),
  INDEX `FK_sucursales_colonia_id_idx` (`colonia_id` ASC),
  CONSTRAINT `FK_sucursales_cia_id`
    FOREIGN KEY (`cia_id`)
    REFERENCES `db_credistar`.`cias` (`cia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_sucursales_colonia_id`
    FOREIGN KEY (`colonia_id`)
    REFERENCES `db_credistar`.`colonias` (`colonia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_sucursales_deptos_id`
    FOREIGN KEY (`depto_id`)
    REFERENCES `db_credistar`.`departamentos` (`depto_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_sucursales_municipio_id`
    FOREIGN KEY (`municipio_id`)
    REFERENCES `db_credistar`.`municipios` (`municipio_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_sucursales_pais_id`
    FOREIGN KEY (`pais_id`)
    REFERENCES `db_credistar`.`pais` (`pais_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se almacenaran las sucursales de las compañias clientes primer nivel del sistema CrediStar.';


-- -----------------------------------------------------
-- Table `db_credistar`.`sys_config`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`sys_config` (
  `sys_config_id` BIGINT(20) NOT NULL,
  `sys_config_nombre` VARCHAR(50) NULL DEFAULT NULL,
  `sys_config_descripcion` VARCHAR(80) NULL DEFAULT NULL,
  `sys_config_logo` VARCHAR(80) NULL DEFAULT NULL,
  `sys_config_mision` VARCHAR(200) NULL DEFAULT NULL,
  `sys_config_vision` VARCHAR(200) NULL DEFAULT NULL,
  `sys_config_valor` VARCHAR(200) NULL DEFAULT NULL,
  `sys_config_correo` VARCHAR(50) NULL DEFAULT NULL,
  `sys_config_ruta` VARCHAR(50) NULL DEFAULT NULL,
  `sys_confug_bd` VARCHAR(50) NULL DEFAULT NULL,
  `sys_config_llave` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Campo en donde se guardara la llave encriptada del producto para que solo pueda ser generado desde un servidor web que ya previamente fue definido. (En estado de prototipo)',
  PRIMARY KEY (`sys_config_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se guardaran todas las configuraciones generales del programa CrediStar como tal, estos registros no tienen impacto sobre la informacion transaccional que se guarda y se aplicara por igual a todas compañias que lo utilicen.';


-- -----------------------------------------------------
-- Table `db_credistar`.`sys_scores_cortes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`sys_scores_cortes` (
  `cia_id` VARCHAR(4) NOT NULL,
  `score_variable` VARCHAR(50) NOT NULL,
  `sys_score_corte_puntaje` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cia_id`, `score_variable`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se guardaran las configuraciones globales para los cortes de un scores, como ser la edad >30 años, tiene un score meta de 300 el cual sera su valor de corte por compañia ya que diferentes compañias tendran diferentes cortes o metas.';


-- -----------------------------------------------------
-- Table `db_credistar`.`telefonos_subtipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`telefonos_subtipos` (
  `telefono_subtipo_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `telefono_subtipo_descripcion` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`telefono_subtipo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se definiran los subtipos de telefonos que puede tener una entidad como ser de un telefono tipo [Celular] tiene un subtipo [Principal]';


-- -----------------------------------------------------
-- Table `db_credistar`.`telefonos_tipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`telefonos_tipos` (
  `telefono_tipo_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `telefono_descripcion` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`telefono_tipo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se definiran los tipos de telefonos que puede llegar a tener una entidad y como se clasificaran';


-- -----------------------------------------------------
-- Table `db_credistar`.`titulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`titulos` (
  `titulo_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `titulo_descripcion` VARCHAR(50) NOT NULL,
  `titulo_abreviatura` VARCHAR(50) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`titulo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se guardaran los titulos de caracter educativo que puede llegar a tener un cliente de segundo nivel en el sistema	';


-- -----------------------------------------------------
-- Table `db_credistar`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`usuarios` (
  `usuario_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `usuario_alias` VARCHAR(25) NOT NULL,
  `usuario_nombre` VARCHAR(50) NULL DEFAULT NULL,
  `usuario_apellido` VARCHAR(50) NULL DEFAULT NULL,
  `usuario_cel` VARCHAR(50) NULL DEFAULT NULL,
  `usuario_telefono` VARCHAR(50) NULL DEFAULT NULL,
  `usuario_foto` VARCHAR(50) NULL DEFAULT NULL,
  `usuario_isadmin` INT(11) NULL DEFAULT NULL,
  `estatus_id` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`usuario_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se registraran todos los usuarios del sistema, con este registro y dependiendo de su nivel de acceso es donde se podra definir la seguridad a cada usuario.';


-- -----------------------------------------------------
-- Table `db_credistar`.`usuarios_cias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`usuarios_cias` (
  `usuario_id` BIGINT(20) NOT NULL,
  `cia_id` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`usuario_id`, `cia_id`),
  INDEX `FK_usuarios_cias_cia_id_idx` (`cia_id` ASC),
  CONSTRAINT `FK_usuarios_cias_cia_id`
    FOREIGN KEY (`cia_id`)
    REFERENCES `db_credistar`.`cias` (`cia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_usuarios_cias_usuario_id`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `db_credistar`.`usuarios` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se almacenaran los usuarios y a que compañias tienen accesos.';


-- -----------------------------------------------------
-- Table `db_credistar`.`usuarios_grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_credistar`.`usuarios_grupos` (
  `usuario_id` BIGINT(20) NOT NULL,
  `grupo_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`usuario_id`, `grupo_id`),
  INDEX `FK_usuarios_grupos_grupo_id_idx` (`grupo_id` ASC),
  CONSTRAINT `FK_usuarios_grupos_grupo_id`
    FOREIGN KEY (`grupo_id`)
    REFERENCES `db_credistar`.`grupos` (`grupo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_usuarios_grupos_usuario_id`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `db_credistar`.`usuarios` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Tabla en donde se registraran los usuarios a que grupo o perfil en particular peretenecen.';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
