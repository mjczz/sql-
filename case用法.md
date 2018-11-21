## pgsql case 用法，获取学生人数

```sql
SELECT
	co.ymd,
	co.class_num,
	case WHEN co.class_num = 0
	THEN 0 else sum(co.class_num)/co.class_num END AS sum_student,
	SUM (co.class_money) AS class_money,
	SUM (co.keshi_num) AS keshi_num
FROM
	nice_student_class_out AS co
WHERE
	co.keshi_num > 0
AND co.city = '1'
AND co.class_campus = '111'
AND co.ymd >= '20181101'
AND co.ymd <= '20181130'
AND class_status = 4
GROUP BY
	co.ymd,
	co.class_num
ORDER BY
	co.ymd DESC
```