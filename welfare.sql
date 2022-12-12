-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Operator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Operator` (
  `oprID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `facility_name` VARCHAR(45) NULL,
  PRIMARY KEY (`oprID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.` facility`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.` facility` (
  `facID` INT NOT NULL,
  `oprID` INT NOT NULL,
  `facility_name` VARCHAR(45) NULL,
  `Field` VARCHAR(45) NULL,
  PRIMARY KEY (`facID`, `oprID`),
  INDEX `fk_ facility_Operator1_idx` (`oprID` ASC) VISIBLE,
  CONSTRAINT `operate`
    FOREIGN KEY (`oprID`)
    REFERENCES `mydb`.`Operator` (`oprID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`practician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`practician` (
  `pracID` INT NOT NULL,
  `phone` VARCHAR(45) NULL,
  `rank` VARCHAR(45) NULL,
  `employment_date` DATETIME NULL,
  `departure_date` DATETIME NULL,
  ` facID` INT NOT NULL,
  `oprID` INT NOT NULL,
  PRIMARY KEY (`pracID`, ` facID`, `oprID`),
  INDEX `workin_facID
practician_ facility1_idx` (` facID` ASC) VISIBLE,
  INDEX `manage_oprID` (`oprID` ASC) VISIBLE,
  CONSTRAINT `workin`
    FOREIGN KEY (` facID`)
    REFERENCES `mydb`.` facility` (`facID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `manage`
    FOREIGN KEY (`oprID`)
    REFERENCES `mydb`.`Operator` (`oprID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`recipient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`recipient` (
  `recID` INT NOT NULL,
  `pracID` INT NOT NULL,
  `facID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `income` INT NULL,
  `Social Security Number` INT NULL,
  PRIMARY KEY (`recID`),
  INDEX `fk_
recipient_
practician1_idx` (`pracID` ASC, `facID` ASC) VISIBLE,
  CONSTRAINT `care`
    FOREIGN KEY (`pracID`)
    REFERENCES `mydb`.`practician` (`pracID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`service` (
  `facID` INT NOT NULL,
  `serviceID` VARCHAR(45) NOT NULL,
  `income_bound` INT NULL,
  `recID` INT NOT NULL,
  PRIMARY KEY (`facID`, `serviceID`),
  INDEX `fk_ facility_has_
recipient_ facility1_idx` (`facID` ASC) VISIBLE,
  INDEX `fk_service
recipient_
recipient1_idx` (`recID` ASC) VISIBLE,
  CONSTRAINT `offer`
    FOREIGN KEY (`facID`)
    REFERENCES `mydb`.` facility` (`facID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `beneficiary`
    FOREIGN KEY (`recID`)
    REFERENCES `mydb`.`recipient` (`recID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
