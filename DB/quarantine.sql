-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema quarantinedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `quarantinedb` ;

-- -----------------------------------------------------
-- Schema quarantinedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `quarantinedb` DEFAULT CHARACTER SET utf8 ;
USE `quarantinedb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `user_image_url` VARCHAR(300) NULL,
  `create_date` DATE NULL,
  `user_description` VARCHAR(1000) NULL,
  `enabled` TINYINT(1) NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(200) NULL,
  `state` VARCHAR(200) NULL,
  `city` VARCHAR(200) NULL,
  `address` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `host`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `host` ;

CREATE TABLE IF NOT EXISTS `host` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `host_name` VARCHAR(500) NOT NULL,
  `email` VARCHAR(500) NULL,
  `phone_number` VARCHAR(20) NULL,
  `location_id` INT NULL,
  `url` VARCHAR(500) NOT NULL,
  `url_logo` VARCHAR(500) NULL,
  PRIMARY KEY (`id`),
  INDEX `location_id_idx` (`location_id` ASC),
  CONSTRAINT `location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(1000) NULL,
  `title` VARCHAR(500) NOT NULL,
  `event_date` DATE NOT NULL,
  `event_time` VARCHAR(100) NOT NULL,
  `link_to_event` VARCHAR(500) NOT NULL,
  `host_id` INT NULL,
  `location_id` INT NULL,
  `public` TINYINT(1) NULL,
  `event_image_url` VARCHAR(500) NULL,
  `status` VARCHAR(200) NULL,
  `prereqs` VARCHAR(500) NULL,
  `create_date` DATE NULL,
  `rating` DOUBLE NULL,
  PRIMARY KEY (`id`),
  INDEX `location_id_idx` (`location_id` ASC),
  INDEX `host_id_idx` (`host_id` ASC),
  CONSTRAINT `fk_event_location`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_host`
    FOREIGN KEY (`host_id`)
    REFERENCES `host` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `group` ;

CREATE TABLE IF NOT EXISTS `group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(450) NOT NULL,
  `description` VARCHAR(1000) NULL,
  `user_id` INT NULL,
  `create_date` DATE NULL,
  `status` VARCHAR(500) NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `fk_group_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `group_comment` ;

CREATE TABLE IF NOT EXISTS `group_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(1000) NULL,
  `create_date` DATE NULL,
  `group_id` INT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `group_id_idx` (`group_id` ASC),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_comment` ;

CREATE TABLE IF NOT EXISTS `event_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(1000) NULL,
  `create_date` DATE NULL,
  `event_id` INT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `event_id_idx` (`event_id` ASC),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `fk_eventcomment_event`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_eventcomment_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category_event` ;

CREATE TABLE IF NOT EXISTS `category_event` (
  `category_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `event_id`),
  INDEX `fk_category_has_event_event1_idx` (`event_id` ASC),
  INDEX `fk_category_has_event_category_idx` (`category_id` ASC),
  CONSTRAINT `fk_category_has_event_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_event_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_event` ;

CREATE TABLE IF NOT EXISTS `user_event` (
  `user_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `event_id`),
  INDEX `fk_user_has_event_event1_idx` (`event_id` ASC),
  INDEX `fk_user_has_event_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_event_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_event_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS veterans@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'veterans'@'localhost' IDENTIFIED BY 'veterans';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'veterans'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarantinedb`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`) VALUES (1, 'Chrissy', 'Rowland', 'frog', 'crispy', NULL, NULL, NULL, 1, 'admin');

COMMIT;

