--공지사항, FAQ, Q&A 테이블

create table f_customerCenter(
	ccno int primary key,
	mno int,
	title varchar2(100),
	content varchar2(3000),
	regDate date,
	modDate date,
	category int,
	url varchar2(100)
);

drop table f_customerCenter;
select * from F_CUSTOMERCENTER

INSERT INTO f_customerCenter (ccno,title,content,regDate,category) 
VALUES (ccno_seq.nextval,'[결제] 주문 후 언제까지 입금해야 하나요?','<p>주문 후 24시간 이내로 무통장 및 카드 결제 진행해 주셔야 합니다.</p><p> 
입금확인이 어려울시 자동으로 주문이 취소됩니다.^^<p>',sysdate,2) 

INSERT INTO f_customerCenter (ccno,title,content,regDate,category)
VALUES (ccno_seq.nextval,'[배송] 배송은 얼마나 걸리나요?','<p>주문 후 24시간 이내로 무통장 및 카드 결제 진행해 주셔야 합니다.</p><p>입금확인이 어려울시 자동으로 주문이 취소됩니다.^^</p>',sysdate,2) 

INSERT INTO f_customerCenter (ccno,title,content,regDate,category) 
VALUES (ccno_seq.nextval,'[상품] 상품이 매진되었습니다. 언제 입고 될까요?','<p>상품이 품절될 경우 가능한 한 빨리 입고할 예정입니다.</p> <p>다만 업체에 따라 시간이 소요될 수 있습니다.</p> <p>최선을 다해서 물량 조절 하겠습니다.</p> <p>항상 애용해 주셔서 감사합니다.^^</p>',sysdate,2) 

INSERT INTO f_customerCenter (ccno,title,content,regDate,category) 
VALUES (ccno_seq.nextval,'[환불] 환불 정책은 어떻게 되나요?','<p>제품의 하자가 발생할 시 사진 첨부 후 이메일 발송해주시면 2일 이내 바로 연락드리겠습니다.</p> <p>제품 파손의 경우 100% 환불 그 외의 상황은 연락으로 개별 안내 도와드리겠습니다.^^</p>',sysdate,2) 

INSERT INTO f_customerCenter (ccno,title,content,regDate,category) 
VALUES (ccno_seq.nextval,'[적립금] 적립금이 확인 되지 않습니다.','<p>적립금은 고객님께서 제품을 받으신 후 3일 이내로 일괄 처리됩니다.</p><p>너그러운 마음으로 잠시만 기다려주세요 ^^</p>',sysdate,2) 

INSERT INTO f_customerCenter (ccno,title,content,regDate,category) 
VALUES (ccno_seq.nextval,'[기타] 고객센터 운영시간을 알고 싶습니다.','<p>고객센터 운영시간은 평일: 월 ~ 금, 시간: 오전 9시 30분 ~ 17시 30분 까지 운영하고 있습니다.</p> <p>이메일로 문의 주셔도 성심성의껏 답변 드리겠습니다!</p>',sysdate,2) 

INSERT INTO f_customerCenter (ccno,title,content,regDate,category) 
VALUES (ccno_seq.nextval,'[기타] 화분 회사에 지원하고 싶습니다!','<p>화분은 수시 채용을 하고 있습니다.</p> <p>자유 이력서 양식을 Light & Salt 멤버에게 직접 보내주시면 검토 후 순차적으로 연락드리겠습니다.^^</p>',sysdate,2) 

INSERT INTO f_customerCenter (ccno,title,content,regDate,category) 
VALUES (ccno_seq.nextval,'[기타] 광고 및 투자는 어떻게 하나요?','<p>관련 문의는 Light & Salt 멤버에게 문의 이메일을 보내주세요.</p><p>이메일 보내주시면 관련 양식 보내드립니다.</p> <p>해당 양식 회신해주시면 5일 이내 연락드리겠습니다.</p><p>화분은 한 분 한 분의 인연을 소중하게 생각합니다.</p> <p>감사합니다.^^</p>',sysdate,2) 


delete from f_customerCenter where category=1 --공지사항만 삭제
delete from f_customerCenter where category=2 --faq만 삭제
delete from f_customerCenter where category=3 --q&a만 삭제

drop table f_customerCenter

create sequence ccno_seq
start with 1
increment by 1

