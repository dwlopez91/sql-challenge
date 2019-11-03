/*list the following details of each employee: 
employee number, last name, first name, gender, and salary.*/

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
FROM employees AS emp
JOIN salaries AS sal 
	ON (emp.emp_no=sal.emp_no)


/*List employees who were hired in 1986.*/

SELECT emp.emp_no, emp.first_name, emp.last_name, emp.hire_date
FROM employees AS emp
WHERE hire_date BETWEEN '01-01-1986' AND '12-31-1986'
ORDER BY hire_date;

/*List the manager of each department with the following information: 
department number, department name, the manager's employee number, 
last name, first name, and start and end employment dates.*/

SELECT dept_mang.dept_no, dept.dept_name, dept_mang.emp_no, emp.first_name, emp.last_name, 
dept_mang.from_date, dept_mang.to_date
FROM employees as emp
JOIN dept_manager as dept_mang
	ON(emp.emp_no=dept_mang.emp_no)
JOIN departments as dept
	ON(dept_mang.dept_no=dept.dept_no)
ORDER BY hire_date

	
/*List the department of each employee with the following information: 
employee number, last name, first name, and department name.*/

SELECT emp.emp_no, emp.first_name, emp.last_name, dept.dept_name
FROM employees as emp
JOIN dept_emp
	ON(emp.emp_no=dept_emp.emp_no)
JOIN departments as dept
	ON(dept_emp.dept_no=dept.dept_no)
	

/*List all employees whose first name is "Hercules" and 
last names begin with "B."*/

SELECT emp.first_name, emp.last_name
FROM employees as emp
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

/*List all employees in the Sales department, 
including their employee number, last name, first name, and 
department name.*/

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees as emp
JOIN dept_emp
	ON(emp.emp_no=dept_emp.emp_no)
JOIN departments as dept
	ON(dept_emp.dept_no=dept.dept_no)
WHERE dept_name = 'Sales'

/*List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name.*/

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees as emp
JOIN dept_emp
	ON(emp.emp_no=dept_emp.emp_no)
JOIN departments as dept
	ON(dept_emp.dept_no=dept.dept_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development'

/*In descending order, list the frequency count of employee last names, 
i.e., how many employees share each last name.*/

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
 

	