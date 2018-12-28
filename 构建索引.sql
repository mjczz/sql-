-- 并发构建索引，支持读写操作并发
CREATE INDEX CONCURRENTLY class_teacher_id ON nice_student_class_out (class_teacher_id)

-- 常规构建索引，或锁住写操作的表
CREATE INDEX  class_teacher_id ON nice_student_class_out (class_teacher_id)
