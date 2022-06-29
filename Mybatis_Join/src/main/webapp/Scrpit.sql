select * from employee;

select * from department;


--Join Query

select * 
from employee e, department d
where e.dno = d.dno;

--Join Query2

SELECT ENO, ENAME, JOB, MANAGER, HIREDATE, SALARY, COMMISSION,
       D.DNO, DNAME, LOC
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO


-----------------------------------------------------------------
1. �θ����̺� : spring_department TABLE ���� �� INSERT

CREATE TABLE spring_department(
	deptno  NUMBER        PRIMARY KEY,
	dname   VARCHAR2(100) NOT NULL,
	loc     VARCHAR2(100) NOT NULL
)

INSERT INTO spring_department VALUES(10, '������ȹ', '�Ǳ�');
INSERT INTO spring_department VALUES(20, '�ؾ����', '�λ�');
INSERT INTO spring_department VALUES(30, '�������', '�Ǳ�');


2. �ڽ����̺� : spring_employmentTABLE ���� �� INSERT

CREATE TABLE spring_employment(
    empno   number        PRIMARY KEY,
    ename   VARCHAR2(100) NOT NULL,
    sal     NUMBER        NOT NULL,
    deptno  NUMBER        NOT NULL,
    CONSTRAINT fk_spring_deptno FOREIGN KEY(deptno) REFERENCES spring_department(deptno)
)

--INSERT INTO spring_employment VALUES(1, '���ӽ�', 300, 40);
INSERT INTO spring_employment VALUES(1,'���ӽ�',300,10);
INSERT INTO spring_employment VALUES(2,'�ٸ���',500,10);
INSERT INTO spring_employment VALUES(3,'ũ����',400,20);

select * from spring_department;

select * from spring_employment;
commit;

SELECT A.DEPTNO, A.DNAME, A.LOC, B.EMPNO, B.ENAME, B.SAL
		FROM SPRING_DEPARTMENT A, SPRING_EMPLOYMENT B
		WHERE A.DEPTNO = B.DEPTNO