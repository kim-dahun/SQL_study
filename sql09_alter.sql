/*
DDL(Data Definition Language) : Create, alter, trncate, drop
alter table : 테이블 정의 수정.
- 변경 : 이름 변경(RENAME), 추가(ADD), 삭제(DROP), 수정(MODIFY)
(1) alter table N rename ...
(2) alter table N add ...
(3) alter table N drop ...
(4) alter table N modify ...
*/


-- 이름 변경 ( RENAME )
-- (1) 테이블 이름 변경 : students 테이블 이름을 student로 변경
ALTER TABLE students RENAME TO student;
-- (2) 컬럼이름 변경: student 테이블의 stuname 컬럼의 이름을 sname으로 변경

ALTER TABLE student RENAME COLUMN stuname TO sname;
-- (3) 제약조건 이름 변경: 제약 조건 추가 후 작성.

DESCRIBE student; 
--> 테이블의 컬럼이름, 널 가능 여부, 데이터타입을 출력.
--> 표준 SQL 명령어 아님. ORACLE에서만 사용가능.

-- 추가(add)
-- (1) 새로운 컬럼 : student 테이블에 department(학과) 컬럼 추가
-- alter add column name datatype default value
ALTER TABLE student ADD department number(2);


-- (2) 새로운 제약조건 : student 테이블에 stuno 컬럼에 PK 제약조건을 추가
-- alter table tableName add constraint consName 제약내용 (columnName) 
ALTER TABLE student ADD CONSTRAINT stu_no_pk PRIMARY KEY (stuno);
ALTER TABLE student RENAME CONSTRAINT stu_no_pk TO student_pk;

-- 삭제(DROP)
-- (1) 컬럼 삭제: student table에서 department 컬럼을 삭제
ALTER TABLE student DROP COLUMN department;

-- (2) 제약조건 삭제 
ALTER TABLE student DROP CONSTRAINT student_pk;


-- 수정(MODIFY) : TABLE의 컬럼 정의(Data type, null 여부, 기본값) 를 수정
-- student 테이블의 sname 컬럼의 데이터 타입을 varchar2(100 char) 로 수정
ALTER TABLE student MODIFY sname varchar2(100 char);

ALTER TABLE student MODIFY sname NOT NULL;
desc student;

-- modify는 제약 조건 내용을 변경할 수 없음.
-- drop constraint ... (제약조건 삭제)-> add constraint(새로운 제약조건 추가)

