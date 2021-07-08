create table f_customerCenter(
	ccno number(30),
	title varchar2(100),
	content varchar2(100),
	regdate date,
	moddate date,
	category varchar2(100),
	mno number(30),
	primary key(mno)
);
	
alter table f_customerCenter add foreign key(mno) references f_member(mno);
select * from F_CUSTOMERCENTER;
insert into F_CUSTOMERCENTER values(1,'a','b',sysdate,sysdate,1,1);

delete from f_customerCenter where ccno=1;

create sequence ccno_seq increment by 1 start with 1 minvalue 1;

drop table f_customerCenter;