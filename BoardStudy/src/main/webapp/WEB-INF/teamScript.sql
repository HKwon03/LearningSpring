--�Խ��� ���̺� ����
CREATE TABLE MP_BOARD(
    BNO NUMBER NOT NULL,
    TITLE VARCHAR2(100)     NOT NULL,
    CONTENT VARCHAR2(2000)  NOT NULL,
    WRITER VARCHAR2(100)    NOT NULL,
    REGDATE DATE            DEFAULT SYSDATE,
    PRIMARY KEY(BNO)
);

--�Խ��� ��ȣ ������ ����
CREATE SEQUENCE MP_BOARD_SEQ
START WITH 1
INCREMENT BY 1;

--�Խ��� ���� ������ ����
INSERT INTO MP_BOARD(BNO, TITLE, CONTENT, WRITER)
     VALUES (MP_BOARD_SEQ.NEXTVAL, '�����Դϴ�', '�����Դϴ�', 'BTS');

--2��� �Խù� ���� ����
insert into mp_board(bno, title, content, writer)
select mp_board_seq.nextval, title, content, writer from mp_board;

SELECT * FROM MP_BOARD order by bno desc;
COMMIT;

--��� ���̺� ����
create table mp_reply (
    bno number not null,
    rno number not null,
    content varchar2(1000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    primary key(bno, rno)
);

drop table mp_reply;

--�ܷ�Ű ����
alter table mp_reply add constraint mp_reply_bno foreign key(bno)
references mp_board(bno) on delete cascade;

SELECT * FROM MP_BOARD order by bno desc;
COMMIT;

--��� ��ȣ ������ ����
create sequence mp_reply_seq START WITH 1 MINVALUE 0;
drop sequence mp_reply_seq;
--��� ���� ������ ����
insert into mp_reply(bno, rno, content, writer)
    values(418, mp_reply_seq.nextval, '�׽�Ʈ���', '�׽�Ʈ �ۼ���');

select rno, content, writer, regdate
  from mp_reply
 where bno = 418;


