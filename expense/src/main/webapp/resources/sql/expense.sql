drop table expense purge;

create table expense(
	expense_id  varchar2(20)  constraint expense_expense_id_pk primary key,
	root_idn  number  constraint expense_root_idn_fk references object_root(root_idn),
	root_id  varchar2(20)  constraint expense_root_id_fk references object_root(root_id),
	expense_date  date  constraint expense_expense_date_nn not null,
	item_code  varchar2(20)  constraint expense_item_code_fk references item(item_code),
	parent_code  varchar2(2)  constraint expense_parent_code_fk references item(parent_code),
	trade_code  varchar2(50)  constraint expense_trade_code_nn not null,
	asset_code  varchar2(20)  constraint expense_expense_code_nn not null,
	expense_discription  varchar2(200)  constraint expense_expense_discription_nn not null,
	expense_amount  number  constraint expense_expense_amount_nn not null
);

create table expense(
	expense_id  varchar2(20)  constraint expense_expense_id_pk primary key,
	root_idn  number,
	root_id  varchar2(20),
	expense_date  date,
	item_code  varchar2(20),
	parent_code varchar2(20),
	trade_code  varchar2(50),
	asset_code  varchar2(20),
	expense_discription  varchar2(200),
	expense_amount  number
);

select * from expense where root_idn = 1 and trade_code='checkcard' order by expense_date desc;

select * from expense order by expense_date desc;

select count(*) from expense where item_code='1e004001';
select count(*) from expense where item_code='1e003002';
select count(*) from expense where item_code='1e004002';

select * from expense where root_idn = 1 and expense_date >= '2018-02-14' order by expense_date desc;

update expense set expense_code = '1ch001' where root_idn=1 and trade_code = 'checkcard';
update expense set root_id = 'sehoon.jin' where root_idn=2;

delete from expense where root_idn = 1;

delete from expense where expense_discription = '테스트';

insert into expense values('1e000001', 1, 'admin', '2018-02-01', '1e003002', '1e003000', 'cash', '1cs001', '점심식사(짬뽕)', '5500');
insert into expense values('1e000002', 1, 'admin', '2018-02-02', '1e003002', '1e003000', 'cash', '1cs001', '점심식사(비빔밥)', '6000');
insert into expense values('1e000003', 1, 'admin', '2018-02-03', '1e003002', '1e003000', 'cash', '1cs001', '점심식사(고추장불고기)', '7000');
insert into expense values('1e000004', 1, 'admin', '2018-02-04', '1e003002', '1e003000', 'cash', '1cs001', '점심식사(된장찌개)', '4000');
insert into expense values('1e000005', 1, 'admin', '2018-02-05', '1e003002', '1e003000', 'cash', '1cs001', '점심식사(칼국수)', '5000');
insert into expense values('1e000006', 1, 'admin', '2018-02-06', '1e003002', '1e003000', 'cash', '1cs001', '점심식사(김밥, 라면)', '5500');
insert into expense values('1e000007', 1, 'admin', '2018-02-07', '1e003002', '1e003000', 'cash', '1cs001', '점심식사(김치찌개)', '5000');
insert into expense values('1e000008', 1, 'admin', '2018-02-08', '1e003002', '1e003000', 'cash', '1cs001', '점심식사(부대찌개)', '7000');
insert into expense values('1e000009', 1, 'admin', '2018-02-09', '1e003002', '1e003000', 'cash', '1cs001', '점심식사(짜장면)', '4000');
insert into expense values('1e000010', 1, 'admin', '2018-02-10', '1e003002', '1e003000', 'cash', '1cs001', '점심식사(떡볶이)', '5000');
insert into expense values('1e000011', 1, 'admin', '2018-02-11', '1e004001', '1e004000', 'cash', '1cs001', '월세 지불', '300000');


select count(*) from expense where root_idn=1 and asset_code='1bk002';


select (select sum(expense_amount) from expense where trade_code = 'cash') exp,
(select sum(expense_amount) from expense where trade_code = 'account') exp2
from expense group by root_idn;

select sum(expense_amount) from expense where trade_code = 'account';

update expense set asset_code = '1bk001' where trade_code='account';

select * from expense where trade_code = 'account';



select sum(expense_amount) from expense where root_idn = 1 and expense_date >= '2017-01-01' and trade_code = 'cash';

select basic_amount - (select sum(expense_amount) from expense where root_idn = 1 and expense_date >= '2017-01-01'
		 and asset_code = '1cs001' and trade_code = 'cash') from asset where asset_code = '1cs001';

select sum(expense_amount) from expense where root_idn = 1 and expense_date >= '2017-01-01'
		 and asset_code = '1cs001' and trade_code = 'cash';

select * from expense where root_idn = 1 and expense_date >= '2017-01-01'
		 and asset_code = '1cs001' and trade_code = 'cash';

select * from expense where root_idn = 1 and expense_date >= '2017-01-01' and trade_code = 'cash';

select sum(expense_amount) from expense where asset_code = '1bk002';
