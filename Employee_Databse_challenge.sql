SELECT e.emp_no,
        e.first_name,
        e.last_name,
        t.title,
        t.from_date,
        t.to_date
INTO mentor_list
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no DESC

-- using DISTINCT ON
SELECT DISTINCT ON(emp_no) 
		rt.emp_no,
        rt.first_name,
        rt.last_name,
		rt.title
-- INTO unique_titles
FROM retirement_titles as rt
-- INNER JOIN retirement_titles as rt
-- ON (e.emp_no = t.emp_no)
-- WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY rt.emp_no, to_date DESC  
--AND by the last date to_date of the most recent title
-- Use DISTINCT ON to remove duplicate rows

-- COUNT number of titles from the uniqeu titles table
-- create Retireing Titles table to hold info
-- Group by the table titble and sort by the count column in descneding order
-- 

-- get count of titles from uniqe titles table
SELECT COUNT(title), title
-- INTO retiring_titles
FROM unique_titles as ut
-- LEFT JOIN titles as t
-- -- ON (t.title = ut.title)
GROUP BY ut.title
ORDER BY COUNT DESC;
