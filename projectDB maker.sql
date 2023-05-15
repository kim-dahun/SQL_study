((system/oracle as sysdba;

alter session set "_ORACLE_SCRIPT"=true;

create user scott identified by tiger;

alter user scott account unlock;

grant create session to scott;

grant connect,resource,dba to scott;

)) -- scott 생성부터 권한 부여까지 활성화하는 stmt

CREATE TABLE ACCOUNT (

    eid number(10),
    id varchar2(20 char) CONSTRAINT acc_id_pk PRIMARY KEY,
    password varchar2(20 char),
    name varchar2(10 char),
    phone varchar2(20 char),
    email varchar2(20 char),
    dept_No number(10),
    deptName varchar2(50 char) references deptlist(deptname),
    emp_no varchar2(20 char) UNIQUE,
    pos_no number(10) references position(posno),
    pos_name varchar2(50 char),
    isadmin varchar2(5 char) check(isadmin in ('true','false'))

);

ALTER TABLE account ADD CONSTRAINT empno_uq UNIQUE (emp_no);

CREATE TABLE deptlist (

    deptno number(10),
    deptname varchar2(50 char) CONSTRAINT dlist_dp_pk Primary key,
    deptnodeno number(10) 

);

CREATE TABLE position (

    posname varchar2(50 char) UNIQUE,
    posno number(10) CONSTRAINT pos_posno_pk PRIMARY KEY

);


CREATE TABLE paymentcontent (
    name varchar2(10 char) NOT NULL,
    empno varchar2(20 char)references account(emp_no) NOT NULL,
    basesal number(20),
    bonus number(20),
    overtimepay number(20),
    meals number(20),
    vehiclemaintenance number(20),
    severancepay number(20),
    incometax number(20),
    residenttax number(20),
    healthinsurancepremium number(20),
    nationalpension number(20),
    employmentinsurance number(20),
    otherdeductions number(20),
    deductionsreason varchar2(100 char),
    paymonth varchar2(10 char) NOT NULL


);

CREATE TABLE schedule (

    contentno number(10) UNIQUE,
    empno varchar2(20 char) references account(emp_no),
    startday timestamp NOT NULL,
    endday timestamp NOT NULL,
    title varchar2(100 char),
    content varchar2(1000 char)

);

CREATE SEQUENCE CONTENTNO_SEQ
START WITH 1
INCREMENT BY 1
CACHE 5;
-- 5개 시퀀스를 기억해두고 1개씩 시퀀스를 증가시키도록 설정

INSERT INTO deptlist 
VALUES (0,'admins',0);



INSERT INTO position
VALUES ('admin',99);