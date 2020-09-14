--retirment_titles
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;




-- unique_titles
SELECT DISTINCT ON (ret.emp_no)ret.emp_no ,
ret.first_name,
ret.last_name,
ret.title
INTO unique_titles
FROM retirement_titles as ret
ORDER BY ret.emp_no, ret.to_date DESC;

--retiring_titles 
SELECT COUNT(ut.emp_no) as cut, ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY cut DESC;

--membership_eligibility
SELECT DISTINCT ON (em.emp_no)em.emp_no,
em.first_name, 
em.last_name,
em.birth_date,
de.from_date,
de.to_date,
ti.title
INTO membership_eligibility
FROM employees as em
INNER JOIN dept_emp AS de
ON (em.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (de.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')