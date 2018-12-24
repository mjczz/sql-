SELECT student_id,student_name,student_code,encrypt,passwd,md5(md5(concat(substr(student_code,5,4),encrypt)))
FROM table_a

UPDATE table_a
set passwd = md5(md5(concat(substr(student_code,5,4),encrypt)))