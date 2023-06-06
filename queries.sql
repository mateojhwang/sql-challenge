--List the employee number, last name, first name, sex, and salary of each employee
select "Salaries".emp_no, last_name, first_name, sex, "Salaries".salary from "Employees"
--join salaries and employees table on emp_no column
join "Salaries"
on "Employees".emp_no = "Salaries".emp_no
order by emp_no;


--List the first name, last name, and hire date for the employees who were hired in 1986
select first_name, last_name, hire_date from "Employees"
--hire date is after the 
where hire_date >= '1986-01-01'
and hire_date <= '1986-12-31';


--List the manager of each department along with their department number, department name,
--employee number, last name, and first name
select "Employees".emp_no, "Employees".last_name, "Employees".first_name
		, "Departments".dept_no, "Departments".dept_name
--join departmentmanager, employees and departments table
from (("DepartmentManager"
	inner join "Employees"
	on "DepartmentManager".emp_no = "Employees".emp_no)
	  	inner join "Departments"
	  	on "DepartmentManager".dept_no = "Departments".dept_no)
	  	order by emp_no;
		
		
--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name
select "DepartmentEmployees".dept_no, "Employees".emp_no, "Employees".last_name, 
		"Employees".first_name, "Departments".dept_name
--join departmentmanager, employees and departments table
from (("DepartmentEmployees"
	inner join "Departments"
	on "DepartmentEmployees".dept_no = "Departments".dept_no)
	  	inner join "Employees"
	  	on "DepartmentEmployees".emp_no = "Employees".emp_no)
		order by emp_no;
	
	
--List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B
select first_name, last_name, sex from "Employees"
where first_name = 'Hercules'
and last_name like 'B%';


--List each employee in the Sales department, including their employee number,
--last name, and first name
select "Employees".emp_no, "Employees".last_name, 
		"Employees".first_name, "Departments".dept_name
--join departmentemployees, employees and departments table
from (("DepartmentEmployees"
	inner join "Departments"
	on "DepartmentEmployees".dept_no = "Departments".dept_no)
	  	inner join "Employees"
	  	on "DepartmentEmployees".emp_no = "Employees".emp_no)
		where dept_name = 'Sales'
		order by emp_no;
		
		
--List each employee in the Sales and Development departments, including their 
--employee number, last name, first name, and department name
select "Employees".emp_no, "Employees".last_name, 
		"Employees".first_name, "Departments".dept_name
--join departmentemployees, employees and departments table
from (("DepartmentEmployees"
	inner join "Departments"
	on "DepartmentEmployees".dept_no = "Departments".dept_no)
	  	inner join "Employees"
	  	on "DepartmentEmployees".emp_no = "Employees".emp_no)
		where dept_name = 'Sales'
		or dept_name = 'Development'
		order by emp_no;
		
		
--List the frequency counts, in descending order, of all the employee last names
--(that is, how many employees share each last name)
select last_name, count(last_name) from "Employees"
group by last_name
order by count desc;