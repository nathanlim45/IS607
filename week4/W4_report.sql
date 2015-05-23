--Make a table to show who reports to whom, using a self join method

SELECT e.employee_id, e.name, e.job_title, s.name AS "Supervisor" 
FROM etm AS e
LEFT JOIN etm AS s 
ON e.supervisor_id=s.employee_id
ORDER BY e.employee_id
