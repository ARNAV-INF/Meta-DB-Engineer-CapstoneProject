-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Little_Lemon_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Little_Lemon_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Little_Lemon_DB` DEFAULT CHARACTER SET utf8 ;
USE `Little_Lemon_DB` ;

-- -----------------------------------------------------
-- Table `Little_Lemon_DB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon_DB`.`Customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `ContactNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_Lemon_DB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon_DB`.`Staff` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_Lemon_DB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon_DB`.`MenuItems` (
  `MenuItemsID` INT NOT NULL,
  `ItemName` VARCHAR(45) NOT NULL,
  `ItemCategory` VARCHAR(45) NOT NULL,
  `Price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_Lemon_DB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon_DB`.`Menu` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `ItemName` VARCHAR(45) NOT NULL,
  `Category` VARCHAR(45) NOT NULL,
  `Price` DECIMAL(5,2) NOT NULL,
  `MenuItemsID` INT NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `fk_menuitems_idx` (`MenuItemsID` ASC) VISIBLE,
  CONSTRAINT `fk_menuitems`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `Little_Lemon_DB`.`MenuItems` (`MenuItemsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_Lemon_DB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon_DB`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `BookingDate` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_customerid_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_customerid`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Little_Lemon_DB`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_Lemon_DB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon_DB`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL(6,2) NOT NULL,
  `BookingID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_bookingid_idx` (`BookingID` ASC) VISIBLE,
  INDEX `fk_menuid_idx` (`MenuID` ASC) VISIBLE,
  INDEX `fk_staffid_idx` (`StaffID` ASC) VISIBLE,
  INDEX `fk_custid_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_bookingid`
    FOREIGN KEY (`BookingID`)
    REFERENCES `Little_Lemon_DB`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_menuid`
    FOREIGN KEY (`MenuID`)
    REFERENCES `Little_Lemon_DB`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staffid`
    FOREIGN KEY (`StaffID`)
    REFERENCES `Little_Lemon_DB`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_custid`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Little_Lemon_DB`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_Lemon_DB`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon_DB`.`OrderDeliveryStatus` (
  `DeliveryID` INT NOT NULL AUTO_INCREMENT,
  `DeliveryDate` DATE NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `fk_ORDERID_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_ORDERID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `Little_Lemon_DB`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
