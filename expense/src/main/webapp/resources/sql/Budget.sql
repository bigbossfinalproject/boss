drop table budget purge;

CREATE TABLE budget
(
	budget_code number, 
	root_idn        NUMBER          NOT NULL, 
    budget_amount          NUMBER          NULL, 
    budget_amount_spent    NUMBER          NULL, 
    budget_date     DATE            NULL, 
    item_code       VARCHAR2(20)    NULL   
);

select sum(budget_amount) budget_amount, 
sum(budget_amount_spent) budget_amount_spent from budget;

create sequence budget_code_seq;

drop table budget;


insert into budget values(budget_code_seq.nextVal,2,200,400,sysdate,'3');
 insert into budget values(select * from budget);


update budget set BUDGET_AMMOUNT = 20, item_code='3' 
where budget_code=4

select * from budget;

select count(*) from budget where item_code = '1a00000';

update budget set BUDGET_AMOUNT = 20, budget_amount_spent =10


select sum(budget_ammount) budget_ammount , 
sum(budget_amount_spent) budget_ammount_spent from budget


drop table budget
select budget_ammount,item_code from budget; 
select budget_ammount,item_code from budget;

create table ajax_user(
userName varchar2(20),
userAge number,
userGender varchar2(20),
userEmail varchar2(20)
)

insert into AJAX_USER values ('박진환', 22, '남' ,'222@naver.com');
insert into AJAX_USER values ('김진환', 22, '남' ,'222@naver.com');
insert into AJAX_USER values ('오진환', 22, '남' ,'222@naver.com');
insert into AJAX_USER values ('이진환', 22, '남' ,'222@naver.com');
select * from ajax_user where userName LIKE '%환%'

select * from ajax_user

create table test22(
abc10 number,
abc11 number,
abc12 number);

insert into test20 values(1,2,3);

select abc10 from test20;
select * from test22 limit 20;

select test20.* from test20, test22;

select * from test20, test22 where test22.abc10=1;
select * from ajax_user where userName LIKE '%d%';
