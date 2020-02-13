-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name,e.gender,s.salary from employees e
join salaries s ON e.emp_no = s.emp_no;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 2. List employees who were hired in 1986.
select e.emp_no, e.last_name, e.first_name,e.hire_date from employees e
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 3. List the manager of each department with the following information: department number, department name, the manager's 
--    employee number, last name,first name, and start and end employment dates.
select dm.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name,dm.from_date, dm.to_date
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 4. List the department of each employee with the following information: employee number, last name, first name, 
--    and department name.
select dm.emp_no, e.first_name, e.last_name, d.dept_name
FROM dept_emp dm
JOIN employees e ON dm.emp_no = e.emp_no
JOIN departments d ON dm.dept_no = d.dept_no;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select dm.emp_no, e.first_name, e.last_name, d.dept_name
FROM dept_emp dm
JOIN employees e ON dm.emp_no = e.emp_no
JOIN departments d ON dm.dept_no = d.dept_no
WHERE dept_name IN ('Sales', 'Development')
ORDER BY dept_name;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, 
-- 	  and department name.
select last_name, count(last_name )
FROM employees
GROUP BY(last_name);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;