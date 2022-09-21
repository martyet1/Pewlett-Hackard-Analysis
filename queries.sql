SELECT e.emp_no,e.first_name,e.last_name,t.title,t.from_date,t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' and '1955-12-31'


SELECT DISTINCT ON(emp_no)emp_no,first_name,last_name,title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'

SELECT count(title),title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count desc


SELECT DISTINCT ON(e.emp_no)e.emp_no,e.first_name,e.last_name,e.birth_date,d.from_date,d.to_date,t.title
INTO mentorship
FROM employees as e
INNER JOIN dept_emp as d
ON e.emp_no = d.emp_no
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE d.to_date = '9999-01-01'
AND birth_date between '1965-01-01' and '1965-12-31'