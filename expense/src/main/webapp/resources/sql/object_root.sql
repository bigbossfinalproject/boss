--일반 data
select * from object_root;


create table object_root(
   root_idn  number  constraint object_root_idn_pk primary key,
   root_id  varchar2(20)  constraint object_root_idn_id unique,
   root_pwd  varchar2(20),
   root_name  varchar2(20),
   root_email  varchar2(50),   
   root_grade  number default 0
);
create sequence object_root_seq;
--분석용 추가 data
create table object_root_big(
   root_idn  number,  
   root_Address varchar2(50),
   root_birth number,
   root_gender number,
   root_edu number,
   root_marry number,
   root_job  number
);

--삭제
drop sequence object_root_seq;
drop table object_root purge;
drop table object_root_big purge;

truncate table object_root;

--조회
select * from object_root
select * from object_root_big


--사용자 추가
insert into OBJECT_ROOT
values(object_root_seq.nextVal, 'Admin', 1, 1, 1, 1);

insert into OBJECT_ROOT
values(object_root_seq.nextVal, 1, 1, 1, 1, 1);

--insert into object_root(root_idn, root_name, root_id, root_pwd, root_email, root_grade)
--	values (object_root_seq.nextVal, '관리자', 'admin', '1234', 'admin@thejoeun.com', 1);
--insert into object_root(root_idn, root_name, root_id, root_pwd, root_email, root_grade)
--	values (object_root_seq.nextVal, '진세훈', 'user1', '1234', 'sehoon.jin@thejoeun.com', 3);
--insert into object_root(root_idn, root_name, root_id, root_pwd, root_email, root_grade)
--	values (object_root_seq.nextVal, '이재훈', 'user2', '1234', 'jehoon.lee@thejoeun.com', 3);
--insert into object_root(root_idn, root_name, root_id, root_pwd, root_email, root_grade)
--	values (object_root_seq.nextVal, '유재광', 'user3', '1234', 'jekwang.yu@thejoeun.com', 3);
--insert into object_root(root_idn, root_name, root_id, root_pwd, root_email, root_grade)
--	values (object_root_seq.nextVal, '박진환', 'user4', '234', 'jinhwan.park@thejoeun.com', 3);
--insert into object_root(root_idn, root_name, root_id, root_pwd, root_email, root_grade)
--	values (object_root_seq.nextVal, '이동호', 'user5', '1234', 'dongho.lee@thejoeun.com', 3);




