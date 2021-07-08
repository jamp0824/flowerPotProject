create table f_component(
	cpno number(30),   -- 성분번호
	cname varchar2(50),   -- 성분이름
	ename varchar2(100),   --성분영어이름
	allergy char(1),    -- 알러지가 있는지 
	oil char(1),     -- 지성피부에 도움이 되는지 
	dry char(1),     -- 건성에 도움이 되는가
	sensitive char(1),  --  민감성 피부에 좋은지
	sunblock char(1),   -- 민감성피부에 좋은지
	whitening char(1),   --  미백에 도움이 되는지
	wrinkle char(1),    --  주름개선에 도움이 되는지
	primary key(cpno)
);

-- 성분 번호 시퀀스
create sequence cpno_seq start with 1 increment by 1;

select * from f_component;
alter table f_component drop column skinType;