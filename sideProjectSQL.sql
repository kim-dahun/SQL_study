CREATE TABLE userlist (
    userid number(8) constraint us_id_pk primary key,
    id varchar2(15 char) unique,
    password varchar2(20 char) NOT NULL,
    name varchar2(10 char) NOT NULL,
    birthday TIMESTAMP,
    email varchar2(30 char) NOT NULL,
    phone varchar2(12 char) NOT NULL,
    companycode number(6) UNIQUE
);