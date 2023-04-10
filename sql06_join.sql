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
