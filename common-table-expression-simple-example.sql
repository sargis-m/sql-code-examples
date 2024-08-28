WITH EmployeeHierarchy AS (
    -- Anchor member: Select the top-level employees (those without managers)
    SELECT
        id,
        name,
        manager_id,
        0 AS level
    FROM
        employees
    WHERE
        manager_id IS NULL

    UNION ALL

    -- Recursive member: Select employees that report to the previous level
    SELECT
        e.id,
        e.name,
        e.manager_id,
        eh.level + 1
    FROM
        employees e
            INNER JOIN
        EmployeeHierarchy eh ON e.manager_id = eh.id
)

-- Final query to get all employees with their hierarchy levels
SELECT
    id,
    name,
    manager_id,
    level
FROM
    EmployeeHierarchy
ORDER BY
    level, id;
