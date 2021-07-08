create table f_hasCoupon(
	hasCno number(30),
	mno number(30),
	couNo number(30)
);
-- 시퀀스
create sequence hasCno_seq increment by 1 start with 1;
--
alter table f_hasCoupon add constraint f_hasCoupon_fk_mno foreign key (mno) references f_member(mno); 
alter table f_hasCoupon add constraint f_hasCoupon_fk_couNo foreign key (couNo) references f_coupon(couNo);




















drop table f_hasCoupon;
select * from f_member;
select * from f_member where enabled = 1;
select * from f_hasCoupon;
delete from f_hasCoupon;