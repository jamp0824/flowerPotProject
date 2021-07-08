create table comments(
rno number(38) primary key -- 답글번호, number(38)은 오라클에서 최대 38자까지 정수숫자값을 지정하는 자료형, primary key는 기본키 제약조건으로 중복번호값이 없고 null저장 금지
,ccno number(38) default 0 -- f_customerCenter테이블의 ccno컬럼 Q&A번호값만 저장됨. -- 외래키 제약조건으로 추가 설정. defualt 0 제약조건은 굳이 번호값을 저장하지 않아도 기본값 0 이 저장됨.
,replyer varchar2(100) not null -- 답글 작성자
,replytitle varchar2(4000) not null -- 답글 제목
,replytext varchar2(4000) not null -- 답글 내용
,regdate date -- 답글 등록날짜, date는 오라클 날짜 타입
,updatedate date -- 답글 수정날짜
);
create sequence comment_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가
nocache;--임시 저장 장소를 사용하지 않겠다.


select * from comments where ccno=104
select * from comments where rno=12

select * from comments order by rno desc; --답글 번호를 기준으로 내림차순 정렬

update comments set replytitle='안녕', replytext='메롱', updatedate=sysdate where rno =8

--외래키 설정 (casecade로 부모 q&a게시글이 삭제되면 자손 답변도 함께 삭제)
alter table comments add constraint fk_QAcomnts
foreign key(ccno) references f_customerCenter(ccno) on delete cascade; --주인테이블의 f_customerCenter의 기본키 컬럼 ccno를 참조하고 있다. 그러므로 Q&A 번호값만 저장됨.





-- 답글번호값이 저장된 시퀀스 생성
create sequence comment_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가
nocache;--임시 저장 장소를 사용하지 않겠다.

-- 시퀀스 다음번호값 확인
select comment_seq.nextval from dual;
--dual테이블은 오라클 설치시 설치되는 임시테이블로 시퀀스 번호값 확인 용도, 오라클 함수값 확인 용도, 연산결과값 확인용도 등으로 활용됨.

--sysdate 오라클 날짜함수 값 확인
select sysdate from dual;

delete from f_customerCenter where ccno=104
delete from comments where ccno=104

drop table comments
drop sequence comment_seq;
