drop table object_root purge;
drop sequence object_root_seq;

create table object_root(
	root_idn  number  constraint object_root_idn_pk primary key,
	root_name  varchar2(20),
	root_id  varchar2(20),
	root_password  varchar2(20),
	root_email  varchar2(50),
	root_birth  varchar2(20),
	root_gender  varchar2(10),
	root_job  varchar2(20),
	root_address  varchar2(200),
	root_grade  number
);

create sequence object_root_seq start with 1 increment by 1; 

select * from object_root;

select object_root_seq.currVal from dual;

insert into object_root(root_idn, root_name, root_id, root_password, root_email, root_grade)
	values (object_root_seq.nextVal, '관리자', 'admin', '1234', 'admin@thejoeun.com', 1);
insert into object_root(root_idn, root_name, root_id, root_password, root_email, root_grade)
	values (object_root_seq.nextVal, '진세훈', 'user1', '1234', 'sehoon.jin@thejoeun.com', 3);
insert into object_root(root_idn, root_name, root_id, root_password, root_email, root_grade)
	values (object_root_seq.nextVal, '이재훈', 'user2', '1234', 'jehoon.lee@thejoeun.com', 3);
insert into object_root(root_idn, root_name, root_id, root_password, root_email, root_grade)
	values (object_root_seq.nextVal, '유재광', 'user3', '1234', 'jekwang.yu@thejoeun.com', 3);
insert into object_root(root_idn, root_name, root_id, root_password, root_email, root_grade)
	values (object_root_seq.nextVal, '박진환', 'user4', '234', 'jinhwan.park@thejoeun.com', 3);
insert into object_root(root_idn, root_name, root_id, root_password, root_email, root_grade)
	values (object_root_seq.nextVal, '이동호', 'user5', '1234', 'dongho.lee@thejoeun.com', 3);




