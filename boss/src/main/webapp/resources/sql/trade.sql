drop table trade purge;

create table trade(
	trade_code  varchar2(20)  constraint trade_trade_code_pk  primary key,
	trade_name varchar2(50)  constraint trade_trade_name_nn not null
);

create table trade(
	trade_code  varchar2(20)  constraint trade_trade_code_pk  primary key,
	trade_name varchar2(50)
);

truncate table trade;

insert into trade values('cash', '현금');
insert into trade values('account', '통장');
insert into trade values('card', '카드');
insert into trade values('transfer', '계좌이체');

delete from trade where trade_code='account'
delete from trade where trade_code=

select * from trade;