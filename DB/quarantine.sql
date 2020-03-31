-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
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
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(500) NOT NULL,
  `description` VARCHAR(5000) NULL DEFAULT NULL,
  `category_image_url` VARCHAR(5000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `user_image_url` VARCHAR(5000) NULL DEFAULT NULL,
  `create_date` DATETIME NULL DEFAULT NULL,
  `user_description` TEXT NULL DEFAULT NULL,
  `enabled` TINYINT(1) NOT NULL DEFAULT '1',
  `role` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `category_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category_comment` ;

CREATE TABLE IF NOT EXISTS `category_comment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `category_id` INT(11) NOT NULL,
  `content` VARCHAR(1000) NULL DEFAULT NULL,
  `create_date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `fk_categorycomment_category_idx` (`category_id` ASC),
  CONSTRAINT `fk_categorycomment_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(200) NULL DEFAULT NULL,
  `state` VARCHAR(200) NULL DEFAULT NULL,
  `city` VARCHAR(200) NULL DEFAULT NULL,
  `address` VARCHAR(200) NULL DEFAULT NULL,
  `postal_code` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `host`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `host` ;

CREATE TABLE IF NOT EXISTS `host` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `host_name` VARCHAR(500) NOT NULL,
  `email` VARCHAR(500) NULL DEFAULT NULL,
  `location_id` INT(11) NULL DEFAULT NULL,
  `phone_number` VARCHAR(20) NULL DEFAULT NULL,
  `url` VARCHAR(5000) NULL DEFAULT NULL,
  `url_logo` VARCHAR(5000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `location_id_idx` (`location_id` ASC),
  CONSTRAINT `location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `description` TEXT NOT NULL,
  `title` VARCHAR(500) NOT NULL,
  `event_date` DATE NULL,
  `event_time` TIME NULL,
  `link_to_event` VARCHAR(5000) NOT NULL,
  `host_id` INT(11) NULL DEFAULT NULL,
  `location_id` INT(11) NULL DEFAULT NULL,
  `public` TINYINT(1) NULL DEFAULT NULL,
  `event_image_url` VARCHAR(5000) NULL DEFAULT NULL,
  `status` ENUM('Delayed', 'Canceled') NULL DEFAULT NULL,
  `prereqs` VARCHAR(500) NULL DEFAULT NULL,
  `create_date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `location_id_idx` (`location_id` ASC),
  INDEX `host_id_idx` (`host_id` ASC),
  CONSTRAINT `fk_event_host`
    FOREIGN KEY (`host_id`)
    REFERENCES `host` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_location`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `event_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_category` ;

CREATE TABLE IF NOT EXISTS `event_category` (
  `category_id` INT(11) NOT NULL,
  `event_id` INT(11) NOT NULL,
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `event_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_comment` ;

CREATE TABLE IF NOT EXISTS `event_comment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `event_id` INT(11) NOT NULL,
  `content` VARCHAR(1000) NULL DEFAULT NULL,
  `create_date` DATETIME NULL DEFAULT NULL,
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
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag` ;

CREATE TABLE IF NOT EXISTS `tag` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `tag_name` VARCHAR(100) NOT NULL,
  `create_date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tag_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_tag_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `event_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_tag` ;

CREATE TABLE IF NOT EXISTS `event_tag` (
  `tag_id` INT(11) NOT NULL,
  `event_id` INT(11) NOT NULL,
  PRIMARY KEY (`tag_id`, `event_id`),
  INDEX `fk_tag_has_event_event1_idx` (`event_id` ASC),
  INDEX `fk_tag_has_event_tag1_idx` (`tag_id` ASC),
  CONSTRAINT `fk_tag_has_event_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tag_has_event_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_event` ;

CREATE TABLE IF NOT EXISTS `user_event` (
  `user_id` INT(11) NOT NULL,
  `event_id` INT(11) NOT NULL,
  `attended` TINYINT(4) NULL DEFAULT NULL,
  `rating` INT(11) NULL DEFAULT NULL,
  `rating_comment` VARCHAR(5000) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `event_id`),
  INDEX `fk_user_has_event_event1_idx` (`event_id` ASC),
  INDEX `fk_user_has_event_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_event_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_event_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarantinedb`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`) VALUES (1, 'Peggy', 'Smith', 'kissmyaxe', 'bullseye', 'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/GettyImages-1158622531_thumb.jpg', '2020-01-01 10:10:10', ' Freelance internet buff. Amateur introvert. Writer. Web nerd. Travel aficionado.', 1, 'admin', 'p.smith@qe.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`) VALUES (2, 'Clayton', 'McGregor', 'shaquilleoatmeal', 'basketball', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Outdoors-man-portrait_%28cropped%29.jpg/1200px-Outdoors-man-portrait_%28cropped%29.jpg', '2020-01-01 10:10:10', ' Music geek. Social media enthusiast. Student. Professional twitter fanatic. Web advocate.', 1, 'user', 'c.mcgregor@qe.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`) VALUES (3, 'Brian', 'Bailey', 'desperateenuf', 'crumbbum', 'https://media.gettyimages.com/photos/what-more-can-a-girl-ask-for-picture-id692879918?b=1&k=6&m=692879918&s=612x612&w=0&h=uc4HrCahufEOMHYbRxjsESauxoJhzYkyzFPq0YZtxSo=', '2020-01-01 10:10:10', ' Bacon enthusiast. Professional troublemaker. Lifelong music scholar. Unapologetic twitter advocate.', 1, 'user', 'b.bailey@qe.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`) VALUES (4, 'Julie', 'Haley', 'billnyetherussianspy', 'ilovebears', 'https://secure.gravatar.com/avatar/81c8847e3d52f5cab58ce0a0b923f11f?s=400&d=mm&r=g', '2020-01-01 10:10:10', ' Analyst. Student. Tv nerd. Unapologetic music specialist. Freelance coffee maven. Lifelong reader.', 1, 'user', 'j.haley@qe.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`) VALUES (5, 'Anna', 'Adams', 'hoosierdaddy', 'indiana', 'https://www.bmc.edu.sa/images/academia/tutors/dr-iklass.jpg', '2020-01-01 10:10:10', ' Writer. Extreme zombieaholic. Problem solver. Tv guru. Communicator. Internet maven.', 1, 'user', 'a.adams@qe.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`) VALUES (6, 'Richard', 'Gil', 'iwasamistake', 'surviving', 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', '2020-01-01 10:10:10', ' Friend of animals everywhere. Explorer. Lifelong writer. Web trailblazer. Proud pop culture lover. Certified beer fan.', 1, 'user', 'r.gil@qe.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`) VALUES (7, 'Mary', 'Wood', 'uncommonname', 'common', 'https://photoartinc.com/wp-content/uploads/2018/02/female-photos.jpg', '2020-01-01 10:10:10', ' Hardcore communicator. Friendly student. Devoted problem solver. Amateur thinker. Alcoholaholic.', 1, 'user', 'm.wood@qe.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`) VALUES (8, 'Kyle', 'Johnson', 'princecharmin', 'toilets', 'https://images.unsplash.com/photo-1530645298377-82c8416d3f90?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80', '2020-01-01 10:10:10', ' Friendly music scholar. Internet specialist. Extreme problem solver. Communicator. Freelance bacon buff.', 1, 'user', 'k.johnson@qe.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`) VALUES (9, 'Katherine', 'Landry', 'tpqueen', 'bidet', 'https://www.investmentexecutive.com/wp-content/uploads/sites/3/2019/11/100044137_m.jpg', '2020-01-01 10:10:10', ' Total troublemaker. Coffee expert. Hipster-friendly internet evangelist. Organizer. Introvert. Alcohol scholar. Beer ninja. Avid music fanatic.', 1, 'user', 'k.landry@qe.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`) VALUES (10, 'Andrew', 'Fletcher', 'behindyou', 'watchout', 'https://images-prod.healthline.com/hlcmsresource/images/imce/mens-health-symptoms_thumb.jpg', '2020-01-01 10:10:10', ' Incurable communicator. Alcohol maven. Web buff. Zombieaholic. Professional pop culture specialist.', 1, 'user', 'a.fletcher@qe.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`) VALUES (11, 'Hosea', 'Thomas', 'onemorepint', 'lastone', 'https://media.wnyc.org/i/800/0/l/85/1/adult-business-businessman-428339.jpg', '2020-01-01 10:10:10', ' Incurable bacon expert. Certified alcohol evangelist. Extreme internet ninja. Zombie geek. Freelance creator. Student.', 1, 'user', 'h.thomas@qe.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`) VALUES (12, 'Selena', 'Evans', 'duckduckgrayduck', 'goose', 'https://findnicknames.com/wp-content/uploads/2017/05/Nicknames-for-girls.jpeg', '2020-01-01 10:10:10', ' Coffee ninja. Certified web nerd. Future teen idol. Problem solver. Friendly pop culture fanatic.', 1, 'user', 's.evans@qe.com');

COMMIT;

