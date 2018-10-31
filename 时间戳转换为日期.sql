update nice_student_follow set ymd = 
cast(to_char(to_timestamp(follow_time),'yyyyMMdd') as integer)