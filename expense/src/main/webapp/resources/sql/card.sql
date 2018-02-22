drop table card purge;

create table card(
	card_code  varchar2(20)  constraint card_card_code_pk primary key,
	root_idn  number  constraint card_root_idn_fk references object_root(root_idn),
	card_name  varchar2(50)  constraint card_card_name not null,
	card_corp_code  varchar2(20)  constraint card_card_corp_code_fk references card_corp(card_corp_code),
	card_type_code  varchar2(20)  constraint card_card_type_code_nn not null,
	card_type_name  varchar2(50)  constraint card_card_type_name_nn not null,
	card_expense_date  number,
	card_use_term  varchar2(50),
	bank_code  varchar2(20)  constraint card_bank_code_fk references bank_corp(bank_code),
	root_id  varchar2(20)
);

create table card(
	card_code  varchar2(20)  constraint card_card_code_pk primary key,
	root_idn  number,
	card_name  varchar2(50),
	card_corp_code  varchar2(20),
	card_type_code  varchar2(20),
	card_type_name  varchar2(50),
	card_expense_date  number,
	card_use_term  varchar2(50),
	bank_code  varchar2(20),
	asset_code  varchar2(20),
	root_id varchar2(20)
);

select * from card;

select count(*) from card where root_id = 'admin' and card_type_code = 'creditcard';

alter table card add(root_id varchar2(20));

update card set root_id = 'admin' where root_idn=1;

insert into card values('1ch001', 1, '신한카카오체크카드', 'card002', 'checkcard', '체크카드', 5, 'sdm22~esm21', 'fnc011', '1bk001', 'admin');
insert into card values('1cd001', 1, '현대제로카드', 'card008', 'creditcard', '신용카드', 5, 'sdm24~esm23', 'fnc011', '1bk001', 'admin');

delete from card;

select * from card where root_idn = 1 and card_code = 'ch001';
