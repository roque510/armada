Acordate de actualizar la base con este nuevo archivo de sql agruegue las identificaciones

CAMBIO EN BASE DE DATOS
Entidad : agregar antes de estatus_id campo llamado "entidad_nacionalidad"
Pais: Cambio de nombre en campo pais_region por flag

ALTER TABLE `direcciones` CHANGE `direccion_antiguedad` `direccion_antiguedad` DATE NULL DEFAULT '0.00';
ALTER TABLE `empleos` ADD `empleo_nombre` VARCHAR(50) NOT NULL AFTER `empleo_id`, ADD `entidad_id` BIGINT NOT NULL AFTER `empleo_nombre`;
ALTER TABLE `empleos` DROP FOREIGN KEY `FK_empleos_empresa_id`;
ALTER TABLE `empleos` DROP `empresa_id`;
INSERT INTO `db_credistar`.`contratos_tipos` (`contrato_tipo_id`, `contrato_tipo_descripcion`) VALUES (NULL, ''), (NULL, 'Independiente Informal'), (NULL, 'Independiente Formal'), (NULL, 'Asalariado Privado'), (NULL, 'Gobierno');
INSERT INTO `db_credistar`.`frecuencias_pagos` (`frecuencia_pago_id`, `frecuencia_pago_descripcion`) VALUES (NULL, 'Mensual'), (NULL, 'Quincenal'), (NULL, 'Semanal'), (NULL, 'Diario');
INSERT INTO `db_credistar`.`monedas` (`moneda_id`, `moneda_descripcion`, `moneda_simbolo`) VALUES (NULL, 'Lempiras', NULL), (NULL, 'Dolares', NULL), (NULL, 'Euros', NULL);
ALTER TABLE `empleos` ADD `direccion_id` INT NOT NULL ;
ALTER TABLE `empleos` ADD `telefono_id` INT NOT NULL ;
ALTER TABLE `empleos` CHANGE `empleo_jefe_cargo` `empleo_jefe_cargo_id` INT NULL DEFAULT NULL;
ALTER TABLE `empleos` ADD `empleo_cargo_id` INT NOT NULL AFTER `empleo_nombre`;
ALTER TABLE `empleos` DROP FOREIGN KEY `FK_empleos_empleo_tipo_id`;
ALTER TABLE `empleos` CHANGE `empleo_ingreso_neto` `empleo_ingreso_neto` DECIMAL(10,2) NULL DEFAULT '0';
ALTER TABLE `propiedades_tipos` ADD `propiedad_descripcion` VARCHAR(50) NOT NULL ;
ALTER TABLE `propiedades` ADD `entidad_id` INT NOT NULL ;
INSERT INTO `db_credistar`.`referencias_relaciones` (`referencia_relacion_id`, `referencia_relacion_descripcion`, `referencia_relacion_abreviatura`) VALUES (NULL, 'Amigo', NULL), (NULL, 'Familiar', NULL), (NULL, 'Compañero de Trabajo', NULL);
ALTER TABLE `referencias_personales` CHANGE `referencias_personales_antiguedad` `referencias_personales_antiguedad` DATE NULL DEFAULT NULL;
ALTER TABLE `referencias_personales` ADD `referencia_pnombre` VARCHAR(50) NOT NULL , ADD `referencia_snombre` VARCHAR(50) NOT NULL , ADD `referencia_papellido` VARCHAR(50) NOT NULL , ADD `referencia_sapellido` VARCHAR(50) NOT NULL , ADD `referencia_tipo_tel` INT NOT NULL , ADD `referencia_telefono` INT NOT NULL , ADD `referencia_extension` INT NOT NULL , ADD `referencia_hora_contacto` INT NOT NULL , ADD `referencia_generico1` INT NOT NULL ;
ALTER TABLE `referencias_personales` ADD `referencia_nid` INT NOT NULL , ADD `referencia_fechanac` DATE NOT NULL ;
ALTER TABLE `clientes` ADD `cliente_tipo` INT NOT NULL AFTER `cliente_id`;
ALTER TABLE `solicitudes` CHANGE `soliciutd_comentario` `soliciutd_comentario` VARCHAR(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;
ALTER TABLE `clientes` ADD `cliente_cuota_sugerida` BIGINT NOT NULL AFTER `cliente_cuota`, ADD `cliente_limite_sugerido` BIGINT NOT NULL AFTER `cliente_cuota_sugerida`;
INSERT INTO `db_credistar`.`estatus` (`estatus_id`, `estatus_desripcion`, `estatus_comentario`) VALUES ('8', 'devuelta', 'solicitud');
-----------------------------

ALTER TABLE  `entidades_telefonos` ADD  `telefono_id2` BIGINT( 20 ) NOT NULL AFTER  `telefono_id` ,
ADD  `telefono_id3` BIGINT( 20 ) NOT NULL AFTER  `telefono_id2`
ALTER TABLE  `empleos` ADD  `empleo_ingreso_bruto` DECIMAL( 10, 2 ) NOT NULL AFTER  `empleo_ingreso_declarado`
CREATE TABLE IF NOT EXISTS `blacklist_identidad` (
  `blacklist_id` int(11) NOT NULL AUTO_INCREMENT,
  `blacklist_identidad` varchar(30) NOT NULL,
  PRIMARY KEY (`blacklist_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;
INSERT INTO  `db_credistar`.`estatus` (
`estatus_id` ,
`estatus_desripcion` ,
`estatus_comentario`
)
VALUES (
'10',  'positiva',  'telefono'
), (
'11',  'negativa',  'telefono'
), (
'12',  'sin telefono',  'telefono'
);
CREATE TABLE IF NOT EXISTS `verificacion_telefonos` (
  `entidad_id` int(11) NOT NULL,
  `telspersonales` tinyint(1) NOT NULL,
  `teltrabajo` tinyint(1) NOT NULL,
  `telref1` tinyint(1) NOT NULL,
  `telref2` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE  `solicitudes` ADD  `solicitud_comentario_analista` TEXT NOT NULL AFTER  `soliciutd_comentario`

INSERT INTO `db_credistar`.`estados_civiles` (`estado_civil_id`, `estado_civil_descripcion`, `estado_civil_abreviatura`) VALUES (NULL, 'Conyugue', NULL);

ALTER TABLE `direcciones` ADD `direccion_year` INT NOT NULL AFTER `direccion_antiguedad`, ADD `direccion_month` INT NOT NULL AFTER `direccion_year`;

ALTER TABLE `empleos` ADD `empleo_year` INT NOT NULL AFTER `empleo_antiguedad`, ADD `empleo_month` INT NOT NULL AFTER `empleo_year`;

ALTER TABLE  `referencias_personales` ADD  `ref_year` INT NOT NULL AFTER  `referencias_personales_antiguedad` ,
ADD  `ref_month` INT NOT NULL AFTER  `ref_year`

Nota: a la base de datos fue agregada la tabla usuarios_solicitudes.
	el motivo de esta es porque, una ves que cierto analista tome la solicitud
	esta no podra ser modificada por nadie mas que el analista que la tome.
