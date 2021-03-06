-- MySQL Script generated by MySQL Workbench
-- Wed Nov 24 08:52:58 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8 ;
USE `biblioteca` ;

-- -----------------------------------------------------
-- Table `biblioteca`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`rol` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`usuario` (
  `id` INT NOT NULL,
  `usuario` VARCHAR(50) NOT NULL,
  `pasword` VARCHAR(100) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`usuario_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`usuario_rol` (
  `id` INT NOT NULL,
  `estado` INT NOT NULL,
  `rol_id1` INT NOT NULL,
  `usuario_id1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_rol_rol1_idx` (`rol_id1` ASC) VISIBLE,
  INDEX `fk_usuario_rol_usuario1_idx` (`usuario_id1` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_rol_rol1`
    FOREIGN KEY (`rol_id1`)
    REFERENCES `biblioteca`.`rol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_rol_usuario1`
    FOREIGN KEY (`usuario_id1`)
    REFERENCES `biblioteca`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`permiso` (
  `id` INT NOT NULL,
  `rol_id` INT NOT NULL,
  `permiso_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`permiso_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`permiso_rol` (
  `id` INT NOT NULL,
  `rol_id1` INT NOT NULL,
  `permiso_id1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_permiso_rol_rol1_idx` (`rol_id1` ASC) VISIBLE,
  INDEX `fk_permiso_rol_permiso1_idx` (`permiso_id1` ASC) VISIBLE,
  CONSTRAINT `fk_permiso_rol_rol1`
    FOREIGN KEY (`rol_id1`)
    REFERENCES `biblioteca`.`rol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_permiso_rol_permiso1`
    FOREIGN KEY (`permiso_id1`)
    REFERENCES `biblioteca`.`permiso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`libro` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `isbn` VARCHAR(30) NOT NULL,
  `autor` VARCHAR(100) NOT NULL,
  `cantidad` TINYINT(2) NOT NULL,
  `editorial` VARCHAR(50) NOT NULL,
  `fotol` VARCHAR(100) NOT NULL,
  `librocol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`lobro_prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`lobro_prestamo` (
  `id` INT NOT NULL,
  `fecha_prestamo` DATE NOT NULL,
  `prestamo_a` VARCHAR(100) NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  `fecha_devolucion` DATE NULL,
  `libro_id1` INT NOT NULL,
  `usuario_id1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lobro_prestamo_libro_idx` (`libro_id1` ASC) VISIBLE,
  INDEX `fk_lobro_prestamo_usuario1_idx` (`usuario_id1` ASC) VISIBLE,
  CONSTRAINT `fk_lobro_prestamo_libro`
    FOREIGN KEY (`libro_id1`)
    REFERENCES `biblioteca`.`libro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lobro_prestamo_usuario1`
    FOREIGN KEY (`usuario_id1`)
    REFERENCES `biblioteca`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
