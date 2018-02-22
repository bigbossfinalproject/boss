drop table expense purge;

create table expense(
	expense_id  varchar2(20)  constraint expense_expense_id_pk primary key,
	root_idn  number  constraint expense_root_idn_fk references object_root(root_idn),
	root_id  varchar2(20)  constraint expense_root_id_fk references object_root(root_id),
	expense_date  date  constraint expense_expense_date_nn not null,
	item_code  varchar2(20)  constraint expense_item_code_fk references item(item_code),
	trade_code  varchar2(50)  constraint expense_trade_code_nn not null,
	expense_code  varchar2(20)  constraint expense_expense_code_nn not null,
	expense_discription  varchar2(200)  constraint expense_expense_discription_nn not null,
	expense_amount  number  constraint expense_expense_amount_nn not null
);

create table expense(
	expense_id  varchar2(20)  constraint expense_expense_id_pk primary key,
	root_idn  number,
	root_id  varchar2(20),
	expense_date  date,
	item_code  varchar2(20),
	trade_code  varchar2(50),
	expense_code  varchar2(20),
	expense_discription  varchar2(200),
	expense_amount  number
);

select * from expense where root_idn = 1 and trade_code='checkcard' order by expense_date desc;

select * from expense order by expense_date desc;

select * from expense where root_idn = 1 and expense_date >= '2018-02-14' order by expense_date desc;

update expense set expense_code = '1ch001' where root_idn=1 and trade_code = 'checkcard';
update expense set root_id = 'sehoon.jin' where root_idn=2;

update expense set item_code = '1e004000' where item_code = 'e004000';
update expense set item_code = '1e013000' where item_code = 'e013000';
update expense set item_code = '1e012000' where item_code = 'e012000';
update expense set item_code = '1e005000' where item_code = 'e005000';
update expense set item_code = '1e007000' where item_code = 'e007000';

delete from expense where root_idn = 2;

