--DATA CLEANING

SELECT * 
FROM world_layoffs.layoffs;

--1.Remove duplicates
--2.Standardize the data
--3.Null Values or blank values
--4.Remove Any columns





CREATE TABLE layoffs (
company VARCHAR(255),
location VARCHAR(255),
industry VARCHAR(255),
total_laid_off int,
percentage_laid_off decimal(4,2),
date text,
stage VARCHAR(255),
country VARCHAR(255),
funds_raised_millions int
);


DESCRIBE layoffs;
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;



