# Write your MySQL query statement below
SELECT P.project_id, ROUND(SUM(E.experience_years)/COUNT(project_id),2) AS average_years
FROM Project P
LEFT JOIN Employee AS E
ON P.employee_id = E.employee_id
GROUP BY project_id;