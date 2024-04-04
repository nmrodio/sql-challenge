
-- List the employee number, last name, first name, sex, and salary of each employee
select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", e.sex as "Sex", s.salary as "Salary"
from employees e
left join salaries s on (e.emp_no = s.emp_no)            
order by "Employee Number";    ----- DONT NEED THIS BUT PROBABLY KEEP JUST FOR A MORE INTUITIVE TABLE??????????????????????????????????????????



-- List the first name, last name, and hire date for the employees who were hired in 1986
select first_name as "First Name", last_name as "Last Name", hire_date as "Hire Date"
from employees
where extract (year from hire_date) = 1986;

---OR 
--where hire_date >= '1986-01-01' and hire_date < '1987-01-01';      ---- NOT SURE WHICH ONE IS BETTER PRACTICE????????????????????????????????????????


-- List the manager of each department along with their department number, department name, employee number, last name, and first name
select d.dept_name as "Department name", d.dept_no as "Department Number", e.emp_no as "Managers Employee Number", e.last_name as "Managers Last Name", e.first_name as "Managers First Name" 
from employees e
inner join dept_manager dm on (e.emp_no = dm.emp_no)                -------------HOW SHOULD I CHANGE THE ALIASES TO MAKE THIS MORE INTUTIVE===> IS WHAT I HAVE REDUNDENT??!?!?!?!?
inner join departments d on (dm.dept_no = d.dept_no);



-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
select d.dept_no as "Department Number", d.dept_name as "Department name", e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name" 
from employees e
inner join dept_emp de on (e.emp_no = de.emp_no)
inner join departments d on (de.dept_no = d.dept_no)
---where e.emp_no = '10010';            ====> THIS LINE OF CODE TESTS TO FIND THE "emp_no"/employees that are dupes but have to figure out what to do when a person works in two departments(I think its fine)


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select first_name as "First Name", last_name as "Last Name", sex as "Sex"
from employees
where first_name = 'Hercules' and last_name like 'B%';


-- List each employee in the Sales department, including their employee number, last name, and first name
select d.dept_name as "Department", e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name"
from employees e
inner join dept_emp de on (e.emp_no = de.emp_no)
inner join departments d on (de.dept_no = d.dept_no)
where dept_name = 'Sales';


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
select d.dept_name as "Department", e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name"
from employees e
inner join dept_emp de on (e.emp_no = de.emp_no)
inner join departments d on (de.dept_no = d.dept_no)
where dept_name = 'Sales' or dept_name = 'Development';


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
 select count(*) as "Frequency Count", last_name as "Last Names" 
 from employees
 group by last_name
 order by "Frequency Count" DESC;
 

