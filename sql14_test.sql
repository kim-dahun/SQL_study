CREATE TABLE post (
    id number(6) CONSTRAINT post_id_pk Primary key,
    title varchar2(100char) CONSTRAINT post_title_nn NOT NULL,
    content varchar2(1000char) CONSTRAINT post_content_nn NOT NULL,
    author varchar2(20char) CONSTRAINT post_author_nn NOT NULL,
    created_time timestamp default sysdate,
    modified_time timestamp default sysdate
    
);

INSERT INTO post (title,content,author) 
Values('안녕하세요','반갑습니다','김방가');


commit;

SELECT * FROM post;