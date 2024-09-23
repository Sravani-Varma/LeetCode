/* Write your T-SQL query statement below */
SELECT Q.query_name, 
       ROUND((SUM(QQ.quality1)/COUNT(QQ.quality1)), 2) AS quality, ROUND(QP1.poor_query_percentage,2) AS poor_query_percentage
FROM Queries Q
JOIN (
    SELECT QA.query_name, CONVERT(DECIMAL(10, 2), QA.rating) / CONVERT(DECIMAL(10, 2), QA.position) AS quality1
    FROM Queries QA
) AS QQ 
ON Q.query_name = QQ.query_name
JOIN ( SELECT QP.query_name, COUNT(CASE WHEN QP.rating < 3 THEN 1 END) * 100.0 / COUNT(*) AS poor_query_percentage
        FROM Queries QP
        GROUP BY QP.query_name) AS QP1
ON Q.query_name = QP1.query_name
GROUP BY Q.query_name, QP1.poor_query_percentage;



