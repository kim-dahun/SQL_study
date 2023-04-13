-- JDBC(Java DataBase Connectivity):
-- 자바 프로그램에서 데이터베이스에 접속해서 SQL(SELECT, INSERT, UPDATE, DELETE) 문장들을 실행.

-- 테이블 생성
-- 테이블 이름: blogs
-- 컬럼 :
--  id: 블로그의 글 번호. Number(6). primary key(고유키). -> insert 할 때 마다 자동으로 증가.
--  title : 블로그 글 제목. varchar2(100 char). NOT NULL. 
--  content : 블로그 글 내용. varchar2(1000 char). NOT NULL.
--  author : 블로그 글 작성자. varchar2(100 char). NOT NULL.
-- Created Time : 블로그 작성 시간. timestamp. -- 자바에서 LocalDateTime 으로 변환하기 좋음. 기본값(시스템 현재 시간).
-- Modified Time : 블로그 수정 시간. timestamp. 시스템 현재 시간.

CREATE TABLE blogs (

    id number(6) constraint blogs_id_pk Primary key,
    title varchar2(100 char) constraint blogs_title_nn Not Null,
    content varchar2(1000 char) CONSTRAINT blogs_content_nn Not Null,
    author varchar2(100 char) CONSTRAINT blogs_author_nn Not Null,
    createdtime TIMESTAMP default sysdate,
    Modifiedtime TIMESTAMP default sysdate

);

ALTER TABLE blogs RENAME COLUMN createdtime TO created_time;
ALTER TABLE blogs RENAME COLUMN modifiedtime TO modified_time;

/*
Oracle 접속 -> SCOTT -> 테이블 -> BLOGS 오른쪽 클릭 -> ID 컬럼이 선택된 상태 -> ID 열 탭 클릭
-> 유형 : 열 시퀀스 로 변경 -> 확인.

시퀀스(sequence) : 자동으로 생성되는 연속된 숫자. ( 0, 1, 2, 3, 4, ... ).
BLOGS 테이블에 데이터가 insert 될 때 마다 Primary키로 설정된 ID 컬럼에 시퀀스가 자동으로 저장되도록 하기 위해서.

*/

INSERT INTO blogs ( title, content, author )
VALUES ('블로그 테스트','새 블로그 작성...','test');