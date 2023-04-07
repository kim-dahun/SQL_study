/*
 * Block comment
 */
 
-- inline comment
-- SQL 문장은 세미콜론(;) 으로 끝남.
-- Ctrl+Enter : 현재 커서가 있는 위치의 SQL 한 문장을 실행.(세미콜론이 있는 지점까지
-- F5 : 스크립트 (확장자가 SQL인 파일) 전체를 실행.


-- DQL(Data Query Language): 테이블의 내용을 검색.
-- SELECT 컬럼 이름, ... FROM 테이블 이름;
-- dual : 오라클 DB에서 Select 문장의 문법을 맞추기 위해서 사용하는 가상의 테이블 이름.

SELECT sysdate FROM dual;

-- IN EMP TABLE, ALL OF DATA;

SELECT * FROM emp;

-- SQL 명령어(키워드), 테이블 이름, 컬럼 이름은 대/소문자를 구분하지 않음.
select * from emp;

-- Table에 저장된 데이터는 대/소문자를 구분함!



SELECT ename || '씨의 연봉은 ' ||sal FROM emp;