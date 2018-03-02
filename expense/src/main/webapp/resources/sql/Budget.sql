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

create sequence budget_code_seq;

select * from budget

drop table budget;

insert into budget values(budget_code_seq.nextVal,2,200,400,sysdate,'3');
select item_name from item where root_idn=3

	select sum(budget_amount) budget_amount, sum(budget_amount_spent) budget_amount_spent,to_char(budget_date,'YYYYMM') budget_date from budget where root_idn= 1 group by to_char(budget_date,'YYYYMM')  

	
	select count(*) from budget where to_char(budget_date,'YYYY-MM')=to_char(sysdate,'YYYY-MM') and ITEM_code=? and root_idn=?