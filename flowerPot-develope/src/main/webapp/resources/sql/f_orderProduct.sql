create table f_orderProduct(
	ono number(30) primary key,
	mno number(30),  -- 제약조건
	cno number(30),	 -- 제약조건
	dno number(30),  -- 제약조건
	order_num varchar2(100),  --주문번호
	amount number(30),   --주문량
	state varchar2(100) default '주문완료',  -- 
	deliver_state varchar2(100) default '배송시작',  -- 배송상태
	member_rank varchar2(30),  --회원등급
	point number(30),   -- 사용한 포인트
	couponName varchar2(50),   -- 사용한 쿠폰이름
	regdate date,   -- 구입날짜
	tel varchar2(50),    -- 비회원용 전화번호
	email varchar2(100),   -- 비회원용 이메일
	final_price number(30),  -- 최종 액수
	brand varchar2(100)
);
-- 시퀀스
create sequence ono_seq increment by 1 start with 1;
-- 제약조건





select * from f_orderProduct o left outer join f_member m on o.mno = m.mno where o.brand = '이니스프리' WHERE o.cno = 1 
select * from (select * from f_orderProduct o left outer join f_member m on o.mno = m.mno) o2 inner join f_cosmetic c on o2.cno = c.cno;
select * from f_orderProduct o left outer join f_member m on o.mno = m.mno;


drop table f_orderProduct;
select * from f_orderProduct;
select ono_seq.nextval from dual;

drop sequence ordPro_seq;
 
insert into f_orderProduct values(ono_seq.nextval, 3, 2401, 222,'주문번호1414', 2, '주문완료','배송시작','새싹',1500,'쿠폰번호',sysdate,'010-1111-1111','bbbb@naver.com',1300,'이니스프리');
insert into f_order values(orderno_seq.nextval,3,222,'주문번호1414');
insert into f_orderProduct values(ono_seq.nextval, 3, 2401, 222,'주문번호1415', 2, '주문완료','배송시작','새싹',1500,'쿠폰번호',sysdate,'010-1111-1111','bbbb@naver.com',1300,'이니스프리');
insert into f_order values(orderno_seq.nextval,3,222,'주문번호1415');
insert into f_orderProduct values(ono_seq.nextval, 3, 2401, 222,'주문번호1416', 2, '주문완료','배송시작','새싹',1500,'쿠폰번호',sysdate,'010-1111-1111','bbbb@naver.com',1300,'이니스프리');
insert into f_order values(orderno_seq.nextval,3,222,'주문번호1416');

insert into f_cosmeticReview values (crno_seq.nextval, 2401,3, 'rating',5, 'phantom1994','윤신영','title','content');

select * from f_orderProduct where brand = '이니스프리';

select * from f_orderProduct inner join f_cosmetic on f_orderProduct.cno = f_cosmetic.cno where f_cosmetic.brand = '이니스프리';

select f_cosmeticReview.* from f_cosmeticReview inner join f_cosmetic on f_cosmeticReview.cno = f_cosmetic.cno where brand = '이니스프리';
-- join 작업
select * from f_cosmeticReview.* , f_cosmetic.brand from f_cosmeticReview inner join f_cosmetic on f_cosmeticReview.cno = f_cosmetic.cno where f_cosmetic.brand = '이니스프리';
-- /join 작업

select * from f_cosmetic where brand = '이니스프리';
select * from f_cosmeticReview;
select * from f_orderProduct;
select * from f_order;
select * from f_member;
update f_member set brand= '이니스프리' where mno = 3;

select ono_seq.currval from dual;
select LAST_NUMBER from user_sequences where SEQUENCE_NAME = 'ONO_SEQ';


select * from f_orderProduct where mno = 3 order by ono desc;
