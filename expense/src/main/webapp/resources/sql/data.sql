drop table test1 purge;

create table test1(
    root_idn         NUMBER           NOT NULL,  --'회원고유번호' h11_id
    root_gender     VARCHAR2(20)    NOT NULL, --'성별' h1101_4
    root_birth      VARCHAR2(20)    NOT NULL, --'생년월일' h1101_5
  	root_edu  		NUMBER            NOT NULL, -- '교육수준' h1101_6
	root_marry    NUMBER   			NOT NULL, --'혼인상태' h1101_11
    root_job        NUMBER  			NOT NULL, --'직업' h1103_7
    food             NUMBER          NULL, --'식료품비' h1107_3aq1,2 5aq1
    house            NUMBER          NULL, --'주거비' h1107_3aq3,4 
    infra            NUMBER          NULL, --'광열수도비' h1107_3aq5, 6aq1
    fixtures         NUMBER          NULL, --'가구가사용품비' h1107_3aq6, 5aq2
    clothes          NUMBER          NULL, --'의류비' h1107_3aq7
    medical          NUMBER          NULL, -- '의료비' h1107_3aq8
    education        NUMBER          NULL, --'교육비' h1107_3aq9,10
    culture          NUMBER          NULL, --'교양오락비' h1107_3aq11
    traffic          NUMBER          NULL, --'교통비' h1107_5aq3
    communication    NUMBER          NULL, --'통신비' h1107_5aq4
    etc_expense      NUMBER          NULL, --'기타소비지출' h1107_3aq13
    tax              NUMBER          NULL, --'세금' h1107_4
    welfare          NUMBER          NULL, --'사회보험금' h1107_5
    insure           NUMBER          NULL, --'보험료' h1107_6aq12,13
    expense_total    NUMBER          NULL, --'지출 합계(월별)' h1107_9
    income_amount         NUMBER          NOT NULL, --'소득 금액(일별)' h1108_114,122,164,170(연이니까 365로 나눠준다)
	loan_cash         NUMBER            NOT NULL, --'총대출 잔액' h1109_aq1,2,3,4,5,6,7,8(연)
    CONSTRAINT OBJECT_ROOT_PK PRIMARY KEY (root_idn)
);


select h11_id + h1101_4 from test;
select * from test;


update test set a=a+b, b=0
alter table test rename column h11_id to root_idn;

update test set h1107_3aq1=h1107_3aq1 + h1107_3aq2 + h1107_5aq1; --food
update test set h1107_3aq3=h1107_3aq3 + h1107_3aq4; --house
update test set h1107_3aq5=h1107_3aq5 + h1107_6aq1; --infra
update test set h1107_3aq6=h1107_3aq6 + h1107_5aq2; --fixtures
update test set h1107_3aq9=h1107_3aq9 + h1107_3aq10; --education
update test set h1107_6aq12=h1107_6aq12 + h1107_6aq13; --insure
update test set h1108_114=h1108_114 + h1108_122 + h1108_164 + h1108_170; --income_amount
update test set h1109_aq1=h1109_aq1 + h1109_aq2 + h1109_aq3 + h1109_aq4 + h1109_aq5 + h1109_aq6 + h1109_aq7 + h1109_aq8; --income_amount

alter table test rename column h1101_4 to root_gender;
alter table test rename column h1101_5 to root_birth;
alter table test rename column h1101_6 to root_edu;
alter table test rename column h1101_11 to marry;
alter table test rename column h1103_7 to root_job;
alter table test rename column h1107_3aq1 to food;
alter table test rename column h1107_3aq3 to house;
alter table test rename column h1107_3aq5 to infra;
alter table test rename column h1107_3aq6 to fixtures;
alter table test rename column h1107_3aq7 to clothes;
alter table test rename column h1107_3aq8 to medical;
alter table test rename column h1107_3aq9 to education;
alter table test rename column h1107_3aq11 to culture;
alter table test rename column h1107_5aq3 to traffic;
alter table test rename column h1107_5aq4 to communication;
alter table test rename column h1107_3aq13 to etc_expense;
alter table test rename column h1107_4 to tax;
alter table test rename column h1107_5 to welfare;
alter table test rename column h1107_6aq12 to insure;
alter table test rename column h1107_9 to expense_total;
alter table test rename column h1108_114 to income_amount;
alter table test rename column h1109_aq1 to loan_cash;


ALTER TABLE test MODIFY (COLUMN_T3 NUMBER(5));



