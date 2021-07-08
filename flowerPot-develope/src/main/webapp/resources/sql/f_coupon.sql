create table f_coupon(
	couNo int primary key
	,couponName varchar2(100) unique  -- 쿠폰이름 유효성 검증..
	,discountMoney int default 0
	,discountPercent int default 0
	,startDate date
	,endDate date,
	enable char(1) default 1
);
-- 시퀀스
create sequence couNo_seq increment by 1 start with 1;

select * from f_coupon;


drop table f_coupon;

