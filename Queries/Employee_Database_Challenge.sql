-- Creating a retirement_titles table
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles

-- Creating a unique_titles table
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) r.emp_no,
r.first_name,
r.last_name,
r.title
INTO unique_titles
FROM retirement_titles as r
ORDER BY emp_no, title DESC;

SELECT * FROM unique_titles

--  Creating a retiring_titles table
-- Employee count by title
SELECT COUNT(u.emp_no), u.title
INTO retiring_titles
FROM unique_titles as u
GROUP BY u.title
ORDER BY COUNT(u.emp_no) DESC;

SELECT * FROM retiring_titles

--Creating a mentorship eligibility table by title
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE de.to_date = ('9999-01-01')
    AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibilty

--Employees in retirement_titles who are still working near retirement
SELECT DISTINCT ON (r.emp_no) r.emp_no,
r.first_name,
r.last_name,
r.title,
r.to_date
INTO emp_to_retire_still_working
FROM retirement_titles as r
where r.to_date = '9999-01-01'
ORDER BY r.emp_no;

SELECT * FROM emp_to_retire_still_working

--Total employees in Pewlett-Hackard still working
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.birth_date,
	e.first_name,
	e.last_name,
	e.gender,
	e.hire_date,
	d.to_date
INTO employees_currently_working
FROM employees AS e
INNER JOIN dept_emp AS d
ON (e.emp_no = d.emp_no)
WHERE to_date = '9999-01-01'
ORDER BY e.emp_no

SELECT * FROM employees_currently_working

--Total employee count for each title who will retire soon 
SELECT COUNT(er.emp_no) as retiree_count, er.title
INTO retiring_titles_still_working
FROM emp_to_retire_still_working as er
GROUP BY er.title
ORDER BY COUNT(er.emp_no) DESC;

SELECT * FROM retiring_titles_still_working

--Creating emp_to_retire_still_working_by_dept table
SELECT DISTINCT ON (er.emp_no) er.emp_no,
	er.first_name,
	er.last_name,
	er.title,
	de.dept_no,
	d.dept_name
INTO emp_to_retire_still_working_by_dept
FROM emp_to_retire_still_working as er
INNER JOIN dept_emp AS de
ON (er.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
ORDER BY er.emp_no;

SELECT * FROM emp_to_retire_still_working_by_dept

-- Employee to retire count for Sales and Development by title
SELECT COUNT(ed.emp_no), ed.dept_name, ed.title
INTO emp_to_retire_sales_dev
FROM emp_to_retire_still_working_bydept as ed
WHERE ed.dept_name = 'Sales' or ed.dept_name = 'Development'
GROUP BY ed.dept_name, ed.title
ORDER BY ed.dept_name, count(ed.emp_no) DESC;

SELECT * FROM emp_to_retire_sales_dev