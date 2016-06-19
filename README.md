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

Nota: a la base de datos fue agregada la tabla usuarios_solicitudes.
	el motivo de esta es porque, una ves que cierto analista tome la solicitud
	esta no podra ser modificada por nadie mas que el analista que la tome.
