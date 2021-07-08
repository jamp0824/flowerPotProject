create table f_reply (
	rno number(30) primary key,
	ccno number(30),
	mno number(30),
	name varchar2(100),
	title varchar2(100),
	content varchar2(3000),
	regdate date,
	moddate date
);

create sequence seq_rno increment by 1 start with 1;