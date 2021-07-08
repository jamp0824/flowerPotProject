create table f_authority (
   auno number(30) primary key,
   id varchar2(100),   -- 멤버 id 명
   authority varchar2(50)  -- 권한이름
);
-- 시퀀스
create sequence auno_seq increment by 1 start with 1 minvalue 1; 
-- 제약조건
alter table f_authority add constraint f_authority_fk_id foreign key (id) references f_member(id);  -- 제약조건 추가


insert into f_authority  values (auno_seq.nextval, 'phantom1994' , 'ROLE_ADMIN');
insert into f_authority  values (auno_seq.nextval, 'phantom1994' , 'ROLE_BRAND');
select * from f_authority;
























create sequence auno_seq increment by 1 start with 1 minvalue 1; -- 시퀀스

drop table f_authority;
drop sequence auno_seq;

select * from f_authority;
insert into f_authority values (auno_seq.nextval, 'user0', 'ROLE_ADMIN','ROLE_ADMIN');
insert into f_authority values (auno_seq.nextval, 'user1', 'ROLE_USER','ROLE_USER');

insert into f_authority values (auno_seq.nextval, 'admin', 'ROLE_ADMIN','ROLE_ADMIN');
delete from f_authority where id='phantom1994';

insert into f_authority values (auno_seq.nextval, 'user1', 'ROLE_ADMIN','ROLE_ADMIN');
insert into f_authority values (auno_seq.nextval, 'phantom1994', 'ROLE_USER','ROLE_USER');
insert into f_authority values (auno_seq.nextval, 'phantom1994', 'ROLE_ADMIN','ROLE_ADMIN');

insert into f_authority values (auno_seq.nextval, 'user1', 'ROLE_ADMIN','ROLE_ADMIN');
insert into f_authority values (auno_seq.nextval, 'admin', 'ROLE_USER','ROLE_USER');
insert into f_authority values (auno_seq.nextval, 'admin0', 'ROLE_ADMIN','ROLE_ADMIN');



select mem.id, mem.password,  auth.authority from f_member mem left outer join f_authority auth on mem.id = auth.id where mem.id = 'user1';

select * from f_authority
select * from f_member

