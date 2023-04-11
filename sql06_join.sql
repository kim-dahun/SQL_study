-- 두개 이상의 테이블에서 검색하는것 - join

/*
join문법:
    (1) ANSI 표준 문법:
            SELECT 컬럼, ...
            FROM 테이블1
                JOIN 종류 테이블2 on join 조건;

    (2) Oracle 문법:
            SELECT 컬럼, ...
            FROM 테이블1, 테이블2, ...
            WHERE JOIN 조건;
*/

/*
-- join 종류
    (1) inner join
    (2) outer join
        - left outer join
        - right outer join
        - full outer join
        */
        
-- 사번, 이름, 부서번호, 부서이름을 검색 ( inner join)

SELECT emp.empno, emp.ename, emp.deptno, dept.dname
FROM emp
INNER JOIN dept ON emp.deptno = dept.deptno;

SELECT emp.empno, emp.ename, emp.deptno, dept.dname
FROM emp,dept -- emp e ( emp 테이블을 e로 부르겠다)
WHERE emp.deptno=dept.deptno;

/*

*/
-- inner join과 outer join의 차이점을 보기 위해서.

INSERT INTO emp(empno, ename, deptno) -- 메모리에만 반영된 상태
values (1004,'오쌤',50);

commit; -- 메모리에 반영된 내용을 실제 테이블에 반영

-- left outer join
SELECT empno, ename, d.deptno,  d.dname
FROM emp e
    LEFT OUTER JOIN dept d ON e.deptno = d.deptno;
    
SELECT empno, ename, e.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno(+);

-- Right outer join

SELECT empno, ename, e.deptno, d.dname
FROM emp e
    RIGHT OUTER JOIN dept d ON e.deptno = d.deptno;
    
    
SELECT e.empno, ename, e.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno;

-- FUll outer join

SELECT empno, ename, e.deptno, d.dname
FROM emp e
    FULL OUTER JOIN dept d ON d.deptno=e.deptno;
    
-- 오라클에서는 FUll OUTER JOIN의 문법을 제공하지는 않음
-- left outer join 결과와 right outer join 결과를 합집합(union) 하면 사용할 수는 있음
SELECT empno, ename, e.deptno, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno(+)
UNION
SELECT empno, ename, e.deptno, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno;

-- inner join에서 inner는 생략하고 사용할 수 있음 inner join = join
-- left/right/full outer join에서 outer 생략 가능 left outer join = left join

-- self-join : 같은 테이블에서 join 하는 것.emp.deptno
-- 사번, 이름, 매니저 사번, 매니저 이름 검색

SELECT e1.empno AS "사번", e1.ename AS "직원명", e1.mgr AS "매니저 사번", e2.ename AS "매니저 이름"
FROM emp e1
    JOIN emp e2 ON e1.mgr=e2.empno
    ORDER BY e1.empno;

SELECT e1.empno AS "사번", e1.ename AS "직원명", e1.mgr AS "매니저 사번", e2.ename AS "매니저 이름"
FROM emp e1, emp e2
WHERE e1.mgr=e2.empno
    ORDER BY e1.empno;
    
--equi join : 조인 조건이 = 를 사용해서 만들어지는 경우
--non-equi join : join 조건이 부등식(>,>=,<,<=,...)을 사용해서 만들어지는 경우.

-- emp, salgrade 테이블을 사용 사번, 이름, 급여, 급여등급을 검색.
-- 사번 오름차순정렬

SELECT e1.empno, e1.ename, e1.sal, s.grade
FROM emp e1
    JOIN salgrade s ON e1.sal >= s.losal AND e1.sal <= s.hisal
    ORDER BY e1.empno;
    
    
SELECT e1.empno, e1.ename, e1.sal, s.grade
FROM emp e1, salgrade s
WHERE e1.sal>=s.losal AND e1.sal <= s.hisal
ORDER BY empno;

-- ex1. 직원 이름, 직원근무도시 검색. 근무도시 오름차순

SELECT e.ename, d.loc
FROM emp e
    JOIN dept d ON e.deptno = d.deptno
    ORDER BY d.loc;

-- ex2. 직원 이름, 직원의 매니저이름, 급여, 급여 등급 검색. 매니저 오름차순, 급여 등급 오름차순

SELECT e.ename, e2.ename, e.sal, s.grade
FROM emp e, emp e2, salgrade s
WHERE e.mgr = e2.empno AND e.sal Between s.losal and s.hisal
ORDER BY e2.ename, s.grade;


-- ex3. 직원 이름, 부서 이름, 급여, 급여 등급을 검색. 순서는 부서이름 오름차순, 급여 등급 오름차순

SELECT e.ename, d.dname, e.sal, s.grade
FROM emp e
    JOIN dept d ON d.deptno=e.deptno
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
    ORDER BY d.dname, s.grade;


-- ex4. 부서 이름, 부서 위치, 부서의 직원 수 검색. 부서 번호 오름차순

SELECT  d.dname, d.loc, count(e.deptno)
FROM dept d
    JOIN emp e ON e.deptno = d.deptno
GROUP BY d.dname, d.loc, e.deptno
ORDER BY e.deptno;


-- ex5. 부서 번호, 부서 이름, 부서 직원 수, 부서의 급여 최소값, 부서의 급여 최댓값 검색. 부서번호 오름차순

SELECT e.deptno, d.dname, count(e.deptno), min(e.sal), max(e.sal)
FROM emp e, dept d
WHERE e.deptno=d.deptno
GROUP BY e.deptno,d.dname
ORDER BY e.deptno;

-- ex.6 부서 번호, 부서 이름, 직원 사번, 사원이름, 매니저사번, 매니저 명, 급여, 급여등급
-- 급여가 3000이상인 직원들만 검색하도록. 
-- 정렬순서 -  부서번호/사번

SELECT e.deptno, d.dname, e.empno, e.ename, e2.empno, e2.ename, e.sal, s.grade
FROM emp e
    JOIN emp e2 ON e.mgr = e2.empno
    JOIN dept d ON e.deptno = d.deptno
    JOIN salgrade s ON e.sal Between losal and hisal
WHERE  e.sal>=3000 
ORDER BY e.deptno, e.empno;

SELECT e.deptno, d.dname, e.empno, e.ename, e2.empno, e2.ename, e.sal, s.grade
FROM emp e, emp e2, dept d, salgrade s
WHERE e.mgr = e2.empno AND e.deptno = d.deptno AND e.sal>=3000 AND e.sal Between losal and hisal
ORDER BY e.deptno, e.empno;
