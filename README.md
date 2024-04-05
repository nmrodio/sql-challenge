# **sql-challenge** #

--------

## **Project Goal** ##
This project aims to recover, integrate, and analyze historical employee data from Hewlett Hackard for the 1980s and 1990s. The primary data source consists of six legacy CSV files, representing the remnants of the employee database from that period.

**Key Objectives:**

**1) Data Modeling:** Design and implement a relational database schema to effectively store and manage the extracted employee information from the CSV files.

**2) Data Engineering:** Develop and execute data pipelines to import and integrate the CSV data into the designed database schema, ensuring data quality and consistency.

**3) Data Analysis:** Perform exploratory data analysis on the imported data to answer relevant questions and gain insights into the historical employee population at Hewlett Hackard during the specified timeframe.

---------

## **Results From Queries - (Showing the first 10 rows)** ##

**1) List the employee number, last name, first name, sex, and salary of each employee.**

![Screenshot 2024-04-05 123159](https://github.com/nmrodio/sql-challenge/assets/157527614/68a3df32-d269-49ba-a701-4722776d9f01)

**2) List the first name, last name, and hire date for the employees who were hired in 1986.**

![Screenshot 2024-04-05 123422](https://github.com/nmrodio/sql-challenge/assets/157527614/5b1b7583-b1e1-481c-be5f-a0e3ff1ae3a0)

**3) List the manager of each department along with their department number, department name, employee number, last name, and first name.**

![Screenshot 2024-04-05 124021](https://github.com/nmrodio/sql-challenge/assets/157527614/1cda3552-dacc-4f3c-b6c5-c0e025b66d4a)

**4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name.**

![Screenshot 2024-04-05 130605](https://github.com/nmrodio/sql-challenge/assets/157527614/7f99ad87-73d5-4f0c-b0ed-f5c9dff01e8f)

**5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.**

![Screenshot 2024-04-05 130651](https://github.com/nmrodio/sql-challenge/assets/157527614/528464c6-cbd5-43bc-b58d-bbcbb0f023c7)

**6) List each employee in the Sales department, including their employee number, last name, and first name.**

![Screenshot 2024-04-05 130717](https://github.com/nmrodio/sql-challenge/assets/157527614/9329a806-9837-4473-8917-b7205f6e81dc)

**7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.**

![Screenshot 2024-04-05 130815](https://github.com/nmrodio/sql-challenge/assets/157527614/548c4d7c-b435-44f9-8f28-f7edb3a44002)

**8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).**

![Screenshot 2024-04-05 130833](https://github.com/nmrodio/sql-challenge/assets/157527614/986979d5-f785-4278-b435-88902696d6ed)

---------------------------

## **How does the code work?** ##
**tables_schema:**
* All six tables have to be created in this order due to the foreign key relationships in these tables! (Data type limits are estimated with a small buffer to handle potential future increases in data size)

1) The first table that is created is called "departments". This table has two columns "dept_no" and "dept_name". The primary key for this table is "dept_no" and the data type is set to a varchar(10) since "dept_no" includes both letters and numbers (Ex: "d001"). The "dept_no" column is set as a varchar(30) data type. To ensure data integrity, "NOT NULL" constraints are applied to these columns, disallowing null values.

2) The second table that is created is called "titles". This table has two columns "title_id" and "title". The primary key for this table is "title_id" and the data type is set to a varchar(10) since "title_id" includes both letters and numbers (Ex: "s0001"). The "titles" column is set as a varchar(30) data type. To ensure data integrity, "NOT NULL" constraints are applied to these columns, disallowing null values.

3) The third table that is created is called "employees", which is the main driver table of the entire database. This table has seven columns - "emp_no", "emp_title_id", "birth_date", "first_name", "last_name", "sex", and "hire_date". The primary key for this table is "emp_no" and the data type is set to an integer(int) (Ex: 10001). The "emp_title_id" column is set to varchar(10) data type and "first_name" and "last_name" columns are set to a varchar(30) data type. The "sex" column is set to a char(1) data type since the input for this column should only ever be a fixed length one character entry (Ex. "M" for Male and "F" for Female). The "birth_date" and "hire_date" columns are set to date data type since both of those columns hold dates in yyyy-mm-dd format. Finally, a foreign key relationship is established between "emp_title_id" from the employees table in reference to the "title_id" from the titles table ==> This relationship is a MANY-TO-ONE. To ensure data integrity, "NOT NULL" constraints are applied to these columns, disallowing null values.

4) The fourth table that is created is called "dept_emp". This table acts as a junction table and has two columns "emp_no" and "dept_no". The "emp_no" is set as a interger(int) data type and "dept_no" is set as a varchar(10) data type. There are two foreign key relationships established in this table - The first one being a foreign key relationship is established between "emp_no" from the dept_emp table in reference to the "emp_no" from the employees table ==> This relationship is a MANY-TO-ONE. The second foreign key relationship is established between "dept_no" from the dept_emp table in reference to the "dept_no" from the departments table ==> This relationship is also a MANY-TO-ONE. Lastly, a composite/primary key is created for this table by combining both "emp_no" and "dept_no" to uniquely identify each row in this table (Each employee and each department(s) they work in). To ensure data integrity, "NOT NULL" constraints are applied to these columns, disallowing null values.

5) The fifth table that is create is called "dept_manager". This table also acts as a junction table and has two columns "dept_no" and "emp_no" which show each manager(s) of each department. The "emp_no" is set as a interger(int) data type and "dept_no" is set as a varchar(10) data type. There are two foreign key relationships established in this table - The first one being a foreign key relationship is established between "dept_no" from the dept_manager table in reference to the "dept_no" from the departments table ==> This relationship is a MANY-TO-ONE. The second foreign key relationship is established between "emp_no" from the dept_manager table in reference to the "emp_no" from the employees table ==> This relationship is a ONE-TO-ONE. Lastly, a composite/primary key is created for this table by combining both "dept_no" and "emp_no" to uniquely identify each row in this table (Each manager(s) of each department). To ensure data integrity, "NOT NULL" constraints are applied to these columns, disallowing null values.

6) The sixth table that is created is called "salaries". This table has two columns "emp_no" and "salary". The primary key for this table is "emp_no" and the data type is set as a integer(int). The "salary" column is also set as a interger(int) data type. Finally, a foreign key relationship is established between "emp_no" from the salaries table in reference to the "emp_no" from the employees table ==> This relationship is a ONE-TO-ONE. To ensure data integrity, "NOT NULL" constraints are applied to these columns, disallowing null values.




**queries_schema:**
