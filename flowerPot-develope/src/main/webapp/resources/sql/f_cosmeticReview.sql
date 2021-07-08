create table f_cosmeticReview(
	crno number(30), --게시글번호
	cno number(30), --상품번호
	mno number(30), --멤버번호
	category varchar2(50),   -- 상품문의인지 상품평인지
	id varchar2(50),    -- 회원 아이디
	nickname varchar2(50),    -- 회원 닉네임
	title varchar2(100),    -- 평가제목
	content varchar2(3000),  -- 평가내용
	rating number(5) ,  --평점
	regdate date,
	primary key (crno)
);
-- 시퀀스
create sequence crno_seq  start with 1 increment by 1;










insert into F_COSMETICREVIEW values(crno_seq.nextval, 1,1, '아주좋습니다.',5,'abcd1234','june123','aaa123','aaa123')
insert into F_COSMETICREVIEW values(crno_seq.nextval, 1,1, '아주좋습니다.123',5,'abcd1234','june123','aaa123','aaa123')
select * from f_cosmeticReview;
drop table f_cosmeticReview;

alter table f_cosmeticReview add regdate date;


insert into
F_COSMETICREVIEW  values
(crno_seq.nextval, 1,222,'category','id','nickame','title','content',3 );

insert into
F_COSMETICREVIEW  values
(crno_seq.nextval, 2,333,'category2','id2','nickame2','title2','content2',4);

insert into
F_COSMETICREVIEW  values
(crno_seq.nextval, 3,222,'category','id3','nickame3','title3','content',3 );

insert into
F_COSMETICREVIEW  values
(crno_seq.nextval, 4,333,'category2','id4','nickame4','title4','content2',2);

insert into
F_COSMETICREVIEW  values
(crno_seq.nextval, 5,222,'category','id5','nickame5','title5','content',1 );

insert into
F_COSMETICREVIEW  values
(crno_seq.nextval, 6,333,'category2','id6','nickame6','title6','content2',5);

insert into
F_COSMETICREVIEW  values
(crno_seq.nextval, 7,222,'category','id7','nickame7','title7','content',6 );

insert into
F_COSMETICREVIEW  values
(crno_seq.nextval, 2,333,'category2','id2','nickame2','title7','content2',4);

alter table f_cosmeticReview add constraint fk_id foreign key(id) references f_member(id)
