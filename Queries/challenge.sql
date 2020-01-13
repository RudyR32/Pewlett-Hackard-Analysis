-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);
-- Creating table for Employees
Create Table employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

--dept_manager table
--Foreigh KEY: The FOREIGN KEY constraint tells Postgres that there is a link between two tables
CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no, from_date)
);

CREATE TABLE salaries (
  	emp_no INT NOT NULL,
  	salary INT NOT NULL,
  	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
 FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
 	PRIMARY KEY (emp_no)
);

CREATE TABLE titles (
  	emp_no INT NOT NULL,
  	title VARCHAR NOT NULL,
  	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
 FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
 	PRIMARY KEY (emp_no, title, from_date)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
  	dept_no VARCHAR NOT NULL,
  	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  	PRIMARY KEY (emp_no, dept_no, from_date)
);

SELECT * FROM departments;

SELECT * FROM dept_emp;

DROP TABLE titles CASCADE;

DROP TABLE dept_emp CASCADE;

DROP TABLE dept_manager CASCADE;

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

DROP TABLE retirement_info;

-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments AS d
INNER JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no;

-- -- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info AS ri
LEFT JOIN dept_emp AS de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO emp_dept_count
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info
FROM employees AS e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01');
	
-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
		
-- List of Department Retirees
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

-- Skill Drill
-- List of Department Retirees in Sales
SELECT ri.emp_no,
ri.first_name,
ri.last_name,
d.dept_name
INTO sales_dept_info
FROM retirement_info as ri
INNER JOIN dept_emp AS de
	ON (ri.emp_no = de.emp_no)
INNER JOIN departments AS d
	ON (de.dept_no = d.dept_no)
WHERE dept_name = 'Sales';

-- Skill Drill
-- List of Department Retirees in Sales and Development
SELECT ri.emp_no,
ri.first_name,
ri.last_name,
d.dept_name
INTO salesanddev_dept_info
FROM retirement_info as ri
INNER JOIN dept_emp AS de
	ON (ri.emp_no = de.emp_no)
INNER JOIN departments AS d
	ON (de.dept_no = d.dept_no)
WHERE dept_name IN ('Sales', 'Development');

-- Challenge Part 1
SELECT ri.emp_no,
ri.first_name,
ri.last_name,
ti.title,
ti.from_date,
s.salary
INTO mentor_info
FROM retirement_info as ri
INNER JOIN titles AS ti
	ON (ri.emp_no = ti.emp_no)
INNER JOIN salaries AS s
	ON (ri.emp_no = s.emp_no)

-- Challenge Part 1 removing duplicates
-- Find Duplicates
--1a. Create a new table using an INNER JOIN that contains the following
SELECT emp_no,
first_name,
last_name,
count(*)
FROM mentor_info
GROUP BY 
	emp_no,
	first_name,
	last_name
HAVING count(*) > 1

-- Prework to counts by title
-- Display duplicates with all data
SELECT * FROM
	(SELECT *, count(*)
	OVER
		(PARTITION BY
		emp_no,
		first_name,
		last_name
	) AS COUNT
	FROM mentor_info) tableWithCount
	WHERE tableWithCount.count > 1;

-- Delete unwanted duplicates
SELECT emp_no, first_name, last_name, title, from_date, salary
INTO mentor_info_no_duplicates
FROM
 	(SELECT emp_no, first_name, last_name, title, from_date, salary,
     	ROW_NUMBER() OVER 
(PARTITION BY (emp_no, first_name, last_name) ORDER BY from_date DESC) rn
   FROM mentor_info
  ) tmp WHERE rn = 1;
  
 -- In descending order (by date), list the frequency count 
 -- of employee titles (i.e., how many employees share the same title?).
SELECT
	title,
	count(*)
INTO count_by_title
FROM mentor_info_no_duplicates
GROUP BY
	title

-- Part 1c. Create a new table that contains the following information
Select
	e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO mentor_list_1965
FROM employees AS e
INNER JOIN titles AS ti
	ON (e.emp_no = ti.emp_no)
WHERE birth_date BETWEEN '1965-01-01' AND '1965-12-31'
	AND to_date = '9999-01-01';