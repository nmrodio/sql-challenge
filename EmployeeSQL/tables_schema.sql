------------------------- CREATING TABLES & SETTING UP PRIMARY AND FOREIGN KEYS ----------------------------

--Creating "departments" table
create table departments(
	dept_no varchar(10) NOT NULL PRIMARY KEY,
	dept_name varchar(30) NOT NULL
);

--Creating "titles" table
create table titles(
	title_id varchar(10) NOT NULL PRIMARY KEY,
	title varchar(30) NOT NULL
);


--Creating "employees" table
create table employees(
	emp_no int NOT NULL PRIMARY KEY,
	emp_title_id varchar(10) NOT NULL,
	birth_date date NOT NULL,
	first_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
	sex char(1) NOT NULL,
	hire_date date NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);


--Creating "dept_emp" table
create table dept_emp(
	emp_no int NOT NULL,
	dept_no varchar(10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


--Creating "dept_manager" table
create table dept_manager(
	dept_no varchar(10) NOT NULL,
	emp_no int NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


--Creating "salaries" table
create table salaries(
	emp_no int NOT NULL,
	salary int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);