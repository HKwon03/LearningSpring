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
INSERT INTO MP_BOARD(BNO, TITLE, CONTENT, WRITER)
     VALUES (MP_BOARD_SEQ.NEXTVAL, '�ȳ��ϼ���', 'ȣ��', '��');
INSERT INTO MP_BOARD(BNO, TITLE, CONTENT, WRITER)
     VALUES (MP_BOARD_SEQ.NEXTVAL, '�����', '�����', '����');

--2��� �Խù� ���� ����
insert into mp_board(bno, title, content, writer)
select mp_board_seq.nextval, title, content, writer from mp_board;

--��ȸ�� �÷� �߰�
ALTER TABLE MP_BOARD ADD(HIT NUMBER DEFAULT 0);
COMMIT;

--�亯 �Ϸ� �÷� �߰�
ALTER TABLE MP_BOARD ADD(replyCom NUMBER DEFAULT 0);

--�亯 �Ϸ� �÷� ����
ALTER TABLE MP_BOARD DROP COLUMN replyCom;

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


--SID��ȣ Ȯ��
select name from v$database;






-------------------------------------------------------------
-- decode �Լ�
/*
    DECODE(ǥ����, ����, ���1,
                  ����, ���2,
                  ����, ���3,
                  �⺻���n
           )    
*/

select ename, dno, decode(dno, 10, 'ACCOUNTING',
                               20, 'RESEARCH',
                               30, 'SALES',
                               40, 'OPERATIONS',
                               'DEFAULT') as DNAME
from employee;

-- dno �÷��� 10�� �μ��� ��� ���޿��� + 300�� ó���ϰ�, 20�� �μ��� ��� ���޿� +500 ��
    --�μ���ȣ�� 30�� ��� ���޿� + 700�� �ؼ� �̸�, ����, �μ��������÷��� �� ����� ���.

select ename, salary, dno, decode(dno, 10, salary + 300,
                                       20, salary + 500,
                                       30, salary + 700,
                                       salary) as "�μ��������÷������"
from employee
order by dno asc;
---------------------------------------------------------------

dname		Location		Number of People		Salary
-----------------------------------------------------------------------------------------------
SALES		CHICAO			    6		            1567
RESERCH		DALLS			    5		            2175
ACCOUNTING  NEW YORK		    3		            2917


select decode (dno, 30, 'SALES',
                    20, 'RESEARCH',
                    10, 'ACCOUNTING') as dname ,
       decode (dno, 30, 'CHICAO',
                    20, 'DALLS',
                    10, 'NEW YORK') as Location,
       count(*) "Number of People",
       round(avg(salary)) Salary
from employee
group by dno;