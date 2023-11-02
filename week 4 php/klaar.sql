-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema gameraccount
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gameraccount
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gameraccount` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `gameraccount` ;

-- -----------------------------------------------------
-- Table `gameraccount`.`achievments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gameraccount`.`achievments` ;

CREATE TABLE IF NOT EXISTS `gameraccount`.`achievments` (
  `achievmentsID` INT NOT NULL,
  `bronze` VARCHAR(45) NULL DEFAULT NULL,
  `silver` VARCHAR(45) NULL DEFAULT NULL,
  `gold` VARCHAR(45) NULL DEFAULT NULL,
  `platinum` VARCHAR(45) NULL DEFAULT NULL,
  `achievments behaald` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`achievmentsID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gameraccount`.`game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gameraccount`.`game` ;

CREATE TABLE IF NOT EXISTS `gameraccount`.`game` (
  `gameID` INT NOT NULL,
  `level` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`gameID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gameraccount`.`game abbonament`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gameraccount`.`game abbonament` ;

CREATE TABLE IF NOT EXISTS `gameraccount`.`game abbonament` (
  `game abbonamentID` INT NOT NULL,
  `battlerpass` VARCHAR(45) NULL DEFAULT NULL,
  `game` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`game abbonamentID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gameraccount`.`gamer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gameraccount`.`gamer` ;

CREATE TABLE IF NOT EXISTS `gameraccount`.`gamer` (
  `username` VARCHAR(45) NOT NULL,
  `leftijd` INT NULL DEFAULT NULL,
  `games` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gameraccount`.`achievments_has_gamer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gameraccount`.`achievments_has_gamer` ;

CREATE TABLE IF NOT EXISTS `gameraccount`.`achievments_has_gamer` (
  `achievments_achievmentsID` INT NOT NULL,
  `gamer_username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`achievments_achievmentsID`, `gamer_username`),
  INDEX `fk_achievments_has_gamer_gamer1_idx` (`gamer_username` ASC) VISIBLE,
  INDEX `fk_achievments_has_gamer_achievments_idx` (`achievments_achievmentsID` ASC) VISIBLE,
  CONSTRAINT `fk_achievments_has_gamer_achievments`
    FOREIGN KEY (`achievments_achievmentsID`)
    REFERENCES `gameraccount`.`achievments` (`achievmentsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_achievments_has_gamer_gamer1`
    FOREIGN KEY (`gamer_username`)
    REFERENCES `gameraccount`.`gamer` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gameraccount`.`game_has_gamer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gameraccount`.`game_has_gamer` ;

CREATE TABLE IF NOT EXISTS `gameraccount`.`game_has_gamer` (
  `game_gameID` INT NOT NULL,
  `gamer_username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`game_gameID`, `gamer_username`),
  INDEX `fk_game_has_gamer_gamer1_idx` (`gamer_username` ASC) VISIBLE,
  INDEX `fk_game_has_gamer_game1_idx` (`game_gameID` ASC) VISIBLE,
  CONSTRAINT `fk_game_has_gamer_game1`
    FOREIGN KEY (`game_gameID`)
    REFERENCES `gameraccount`.`game` (`gameID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_has_gamer_gamer1`
    FOREIGN KEY (`gamer_username`)
    REFERENCES `gameraccount`.`gamer` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gameraccount`.`game abbonament_has_gamer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gameraccount`.`game abbonament_has_gamer` ;

CREATE TABLE IF NOT EXISTS `gameraccount`.`game abbonament_has_gamer` (
  `game abbonament_game abbonamentID` INT NOT NULL,
  `gamer_username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`game abbonament_game abbonamentID`, `gamer_username`),
  INDEX `fk_game abbonament_has_gamer_gamer1_idx` (`gamer_username` ASC) VISIBLE,
  INDEX `fk_game abbonament_has_gamer_game abbonament1_idx` (`game abbonament_game abbonamentID` ASC) VISIBLE,
  CONSTRAINT `fk_game abbonament_has_gamer_game abbonament1`
    FOREIGN KEY (`game abbonament_game abbonamentID`)
    REFERENCES `gameraccount`.`game abbonament` (`game abbonamentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game abbonament_has_gamer_gamer1`
    FOREIGN KEY (`gamer_username`)
    REFERENCES `gameraccount`.`gamer` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
