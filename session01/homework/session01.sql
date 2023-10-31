create schema `student-management`;
CREATE TABLE `student-management`.`Class` (
`id` INT NOT NULL primary key auto_increment,
`name` varchar(45) NULL
);
CREATE TABLE `student-management`.`Teacher` (
`id` INT NOT NULL primary key auto_increment,
`name` varchar(45) NULL,
`age` INT NULL,
`country` VARCHAR(45) NULL
);