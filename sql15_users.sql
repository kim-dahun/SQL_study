CREATE TABLE users (
    ID NUMBER(8) CONSTRAINT users_id_pk PRIMARY KEY,
    USERNAME varchar2(20 char) NOT NULL,
    PASSWORD varchar2(128 char) NOT NULL,
    EMAIL varchar2(256 char) NOT NULL,
    POINT number(8) default 0
);

INSERT INTO users (username, password, email)
VALUES ('admin','admin0000','admin@itwill.co.kr');

INSERT INTO users (username, password, email)
VALUES ('guest','guest','guest@itwill.co.kr');

commit;

select * from users;

