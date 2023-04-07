-- 테이블에서 데이터를 검색:
-- (1) projection : 테이블에서 원하는 컬럼들을 선택.
-- (2) selection : 테이블에서 조건을 만족하는 레코드(행, row)
-- select column_name, ... from table_name 
-- where 조건식 
-- order by 기준 column_name, ...;

--조건식에서 사용되는 연산자들:
--  (1) 비교 연산자 : =, !=, >, >=, <, <=, is null, is not null, ...
--  (2) 논리 연산자 : AND, OR, NOT

-- 직원 테이블에서 10번 부서에서 근무하는 직원들의 부서번호, 사번, 이름을 출력
SELECT deptno, empno, ename
FROM emp
WHERE deptno = 10;

-- 직원 테이블에서 수당(COMM)이 null 이 아닌 직원들의 사번, 부서번호, 이름, 수당을 출력
SELECT  empno, deptno, ename, comm 
FROM emp
WHERE comm IS NOT NULL
ORDER BY comm DESC;


-- 직원 테이블에서 급여(SAL)가 2000 이상인 직원들의 이름, 직무, 급여를 출력.
SELECT ename, job, sal
FROM emp
WHERE sal >= 2000 --AND job != 'PRESIDENT'
ORDER BY sal;

-- 직원 테이블에서 급여가 2000 이상, 3000이하인 직원들의 이름, 직무, 급여를 출력.
-- 급여의 내림차순으로 정렬.

SELECT ename AS "비즈니스 국제이름", job AS "직무", sal AS "연봉"
FROM emp
WHERE sal >=2000 AND sal <=3000
ORDER BY sal DESC;

SELECT ename, job, sal
FROM emp
WHERE sal BETWEEN 2000 and 3000
ORDER BY sal DESC;

-- 직원 테이블에서 10번 또는 20번 부서에서 근무하는 직원들의 부서번호, 이름, 급여를 검색.
-- 출력 순서는 (1) 부서 번호, (2) 이름 오름차순 정렬.

SELECT deptno, ename, sal
FROM emp
--WHERE deptno = 10 OR deptno = 20
WHERE deptno IN (10 , 20 )
ORDER BY deptno, ename;

-- 직원 테이블에서 직무가 'CLERK'인 직원들의 직무, 이름, 급여를 출력.
-- 이름 오름차순 순서로 출력
SELECT job, ename, sal
FROM emp
WHERE job = 'CLERK'
ORDER BY ename;


-- 직원 테이블에서 직무가 CLERK 또는 MANAGER인 직원들의 직무, 이름, 급여를 검색.
-- 출력 순서 (1) 직무 (2) 급여 오름차순 정렬.

SELECT job, ename, sal
FROM emp
WHERE job = 'CLERK' OR job = 'MANAGER'
ORDER BY job, sal;

-- 직원 테이블에서 20번 부서에서 근무하는 CLERK의 모든 정보를 검색

SELECT *
FROM emp
WHERE job = 'CLERK' AND deptno = 20;

-- 직원 테이블에서 CLERK, ANALYST, MANAGER가 아닌 직원들의 사번, 이름, 직무, 급여를 검색
-- 사번 오름차순 정렬.

SELECT empno, ename, job, sal
FROM emp
--WHERE job != 'CLERK' AND job !='ANALYST' AND job !='MANAGER'
WHERE job NOT IN ('CLERK' , 'ANALYST' , 'MANAGER' ) 
ORDER BY empno;


