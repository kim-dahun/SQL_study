--------------------------------------------------------
--  파일이 생성됨 - 월요일-5월-29-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CHAT
--------------------------------------------------------

  CREATE TABLE "SCOTT"."CHAT" 
   (	"CID" NUMBER(8,0), 
	"USERID" VARCHAR2(15 CHAR), 
	"CONVERSATION" VARCHAR2(500 CHAR), 
	"TEXTTYPE" NUMBER(1,0) DEFAULT 0, 
	"CONTENTID" NUMBER(8,0), 
	"CREATEDTIME" TIMESTAMP (6) DEFAULT systimestamp
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.CHAT
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index CHAT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."CHAT_PK" ON "SCOTT"."CHAT" ("CONTENTID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger CHAT_TRG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."CHAT_TRG" 
BEFORE INSERT ON CHAT 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.CONTENTID IS NULL THEN
      SELECT CHAT_SEQ.NEXTVAL INTO :NEW.CONTENTID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."CHAT_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table CHAT
--------------------------------------------------------

  ALTER TABLE "SCOTT"."CHAT" MODIFY ("CID" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."CHAT" MODIFY ("USERID" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."CHAT" MODIFY ("CONVERSATION" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."CHAT" MODIFY ("CONTENTID" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."CHAT" ADD CONSTRAINT "CHAT_PK" PRIMARY KEY ("CONTENTID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SCOTT"."CHAT" MODIFY ("CREATEDTIME" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table CHAT
--------------------------------------------------------

  ALTER TABLE "SCOTT"."CHAT" ADD CONSTRAINT "CHAT_FK1" FOREIGN KEY ("CID")
	  REFERENCES "SCOTT"."USERAUCTION" ("CID") ENABLE;
