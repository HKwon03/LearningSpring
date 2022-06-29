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
1. 부모테이블 : spring_department TABLE 생성 및 INSERT

CREATE TABLE spring_department(
	deptno  NUMBER        PRIMARY KEY,
	dname   VARCHAR2(100) NOT NULL,
	loc     VARCHAR2(100) NOT NULL
)

INSERT INTO spring_department VALUES(10, '전략기획', '판교');
INSERT INTO spring_department VALUES(20, '해양수산', '부산');
INSERT INTO spring_department VALUES(30, '공공사업', '판교');


2. 자식테이블 : spring_employmentTABLE 생성 및 INSERT

CREATE TABLE spring_employment(
    empno   number        PRIMARY KEY,
    ename   VARCHAR2(100) NOT NULL,
    sal     NUMBER        NOT NULL,
    deptno  NUMBER        NOT NULL,
    CONSTRAINT fk_spring_deptno FOREIGN KEY(deptno) REFERENCES spring_department(deptno)
)

--INSERT INTO spring_employment VALUES(1, '제임슨', 300, 40);
INSERT INTO spring_employment VALUES(1,'제임슨',300,10);
INSERT INTO spring_employment VALUES(2,'앨리사',500,10);
INSERT INTO spring_employment VALUES(3,'크림슨',400,20);

select * from spring_department;

select * from spring_employment;
commit;

SELECT A.DEPTNO, A.DNAME, A.LOC, B.EMPNO, B.ENAME, B.SAL
		FROM SPRING_DEPARTMENT A, SPRING_EMPLOYMENT B
		WHERE A.DEPTNO = B.DEPTNO