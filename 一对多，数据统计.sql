-- 金额表一对多订单表
-- 金额表freezed字段由订单表生成
-- 金额表freezed = 订单表kind小于3的数据-订单表kind=3的数据
SELECT t.student_id,t.freezed,(t.kind_12-t.kind_3) AS source_freezed,t.kind_12,t.kind_3 
FROM (
		SELECT sm.student_id,sm.freezed,bb.kind_12,cc.kind_3 FROM nice_student_money as sm 
		INNER JOIN 
			(
			SELECT student_id,SUM(pay_total/100) AS kind_12
			FROM nice_student_class_in
			WHERE kind < 3 
			AND student_id IN (SELECT student_id FROM nice_student_money)
			GROUP BY student_id 
			) AS bb
		ON bb.student_id = sm.student_id

		INNER JOIN 
			(
			SELECT student_id,SUM(pay_total/100) AS kind_3
			FROM nice_student_class_in
			WHERE fee_flag = 1 AND kind = 3 
			AND student_id IN (SELECT student_id FROM nice_student_money)
			GROUP BY student_id 
			) AS cc
	    ON cc.student_id = sm.student_id
) AS t


-- 查询金额表freezed字段和订单表数据不同步的情况
SELECT * FROM (
    SELECT t.student_id,t.freezed,(t.kind_12-t.kind_3) AS source_freezed,t.kind_12,t.kind_3
    FROM (
			SELECT sm.student_id,sm.freezed,bb.kind_12,cc.kind_3 FROM nice_student_money as sm
			INNER JOIN
			(
			SELECT student_id,SUM(pay_total/100) AS kind_12
			FROM nice_student_class_in
			WHERE kind < 3
			AND student_id IN (SELECT student_id FROM nice_student_money)
			GROUP BY student_id
			) AS bb
			ON bb.student_id = sm.student_id

			INNER JOIN
			(
			SELECT student_id,SUM(pay_total/100) AS kind_3
			FROM nice_student_class_in
			WHERE fee_flag = 1 AND kind = 3
			AND student_id IN (SELECT student_id FROM nice_student_money)
			GROUP BY student_id
			) AS cc
			ON cc.student_id = sm.student_id

    ) AS t
) AS t2
WHERE t2.freezed != t2.source_freezed