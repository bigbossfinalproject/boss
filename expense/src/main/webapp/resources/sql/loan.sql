drop table loan purge;

create table loan(
	loan_code  varchar2(20)  constraint loan_loan_code_pk primary key,
	item_code  varchar2(20),
	root_idn  number,
	root_id  varchar2(20),
	loan_date  date,
	loan_name varchar2(50),
	loan_purpose  varchar2(200),
	loan_begin_date  date,
	loan_expense_date  number,
	loan_end_date  date,
	asset_code  varchar2(20),
	capital_code  varchar2(20),
	loan_term  number,
	loan_rate number,
	loan_mean_code  varchar2(20),
	loan_mean  varchar2(50),
	loan_amount  number,
	loan_principal  varchar2(4000),
	loan_interest  varchar2(4000)
);

create table loan(
	loan_code  varchar2(20)  constraint loan_loan_code_pk primary key,
	item_code  varchar2(20)  constraint loan_item_code_fk references item(item_code),
	root_idn  number  constraint loan_root_idn_fk references object_root(root_idn),
	root_id  varchar2(20) constraint loan_root_id_nn references not null,
	loan_date  date  constraint loan_loan_date_nn not null,
	loan_name varchar2(50)  constraint loan_loan_name_nn not null,
	loan_purpose  varchar2(200)  constraint loan_loan_purpose_nn not null,
	loan_begin_date  date  constraint loan_loan_begin_date_nn not null,
	loan_expense_date  number  constraint loan_loan_expense_date_nn not null,
	loan_end_date  date  constraint loan_loan_end_date_nn not null,
	asset_code  varchar2(20)    constraint loan_asset_code_fk references asset(asset_code),
	capital_code varchar2(20)  constraint loan_capital_code_fk references capital_corp(capital_code),
	loan_term  number,
	loan_rate number  constraint loan_loan_rate_nn not null,
	loan_mean_code  varchar2(20),
	loan_mean  varchar2(50),
	loan_amount  number  constraint loan_loan_amount_nn not null,
	loan_principal  varchar2(4000),
	loan_interest  varchar2(4000)
);

select * from loan;

select * from loan where loan_code like '1lo001';

select count(*) from loan where loan_code like '1lo%';

select loan_code from loan where loan_code like '1lo%';

