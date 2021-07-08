create table f_customerCenter(
	ccno int primary key,
	mno int,
	title varchar2(200) not null,  -- 제목
	content varchar2(4000) not null,  -- 내용
	regdate date ,    
	moddate date ,
	category int not null,   -- 카테고리
	URL varchar2(200)     -- url
);
-- 시퀀스
create sequence ccno_seq increment by 1 start with 1 minvalue 1 nocache;
-- 제약조건 
alter table f_customerCenter add constraint f_customerCenter_fk_mno foreign key (mno) references f_member(mno);

alter table f_customerCenter add URL varchar2(200);




















select * from f_member;
select * from f_customerCenter;

drop table f_member;
drop table f_customerCenter;
drop sequence mno_seq;
drop sequence ccno_seq;

select * from f_customerCenter;
select * from (select f_customerCenter.*, rownum from f_customerCenter order by ccno desc) where rownum <= 10
select f_customerCenter.*, rownum from f_customerCenter order by ccno desc;

alter table f_customerCenter add constraint  f_mno foreign key (mno) references f_member(mno);

create sequence mno_seq increment by 1 start with 1 minvalue 1 nocache;

create sequence ccno_seq increment by 1 start with 1 minvalue 1 nocache;

insert into f_member (mno,id,password,name,nickname,address,email,gender,birth,member_rank,authority ) 
values (mno_seq.nextval,'dobby1234','isfree1234','김도비','도오비이','주소','dobby1234@gmail.com','M','01-18','골드','고객');



insert into f_member (mno,id,password,name,nickname,address,email,gender,birth,member_rank,authority ) 
values (mno_seq.nextval,'dobby4567','isfree4567','박도비','바아악도오비이','주소','dobby4567@gmail.com','M','01-28','골드','고객');


insert into f_customerCenter (ccno,mno, title, content, regdate, moddate, category) 
values (ccno_seq.nextval, 3,'dobby is free', 'DOBBY IS FREE', sysdate, sysdate ,'notice');

insert into f_customerCenter (ccno,mno, title, content, regdate, moddate, category) 
values (ccno_seq.nextval, 3,'DOBBY is NOT free', 'DOBBY IS not FREE', sysdate, sysdate ,'FAQ');

insert into f_customerCenter (ccno,mno, title, content, regdate, moddate, category) 
values (ccno_seq.nextval, 3,'DOBBY is NOT free', 'DOBBY WANNA FREE', sysdate, sysdate ,'enquiry');

select ccno, title, content, regdate from f_customerCenter where category = '테스트';
select ccno, title, content, regdate from f_customerCenter where category = '테스트2';

insert into f_customerCenter (ccno,mno, title, content, regdate, moddate, category) 
values (ccno_seq.nextval, 2,'DOBBY is NOT free', 'DOBBY WANNA FREE', sysdate, sysdate ,'FAQ');

--공지사항 입력 테스트
insert into f_member (mno,id,password,name,nickname,address,email,gender,birth,member_rank,authority ) 
values (mno_seq.nextval,'adminDobby','administrator','관리자','관리자','관리자','dobby1234@gmail.com','M','01-18','관리자','관리자');

select * from f_member


insert into F_CUSTOMERCENTER (ccno, mno, title, content , regdate, moddate, category) values 
(ccno_seq.nextval, 3,'주문 후 언제까지 입금해야 하나요? (ﾟヘﾟ)？', '주문 후 24시간 이내로 무통장 및 카드 결제 진행해 주셔야 합니다.<br>
입금확인이 어려울 시 자동으로 주문이 취소됩니다', sysdate, sysdate ,'FAQ');

insert into F_CUSTOMERCENTER (ccno, mno, title, content , regdate, moddate, category) values 
(ccno_seq.nextval, 3,'배송은 얼마나 걸리나요? (ﾟヘﾟ)？', '구매하신 시간이 오전 12시 이전이면 당일 배송입니다.<br>
그 이후 시간은 다음날 순차적으로 출고됩니다.<br>
조금만 기다려주시면 꼼꼼하게 검수 후 예쁘게 발송해드리겠습니다.(ง •̀_•́)ง', sysdate, sysdate ,'FAQ');

insert into F_CUSTOMERCENTER (ccno, mno, title, content , regdate, moddate, category) values 
(ccno_seq.nextval, 3,'상품이 매진 됐습니다. 언제 입고 될까요? (ﾟヘﾟ)？', '상품이 품절된 경우 가능한 한 빨리 입고할 예정입니다.<br>
다만 업체에 따라 시간이 소요될 수 있습니다.<br>
최선을 다해서 물량 조절하겠습니다.(๑و•̀Δ•́)و <br>항상 애용해 주셔서 감사합니다.', sysdate, sysdate ,'FAQ');

insert into F_CUSTOMERCENTER (ccno, mno, title, content , regdate, moddate, category) values 
(ccno_seq.nextval, 3,'환불 정책은 어떻게 되나요? (ﾟヘﾟ)？', '제품의 하자가 발생할 시 사진 첨부 후 이메일 발송해 주시면 2일 이내 바로 연락드리겠습니다.(｡•́︿•̀｡)<br>
제품 파손의 경우 100% 환불 그 외의 상황은 연락으로 개별 안내 도와드리겠습니다.', sysdate, sysdate ,'FAQ');

insert into F_CUSTOMERCENTER (ccno, mno, title, content , regdate, moddate, category) values 
(ccno_seq.nextval, 3,'적립금이 확인 되지 않습니다. (๑°ㅁ°๑)‼✧', '적립금은 고객님께서 제품을 받으신 후 3일 이내로 일괄 처리됩니다.<br>
너그러운 마음으로 잠시만 기다려주세요.', sysdate, sysdate ,'FAQ');

insert into F_CUSTOMERCENTER (ccno, mno, title, content , regdate, moddate, category) values 
(ccno_seq.nextval, 3,'고객센터 운영시간을 알고 싶습니다. (๑╹∀╹๑)', '고객센터 운영시간은<br>
평일: 월 ~ 금, 시간: 오전 9시 30분 ~ 17시 30분까지 운영하고 있습니다.<br>
이메일로 문의하셔도 성심성의껏 답변드리겠습니다!٩(๑•̀o•́๑)و', sysdate, sysdate ,'FAQ');

insert into F_CUSTOMERCENTER (ccno, mno, title, content , regdate, moddate, category) values 
(ccno_seq.nextval, 3,'화분 회사에 지원하고 싶습니다! (๑ •̀ω•́)۶', '화분은 수시 채용을 하고 있습니다.<br>
자유 이력서 양식을 Light & Salt 멤버에게 직접 보내주시면,
<br>검토 후 순차적으로 연락드리겠습니다.(๑ •̀ω•́)۶', sysdate, sysdate ,'FAQ');

insert into F_CUSTOMERCENTER (ccno, mno, title, content , regdate, moddate, category) values 
(ccno_seq.nextval, 3,'광고 및 투자는 어떻게 하나요? (ﾟヘﾟ)？', '관련 문의는 Light & Salt 멤버에게 문의 이메일을 보내주세요.<br>
이메일 보내주시면 관련 양식 보내드립니다.<br>
해당 양식 회신해 주시면 5일 이내 연락드리겠습니다.<br>
화분은 한 분 한 분의 인연을 소중하게 생각합니다. 감사합니다.(❀╹◡╹)', sysdate, sysdate ,'FAQ');

--1:1문의 데이터 테스트
insert into F_CUSTOMERCENTER values(ccno_seq.nextval, 3, 'test' ,'test' ,sysdate , sysdate , 'enquiry', 'testurl')


--공지사항 테스트 데이터
insert into F_CUSTOMERCENTER values(ccno_seq.nextval, 3, 'test2' ,'this is data of test2' ,sysdate , sysdate , 'notice', 'testurl')

delete  from  F_CUSTOMERCENTER where category='faq';
delete  from  F_CUSTOMERCENTER where category='FAQ';
select * from F_CUSTOMERCENTER where category ='FAQ'

select * from F_CUSTOMERCENTER where ccno=13

select * from F_CUSTOMERCENTER where category='enquiry'
select * from F_CUSTOMERCENTER where category='notice' and ccno = 42
 /*
create table f_faq(
fno int primary key,
ccno int not null,
title varchar2(400) not null,
content varchar2 (4000) not null,
);

alter table f_customerCenter add constraint  f_mno foreign key (mno) references f_member(mno);

alter table f_faq add constraint f_ccno foreign key (ccno) references f_customerCenter(ccno);
*/

select f_customerCenter.*, rownum as rnum from f_customerCenter where category = 'notice' order by ccno desc;
--select *, rownum from f_customerCenter where category = 'notice' order by ccno desc;
select * from ( select f_customerCenter.*, rownum as rnum from f_customerCenter where category = 'notice' order by ccno desc )  where rnum <= (1*5) and rnum > (1-1)*5;  