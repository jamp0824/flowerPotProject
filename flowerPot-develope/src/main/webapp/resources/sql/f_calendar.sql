create table f_calendar(
  mno number(38),
  id varchar2 (100),
  title varchar2(1000),
  dateChoice date,
  content varchar2(1000),
  primary key(mno)
);

select * from f_calendar 

drop table f_calendar;

