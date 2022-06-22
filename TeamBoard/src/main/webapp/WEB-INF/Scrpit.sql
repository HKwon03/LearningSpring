Create table USERS (
    ID varchar2(8) Primary Key, 
    PASSWORD varchar2 (8), 
    NAME varchar2(20), 
    ROLE varchar2 (5)
);

INSERT INTO USERS VALUES ( 'admin', '1234', '관리자', 'Admin') ; 
INSERT INTO USERS VALUES ( 'user', '1234', '홍길동', 'User') ; 
commit;


select * from users;

 Create Table BOARD (
    SEQ number(5) Primary Key, 
    TITLE varchar2 (200), 
    WRITER varchar2(20), 
    CONTENT varchar2(2000), 
    REGDATE varchar2(20) Default to_char(sysdate,'yyyy-mm-dd hh24:mI'),
    recommend number Default 0,
    CNT number(5) Default 0
   ); 

INSERT INTO BOARD ( SEQ, TITLE, WRITER, CONTENT, recommend, CNT) 
VALUES (1, '가입인사' , '관리자', '안녕하세요. 반갑습니다. .... ', default, default ); 
commit;

SELECT * FROM BOARD;
