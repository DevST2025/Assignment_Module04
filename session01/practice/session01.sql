-- Thực hành 1
create database `my_database1`;
-- Thực hành 2
drop database `my_database1`;
-- Thực hành 3
create schema `student-management`;
CREATE TABLE `student-management`.`Student` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `age` INT NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));