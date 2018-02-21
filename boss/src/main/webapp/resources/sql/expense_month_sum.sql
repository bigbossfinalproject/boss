drop table expense_month_sum purge;

create table expense_month_sum(
	month_id  varchar2(20)  constraint expense_month_sum_month_id_pk primary key,
	root_idn  number,
	month  varchar2(20),
	tax  number  default 0,
	welfare  number  default 0,
	food  number  default 0,
	house  number  default 0,
	infra  number  default 0,
	fixtures  number  default 0,
	clothes  number  default 0,
	medical  number  default 0,
	education  number  default 0,
	culture  number  default 0,
	traffic  number  default 0,
	communication  number  default 0,
	insure  number  default 0,
	etc_expense  number  default 0,
	expense_total  number  default 0
);

create table expense_month_sum(
	month_id  varchar2(20)  constraint expense_month_sum_month_id_pk primary key,
	root_idn  number  constraint expense_month_sum_root_idn_fk references object_root(root_idn),
	month  varchar2(20)  constraint expense_month_sum_month_nn not null,
	tax  number  default 0,
	welfare  number  default 0,
	food  number  default 0,
	house  number  default 0,
	infra  number  default 0,
	fixtures  number  default 0,
	clothes  number  default 0,
	medical  number  default 0,
	education  number  default 0,
	culture  number  default 0,
	traffic  number  default 0,
	communication  number  default 0,
	insure  number  default 0,
	etc_expense  number  default 0,
	expense_total  number  default 0
);
