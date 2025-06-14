--Window Functions


SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id
GROUP BY gender
;

--Window Functions

SELECT gender, AVG(salary) OVER()
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;
everyone and all avg_salary


--Over(Partiton By)


SELECT gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;
same gender group of avg_salary

--eg. of use window functions in two different table


SELECT dem.first_name, dem.last_name, gender, AVG(salary) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name, gender;
This one gave different result because they`ve hold difference value.
Thsi one is calculated base on individual.




SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;
(This result of avg_salary is calculated base on gender group)



---Rolling Total


SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;

--Row number()

SELECT dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;
Give the row number Base On gender.

SELECT dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER()
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;
Give the row number every row different value.Not base on gender.

SELECT dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC)
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;

Give row number base on salary.Even salary is the same the result give different row number.


--Rank 

SELECT dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;

But rank is different.Cuz if the salary is the same,rank give the same number to the same salary row.
And after that the next row numvber will become become the next value.Eg,5,5 and the next will be 7.


--Dense Rank

SELECT dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;

DENSE rank function is the same with rank function.But the different is the next row number will be the same.
Eg,5,5 and the next will be 6 not 7.

