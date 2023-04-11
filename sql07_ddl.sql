/*
SQL 종류:
1. DQL(Data Query Language) : 데이터 질의 언어. select 문장.
2. DML(Data Manipulation Language) : 데이터 조작 언어. 
 - INSERT, UPDATE, DELETE
 - 테이블에 행(row)을 추가, 변경, 삭제하는 SQL 문장들.
3. DDL(Data Definition language) : 데이터 정의 언어.
 - CREATE, ALTER, TRUNCATE, DROP.
 - 테이블, 사용자 계정을 생성, 변경, 삭제하는 SQL 문장.
4. TCL(Transaction Control Language) : 트랜잭션 관리(제어) 문장.

    - commit:데이터베이스의 변경 내용을 영구 저장.
    - rollback : 바로 직전의 Commit 상태로 되돌리기
*/


/*
테이블 생성
CREATE table [테이블 이름] (
    컬럼 이름 데이터 타입 [제약조건, 기본값],
    ...
);
*/

/*
데이터타입의 이름은 데이터베이스의 종류에따라감.
ORACLE에서의 데이터 타입 : number(숫자), varchar2(문자열), date, timesatamp, clob(varchar2로 표현할 수 없는 크기의 문자열을 표현할 경우), blob(이미지나 동영상 등 binary 타입의 큰 오브젝트 저장 시 ), ...



*/

--students 테이블
--column
    -stuNo : 학생 아이디, 학번, 숫자 ( 6자리 정수 )
    -stuName : 학생 이름, 문자열(10글자)
    -birthday : 학생 생일, 날짜
    
CREATE TABLE students (
    stuNo number(6), stuName varchar2(10 char), birthday date 
);

/*
테이블에 행(row)을 추가(삽입): 
INSERT INTO 테이블이름 (컬럼1, 컬럼2, ...) values(값1,값2...);
INSERT INTO 테이블이름 values(값1,값2...);
- values에서 나열하는 값의 갯수 = 컬럼 수 여야 함. 값의 순서는 컬럼 순서와 같아야 함.
*/
    
INSERT INTO students
VALUES (1,'다훈','1994-06-02');

INSERT INTO students
VALUES (2, '길동', NULL);

INSERT INTO students (stuNo, stuName)
VALUES (3, '길붕');

--INSERT INTO students
--VALUES ('길동홍',4,to_date('2000/01/01')); // 데이터 타입이 맞지 않음.

INSERT INTO students(stuName, stuNo, birthday)
VALUES ('길동홍',4,to_date('2008/01/31/'));

INSERT INTO students (stuNo)
VALUES (1234567); --> 자릿수보다 큰 경우에도 에러 발생

INSERT INTO students (stuName)
VALUES ('abcdefghijklmn'); --> 제한 글자 수보다 많은 경우에도 에러 발생

SELECT * FROM students;

commit; -- 현재까지 작업 내용을 DB에 영구 저장.

-- 테이블 생성할 때 컬럼의 기본값 설정하기:

CREATE TABLE ex_user(
    no  number(4),
    userid  varchar2(20), -- 20 바이트까지의 문자열.
    password varchar2(100),
    age number(3) default 0,
    created_date date default sysdate
    
);

INSERT INTO ex_user( no, userid, password)
VALUES (1, 'guest', 'guest0000');
--> default 값이 설정된 컬럼들은 insert하지 않으면 기본값이 insert됨.

INSERT INTO ex_user(userid,password)
VALUES ('admin','admin0000');
--> default 값이 설정되지 않은 컬럼들은 insert 하지 않으면 NULL이 된다.

SELECT * FROM ex_user;

-- 제약 조건: (1) primary key(고유키) (2) Not Null (3) unique (4) check (5) foreign key(외부키)

CREATE TABLE ex1(

    col1 number(2) primary key, --null이 아니고, 유일한 값.(중복되지 않은 값)
    co12 varchar2(100) not null, --반드시 값이 INSERT 되어야 함.
    co13 varchar2(100) unique, --중복되지 않는 유일한 값만 허용(NULL도 상관없음)
    col4 number(2) check (col4 >= 0 ), --조건을 검사하는 것. INSERT한 값이 조건에 맞는지 검사. 조건을 만족하는 값만 INSERT 허용
    col5 number(2)

);

INSERT INTO ex1
values(1,'홍길동','test',10,0);

INSERT INTO ex1(col1,co12)
VALUES(1,'홍길동'); --> primary 키 제약조건 위반 -> 중복값

INSERT INTO ex1(co12)
VALUES ('홍길동'); --> primary 키 제약조건 위반 -> primary 키는 null이 되면 안됌

INSERT INTO ex1(col1, co12)
VALUES (2, '김길동');

INSERT INTO ex1(col1)
VALUES(3); --> Col2가 Not null 이라는 제약조건을 위배함.

INSERT INTO ex1(col1, co12,co13)
VALUES(3,'홍길동','test'); --> 무결성 제약 조건 위배(UNIQUE)

INSERT INTO ex1 (col1, co12, col4)
VALUES(3, '홍길동',-1); --> 체크 제약 조건 위배


SELECT * FROM ex1;

commit;