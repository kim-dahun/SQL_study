CREATE TABLE userAuction (
    cid number(8) CONSTRAINT ci_ua_pk primary key,
    chatroom varchar2(20 char),
    membercount number(10) default 0
    
);

CREATE TABLE chat (
    contentid number(8),
    cid number(8),
    userid varchar2(15 char),
    conversation varchar2(500 char),
    texttype number(1),
    quickroot number(1)
    
);