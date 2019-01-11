
-- nice_student表有数据，其他表没有数据 

UPDATE table_a SET status = 2 WHERE student_id IN 
(
		SELECT student_id FROM table_a AS s 
		WHERE s.student_id NOT in(
		(SELECT student_id FROM table_b WHERE city = 5)
		UNION
		(SELECT student_id FROM table_c WHERE city = 5)
		UNION
		(SELECT student_id FROM table_d WHERE city = 5)
		)
		AND city = 5 AND status = 1
)