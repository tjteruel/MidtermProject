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
  `user_image_url` VARCHAR(5000) NULL,
  `create_date` DATETIME NULL,
  `user_description` TEXT NULL,
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
  `postal_code` VARCHAR(10) NULL,
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
  `location_id` INT NULL,
  `phone_number` VARCHAR(20) NULL,
  `url` VARCHAR(5000) NULL,
  `url_logo` VARCHAR(5000) NULL,
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
  `description` TEXT NULL,
  `title` VARCHAR(500) NOT NULL,
  `event_date` DATE NOT NULL,
  `event_time` TIME NOT NULL,
  `link_to_event` VARCHAR(5000) NOT NULL,
  `host_id` INT NULL,
  `location_id` INT NULL,
  `public` TINYINT(1) NULL,
  `event_image_url` VARCHAR(5000) NULL,
  `status` ENUM('Delayed', 'Canceled') NULL,
  `prereqs` VARCHAR(500) NULL,
  `create_date` DATETIME NULL,
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
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;
CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(500) NOT NULL,
  `description` VARCHAR(5000) NULL,
  `category_image_url` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `category_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category_comment` ;
CREATE TABLE IF NOT EXISTS `category_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `content` VARCHAR(1000) NULL,
  `create_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `fk_categorycomment_category_idx` (`category_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categorycomment_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `event_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_comment` ;
CREATE TABLE IF NOT EXISTS `event_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  `content` VARCHAR(1000) NULL,
  `create_date` DATETIME NULL,
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
-- Table `event_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_category` ;
CREATE TABLE IF NOT EXISTS `event_category` (
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
  `attended` TINYINT NULL,
  `rating` INT NULL,
  `rating_comment` VARCHAR(5000) NULL,
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
-- -----------------------------------------------------
-- Table `tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag` ;
CREATE TABLE IF NOT EXISTS `tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `tag_name` VARCHAR(100) NOT NULL,
  `create_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tag_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_tag_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `event_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_tag` ;
CREATE TABLE IF NOT EXISTS `event_tag` (
  `tag_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`tag_id`, `event_id`),
  INDEX `fk_tag_has_event_event1_idx` (`event_id` ASC),
  INDEX `fk_tag_has_event_tag1_idx` (`tag_id` ASC),
  CONSTRAINT `fk_tag_has_event_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tag_has_event_event1`
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
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`) VALUES (1, 'Chrissy', 'Rowland', 'frog', 'crispy', 'https://www.cmgww.com/music/tim/wp-content/uploads/2017/05/timt006.jpg', '2020-01-24', 'Looking for frogs..!!!', 1, 'admin');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`) VALUES (2, 'Time', 'Teruel', 'bro', 'bro', 'https://static.adweek.com/adweek.com-prod/wp-content/uploads/files/news_article/flextacular-hed-2015.png', '2020-01-25', 'Where the bars at!!', 0, 'user');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`) VALUES (3, 'David', 'Yoachum', 'dude', 'dude', 'https://i.ytimg.com/vi/7Qu_PXldP24/maxresdefault.jpg', '2020-01-26', 'Give me the Iron !!', 0, 'user');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`) VALUES (4, 'Ankit ', 'Shah', 'homie', 'homie', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/72850e4a-aeaf-4cf7-a837-b742f0c9199d/d57g0v7-0b7f71f1-0636-4472-b2b7-c3989c07a172.jpg/v1/fill/w_894,h_894,q_75,strp/homie_pigeon_by_kcam12-d57g0v7.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwic3ViIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl0sIm9iaiI6W1t7InBhdGgiOiIvZi83Mjg1MGU0YS1hZWFmLTRjZjctYTgzNy1iNzQyZjBjOTE5OWQvZDU3ZzB2Ny0wYjdmNzFmMS0wNjM2LTQ0NzItYjJiNy1jMzk4OWMwN2ExNzIuanBnIiwid2lkdGgiOiI8PTg5NCIsImhlaWdodCI6Ijw9ODk0In1dXX0.oFYclMg-RO3KXdwa6UeUEzsqYDxBbHsKw_o96o8e12Q', '2020-01-27', 'Give me the Loot!!', 1, 'user');
COMMIT;
-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarantinedb`;
INSERT INTO `location` (`id`, `country`, `state`, `city`, `address`, `postal_code`) VALUES (1, 'Afghanistan', 'Kandahar', 'Kandahar haha', '123 Route Misty', '00001');
COMMIT;
-- -----------------------------------------------------
-- Data for table `host`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarantinedb`;
INSERT INTO `host` (`id`, `host_name`, `email`, `location_id`, `phone_number`, `url`, `url_logo`) VALUES (1, 'Captain Planet', 'abc@xyz.com', 1, '123-456-789 ', 'https://www.eventbrite.com/e/chicken-fight-the-denver-fried-chicken-championships-2020-tickets-92812908909?aff=ebdshpfprimarybucket', 'https://www.simplyrecipes.com/wp-content/uploads/2015/09/roasted-chicken-apricot-glaze-horiz-a-1500.jpg');
COMMIT;
-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarantinedb`;
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`) VALUES (1, 'Looking for my new baby mama !!', 'Hooker Rank', '2020-03-30', '16:00', 'http://cornhub.com/', 1, 1, 1, 'https://domaingang.com/domain-news/is-cornhub-com-really-worth-365000-dollars/', NULL, 'Love for corns is a must !', '2020-03-27');
COMMIT;
-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarantinedb`;
INSERT INTO `category` (`id`, `name`, `description`, `category_image_url`) VALUES (1, 'Animal Cams', 'Watch your favorite Frogs correct the British spelling', 'https://www.nationalgeographic.com/content/dam/news/photos/000/842/84214.ngsversion.1422286683017.jpg');
COMMIT;
-- -----------------------------------------------------
-- Data for table `event_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarantinedb`;
INSERT INTO `event_comment` (`id`, `user_id`, `event_id`, `content`, `create_date`) VALUES (1, 1, 1, 'Whats going on with these events dudeee... I am ready for the hookers...', '2020-03-27');
COMMIT;
-- -----------------------------------------------------
-- Data for table `event_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarantinedb`;
INSERT INTO `event_category` (`category_id`, `event_id`) VALUES (1, 1);
COMMIT;
-- -----------------------------------------------------
-- Data for table `user_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarantinedb`;
INSERT INTO `user_event` (`user_id`, `event_id`, `attended`, `rating`, `rating_comment`) VALUES (1, 1, 1, 4, 'Loved the hookers and the frog at the animal zoo. The connection was a little sketch');
COMMIT;
-- -----------------------------------------------------
-- Data for table `tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarantinedb`;
INSERT INTO `tag` (`id`, `user_id`, `tag_name`, `create_date`) VALUES (1, 1, 'hookerswithfrogs', '2020-03-27');
COMMIT;
