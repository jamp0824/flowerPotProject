create table f_point(
	pno number(30),    
	mno number(30),
	ono number(30),
	add_point number(30),
	order_num varchar2(200),
	regdate date
);
-- 시퀀스
create sequence pno_seq increment by 1 start with 1;
-- 제약조건















drop table f_point;