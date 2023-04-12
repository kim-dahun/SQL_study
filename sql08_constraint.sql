-- 제약 조건 ( constraint ) :
-- 테이블에 데이터들을 insert 할 때, 조건을 만족하는 값들만 insert될 수 있도록 만들어주는 기능
-- 테이블을 생성(CREATE TABLE) 할 때 제약조건을 정의.
-- 이미 만들어진 테이블에서 테이블을 변경할 때(ALTER TABLE) 제약조건을 새로 정의/변경/삭제할 수 있음.
-- 종류 : primary key, not null, unique, check, foreign key
-- 테이블 생성할 때 제약조건 이름을 설정하지 않으면, 시스템에서 자동으로 이름을 부여함.
-- (예) SYS_C008813 -> INSERT 할 때 제약조건에 위배가 되면 에러 메시지를 볼 수 있음.

-- 테이블을 생성하면서 제약 조건 이름 만들기 1: 컬럼 정의에서.
CREATE TABLE ex2 (
    id  number(4)
        constraint ex2_id_pk primary key, -- constraint 이름 제약내용
    name    varchar2(100)
        constraint ex2_name_nn NOT NULL,
    email   varchar2(100)
        constraint ex2_email_uq UNIQUE,
    gender  varchar2(1)
        constraint ex2_gender_ck CHECK(gender in ('M','F'))
    
    
    
);


-- 테이블을 생성하면서 제약 조건 이름 만들기 2: 컬럼 정의와 제약 조건 정의를 따로.
CREATE TABLE ex3(

id number(4), name varchar2(100), email varchar2(100), gender varchar2(1),
-- 제약 조건 정의
constraint ex3_id_pk primary key (id),
constraint ex3_name_nn CHECK(name is not null), -- NOT NULL (컬럼 이름) 은 불가능,
constraint ex3_email_uq UNIQUE(email),
constraint ex3_gender_ck CHECK(gender in ('M','F'))

);


-- foreign key(외래키) : 다른 테이블의 Primary key(고유키)를 참조하는 제약 조건
-- 데이터를 insert 할 때 다른 테이블의 primary key에 없는 값은 INSERT 되지 않도록 하기 위해서.

-- ex_dept 테이블에서 deptid 컬럼 : primary key
-- ex_emp 테이블의 deptid 컬럼 ex_dept.deptid 컬럼을 참조 -> Foreign key

CREATE TABLE ex_dept(
    deptid number(2) constraint dept_deptid_pk primary key,
    dname varchar2(100) constraint dept_dname_nn NOT NULL
);

CREATE TABLE ex_emp1(
    
    empno number(4) constraint emp1_empno_pk primary key,
    ename varchar2(100) constraint emp1_ename_nn NOT NULL,
    deptid number(2) constraint emp1_deptid_fk REFERENCES ex_dept(deptid)
    -- [constraint 이름] REFERENCES 다른 테이블(PK 필드명)
    
);

CREATE TABLE ex_emp2(

    empid number(4),
    ename varchar2(100),
    deptid number(2),
    constraint emp2_empid_pk primary key (empid),
    constraint emp2_ename_nn check(ename is not null),
    constraint emp2_deptid_fk foreign key (deptid) references ex_dept(deptid)
    -- constraint 이름 foreign key (테이블 내 컬럼) references 참조할 테이블(참조할 PK 컬럼)
);

INSERT INTO ex_emp1
VALUES (1001,'오쌤',10);
--> ex_dept 테이블에 PK로 10 이 생성되어져 있지 않기 때문에 에러 발생.
--> ex_emp1 테이블에 부서 아이디를 INSERT 하기 전에, 부서 ID가 ex_dept 테이블에 먼저 만들어져 있어야 한다.
INSERT INTO ex_dept
VALUES (10, '개발1팀');

INSERT INTO ex_dept
VALUES (20, '인사팀');

INSERT INTO ex_emp1
VALUES (1001,'오쌤',10);

INSERT INTO ex_emp1
VALUES (2001, '홍길동', 20);

INSERT INTO ex_emp1
VALUES (3001, '김길동', 30);

SELECT * FROM ex_dept;
SELECT * FROM ex_emp1;
SELECT * FROM ex_emp2;

COMMIT;


-- DDL(Data Definition Language) : 데이터 정의 언어
-- CREATE, ALTER, TRUNCATE, DROP

-- 테이블 삭제
-- truncate table 테이블 이름; - 테이블의 모든 행(레코드)을 삭제하고, 테이블 이름만 남기는 것
-- drop table 테이블 이름; - 테이블 (객체)가 삭제됨.
-- DELETE from TABLE과 비교!

TRUNCATE TABLE ex_dept;
--> PK 컬럼이 다른 테이블에서 FK로 참조되고 있기 때문에 삭제가 안됨.
--> 참조하고 있는 다른테이블의 레코드들을 먼저 삭제해야 테이블 삭제가 가능함.

TRUNCATE TABLE ex_emp1;

SELECT * FROM ex_emp1;

TRUNCATE TABLE ex_dept; --> 참조하는 다른 테이블의 레코드가 없기 때문에 삭제 성공.

DROP TABLE ex_emp2; --> 테이블 자체를 삭제함.




