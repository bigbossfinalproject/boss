drop table asset purge;

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


insert into asset values('1cs001', 'cash', 1, '2018/02/14', '지갑속 현금', '현금 필요시 사용', 'money', 100000, 100000, 'Y' , 'admin');
insert into asset values('1bk001', 'account', 1, '2018-02-14', '신한입출금통장', '주 사용 통장', 'fnc011', 1000000, 1000000, 'Y', 'admin');
insert into asset values('1bk002', 'account', 1, '2018-02-14', '신한주택청약저축통장', '주택 구입 준비용', 'fnc011', 1500000, 1500000, 'Y', 'admin');

select * from asset;

delete from asset where asset_code = '1bk001';

select * from asset where asset_code like '1bk%';

select count(*) from asset where root_id='admin' and trade_code ='account';

