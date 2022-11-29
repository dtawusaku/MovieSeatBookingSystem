-- MySQL Script generated by MySQL Workbench
-- Tue Nov 29 06:11:25 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema moviebook
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema moviebook
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `moviebook` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `moviebook` ;

-- -----------------------------------------------------
-- Table `movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `image_path` VARCHAR(500) NULL,
  `genre` VARCHAR(45) NULL,
  `price` INT NOT NULL,
  `duration` TIME NULL,
  `release_date` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `theatre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `theatre` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `seat_no` INT NOT NULL,
  `available_seat` INT NOT NULL,
  `movie_id` INT NOT NULL,
  PRIMARY KEY (`id`, `movie_id`),
  INDEX `fk_theatre_movie1_idx` (`movie_id` ASC),
  CONSTRAINT `fk_theatre_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ticket` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ticket_id` VARCHAR(45) NULL,
  `movie_id` INT NOT NULL,
  `time` TIME NULL,
  `venue` VARCHAR(45) NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`id`, `movie_id`),
  INDEX `fk_ticket_movie_idx` (`movie_id` ASC),
  CONSTRAINT `fk_ticket_movie`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(100) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;