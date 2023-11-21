use db_infostack;
show tables;

ALTER TABLE student_marks ADD COLUMN test_no int;
select * from tbl_student;
select * from student_marks;

UPDATE student_marks set test_no = 1;

INSERT INTO student_marks (subject1, subject2, subject3, student_roll_no, test_no)
VALUES
    (ROUND(RAND() * 100), ROUND(RAND() * 100), ROUND(RAND() * 100), 101, 2),
    (ROUND(RAND() * 100), ROUND(RAND() * 100), ROUND(RAND() * 100), 102, 2),
    (ROUND(RAND() * 100), ROUND(RAND() * 100), ROUND(RAND() * 100), 103, 2),
    (ROUND(RAND() * 100), ROUND(RAND() * 100), ROUND(RAND() * 100), 104, 2),
    (ROUND(RAND() * 100), ROUND(RAND() * 100), ROUND(RAND() * 100), 105, 2),
    (ROUND(RAND() * 100), ROUND(RAND() * 100), ROUND(RAND() * 100), 106, 2),
    (ROUND(RAND() * 100), ROUND(RAND() * 100), ROUND(RAND() * 100), 107, 2),
    (ROUND(RAND() * 100), ROUND(RAND() * 100), ROUND(RAND() * 100), 108, 2),
    (ROUND(RAND() * 100), ROUND(RAND() * 100), ROUND(RAND() * 100), 109, 2),
    (ROUND(RAND() * 100), ROUND(RAND() * 100), ROUND(RAND() * 100), 110, 2),
    (ROUND(RAND() * 100), ROUND(RAND() * 100), ROUND(RAND() * 100), 111, 2);
    
SELECT 
	a.student_rollno,
    a.student_name,
    sum(b.subject1),
    sum(b.subject2),
    sum(b.subject3),
    coalesce(b.test_no,1)
FROM tbl_student as a
LEFT OUTER JOIN student_marks as b
ON a.student_rollno = b.student_roll_no
AND b.test_no=1
Group By b.student_roll_no;
UNION
SELECT 
	a.student_rollno,
    a.student_name,
    sum(b.subject1),
    sum(b.subject2),
    sum(b.subject3),
    b.test_no
FROM tbl_student as a
LEFT OUTER JOIN student_marks as b
ON a.student_rollno = b.student_roll_no
AND b.test_no=2
Group By b.student_roll_no;


-- select student_rollno,student_name,student_city from tbl_student
-- union
-- select subject1,subject2,subject3 from student_marks;
-- ;