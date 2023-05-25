CREATE TABLE AuctionProducts (
    productid number(8) CONSTRAINT acp_pid_pk PRIMARY KEY,
    pName varchar2(100 char) CONSTRAINT acp_pname_nn NOT NULL,
    category varchar2(100 char) CONSTRAINT acp_cg_nn NOT NULL,
    constructor varchar2(100 char) CONSTRAINT acp_ct_nn NOT NULL,
    brandname varchar2(100 char) default '없음',
    cost number(20) default 0
);

CREATE TABLE auction (
    aid number(8) CONSTRAINT au_id_pk PRIMARY KEY,
    productid number(8),
    auctioneer varchar2(20) CONSTRAINT au_acneer_nn NOT NULL,
    bidder varchar2(20) CONSTRAINT au_bir_nn NOT NULL,
    passbid number(20) default 0,
    nowbid number(20) default 0,
    bidcount number(20) default 0,
    successbid number(20) default 0,
    auctionstart timestamp default systimestamp,
    auctionend timestamp default systimestamp

);

ALTER TABLE auction ADD CONSTRAINT au_pid_fk foreign key (productid) references auctionproducts(productid);

