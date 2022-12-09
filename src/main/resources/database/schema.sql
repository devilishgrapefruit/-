
-- -----------------------------------------------------
-- Schema coffeeworld
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coffeeworld` DEFAULT CHARACTER SET utf8 ;
USE `coffeeworld` ;

-- -----------------------------------------------------
-- Table `coffeeworld`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffeeworld`.`user` (
  `id` INT(8) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `activation_code` VARCHAR(255) NULL,
  `active` TINYINT NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `coffeeworld`.`user_role`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `coffeeworld`.`user_role` (
    `id_role` INT(8) NOT NULL AUTO_INCREMENT,
    `user_id` INT(8) NOT NULL,
    `roles` VARCHAR(25) NOT NULL,
    PRIMARY KEY (`id_role`, `user_id`),
    CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `coffeeworld`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT);

-- -----------------------------------------------------
-- Table `coffeeworld`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffeeworld`.`menu` (
  `id_food` INT(8) NOT NULL AUTO_INCREMENT,
  `name_food` VARCHAR(45) NOT NULL,
  `cost_food` DOUBLE NOT NULL,
  `type_food` VARCHAR(45) NULL,
  `admin_id` INT(8) NULL,
  `is_have` TINYINT NOT NULL,
  `filename` VARCHAR(255) NULL,
  PRIMARY KEY (`id_food`),
  CONSTRAINT `admin_id`
    FOREIGN KEY (`admin_id`)
    REFERENCES `coffeeworld`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT);


-- -----------------------------------------------------
-- Table `coffeeworld`.`current_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffeeworld`.`current_order` (
  `id_order` INT(8) NOT NULL AUTO_INCREMENT,
  `client_id` INT(8) NOT NULL,
  `pickup` TINYINT NULL,
  `address_order` VARCHAR(255) NULL,
  `date_order` VARCHAR(60) NULL,
  `time_order` VARCHAR(50) NULL,
  `is_done` TINYINT NOT NULL,
  `cost_order` DOUBLE NOT NULL,
  PRIMARY KEY (`id_order`),
  CONSTRAINT `id`
    FOREIGN KEY (`client_id`)
    REFERENCES `coffeeworld`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT);


-- -----------------------------------------------------
-- Table `coffeeworld`.`current_order_meals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffeeworld`.`current_order_meals` (
  `id_current_order_meals` INT(8) NOT NULL AUTO_INCREMENT,
  `current_order_id` INT(8) NOT NULL,
  `order_meal` INT(4) NOT NULL,
  `order_meal_key` INT(8) NOT NULL,
  PRIMARY KEY (`id_current_order_meals`, `current_order_id`),
  CONSTRAINT `id_order`
    FOREIGN KEY (`current_order_id`)
    REFERENCES `coffeeworld`.`current_order` (`id_order`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT);

-- -----------------------------------------------------
-- Table `coffeeworld`.`past_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffeeworld`.`past_order` (
  `id_past_order` INT(8) NOT NULL AUTO_INCREMENT,
  `client_id` INT(8) NOT NULL,
  `cost_order` DOUBLE NOT NULL,
  `pickup` TINYINT NULL,
  `address_order` VARCHAR(255) NULL,
  `date_order` VARCHAR(60) NULL,
  `time_order` VARCHAR(50) NULL,
  `past_order_text` VARCHAR(255) NULL,
  `is_done` TINYINT NULL,
  PRIMARY KEY (`id_past_order`),
  CONSTRAINT `client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `coffeeworld`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT);



-- -----------------------------------------------------
-- Table `coffeeworld`.`past_order_meals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffeeworld`.`past_order_meals` (
  `id_past_order_meals` INT(8) NOT NULL AUTO_INCREMENT,
  `past_order_id` INT(8) NOT NULL,
  `order_meal` INT(4) NOT NULL,
  `order_meal_key` INT(8) NOT NULL,
  PRIMARY KEY (`id_past_order_meals`, `past_order_id`),
  CONSTRAINT `id_past_order`
    FOREIGN KEY (`past_order_id`)
    REFERENCES `coffeeworld`.`past_order` (`id_past_order`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT);