create table f_hasComponent(
	cno number(30) null,
	cpno number(30) null,
	constraint f_hasComponent_fk_cno foreign key (cno) references f_cosmetic(cno),
	constraint f_hasComponent_fk_cpno foreign key (cpno) references f_component(cpno)
);

select * from f_hasComponent;
drop table f_hasComponent;