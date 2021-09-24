-- Deliverable 1 part 1 Challenge 
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    ti.title, 
	ti.from_date, 
	ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no ASC;

-- Deliverable 1 part 2 Challenge
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_tables
FROM retirement_titles as rt
ORDER BY emp_no ASC, to_date DESC;

-- Deliverable 1 part 3 Challenge 
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_tables as ut
GROUP BY title
ORDER BY COUNT(title) DESC

-- Deliverable 2 Challenge
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date, 
	de.to_date, 
	ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (de.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;




