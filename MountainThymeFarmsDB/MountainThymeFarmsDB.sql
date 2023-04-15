-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MountainThymeFarmsDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `MountainThymeFarmsDB` ;

-- -----------------------------------------------------
-- Schema MountainThymeFarmsDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MountainThymeFarmsDB` DEFAULT CHARACTER SET utf8 ;
USE `MountainThymeFarmsDB` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(200) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `first_name` VARCHAR(200) NULL,
  `last_name` VARCHAR(200) NULL,
  `email` VARCHAR(200) NULL,
  `enable` TINYINT NULL DEFAULT 1,
  `imageURL` VARCHAR(200) NULL,
  `role` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Product` ;

CREATE TABLE IF NOT EXISTS `Product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quantity` INT NULL,
  `description` TEXT NULL,
  `price` DOUBLE NULL,
  `name` VARCHAR(200) NULL,
  `location` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Category` ;

CREATE TABLE IF NOT EXISTS `Category` (
  `id` INT NOT NULL,
  `name` VARCHAR(200) NULL,
  `description` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Reviews`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Reviews` ;

CREATE TABLE IF NOT EXISTS `Reviews` (
  `id` INT NOT NULL,
  `name` VARCHAR(200) NULL,
  `description` TEXT NULL,
  `Product_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Reviews_Product1_idx` (`Product_id` ASC),
  INDEX `fk_Reviews_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_Reviews_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reviews_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_Product` ;

CREATE TABLE IF NOT EXISTS `user_has_Product` (
  `user_id` INT NOT NULL,
  `Product_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `Product_id`),
  INDEX `fk_user_has_Product_Product1_idx` (`Product_id` ASC),
  INDEX `fk_user_has_Product_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_Product_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_Product_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Product_has_Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Product_has_Category` ;

CREATE TABLE IF NOT EXISTS `Product_has_Category` (
  `Product_id` INT NOT NULL,
  `Category_id` INT NOT NULL,
  PRIMARY KEY (`Product_id`, `Category_id`),
  INDEX `fk_Product_has_Category_Category1_idx` (`Category_id` ASC),
  INDEX `fk_Product_has_Category_Product1_idx` (`Product_id` ASC),
  CONSTRAINT `fk_Product_has_Category_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_has_Category_Category1`
    FOREIGN KEY (`Category_id`)
    REFERENCES `Category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS admin@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'admin'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `MountainThymeFarmsDB`;
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `enable`, `imageURL`, `role`) VALUES (1, 'LucasP', 'LucasP', 'Lucas', 'Paladini', NULL, 1, NULL, '1');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `enable`, `imageURL`, `role`) VALUES (2, 'SandraL', 'SandraL', 'Sandra', 'Harpole', NULL, 1, NULL, '1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Product`
-- -----------------------------------------------------
START TRANSACTION;
USE `MountainThymeFarmsDB`;
INSERT INTO `Product` (`id`, `quantity`, `description`, `price`, `name`, `location`) VALUES (1, 5, 'wood coasters', 10.00, 'natural wood coasters with live edge', 'Wood Shop');
INSERT INTO `Product` (`id`, `quantity`, `description`, `price`, `name`, `location`) VALUES (2, 3, 'Wagu Steaks Assortment', 210.00, 'Assorted Wagu Steaks', 'Cattle Ranch');
INSERT INTO `Product` (`id`, `quantity`, `description`, `price`, `name`, `location`) VALUES (3, 1, 'Duck Costumes', 25, 'Cute Duck Wear', 'Farm Shop');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Category`
-- -----------------------------------------------------
START TRANSACTION;
USE `MountainThymeFarmsDB`;
INSERT INTO `Category` (`id`, `name`, `description`) VALUES (1, 'Wood Products', NULL);
INSERT INTO `Category` (`id`, `name`, `description`) VALUES (2, 'Cattle Products', '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Reviews`
-- -----------------------------------------------------
START TRANSACTION;
USE `MountainThymeFarmsDB`;
INSERT INTO `Reviews` (`id`, `name`, `description`, `Product_id`, `user_id`) VALUES (1, 'Bought Wood Coasters', 'Very cute and stylish. This products goes really well with the coffee cups I also purchased', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_Product`
-- -----------------------------------------------------
START TRANSACTION;
USE `MountainThymeFarmsDB`;
INSERT INTO `user_has_Product` (`user_id`, `Product_id`) VALUES (1, 1);
INSERT INTO `user_has_Product` (`user_id`, `Product_id`) VALUES (1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Product_has_Category`
-- -----------------------------------------------------
START TRANSACTION;
USE `MountainThymeFarmsDB`;
INSERT INTO `Product_has_Category` (`Product_id`, `Category_id`) VALUES (1, 1);
INSERT INTO `Product_has_Category` (`Product_id`, `Category_id`) VALUES (2, 2);

COMMIT;

