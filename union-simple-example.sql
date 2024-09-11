SELECT employees.name, departments.name AS department
FROM employees
         JOIN departments ON employees.department_id = departments.id

UNION

SELECT contractors.name, projects.name AS department
FROM contractors
         JOIN projects ON contractors.project_id = projects.id;