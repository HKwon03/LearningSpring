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
ALTER TABLE MP_BOARD ADD(answer varchar(20) DEFAULT '�亯���');

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

SELECT * FROM mp_reply;
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





-----------------------------------------------------



UPDATE
    MP_BOARD A
SET
    ANSWER = '�亯�Ϸ�'
WHERE EXISTS (
    SELECT
        RNO
    FROM
        MP_REPLY B
    WHERE
        A.BNO = B.BNO
    );
--------------------------------------------------------
update MP_BOARD A
SET
    ANSWER = (
case
when exists
( select rno from MP_REPLY B where A.BNO = B.BNO) 
then '�亯�Ϸ�' else '�亯���' end);


--------------------------------------------------------
SELECT * FROM MP_BOARD order by bno desc;
commit;

----------------------------------------------------------
--������۾�

select * from tours;		--������

create table users(			-- �������̺�(�ӽ�)
    userID varchar2(50) primary key
);

create table arr_point(		-- ������ ���̺�
    arr_id varchar2(30) primary key,
    arr_loadaddress varchar2(500),
    arr_gnumaddress varchar2(500),
    arr_ny number(38,8) not null,
    arr_nx number(38,8) not null
);

create table dp_point(		-- ����� ���̺�
    dp_id varchar2(30) primary key,
    dp_loadaddress varchar2(500),
    dp_gnumaddress varchar2(500),
    dp_ny number(38,8) not null,
    dp_nx number(38,8) not null
);

create table my_tourroute(	-- �����Ʈ ���̺�
    tr_id varchar2(30) primary key,
    tr_title varchar2(100) not null,
    tr_date varchar2(100),
    dp_id varchar2(30) not null,
    arr_id varchar2(30) not null,
    t_id number not null,
    userId varchar2(50) not null
);

alter table my_tourroute add tr_content varchar2(2400);

/* �ܷ�Ű �۾�*/
ALTER TABLE my_tourroute
ADD CONSTRAINT fk_dp_id foreign KEY(dp_id) references dp_point (dp_id);

ALTER TABLE my_tourroute
ADD CONSTRAINT fk_arr_id foreign KEY(arr_id) references arr_point (arr_id);

ALTER TABLE my_tourroute
ADD CONSTRAINT fk_t_id foreign KEY(t_id) references tours (t_id);

ALTER TABLE my_tourroute
ADD CONSTRAINT fk_tr_userid foreign KEY(userId) references users (userId);

drop table my_tourroute;
drop table arr_point;
drop table dp_point;

select * from dp_point;

--����� �ӽ� ���̵�����
insert into dp_point values('1','���� ��õ�� ���굿 ����4��',' ���� ��õ�� ���굿 ����4��',37.467779,126.901991);
-- ������ �ӽ� ���� ������
insert into arr_point values('1','���� ��õ�� ���굿 ����4��',' ���� ��õ�� ���굿 ����4��',37.467779,126.901991);

select * from dp_point;

select * from arr_point;

desc arr_point;

--�������� ���̺�
create table city(
    c_name varchar2(100) primary key,
    c_ny number(38,8) not null,
    c_nx number(38,8) not null,
    c_pic varchar2(200)
);

-- �������� ������
insert into city values('������',37.555837,128.209315,'������.jpg');
insert into city values('��⵵',37.567167,127.190292,'��⵵.jpg');
insert into city values('��󳲵�',35.259787,128.664734,'��󳲵�.jpg');
insert into city values('���ϵ�',36.248647,128.664734,'���ϵ�.jpg');
insert into city values('��û����',36.557229,126.779757,'��û����.jpg');
insert into city values('��û�ϵ�',36.628503,127.929344,'��û�ϵ�.jpg');
insert into city values('����Ư����',37.540705,126.956764,'����Ư����.jpg');
insert into city values('���ֱ�����',35.126033,126.831302,'���ֱ�����.jpg');
insert into city values('�뱸������',35.798838,128.583052,'�뱸������.jpg');
insert into city values('����������',36.321655,127.378953,'����������.jpg');
insert into city values('�λ걤����',35.198362,129.053922,'�λ걤����.jpg');
insert into city values('��걤����',35.519301,129.239078,'��걤����.jpg');
insert into city values('��õ������',37.469221,126.573234,'��õ������.jpg');
insert into city values('����ϵ�',35.716705,127.144185,'����ϵ�.jpg');
insert into city values('���󳲵�',34.819400,126.893113,'���󳲵�.jpg');
insert into city values('����Ư����ġ��',33.364805,126.542671,'����Ư����ġ��.jpg');

select * from city;
SELECT * FROM tours where t_city = '����Ư����ġ��';
commit;

-- ���� ������ ���� ������ ���� sql
select tr_title as "��ȹ����", tr_date as "��ȹ��¥", tr_content as "��ȹ �޸�", dp_ny as "������浵", dp_nx as "���������",
arr_ny as "�������浵", arr_nx as "����������", t_ny as "������ �浵", t_nx as "������ ����"
from dp_point d, arr_point a, tours t, my_tourroute mt
where d.dp_id = mt.dp_id and a.arr_id = mt.arr_id and t.t_id = mt.tr_id;

commit;

select * from festival;
select * from tours;
delete festival where f_ny is null or f_nx is null;