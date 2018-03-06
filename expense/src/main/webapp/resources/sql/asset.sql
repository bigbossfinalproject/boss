
drop table asset purge;



select sum(basic_amount) total_amount, 
(select sum(a1.basic_amount) from asset a1 where trade_code='account')account_amount, 
(select sum(e1.expense_amount) from expense e1 where trade_code='account') account_amount_spent,
(select sum(a2.basic_amount) from asset a2 where trade_code='cash') cash_amount,
(select sum(e2.expense_amount) from expense e2 where trade_code='cash') cash_amount_spent
from asset a where a.root_idn=1 group by a.root_idn

select * from asset


create table asset(
	asset_code  varchar2(20)  constraint asset_asset_code_pk primary key,
	trade_code  varchar2(20)  constraint asset_trade_code_fk references trade(trade_code),
	root_idn  number  constraint asset_root_idn_fk references object_root(root_idn),
	asset_date  date  constraint asset_asset_date_nn not null,
	asset_name  varchar2(50)  constraint asset_asset_name_nn not null,
	asset_purpose  varchar2(100)  constraint asset_asset_purpose_nn not null,
	bank_code  varchar2(20)  constraint asset_bank_code_nn not null,
	basic_amount  number default 0,
	now_amount  number default 0,
	asset_use varchar2(20),
	root_id varchar2(20)
	
);


create table asset(
	asset_code  varchar2(20)  constraint asset_asset_code_pk primary key,
	trade_code  varchar2(20),
	root_idn  number,
	asset_date  date,
	asset_name  varchar2(50),
	asset_purpose  varchar2(100),
	bank_code  varchar2(20),
	basic_amount  number default 0,
	now_amount  number default 0,
	asset_use varchar2(20),
	root_id varchar2(20)
);

update asset set now_amount = now_amount+30000000 where asset_code = '1bk001';

update asset set now_amount = -374300 where asset_code = '1cs001';
update asset set now_amount = 21506300 where asset_code = '1bk001';



insert into asset values('1cs001', 'cash', 1, '2018/02/14', '지갑속 현금', '현금 필요시 사용', 'money', 100000, 100000, 'Y' , 'admin');
insert into asset values('1bk001', 'account', 1, '2018-02-14', '신한입출금통장', '주 사용 통장', 'fnc011', 1000000, 1000000, 'Y', 'admin');
insert into asset values('1bk002', 'account', 1, '2018-02-14', '신한주택청약저축통장', '주택 구입 준비용', 'fnc011', 1500000, 1500000, 'Y', 'admin');
insert into asset values('1bk003', 'account', 1, '2018-02-24', '신한주택저축통장', '주택 준비용', 'fnc011', 1500000, 1500000, 'Y', 'admin');
insert into asset values('1cs002', 'cash', 1, '2018/02/14', '지갑속 동전', '현금 필요시 사용', 'money', 100000, 100000, 'Y' , 'admin');
select * from asset;

update asset set asset_use = 'Y';

delete from asset where asset_name = 'test';

select * from asset where asset_code like '1bk%';

select count(*) from asset where root_id='admin' and trade_code ='account';

