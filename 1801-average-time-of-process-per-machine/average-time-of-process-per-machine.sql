/* Write your T-SQL query statement below */
SELECT A.machine_id, ROUND(Avg(A1.timestamp - A.timestamp),3) AS processing_time
FROM Activity A
JOIN Activity A1 ON A.machine_id = A1.machine_id AND A.process_id = A1.process_id
WHERE A.activity_type = 'start' and A1.activity_type = 'end'
GROUP BY A.machine_id