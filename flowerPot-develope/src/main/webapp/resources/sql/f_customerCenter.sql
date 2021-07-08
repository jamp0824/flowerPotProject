--공지사항, FAQ, Q&A 테이블

create table f_customerCenter(
	ccno int primary key,
	mno int,
	title varchar2(100),
	content varchar2(3000),
	regDate date,
	modDate date,
	category int 
	--공지사항 1 , FAQ 2 , Q&A 3
);

drop table f_customerCenter

create sequence ccno_seq
start with 1
increment by 1

