create table f_cosmetic(
	cno number(30) primary key,   --화장품 번호
	name varchar(50) unique,  -- 화장품 이름
	code varchar2(150),  -- 상품 코드
	type varchar2(50) not null,   -- 타입
	sub_type varchar2(50) not null, -- 서브 타입
	brand varchar2(50)  not null,   --브랜드
	skinType varchar2(50)  not null, -- 비푸타입
	price number(30) default 0,    --화장품 번호
	tag varchar2(50),   -- 별로 필요 없는놈..
	content varchar2(3000) not null, 
	discountPersent number(30) default 0,
	stockNumber number(30) default 0,
	hits number(30) default 0,  -- 조회수
	likey number(30) default 0,   -- 좋아요 개수
	enable char(1)  default 1, -- 사용가능 여부
	numProduct number(30) default 0,		-- 상품개수
	proOption varchar2(100),   -- 별로 필요 없는놈..
	regdate date
);
-- 시퀀스
create sequence cno_seq  start with 1 increment by 1;
-- 제약조건

select * from f_cosmetic;

update  F_COSMETIC set discountPersent = 10;

















-- alter table f_cosmetic add (hits number(30) default 0, regdate date);
alter table f_cosmetic modify stockNumber number(30) default 0;
discountPersent number(30) default 0,
	stockNumber number(30) default 0
--alter table f_cosmetic add (code varchar2(150));
--alter table f_cosmetic add (enable char(1));

-- 시퀀스
create sequence cno_seq  start with 1 increment by 1;
--  제약조건
-- alter table f_cosmetic add constraint f_cosmetic_fk_cno foreign key (cno) references f_description(cno);

select cno,name,hits,likey from f_cosmetic 

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--inventory work
--cno, name, proOption, stockNumber 만 필요
select * from F_COSMETIC order by cno asc;

insert into F_COSMETIC 
values (1, '화장품이름','상품코드', '타입', '브랜드','스킨타입',112,'tag','content',
30,3,150050, 100,'y',151, 'proOption상품색상/사이즈',sysdate);

insert into F_COSMETIC 
values (cno_seq.nextval, '화장품이름2','상품코드2', '타입2', '브랜드2','스킨타입2',125,'tag2','content2',
20,4,155514, 1580,'N',148, 'proOption상품색상/사이즈2',sysdate);

insert into F_COSMETIC 
values (cno_seq.nextval, '화장품이름3','상품코드3', '타입3', '브랜드3','스킨타입3',125,'tag2','content2',
20,4,155514, 1580,'N',148, 'proOption상품색상/사이즈2',sysdate);

update F_COSMETIC set proOption='상품색상2', stockNumber=3 where cno=1;


update f_cosmetic  
set stockNumber = 3 where cno = 1;

------------------------------------------------------------------------------
UPDATE Temp_Table SET field3='변경된 값' WHERE field1 = 'data2';

ALTER TABLE f_cosmetic DROP CONSTRAINT f_cosmetic_fk_cno;
drop table f_cosmetic;
drop table f_orderProduct;

drop table f_attachFile;
drop table f_description;
select * from f_cosmetic;

delete from f_cosmetic;

update f_cosmetic set type='스킨케어', sub_type='페이셜', skinType='지성', brand='이니스프리';

select rownum as rnum, f_cosmetic.* from f_cosmetic order by cno desc;
select rownum as rnum, c.* from (select * from f_cosmetic order by cno desc) c where rownum >1 and rownum < 10;
select rownum as rnum, f_cosmetic.* from f_cosmetic order by cno desc;
select * from f_cosmetic 


select c.* from (select rownum as rnum, f_cosmetic.* from f_cosmetic order by cno desc) c where rnum >1 and rnum < 10;

select c.* from ( select rownum as rnum, f_cosmetic.* from f_cosmetic where type = '스킨케어' and 
sub_type = '페이셜' order by cno desc ) c where rnum > 1 and rnum < 10;

select rownum as rnum, f_cosmetic.* from f_cosmetic where type = '스킨케어' and 
sub_type = '페이셜';

select rownum as rnum, c.* from (select * from f_cosmetic where type = '스킨케어' and  sub_type = '페이셜' order by cno desc ) c;

select c.* from (select rownum as rnum, c.* from (select * from f_cosmetic where type = '스킨케어' and  sub_type = '페이셜' order by cno desc ) c) c where rnum >1 and rnum < 10;

