create table f_coupon(
	couNo int
	,couponName varchar2(100) unique
	,discountMoney int default 0
	,discountPercent int default 0
	,startDate date
	,endDate date,
	enable char(1) default 1
);

alter table f_coupon add couponName char(1);
alter table f_coupon modify enable char(1) default 1;

drop table f_coupon;

create sequence couNo_seq increment by 1 start with 1;

select * from f_coupon;
select * from f_hasCoupon;

drop sequence couNo_seq;

update f_coupon set enable=1;


select f_coupon.* from f_hasCoupon inner join f_coupon on f_hasCoupon.couNo = f_coupon.couNo where mno = 21
select * from ( select f_hasCoupon.couNo from f_hasCoupon where mno = 21;
insert into f_hasCoupon (hasCno, mno, couNo) values (hasCno_seq.nextval, 21, 21);