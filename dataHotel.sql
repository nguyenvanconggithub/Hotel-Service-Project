-- MySQL Script generated by MySQL Workbench
-- Wed Jun  5 00:03:24 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hotel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hotel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `hotel` ;

-- -----------------------------------------------------
-- Table `hotel`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`account` (
  `userName` VARCHAR(30) NOT NULL,
  `passWord` VARCHAR(15) NOT NULL,
  `role` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`userName`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `hotel`.`bed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`bed` (
  `idBed` INT(11) NOT NULL AUTO_INCREMENT,
  `bedName` VARCHAR(20) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`idBed`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `hotel`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`user` (
  `idUser` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(35) CHARACTER SET 'utf8' NOT NULL,
  `Email` VARCHAR(30) NOT NULL,
  `phone` VARCHAR(10) NOT NULL,
  `userName` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idUser`),
  INDEX `fk_account` (`userName` ASC) VISIBLE,
  CONSTRAINT `fk_account`
    FOREIGN KEY (`userName`)
    REFERENCES `hotel`.`account` (`userName`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `hotel`.`bookingroom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`bookingroom` (
  `idBooking` INT(11) NOT NULL AUTO_INCREMENT,
  `idUser` INT(11) NULL DEFAULT NULL,
  `bookingTime` DATETIME NULL DEFAULT NULL,
  `checkIn` DATE NULL DEFAULT NULL,
  `checkOut` DATE NOT NULL,
  `note` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`idBooking`),
  INDEX `fk_booking_user_idx` (`idUser` ASC) VISIBLE,
  CONSTRAINT `fk_booking_user`
    FOREIGN KEY (`idUser`)
    REFERENCES `hotel`.`user` (`idUser`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `hotel`.`hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`hotel` (
  `idHotel` INT(11) NOT NULL AUTO_INCREMENT,
  `hotelName` VARCHAR(30) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `star` INT(11) NULL DEFAULT NULL,
  `address` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `userName` VARCHAR(30) NULL DEFAULT NULL,
  `rate` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`idHotel`),
  INDEX `fk_hotel_account` (`userName` ASC) VISIBLE,
  CONSTRAINT `fk_hotel_account`
    FOREIGN KEY (`userName`)
    REFERENCES `hotel`.`account` (`userName`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `hotel`.`roomtype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`roomtype` (
  `idRoomType` INT(11) NOT NULL AUTO_INCREMENT,
  `roomTypeName` VARCHAR(30) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`idRoomType`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `hotel`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`room` (
  `idRoom` INT(11) NOT NULL AUTO_INCREMENT,
  `roomName` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `idHotel` INT(11) NOT NULL,
  `idBed` INT(11) NOT NULL,
  `idRoomType` INT(11) NOT NULL,
  `acreage` FLOAT NULL DEFAULT NULL,
  `cost` INT(11) NULL DEFAULT NULL,
  `people` INT(11) NULL DEFAULT NULL,
  `quantity` INT(11) NULL DEFAULT NULL,
  `roomLeft` INT(11) NULL DEFAULT NULL,
  `note` VARCHAR(30) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`idRoom`),
  INDEX `fk_bed_idx` (`idBed` ASC) VISIBLE,
  INDEX `fk_roomtype_idx` (`idRoomType` ASC) VISIBLE,
  INDEX `fk_room_hotel_idx` (`idHotel` ASC) VISIBLE,
  CONSTRAINT `fk_bed`
    FOREIGN KEY (`idBed`)
    REFERENCES `hotel`.`bed` (`idBed`),
  CONSTRAINT `fk_room_hotel`
    FOREIGN KEY (`idHotel`)
    REFERENCES `hotel`.`hotel` (`idHotel`),
  CONSTRAINT `fk_roomtype`
    FOREIGN KEY (`idRoomType`)
    REFERENCES `hotel`.`roomtype` (`idRoomType`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `hotel`.`detailbookingroom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`detailbookingroom` (
  `idRoom` INT(11) NOT NULL,
  `idBooking` INT(11) NOT NULL,
  `status` INT(11) NULL DEFAULT NULL,
  `bookingNumber` INT(11) NULL DEFAULT NULL,
  `ownRoomName` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idRoom`, `idBooking`),
  INDEX `fk_detail_booking_idx` (`idBooking` ASC) VISIBLE,
  CONSTRAINT `fk_detail_booking`
    FOREIGN KEY (`idBooking`)
    REFERENCES `hotel`.`bookingroom` (`idBooking`),
  CONSTRAINT `fk_detail_room`
    FOREIGN KEY (`idRoom`)
    REFERENCES `hotel`.`room` (`idRoom`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `hotel`.`hotelimage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`hotelimage` (
  `idHotelImage` INT(11) NOT NULL AUTO_INCREMENT,
  `linkImage` VARCHAR(200) NULL DEFAULT NULL,
  `idHotel` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idHotelImage`),
  INDEX `fk_hotel_image_idx` (`idHotel` ASC) VISIBLE,
  CONSTRAINT `fk_hotelimage`
    FOREIGN KEY (`idHotel`)
    REFERENCES `hotel`.`hotel` (`idHotel`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `hotel`.`utilities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`utilities` (
  `idUtility` INT(11) NOT NULL AUTO_INCREMENT,
  `utilityName` VARCHAR(25) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`idUtility`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `hotel`.`hotelutilities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`hotelutilities` (
  `idutility` INT(11) NOT NULL,
  `idhotel` INT(11) NOT NULL,
  PRIMARY KEY (`idutility`, `idhotel`),
  INDEX `fk_tienichks_idx` (`idhotel` ASC) VISIBLE,
  CONSTRAINT `fk_hotel_uti`
    FOREIGN KEY (`idhotel`)
    REFERENCES `hotel`.`hotel` (`idHotel`),
  CONSTRAINT `fk_hotelulity`
    FOREIGN KEY (`idutility`)
    REFERENCES `hotel`.`utilities` (`idUtility`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `hotel`.`roomimage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`roomimage` (
  `idRoomImage` INT(11) NOT NULL AUTO_INCREMENT,
  `linkImage` VARCHAR(200) NULL DEFAULT NULL,
  `idRoom` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idRoomImage`),
  INDEX `fk_room_image_idx` (`idRoom` ASC) VISIBLE,
  CONSTRAINT `fk_room_image`
    FOREIGN KEY (`idRoom`)
    REFERENCES `hotel`.`room` (`idRoom`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `hotel`.`roomutilities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`roomutilities` (
  `idUtility` INT(11) NOT NULL,
  `idRoom` INT(11) NOT NULL,
  PRIMARY KEY (`idUtility`, `idRoom`),
  INDEX `fk_uti_room_idx` (`idRoom` ASC) VISIBLE,
  CONSTRAINT `fk_roomuti`
    FOREIGN KEY (`idUtility`)
    REFERENCES `hotel`.`utilities` (`idUtility`),
  CONSTRAINT `fk_uti_room`
    FOREIGN KEY (`idRoom`)
    REFERENCES `hotel`.`room` (`idRoom`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;