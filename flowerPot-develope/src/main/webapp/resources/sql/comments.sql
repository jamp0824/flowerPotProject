create table comments(
rno number(38) primary key -- 답글번호, number(38)은 오라클에서 최대 38자까지 정수숫자값을 지정하는 자료형, primary key는 기본키 제약조건으로 중복번호값이 없고 null저장 금지
,ccno number(38) default 0 -- f_customerCenter테이블의 ccno컬럼 Q&A번호값만 저장됨. -- 외래키 제약조건으로 추가 설정. defualt 0 제약조건은 굳이 번호값을 저장하지 않아도 기본값 0 이 저장됨.
,replyer varchar2(100) not null -- 답글 작성자
,replytitle varchar2(4000) not null -- 답글 제목
,replytext varchar2(4000) not null -- 답글 내용
,regdate date -- 답글 등록날짜, date는 오라클 날짜 타입
,updatedate date -- 답글 수정날짜
);
-- 시퀀스
create sequence comment_seq start with 1 increment by 1 nocache;
-- 제약조건
alter table comments add constraint comments_fk_ccno foreign key (ccno) references f_customerCenter(ccno);

