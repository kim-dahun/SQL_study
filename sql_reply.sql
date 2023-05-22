CREATE TABLE replies (
    id number(10) CONSTRAINT rep_id_pk PRIMARY KEY,
    post_id number(8),
    reply_text varchar2(1000 char) NOT NULL,
    writer varchar2(20 char) NOT NULL,
    created_time timestamp default systimestamp,
    modified_time timestamp default systimestamp
    
);

ALTER TABLE replies ADD CONSTRAINT rep_pid_fk foreign key (post_id) references post(id);

ALTER TABLE users ADD CONSTRAINT users_id_uq UNIQUE (username);

INSERT INTO replies (post_id, reply_text, writer)
VALUES (1, '댓글 테스트' , 'admin');

commit;

SELECT * from replies where post_id = 1;

SELECT count(id) from replies WHERE post_id = 1;