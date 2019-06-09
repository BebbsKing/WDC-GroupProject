-- Sat 07 Jun 2019
-- WDC Database

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` INT NOT NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `phone` VARCHAR(20) NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Restaurant` (
  `idRestaurant` INT NOT NULL,
  `rating` INT NULL,
  `phone` VARCHAR(20) NULL,
  `email` VARCHAR(90) NULL,
  `restaurantName` VARCHAR(45) NULL,
  `restaurateurFirst` VARCHAR(45) NULL,
  `restaurateurLast` VARCHAR(45) NULL,
  PRIMARY KEY (`idRestaurant`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reservation` (
  `idReservation` INT NOT NULL,
  `date` DATETIME NULL,
  `seats` INT NULL,
  `rating` INT NULL,
  `fk_idUser` INT NOT NULL,
  `fk_idRestaurant` INT NOT NULL,
  PRIMARY KEY (`idReservation`, `fk_idUser`, `fk_idRestaurant`),
  INDEX `fk_Reservation_User_idx` (`fk_idUser` ASC) VISIBLE,
  INDEX `fk_Reservation_Restaurant1_idx` (`fk_idRestaurant` ASC) VISIBLE,
  CONSTRAINT `fk_Reservation_User`
    FOREIGN KEY (`fk_idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservation_Restaurant1`
    FOREIGN KEY (`fk_idRestaurant`)
    REFERENCES `mydb`.`Restaurant` (`idRestaurant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TableLayout`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TableLayout` (
  `idTableLayout` INT NOT NULL,
  `seats` INT NULL,
  `count` INT NULL,
  `fk_idRestaurant` INT NOT NULL,
  PRIMARY KEY (`idTableLayout`, `fk_idRestaurant`),
  INDEX `fk_TableLayout_Restaurant1_idx` (`fk_idRestaurant` ASC) VISIBLE,
  CONSTRAINT `fk_TableLayout_Restaurant1`
    FOREIGN KEY (`fk_idRestaurant`)
    REFERENCES `mydb`.`Restaurant` (`idRestaurant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
  `idAddress` INT NOT NULL,
  `lat` FLOAT(10,6) NULL,
  `lng` FLOAT(10,6) NULL,
  `addressLine1` VARCHAR(45) NULL,
  `addressLine2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `postcode` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `fk_idRestaurant` INT NOT NULL,
  PRIMARY KEY (`idAddress`, `fk_idRestaurant`),
  INDEX `fk_Address_Restaurant1_idx` (`fk_idRestaurant` ASC) VISIBLE,
  CONSTRAINT `fk_Address_Restaurant1`
    FOREIGN KEY (`fk_idRestaurant`)
    REFERENCES `mydb`.`Restaurant` (`idRestaurant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
