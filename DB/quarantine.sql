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
  `active` TINYINT(1) NOT NULL DEFAULT 1,
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
  `active` TINYINT(1) NULL DEFAULT 1,
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
  `status` ENUM('Delayed', 'Canceled', 'Scheduled') NOT NULL DEFAULT 'Scheduled',
  `prereqs` VARCHAR(500) NULL DEFAULT NULL,
  `create_date` DATETIME NULL DEFAULT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
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
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`, `active`) VALUES (1, 'Peggy', 'Smith', 'kissmyaxe', 'bullseye', 'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/GettyImages-1158622531_thumb.jpg', '2020-01-01 10:10:10', ' Freelance internet buff. Amateur introvert. Writer. Web nerd. Travel aficionado.', 1, 'admin', 'p.smith@qe.com', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`, `active`) VALUES (2, 'Clayton', 'McGregor', 'shaquilleoatmeal', 'basketball', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Outdoors-man-portrait_%28cropped%29.jpg/1200px-Outdoors-man-portrait_%28cropped%29.jpg', '2020-01-01 10:10:10', ' Music geek. Social media enthusiast. Student. Professional twitter fanatic. Web advocate.', 1, 'user', 'c.mcgregor@qe.com', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`, `active`) VALUES (3, 'Brian', 'Bailey', 'desperateenuf', 'crumbbum', 'https://media.gettyimages.com/photos/what-more-can-a-girl-ask-for-picture-id692879918?b=1&k=6&m=692879918&s=612x612&w=0&h=uc4HrCahufEOMHYbRxjsESauxoJhzYkyzFPq0YZtxSo=', '2020-01-01 10:10:10', ' Bacon enthusiast. Professional troublemaker. Lifelong music scholar. Unapologetic twitter advocate.', 1, 'user', 'b.bailey@qe.com', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`, `active`) VALUES (4, 'Julie', 'Haley', 'billnyetherussianspy', 'ilovebears', 'https://secure.gravatar.com/avatar/81c8847e3d52f5cab58ce0a0b923f11f?s=400&d=mm&r=g', '2020-01-01 10:10:10', ' Analyst. Student. Tv nerd. Unapologetic music specialist. Freelance coffee maven. Lifelong reader.', 1, 'user', 'j.haley@qe.com', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`, `active`) VALUES (5, 'Anna', 'Adams', 'hoosierdaddy', 'indiana', 'https://www.bmc.edu.sa/images/academia/tutors/dr-iklass.jpg', '2020-01-01 10:10:10', ' Writer. Extreme zombieaholic. Problem solver. Tv guru. Communicator. Internet maven.', 1, 'user', 'a.adams@qe.com', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`, `active`) VALUES (6, 'Richard', 'Gil', 'iwasamistake', 'surviving', 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', '2020-01-01 10:10:10', ' Friend of animals everywhere. Explorer. Lifelong writer. Web trailblazer. Proud pop culture lover. Certified beer fan.', 1, 'user', 'r.gil@qe.com', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`, `active`) VALUES (7, 'Mary', 'Wood', 'uncommonname', 'common', 'https://photoartinc.com/wp-content/uploads/2018/02/female-photos.jpg', '2020-01-01 10:10:10', ' Hardcore communicator. Friendly student. Devoted problem solver. Amateur thinker. Alcoholaholic.', 1, 'user', 'm.wood@qe.com', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`, `active`) VALUES (8, 'Kyle', 'Johnson', 'princecharmin', 'toilets', 'https://images.unsplash.com/photo-1530645298377-82c8416d3f90?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80', '2020-01-01 10:10:10', ' Friendly music scholar. Internet specialist. Extreme problem solver. Communicator. Freelance bacon buff.', 1, 'user', 'k.johnson@qe.com', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`, `active`) VALUES (9, 'Katherine', 'Landry', 'tpqueen', 'bidet', 'https://www.investmentexecutive.com/wp-content/uploads/sites/3/2019/11/100044137_m.jpg', '2020-01-01 10:10:10', ' Total troublemaker. Coffee expert. Hipster-friendly internet evangelist. Organizer. Introvert. Alcohol scholar. Beer ninja. Avid music fanatic.', 1, 'user', 'k.landry@qe.com', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`, `active`) VALUES (10, 'Andrew', 'Fletcher', 'behindyou', 'watchout', 'https://images-prod.healthline.com/hlcmsresource/images/imce/mens-health-symptoms_thumb.jpg', '2020-01-01 10:10:10', ' Incurable communicator. Alcohol maven. Web buff. Zombieaholic. Professional pop culture specialist.', 1, 'user', 'a.fletcher@qe.com', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`, `active`) VALUES (11, 'Hosea', 'Thomas', 'onemorepint', 'lastone', 'https://media.wnyc.org/i/800/0/l/85/1/adult-business-businessman-428339.jpg', '2020-01-01 10:10:10', ' Incurable bacon expert. Certified alcohol evangelist. Extreme internet ninja. Zombie geek. Freelance creator. Student.', 1, 'user', 'h.thomas@qe.com', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `user_image_url`, `create_date`, `user_description`, `enabled`, `role`, `email`, `active`) VALUES (12, 'Selena', 'Evans', 'duckduckgrayduck', 'goose', 'https://findnicknames.com/wp-content/uploads/2017/05/Nicknames-for-girls.jpeg', '2020-01-01 10:10:10', ' Coffee ninja. Certified web nerd. Future teen idol. Problem solver. Friendly pop culture fanatic.', 1, 'user', 's.evans@qe.com', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarantinedb`;
INSERT INTO `location` (`id`, `country`, `state`, `city`, `address`, `postal_code`) VALUES (1, 'United States', 'California', 'San Diego', '2920 Zoo Drive', '92101');
INSERT INTO `location` (`id`, `country`, `state`, `city`, `address`, `postal_code`) VALUES (2, 'United States', 'DC', 'Washington, DC', '3001 Connecticut Avenue', '20008');
INSERT INTO `location` (`id`, `country`, `state`, `city`, `address`, `postal_code`) VALUES (3, 'United States', 'Colorado', 'Boulder', 'P.O. BOX 6080', '80306');
INSERT INTO `location` (`id`, `country`, `state`, `city`, `address`, `postal_code`) VALUES (4, 'United States', 'Colorado', 'Aspen', '110 EAST HALLAM STREET', '81611');
INSERT INTO `location` (`id`, `country`, `state`, `city`, `address`, `postal_code`) VALUES (5, 'United States', 'Colorado', 'Denver', '144 W Colfax Ave', '80202');
INSERT INTO `location` (`id`, `country`, `state`, `city`, `address`, `postal_code`) VALUES (6, 'United States', 'Colorado', 'Denver', '100 W 14th Avenue Pkwy', '80204');
INSERT INTO `location` (`id`, `country`, `state`, `city`, `address`, `postal_code`) VALUES (7, 'United States', 'Colorado', 'Denver', '1007 York Street', '80206');
INSERT INTO `location` (`id`, `country`, `state`, `city`, `address`, `postal_code`) VALUES (8, 'United States', 'Colorado', 'Denver', '300 West 11th Ave #A', '80204');
INSERT INTO `location` (`id`, `country`, `state`, `city`, `address`, `postal_code`) VALUES (9, 'United States', 'Colorado', 'Denver', '2300 Steele St', '80205');
INSERT INTO `location` (`id`, `country`, `state`, `city`, `address`, `postal_code`) VALUES (10, 'United Kingdom', 'Greater London', 'London', 'Silk Street', 'EC2Y 8DS');
INSERT INTO `location` (`id`, `country`, `state`, `city`, `address`, `postal_code`) VALUES (11, 'Germany', 'Berlin', 'Berlin', 'Herbert-von-Karajan-Str. 1', '10785');
INSERT INTO `location` (`id`, `country`, `state`, `city`, `address`, `postal_code`) VALUES (12, 'Sweden', 'Göteborg', 'Göteborg', 'Götaplatsen', '41256');

COMMIT;


-- -----------------------------------------------------
-- Data for table `host`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarantinedb`;
INSERT INTO `host` (`id`, `host_name`, `email`, `location_id`, `phone_number`, `url`, `url_logo`, `active`) VALUES (1, 'San Diego Zoo', 'events@sandiegozoo.org ', 1, '6192311515', 'https://zoo.sandiegozoo.org/', 'https://sdchamber.org/wp-content/uploads/2016/07/san-diego-zoo-logo.jpg', 1);
INSERT INTO `host` (`id`, `host_name`, `email`, `location_id`, `phone_number`, `url`, `url_logo`, `active`) VALUES (2, 'Smithsonian\'s National Zoo', 'events@nationalzoo.edu', 2, '2026334888', 'https://nationalzoo.si.edu/', 'https://www.si.edu/sites/default/files/newsdesk/press_releases/si_large_color.jpg', 1);
INSERT INTO `host` (`id`, `host_name`, `email`, `location_id`, `phone_number`, `url`, `url_logo`, `active`) VALUES (3, 'Motus Theater', 'INFO@MOTUSTHEATER.ORG', 3, '7204322004', 'https://www.motustheater.org/', 'https://images.squarespace-cdn.com/content/v1/5ae20263aa49a1f4000bf576/1555966157999-G4AWQ4RHAFC7FCV2O9PW/ke17ZwdGBToddI8pDm48kFyJMLJlQZGARyeR1BU4y5MUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYy7Mythp_T-mtop-vrsUOmeInPi9iDjx9w8K4ZfjXt2dqTir2K1URVvEFX2lMZ1XBYtGOrZnVHUd6ZgSMiKBaOXCjLISwBs8eEdxAxTptZAUg/Motus-WhiteVariant2.png', 1);
INSERT INTO `host` (`id`, `host_name`, `email`, `location_id`, `phone_number`, `url`, `url_logo`, `active`) VALUES (4, 'Aspen Words', 'aspenwords@aspeninstitute.org', 4, '9709253122', 'http://www.aspenwords.org/', 'http://www.aspenwords.org/wp-content/themes/aspen-writers/images/logo-interior.png', 1);
INSERT INTO `host` (`id`, `host_name`, `email`, `location_id`, `phone_number`, `url`, `url_logo`, `active`) VALUES (5, 'Denver Public Art', 'public.art@denvergov.org', 5, '7208655563', '\nhttp://www.denverpublicart.org', 'https://denverpublicart.org/wp-content/themes/denver/dist/images/new-denver-logo.png', 1);
INSERT INTO `host` (`id`, `host_name`, `email`, `location_id`, `phone_number`, `url`, `url_logo`, `active`) VALUES (6, 'Denver Art Museum', 'pressoffice@denverartmuseum.org', 6, '7208655000', 'https://denverartmuseum.org/', 'https://res.cloudinary.com/micronetonline/image/upload/c_crop,h_203,w_450,x_0,y_0/v1553804603/tenants/6b8a1089-4977-4a15-ac7f-97edaddc067a/9011001840c64dcca5b0b3677b2e68f0/Art.png', 1);
INSERT INTO `host` (`id`, `host_name`, `email`, `location_id`, `phone_number`, `url`, `url_logo`, `active`) VALUES (7, 'Denver Botanic Gardens', 'administration@botanicgardens.org', 7, '7208653500', 'https://www.botanicgardens.org/', 'https://www.castlepinesconnection.com/wp-content/uploads/2020/01/DenverBotanicGarden.jpg', 1);
INSERT INTO `host` (`id`, `host_name`, `email`, `location_id`, `phone_number`, `url`, `url_logo`, `active`) VALUES (8, 'Denver Zoo', 'guestcare@denverzoo.org', 8, '7203371400', 'https://www.denverzoo.org/', 'https://www.denverzoo.org/wp-content/uploads/2018/07/logo.png', 1);
INSERT INTO `host` (`id`, `host_name`, `email`, `location_id`, `phone_number`, `url`, `url_logo`, `active`) VALUES (9, 'Walker Fine Art', 'lgaron@walkerfineart.com', 9, '3033558955', 'http://www.walkerfineart.com/', 'http://www.walkerfineart.com/inner-voyages-virtual-tour', 1);
INSERT INTO `host` (`id`, `host_name`, `email`, `location_id`, `phone_number`, `url`, `url_logo`, `active`) VALUES (10, 'London Symophony Orchestra', 'admin@lso.co.uk', 10, '442075881116', 'https://lso.co.uk/', 'https://i.pinimg.com/originals/0b/16/f4/0b16f414c80e759a6beedecc5d1298b8.jpg', 1);
INSERT INTO `host` (`id`, `host_name`, `email`, `location_id`, `phone_number`, `url`, `url_logo`, `active`) VALUES (11, 'Berliner Philharmoniker', 'kartenbuero@berliner-philharmoniker.de', 11, '4930254880', 'https://www.berliner-philharmoniker.de/en/', 'https://www.berliner-philharmoniker.de/app/assets/images/main-header/brand.svg', 1);
INSERT INTO `host` (`id`, `host_name`, `email`, `location_id`, `phone_number`, `url`, `url_logo`, `active`) VALUES (12, 'Gothenburg Symphony Orchestra', 'biljett@gso.se', 12, '317265300', 'https://www.gso.se/en/', 'https://www.gso.se/wp-content/themes/gso/assets/images/gso-top-logo.png', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarantinedb`;
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (1, 'You\'re watching a live stream of African penguins at the big, new Dan & Vi McKinney Penguin Habitat in Conrad Prebys Africa Rocks. You might also spot some of their pool mates, leopard sharks. But don\'t worry, the two species get along swimmingly!\n\nOur flock of African penguins  can be seen in the big, new Cape Fynbos habitat at the San Diego Zoo’s Conrad Prebys Africa Rocks. The spacious Penguin Beach features a cobblestone beach, nesting areas, and rockwork that mimics the granite boulders found at Boulders Beach in South Africa—along with a 200,000-gallon pool with depths up to 13 feet, and underwater viewing. \n\nAs one of the most endangered types of penguin, these little birds need your help! Their numbers have declined by 60 percent in the last 28 years. The African penguins at the Zoo are just the beginning of a large flock that we hope to have over the next couple of years, and start breeding this species. It is important for people to learn about this endearing species.', 'Penguin Cam', '2020-04-01', '', 'https://zoo.sandiegozoo.org/cams/penguin-cam', 1, 1, 1, '', 'Scheduled', '', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (2, 'Welcome to the Smithsonian\'s National Zoo\'s Panda Cams, where you can watch giant pandas Tian Tian and Mei Xiang.\n\nWhile you are watching pandas chomp on bamboo, play in trees and tumble in the grass, specially trained volunteers with Friends of the National Zoo are hard at work using these cameras to collect behavioral data on the giant pandas. Please note that while the cameras stream live 24 hours a day, FONZ volunteer operators will only be following the pandas during regular business hours.\n\nBe sure to toggle back and forth between Panda Cam 1 and Panda Cam 2 using the tabs at the top of the video player to get the full Panda Cam experience.', 'Giant Panda Cam', '2020-04-01', '', 'https://nationalzoo.si.edu/webcams/panda-cam', 2, 2, 1, '', 'Scheduled', '', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (3, 'Motus Theater is striving to be in alignment with Governor Polis\' #DoYourPartCO. We are working creatively to meet the needs of people, across Colorado, to have meaningful ways of engaging while remaining isolated in their homes, and at the same time find ways of reflecting on the ongoing challenges facing our community and democracy. So, Motus is experimenting with intimate home virtual theater explorations.', 'Women of Resolution', '2020-04-05', '14:00:00', 'https://www.motustheater.org/events/2020/4/5/women-of-resolution-colorado-state-house-representatives-read-the-stories-of-immigrants-in-sanctuary', 3, 3, 1, 'https://static1.squarespace.com/static/5ae20263aa49a1f4000bf576/5b19b6a088251b8e27a34414/5e41d90a1d51902113df3575/1585613089620/Artboard+1.png?format=1000w', 'Scheduled', 'Please RSVP on Motus Theater Website', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (4, 'The Aspen Institute\'s annual Aspen Words Literary Prize ceremony is going virtual this year. Tune in for literary interviews with nominees Brian Allen Carr, Nicole Dennis-Benn, Christy Lefteri, Valeria Luiselli and Bryan Washington. At 2 p.m. Aspen Institute President Dan Porterfield and Aspen Words Executive Director Adrienne Brodeur will discuss the importance of literature during a pandemic. And at 4 p.m., the winner will be announced and deliver an acceptance speech.', 'Aspen Words Literary Prize', '2020-04-16', '16:30:00', 'http://www.aspenwords.org/programs/literary-prize/', 4, 4, 1, 'http://www.aspenwords.org/wp-content/uploads/2020/02/2020-AWLP-Shortlist-Graphic_small-e1585093116814.png', 'Scheduled', '', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (5, 'If you\'re missing the city\'s public art, you can still tour it online at Denver Arts & Venues\' virtual public art tours. There are various themed jaunts, from Animals and Black History Month to tours of art in City Park and the Botanic Gardens. Browse it now, and see it in person later.', 'Denver Public Art Virtual Tours', '2020-04-01', '', 'https://denverpublicart.org/tours/', 5, 5, 1, 'https://denverpublicart.org/wp-content/uploads/2018/05/Sun-Spot-1400x800-photo-by-Steve-Hostetler.jpg', 'Scheduled', '', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (6, 'If you miss strolling through the DAM, take a virtual tour of the collection. You can spend as long as you like admiring each piece of work, and the exhibit isn\'t limited to what the curators have on display: You can see all the works that are currently in storage as well.', 'Denver Art Museum Virtual Tour', '2020-04-01', '', 'https://denverartmuseum.org/collection/', 6, 6, 1, 'https://s3.amazonaws.com/damcollections/a43fc3d2_8860/2000/2000_medium.jpg', 'Scheduled', '', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (7, 'Looking to smell a rose? Unless you grow it yourself, that\'s going to be tough. But if you want your fix of flowers, you can browse the Denver Botanic Gardens\' online offerings, which include a virtual tour, educational resources for kids, and gardening tips.', 'Denver Botanic Gardens Virtual Tour', '2020-04-01', '', 'http://navigate.botanicgardens.org/weboi/oecgi2.exe/INET_ECM_ListTours', 7, 7, 1, 'http://navigate.botanicgardens.org/Bitmaps/DEN/FindTourLogo.png', 'Scheduled', '', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (8, 'Zoo to You\nVirtual Safari\nDenver Zoo may be closed, but our animal care staff is still providing vital care for our nearly 3,000 animal residents. And we\'re here to keep you informed, entertained and engaged with daily videos, wildlife-themed activity ideas and much more!', 'Baby Rhino Cam', '2020-04-01', '', 'https://www.denverzoo.org/zootoyou/', 8, 8, 1, 'https://www.denverzoo.org/wp-content/uploads/2020/03/Rhinobaby_feature_600x600.jpg', 'Scheduled', '', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (9, 'I N N E R   V O Y A G E S\nMarch 6th-May 2nd, 2020\n\nLet the serenity of the exhibition Inner Voyages wash over you as you virtually come inside Walker Fine Art. \nThis calming exhibition features artwork by Melanie Walker, Aaron Morgan Brown, Conor King, Angela Piehl, Malcolm Easton and Katie Kalkstein.', 'Inner Voyages Virtual Tour', '2020-04-01', '', 'http://www.walkerfineart.com/inner-voyages-virtual-tour', 9, 9, 1, 'https://images.squarespace-cdn.com/content/v1/5296d40fe4b0a5b6da04660b/1583354212694-XDSHTFYKDLFG99YU1Q8P/ke17ZwdGBToddI8pDm48kMnHRrpWSlSCB9XabjgyantZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpz4FkPJA585QYBg9EjPvRpkIxxB_SdP_xzqtxyFDizV5aadH9FfX0OATazAJGndjd8/Guthridge+Install-Blue.jpg?format=1500w', 'Scheduled', '', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (10, 'Brahms Symphony No 1\n\nSzymanowski Symphony No 1\nSzymanowski Violin Concerto No 1\nBrahms Symphony No 1\n\nValery Gergiev conductor\nJanine Jansen violin', 'London Symphony Orchestra Live Performance', '2020-04-05', '13:30:00', 'https://lso.co.uk/whats-on/2019-20-season/alwaysplaying.html', 10, 10, 1, 'https://images.lincolncenter.org/image/upload/tbtctlqoes7j7ln0hyar', 'Scheduled', 'Go to London Symphony Orchestras Youtube Channel to watch the perfomance live', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (11, 'Verdi Requiem \n\nVerdi Requiem\n\nGianandrea Noseda conductor\nErika Grimaldi soprano\nDaniela Barcellona mezzo-soprano \nFrancesco Meli tenor\nMichele Pertusi bass \nLondon Symphony Chorus\nSimon Halsey chorus director\nLondon Symphony Orchestra', 'London Symphony Orchestra Live Performance', '2020-04-05', '13:00:00', 'https://lso.co.uk/whats-on/2019-20-season/alwaysplaying.html', 10, 10, 1, 'https://images.lincolncenter.org/image/upload/tbtctlqoes7j7ln0hyar', 'Scheduled', 'Go to London Symphony Orchestras Youtube Channel to watch the perfomance live', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (12, 'Stravinsky ballet music  \n\nStravinsky The Firebird (original ballet)\nStravinsky Petrushka (1947 version)\nStravinsky The Rite of Spring\n\nSir Simon Rattle conductor\nLondon Symphony Orchestra', 'London Symphony Orchestra Live Performance', '2020-04-09', '13:30:00', 'https://lso.co.uk/whats-on/2019-20-season/alwaysplaying.html', 10, 10, 1, 'https://images.lincolncenter.org/image/upload/tbtctlqoes7j7ln0hyar', 'Scheduled', 'Go to London Symphony Orchestras Youtube Channel to watch the perfomance live', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (13, 'Rachmaninoff Piano Concerto No 2  \n\nBalakirev Islamey\nRachmaninoff Piano Concerto No 2\nShostakovich Symphony No 1\n\nGianandrea Noseda conductor\nSeong-Jin Cho piano \nLondon Symphony Orchestra', 'London Symphony Orchestra Live Performance', '2020-04-12', '13:00:00', 'https://lso.co.uk/whats-on/2019-20-season/alwaysplaying.html', 10, 10, 1, 'https://images.lincolncenter.org/image/upload/tbtctlqoes7j7ln0hyar', 'Scheduled', 'Go to London Symphony Orchestras Youtube Channel to watch the perfomance live', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (14, 'Mahler 2 \n\nMahler Symphony No 2\n\nSemyon Bychkov conductor\nChristiane Karg soprano\nAnna Larsson contralto \nLondon Symphony Chorus\nSimon Halsey chorus director \nLondon Symphony Orchestra', 'London Symphony Orchestra Live Performance', '2020-04-16', '13:30:00', 'https://lso.co.uk/whats-on/2019-20-season/alwaysplaying.html', 10, 10, 1, 'https://images.lincolncenter.org/image/upload/tbtctlqoes7j7ln0hyar', 'Scheduled', 'Go to London Symphony Orchestras Youtube Channel to watch the perfomance live', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (15, 'Bernstein Prelude, Fugue and Riffs \n\nBartók Hungarian Peasant Songs\nSzymanowski Harnasie\nStravinsky Ebony Concerto\nGolijov Nazareno\nBernstein Prelude, Fugue and Riffs\n\nSir Simon Rattle conductor\nKatia and Marielle Labèque pianos\nLondon Symphony Orchestra', 'London Symphony Orchestra Live Performance', '2020-04-19', '13:00:00', 'https://lso.co.uk/whats-on/2019-20-season/alwaysplaying.html', 10, 10, 1, 'https://images.lincolncenter.org/image/upload/tbtctlqoes7j7ln0hyar', 'Scheduled', 'Go to London Symphony Orchestras Youtube Channel to watch the perfomance live', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (16, 'The Rose Lake \n\nTippett The Rose Lake\nMahler comp. Cooke Symphony No 10\n\nSir Simon Rattle conductor\nLondon Symphony Orchestra', 'London Symphony Orchestra Live Performance', '2020-04-23', '13:30:00', 'https://lso.co.uk/whats-on/2019-20-season/alwaysplaying.html', 10, 10, 1, 'https://images.lincolncenter.org/image/upload/tbtctlqoes7j7ln0hyar', 'Scheduled', 'Go to London Symphony Orchestras Youtube Channel to watch the perfomance live', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (17, 'Webern Six Pieces for Orchestra\nBerg Fragments of Woyzeck\nLigeti Le Grande Macabre\nStravinsky The Rite of Spring\n\nSir Simon Rattle conductor\nBarbara Hannigan soprano\nLondon Symphony Orchestra', 'London Symphony Orchestra Live Performance', '2020-04-26', '13:00:00', 'https://lso.co.uk/whats-on/2019-20-season/alwaysplaying.html', 10, 10, 1, 'https://images.lincolncenter.org/image/upload/tbtctlqoes7j7ln0hyar', 'Scheduled', 'Go to London Symphony Orchestras Youtube Channel to watch the perfomance live', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (18, 'Adams and Berlioz \n\nAdams Harmonielehre\nBerlioz Symphonie Fantastique\n\nSir Simon Rattle conductor\nLondon Symphony Orchestra', 'London Symphony Orchestra Live Performance', '2020-04-30', '13:00:00', 'https://lso.co.uk/whats-on/2019-20-season/alwaysplaying.html', 10, 10, 1, 'https://images.lincolncenter.org/image/upload/tbtctlqoes7j7ln0hyar', 'Scheduled', 'Go to London Symphony Orchestras Youtube Channel to watch the perfomance live', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (19, 'BERLINER PHILHARMONIKER\nIVÁN FISCHER\n\nDaniel Stabrawa, Bruno Delepelaire, Jonathan Kelly, Stefan Schweigert\nJoseph Haydn\nSinfonia concertante in B flat major, Hob. I:105\nDaniel Stabrawa violin, Bruno Delepelaire cello, Jonathan Kelly oboe, Stefan Schweigert bassoon\n\nFranz Liszt\nA Faust Symphony in three character pictures after J. W. von Goethe (1854 version without final chorus)', 'Berliner Philharmoniker Ivan Fischer', '2020-04-24', '13:00:00', 'https://www.digitalconcerthall.com/en/concert/52558', 11, 11, 1, 'https://www.digitalconcerthall.com/cms/thumbnails/960x540/images/core/2019-04-16_1639_2020-04-20-Fischer-Ivan2_Akos-', 'Scheduled', 'Buy a ticket on the Berliner Philharmoniker on the website ', '2020-01-01 10:10:10', 1);
INSERT INTO `event` (`id`, `description`, `title`, `event_date`, `event_time`, `link_to_event`, `host_id`, `location_id`, `public`, `event_image_url`, `status`, `prereqs`, `create_date`, `active`) VALUES (20, 'Barbara Hannigan, Principal Guest Conductor of Gothenburg Symphony Orchestra, combines moments of mourning with a peace manifestation – all performed by Gothenburg Symphony Orchestra, Gothenburg Symphonic Choir, Barbara Hannigan conductor, Veronika Eberle violin and song soloists.\nAlban Berg’s moving Violin Concerto, passionately played by Veronika Eberle, was dedicated to “The Memory of an Angel”, a young human being who really shone during her short life. And, as is the case with people who are dearly missed, the memory lives on. Those memories are given space in the Requiem, and Mozart’s mass for the departed is both comforting and strengthening. A yearning for peace that also permeates Schoenberg’s appeal for world peace, Friede auf Erden.', 'To the Memory of Our Beloved', '2020-04-04', '7:00:00', 'https://www.gso.se/en/programme/concerts/hannigan-eberle/2020-04-04-15:00/', 12, 12, 1, 'https://www.gso.se/wp-content/uploads/2018/12/veronikaeberle-creditfelixbroede.jpg', 'Scheduled', '', '2020-01-01 10:10:10', 1);

COMMIT;

