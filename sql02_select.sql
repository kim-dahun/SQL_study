-- ALT + F10 새로운 워크시트를 작성하는 단축키

-- SELECT 컬럼 이름, ... FROM 테이블 이름;

-- EMP : 사원 테이블 / DEPT : 부서 테이블

-- 사원 테이블에서 사번과 이름을 검색

SELECT empno,ename FROM emp;

-- 부서 테이블에서 모든 컬럼을 검색
SELECT dname,loc,deptno FROM dept; -- SELECT 한 순서대로 결과가 출력됨.(테이블에서 컬럼이 만들어진 순서와 관계 X )
SELECT * FROM dept; -- 테이블에서 컬럼들이 만들어진 순서대로 결과가 출력됨.

-- Column 이름에 별명(alias) 주기.
-- AS "별명" 에서는 큰 따옴표("") 사용함!
SELECT deptno AS "부서 번호", dname AS "부서 이름" 
FROM dept;

-- 별명은 원하는 컬럼에만 사용할 수도 있음
SELECT deptno, dname AS "부서 명" 
FROM dept;

-- 연결 연산자(||) : 두 개 이상의 컬럼을 합쳐서 하나의 컬럼으로 출력.
-- 부서 번호-부서이름 형식의 문자열을 '부서 정보' 라는 컬럼으로 출력.

-- 별명에서만 큰 따옴표("") 를 사용함. 나머지 문자열 등은 작은따옴표('') 사용
SELECT deptno || '-' || dname AS "부서 정보" 
FROM dept;

-- 부서 테이블의 내용을 검색해서 '... 부서는 ... 도시에 있습니다.' 포맷으로 출력

SELECT dname || ' 부서는 ' || loc || ' 에 있습니다.' AS "부서별 위치" 
FROM dept;

-- 정렬해서 출력하기

-- SELECT 컬럼 이름, ... FROM 테이블 이름 ORDER BY 컬럼 이름 (ASC/DESC) -생략가능;

-- ASC(ASCENDING ORDER). 오름차순 정렬. 정렬의 기본값. ASC는 보통 생략
-- DESC(DESCENDING ORDER). 내림차순 정렬. 생략불가.

-- 부서 테이블의 모든 내용을 검색, 부서 번호 내림차순으로 출력.

-- 부서 테이블의 모든 내용을 검색, 부서 번호 기준 내림차순
SELECT * FROM dept ORDER BY deptno DESC;

-- 부서 테이블의 모든 내용을 검색, 부서 이름 기준 오름차순
SELECT * FROM dept ORDER BY dname ASC;

-- 부서 테이블의 모든 내용을 검색, 부서 위치 내림차순으로 출력

SELECT dname, loc, deptno FROM dept ORDER BY loc DESC;

-- 사원 테이블에서 부서번호, 사번, 이름을 검색
-- 정렬 조건 : (1) 부서 번호, (2) 사번 오름차순

SELECT deptno AS "부서번호", empno AS "사번", ename AS "이름" 
FROM emp 
ORDER BY deptno ASC, empno DESC
;

-- 사원 테이블에서 부서번호, 직무, 이름을 검색, 정렬순서 : (1) 부서번호, (2) 직무 오름차순;
-- FROM 테이블을 먼저 작성하면 관련된 필드를 모두 보여줌 ( Ctrl + space )

SELECT deptno, job, ename 
FROM emp
--WHERE deptno = 20 -- 조건식은 정렬 전에 입력
ORDER BY deptno, job;

-- 중복되지 않는 결과만 출력하기
-- 직원 테이블에서 직무를 검색.

SELECT distinct -- SELECT DISTINCT 컬럼 이름 FROM 테이블 명 --> 중복되지 않는 값만 출력
job 
FROM emp
;

-- 직원 테이블에서 중복되지 않는 부서 번호, 직무를 출력

SELECT DISTINCT deptno, job 
FROM emp
ORDER BY deptno DESC, job ASC; -- deptno 내림차순, asc 오름차순

-- DISTINCT 는 SELECT 문장에서 오직 한 번만, 검색하려는 컬럼 이름 앞에서 사용됨.
-- (예) select distinct col1, col2, col3, from tbl;
-- order by는 컬럼별로 정렬 기준(오름/내림차순) 다르게 결정 가능.
