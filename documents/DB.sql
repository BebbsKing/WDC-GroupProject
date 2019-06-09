-- MySQL Script generated by 'My bare hands after my local instance of MariaDB killed MySQL and MySQL Workbench went full retard'
-- Sun 09 Jun 2019 19:10:21 ACST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

--SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
--SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
--SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
--CREATE SCHEMA mydb ;
--USE mydb ;

-- -----------------------------------------------------
-- Table `mydb`.`Cust`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Cust (
  `idCust` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `email` VARCHAR(90) NULL,
  `phone` VARCHAR(20) NULL
  ) ENGINE = Aria;


-- -----------------------------------------------------
-- Table `mydb`.`Restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Restaurant (
  `idRestaurant` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `rating` SMALLINT NULL,
  `phone` VARCHAR(20) NULL,
  `email` VARCHAR(90) NULL,
  `restaurantName` VARCHAR(45) NULL,
  `restaurateurFirst` VARCHAR(45) NULL,
  `restaurateurLast` VARCHAR(45) NULL
  ) ENGINE = Aria;


-- -----------------------------------------------------
-- Table `mydb`.`Reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Reservation (
  `idReservation` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `date` DATETIME NULL,
  `seats` SMALLINT NULL,
  `rating` SMALLINT NULL,
  `fk_idCust` INT NOT NULL,
  `fk_idRestaurant` INT NOT NULL,
  CONSTRAINT `fk_idCust`
    FOREIGN KEY (fk_idCust) REFERENCES Cust (idCust),
  CONSTRAINT `fk_idRestaurant`
    FOREIGN KEY (fk_idRestaurant) REFERENCES Restaurant (fk_idRestaurant)
  ) ENGINE = Aria;


-- -----------------------------------------------------
-- Table `mydb`.`TableLayout`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS TableLayout (
  `idTableLayout` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `seats` SMALLINT NULL,
  `count` SMALLINT NULL,
  `fk_idRestaurant` INT NOT NULL,
  CONSTRAINT `fk_idRestaurant`
    FOREIGN KEY (fk_idRestaurant) REFERENCES Restaurant (fk_idRestaurant)
  ) ENGINE = Aria;


-- -----------------------------------------------------
-- Table `mydb`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Address (
  `idAddress` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `lat` FLOAT(10,6) NULL,
  `lng` FLOAT(10,6) NULL,
  `addressLine1` VARCHAR(45) NULL,
  `addressLine2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `postcode` VARCHAR(20) NULL,
  `state` VARCHAR(45) NULL,
  `fk_idRestaurant` INT NOT NULL,
  CONSTRAINT `fk_idRestaurant`
    FOREIGN KEY (fk_idRestaurant) REFERENCES Restaurant (fk_idRestaurant)
  ) ENGINE = Aria;


--SET SQL_MODE=@OLD_SQL_MODE;
--SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
--SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
