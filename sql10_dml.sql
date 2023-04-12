/*
DML(Data Manipulation Language): 데이터 조작 언어.
INSERT UPDATE DELETE    ---- [ SELECT ]
- INSERT INTO TABLENAME [(COLUMN, ...)] VALUES ( 값1, 값2, ... )
- INSERT INTO TABLE1
SELECT COLUMN, ... FROM TABLE2 WHERE ...;
- UPDATE TABLENAME SET COLUMN = 값, ... [WHERE 조건식]
- DELETE FROM TABLENAME [WHERE 조건식];
*/

-- CREATE TABLE ... AS SELECT: 다른 테이블에서 테이블의 모양(컬럼 이름, 데이터 타입)과 데이터를 을 복사.

CREATE TABLE my_emp 
AS SELECT * FROM emp;

select * from my_emp;

CREATE TABLE my_emp2
AS SELECT * FROM emp WHERE empno=-1;

DESC my_emp2;

-- my_emp2 테이블에 emp 테이블의 모든 내용을 insert:
INSERT INTO my_emp2
SELECT * FROM emp;

-- my_emp2 테이블에서, 사번이 1004인 직원의 급여를
-- 6000으로 변경

UPDATE my_emp2
SET sal = 6000
WHERE empno =1004; --> 조건절이 없으면 모든 행의 값이 업데이트 되어버림.


COMMIT;

ROLLBACK;

--> 사번이 1004 인 직원의 직무를 'MANAGER', 입사날짜 '2000/12/31', 부서번호를 40번으로 업데이트

UPDATE my_emp2
SET job = 'MANAGER', hiredate = to_date('2000/12/31'), deptno = 40
WHERE empno = 1004;

SELECT * FROM my_emp2;

-- 'ACCOUNTING' 부서에서 일하는 직원들의 급여를 10% 인상:
UPDATE my_emp2
SET sal = sal * 1.1
WHERE deptno = (SELECT deptno FROM dept WHERE dname = 'ACCOUNTING');

SELECT * FROM my_emp2 WHERE deptno = 10;


-- SALGRADE가 1인 직원들의 급여를 20% 인상:

UPDATE my_emp2
SET sal = sal * 1.2
WHERE sal Between (SELECT losal FROM salgrade WHERE grade = 1)
AND
(SELECT hisal FROM salgrade WHERE grade = 1);

COMMIT;

-- 테이블에서 행 삭제
DELETE FROM my_emp2;
--> DELETE 명령은 ROLLBACK이 가능한 DML
--> truncate table 명령은 Rollback이 불가능한 DDL


-- 직원번호 1004인 직원 레코드(행)을 삭제:

DELETE FROM my_emp2
WHERE empno = 1004;

-- 1987년에 입사한 직원 삭제
DELETE FROM my_emp2
WHERE to_char(hiredate,'YYYY') = 1987;

SELECT * FROM my_emp2;

COMMIT;
