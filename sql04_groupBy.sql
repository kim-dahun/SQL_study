/* 오라클 함수(funtion)
    1. 단일 행 함수
    행(row) 이 하나씩 함수의 argument로 전달되고, 행 마다 하나씩 결과가 return 되는 함수
    2. 다중 행 함수(group 함수)
    여러 개의 행이 함수의 argument로 전달되고, 하나의 결과가 return 되는 함수
    (예) 통계 관련 함수 : count, sum, avg, max, min, variance(분산), stddev(표준편차) ...
    (주의) 단일 행 함수와 그룹 함수는 동시에 select해서 사용할 수 없음.
*/

-- 단일 행 함수의 예 - 문자열을 소문자로 바꾸기.
SELECT ename, lower(ename)
FROM emp;

-- 날짜 타입을 데이터를 원하는 문자열 포맷으로 출력.

SELECT hiredate, TO_CHAR (hiredate, 'YYYY-MM-DD')
FROM emp;

-- nvl(컬럼, val) : 컬럼이 Null 이면 val 을 리턴하고, 아니면 컬럼이 원래 가지고 있는 값을 리턴
-- nvl2(컬럼, val1, val2) : 컬럼이 Null이 아니면 val1을 리턴하고, Null이면 val2를 리턴

SELECT comm, nvl(comm, -1), nvl2(comm, comm, -1)
from emp;

-- 다중행 함수
-- count(컬럼) : Null이 아닌 행의 갯수 리턴.

SELECT count (empno), count(mgr), count(nvl(comm,0)), count(*) -- count(*) 테이블 행(row)의 갯수를 Return
from emp;

-- 통계함수 : 합계, 평균, 최댓값, 최솟값, 분산, 표준편차

SELECT avg (sal), sum(sal), max(sal), min(sal), variance(sal), stddev(sal)
FROM emp;
--WHERE job LIKE 'S%';

SELECT stddev(sal)
FROM emp;


-- select nvl(sal, 0), sum(sal) from emp;
-- 단일행 함수와 다중 행 함수는 함께 사용할 수 없음.

-- 그룹별 쿼리

-- SELECT ... FROM ... [WHERE ...] GROUP BY ... [HAVING ...] ORDER BY ...;
-- 부서별 급여 평균
SELECT deptno, round(avg(sal),0)
FROM emp
GROUP BY deptno
ORDER BY deptno;

-- 모든 문제에서 소수점은 반올림해서소수점이하 2자리까지만 표시하세요.

/*
1.부서별 급여 평균, 표준편차를 부서번호 오름차순으로 출력.
2. 직무별 직무, 직원수, 급여 최댓값, 최솟값, 평균을 직무 오름차순으로 출력
3. 부서별 직무별 부서번호, 직무, 직원수 급여 평균을 검색
        (1) 부서번호 (2) 직무 순으로 정렬
4. 입사연도별 사원 수를 검색. 힌트 to_char 이용
*/

--1.
SELECT deptno, round(avg(sal),2), round(stddev(sal),2)
FROM emp
GROUP BY deptno
ORDER BY deptno;

--2.
SELECT job, count(job), round(max(sal),2) , round(min(sal),2), round(avg(sal),2)
FROM emp
GROUP BY job
ORDER BY job;

--3.
SELECT deptno, job, count(*), round(avg(sal),2) AS "급여 평균"
FROM emp
GROUP BY deptno, job
ORDER BY deptno, job;

--4.
SELECT to_char(hiredate,'YYYY') AS "입사연도",count(*) AS "사원수",round(avg(sal),2) AS "입사연도별 평균 임금"
FROM emp
GROUP BY to_char(hiredate,'YYYY')
ORDER BY 입사연도;


/*
    Select 문장 순서:
    select 컬럼, ... [5]
    from 테이블 [1]
    where 조건식 ( 그룹을 묶기 전에 검사할 조건식) [2]
    group by 컬럼, ... [3]
    Having 조건식 [4]
    order by [6]
    */
    
    
-- 부서별 평균 급여 검색. 부서번호 오름차순, 부서별 급여 평규닝 2000 이상인 부서만 검색

SELECT deptno, avg(sal)
FROM emp
GROUP BY deptno
HAVING avg(sal)>=2000
ORDER BY deptno;

-- mgr 컬럼이 null이 아닌 직원들 중에서
-- 부서별 급여 평균을 검색. 부서번호 오름차순.

SELECT deptno,avg(sal)
FROM emp
WHERE mgr is not null
GROUP BY deptno
ORDER BY deptno;


-- 직무별 사원 수를 검색, PRESIDENT 검색 제외

SELECT job, count(*)
FROM emp
WHERE job != 'PRESIDENT'
GROUP BY job
HAVING count(*)>=3
ORDER BY job;


-- 입사연도, 부서별, 입사연도별 부서별 사원 수 검색
-- 1980년 검색 제외
-- 연도별 부서별 사원수가 2명 이상인 경우만 선택
-- 연도별, 부서별 오름차순

SELECT to_char(hiredate,'YYYY') AS "입사연도" ,deptno,count(*)
FROM emp
GROUP BY to_char(hiredate,'YYYY'), deptno
HAVING to_char(hiredate, 'YYYY') != '1980' AND count(*)>=2
ORDER BY 입사연도, deptno;


