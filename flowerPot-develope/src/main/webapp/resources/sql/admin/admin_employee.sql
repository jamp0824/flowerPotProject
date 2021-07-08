create table employee(
	empNo number(38) ,
	empId varchar2(100) UNIQUE,
	empName varchar2(100),
	empEnabled char(1) default '1',
	deptNo int,
	poNo int
);

select mem.id, mem.password,  auth.authority from f_member mem left outer join f_authority auth on mem.id = auth.id where mem.id ='admin'

insert into EMPLOYEE (empNo,empId,empName,deptNo,poNo) values('1','admin','유혁',30,10)

select emp.empNo, emp.empEnable, emp.empId, emp.empName, dept.deptName, po.poName from employee emp 
left outer join department dept on emp.deptNo = dept.deptNo 
left outer join position po on emp.poNo = po.poNo 

drop table employee;

create table position(
	poNo number(38) primary key,
	poName varchar2(50)
);

insert into position (poNo,poName) values(1,'알바');
insert into position (poNo,poName) values(2,'인턴');
insert into position (poNo,poName) values(3,'사원');
insert into position (poNo,poName) values(4,'주임');
insert into position (poNo,poName) values(5,'대리');
insert into position (poNo,poName) values(6,'팀장');
insert into position (poNo,poName) values(7,'과장');
insert into position (poNo,poName) values(8,'차장');
insert into position (poNo,poName) values(9,'부장');
insert into position (poNo,poName) values(10,'이사');
insert into position (poNo,poName) values(11,'상무');
insert into position (poNo,poName) values(12,'전무');
insert into position (poNo,poName) values(13,'부사장');
insert into position (poNo,poName) values(14,'사장');
insert into position (poNo,poName) values(15,'부회장');
insert into position (poNo,poName) values(16,'회장');

create table department(
	deptNo number(38) primary key,
	deptName varchar2(100)
);
insert into department (deptNo,deptName) values (10,'기획');
insert into department (deptNo,deptName) values (20,'총무');
insert into department (deptNo,deptName) values (30,'인사');
insert into department (deptNo,deptName) values (40,'개발');
insert into department (deptNo,deptName) values (50,'물류');
--부서번호
--기획 10
--총무 20
--인사 30
--개발 40
--물류 50
		UPDATE employee SET empEnable=1 where=300

deptno number(38) constraint emp86_deptno_fk references dept86(deptno)

select * from position
select * from DEPARTMENT
select * from employee

create sequence eno_seq increment by 1 start with 1;
create sequence dno_seq increment by 1 start with 1;

drop sequence eno_seq;

SELECT * FROM USER_SEQUENCES; 
