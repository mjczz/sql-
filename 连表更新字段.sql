UPDATE nice_student_class_out AS co
SET class_grade = (
	SELECT
		s.grade - 1
	FROM
		nice_student AS s
	WHERE
		co.student_id = s.student_id
)
WHERE co.ymd < 20180901;
