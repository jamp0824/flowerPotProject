create table f_delivery(
	dno number(30) primary key,
	id varchar2(100),
	t_code varchar2(100), --운송장번호
	t_invoice varchar2(100), --택배회사 코드
	postcode varchar2(100),
	street_address varchar2(100),
	parcel_address varchar2(100),
	detail_address varchar2(100),
	more_infomation varchar2(100),
	deliver_state varchar2(100)
);
-- 시퀀스
create sequence dno_seq  start with 1 increment by 1;
-- 제약조건


-- commit



















alter table f_delivery add (t_invoice varchar2(100),t_code varchar2(100)); --운송장번호 --택배회사 코드 추가
alter table tbl_inyeon_fboard add constraint fb_fk_email foreign key (email) references tbl_inyeon_user(email);

alter table f_delivery add constraint fd_fk_id foreign key (id) references f_member(id); --주종관계에서 자식이 부모를 참조한다 (좌:자식 우:부모)

drop table f_delivery

create sequence dno_seq  start with 1 increment by 1;
	
select * from f_delivery;


--inner조인 하는법 : 
-- select (주종관계에서 검색될 컬럼들을 태이블명.컬럼명 으로 지정해준다.) 
-- from절 뒤에  inner join을 통해 양쪽 컬럼을 명시해주고 on절에서 참조된 외래키 기준을 작성한다 (부모테이블명.컬럼명 = 자식테이블명.컬럼명)
select f_member.name, f_delivery.t_code,f_delivery.t_invoice 
from f_member inner join f_delivery on f_member.id = f_delivery.id 
where  f_member.id='admin'

--미완성상태이다. 서브쿼리가들어가야한다 -> 아이디를 검색하고 뜨는 배송정보중에 다시선택해야한다... 어떻게해결해야할까 우선 목록부터 출력하자
where f_member.id=#{id} AND f_delivery.dno=#{dno}
--위와 같은 조건이 들어가야하는데 이렇게되면 객체가... 어쩔수없이 resultMap을 써야하는거같다
