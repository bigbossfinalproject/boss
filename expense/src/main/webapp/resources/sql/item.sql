drop table item purge;

create table item(
	item_code  varchar2(20)  constraint item_item_code_pk primary key,
	parent_code  varchar2(20),
	item_level  number  constraint item_item_level_nn not null,
	item_name  varchar2(50)  constraint item_item_name_nn not null,
	item_seq  number  constraint item_item_seq not null

);

create table item(
	item_code  varchar2(20)  constraint item_item_code_pk primary key,
	parent_code  varchar2(20),
	item_level  number,
	item_name  varchar2(50),
	item_seq  number
);

select * from budget where to_char(budget_date,'YYYY-MM')='2017-02' and root_idn=2

select * from item; where item_code like '14%';




update item set parent_code = '' where item_code = '1a000000';
update item set parent_code = '' where item_code = '1l000000';
update item set parent_code = '' where item_code = '1i000000';
update item set parent_code = '' where item_code = '1e000000';

select * from item where item_code like '1%';

delete from item where parent_code like '1a001%';

select * from item where parent_code like '1a001%';

select * from item where parent_code = '1a001000';
select max(item_seq) from item where parent_code like '1a001%';
select count(item_seq) from item where parent_code like '1a001%';


select * from item where item_level = 3 and item_code like '1%';

select * from item where item_name ='경조비';

delete from item where item_code like '1%';

insert into item values('1a000000', '', 1, '자산', 1);
insert into item values('1a001000', '1a000000', 2, '입출금', 1);
insert into item values('1a002000', '1a000000', 2, '적금', 2);
insert into item values('1a003000', '1a000000', 2, '예금', 3);
insert into item values('1a004000', '1a000000', 2, '금융투자', 4);
insert into item values('1l000000', '', 1, '부채', 2);
insert into item values('1l001000', '1l000000', 2, '대출금', 1);
insert into item values('1l002000', '1l000000', 2, '신용카드', 2);
insert into item values('1i000000', '', 1, '소득', 3);
insert into item values('1i001000', '1i000000', 2, '주요소득', 1);
insert into item values('1i002000', '1i000000', 2, '기타소득', 2);
insert into item values('1e000000', '', 1, '지출', 4);
insert into item values('1e001000', '1e000000', 2, '세금', 1);
insert into item values('1e002000', '1e000000', 2, '사회보험금', 2);
insert into item values('1e003000', '1e000000', 2, '식료품비', 3);
insert into item values('1e004000', '1e000000', 2, '주거비', 4);
insert into item values('1e005000', '1e000000', 2, '광열수도비', 5);
insert into item values('1e006000', '1e000000', 2, '가구가사용품비', 6);
insert into item values('1e007000', '1e000000', 2, '피복신발비', 7);
insert into item values('1e008000', '1e000000', 2, '보건의료비', 8);
insert into item values('1e009000', '1e000000', 2, '교육비', 9);
insert into item values('1e010000', '1e000000', 2, '교양오락비', 10);
insert into item values('1e011000', '1e000000', 2, '교통비', 11);
insert into item values('1e012000', '1e000000', 2, '통신비', 12);
insert into item values('1e013000', '1e000000', 2, '보험료', 13);
insert into item values('1e014000', '1e000000', 2, '기타소비지출', 14);
insert into item values('1e001001', '1e001000', 3, '소득세', 1);
insert into item values('1e001002', '1e001000', 3, '재산세', 2);
insert into item values('1e001003', '1e001000', 3, '자동차세', 3);
insert into item values('1e001004', '1e001000', 3, '종합소득세', 4);
insert into item values('1e001005', '1e001000', 3, '부동산세', 5);
insert into item values('1e002001', '1e002000', 3, '국민연금보험료', 1);
insert into item values('1e002002', '1e002000', 3, '건강보험료', 2);
insert into item values('1e002003', '1e002000', 3, '고용보험료', 3);
insert into item values('1e003001', '1e003000', 3, '가정식비', 1);
insert into item values('1e003002', '1e003000', 3, '외식비', 2);
insert into item values('1e003003', '1e003000', 3, '주류/담배비', 3);
insert into item values('1e004001', '1e004000', 3, '월세', 1);
insert into item values('1e004002', '1e004000', 3, '주거관리비', 2);
insert into item values('1e009001', '1e009000', 3, '공교육비', 1);
insert into item values('1e009002', '1e009000', 3, '사교육비', 2);
insert into item values('1e014001', '1e014000', 3, '경조비', 1);
insert into item values('1e014002', '1e014000', 3, '종교관련', 2);
insert into item values('1e014003', '1e014000', 3, '용돈', 3);

--insert into item values('a000000', '', 1, '자산', 1);
--insert into item values('a001000', 'a000000', 2, '입출금', 1);
--insert into item values('a002000', 'a000000', 2, '적금', 2);
--insert into item values('a003000', 'a000000', 2, '예금', 3);
--insert into item values('a004000', 'a000000', 2, '금융투자', 4);
--insert into item values('l000000', '', 1, '부채', 2);
--insert into item values('l001000', 'l000000', 2, '대출금', 1);
--insert into item values('l002000', 'l000000', 2, '신용카드', 2);
--insert into item values('i000000', '', 1, '소득', 3);
--insert into item values('i001000', 'i001000', 2, '주요소득', 1);
--insert into item values('i002000', 'i001000', 2, '기타소득', 2);
--insert into item values('e000000', '', 1, '지출', 4);
--insert into item values('e001000', 'e000000', 2, '세금', 1);
--insert into item values('e002000', 'e000000', 2, '사회보험금', 2);
--insert into item values('e003000', 'e000000', 2, '식료품비', 3);
--insert into item values('e004000', 'e000000', 2, '주거비', 4);
--insert into item values('e005000', 'e000000', 2, '광열수도비', 5);
--insert into item values('e006000', 'e000000', 2, '가구가사용품비', 6);
--insert into item values('e007000', 'e000000', 2, '피복신발비', 7);
--insert into item values('e008000', 'e000000', 2, '보건의료비', 8);
--insert into item values('e009000', 'e000000', 2, '교육비', 9);
--insert into item values('e010000', 'e000000', 2, '교양오락비', 10);
--insert into item values('e011000', 'e000000', 2, '교통비', 11);
--insert into item values('e012000', 'e000000', 2, '통신비', 12);
--insert into item values('e013000', 'e000000', 2, '보험료', 13);
--insert into item values('e014000', 'e000000', 2, '기타소비지출', 14);
--insert into item values('e001001', 'e001000', 3, '소득세', 1);
--insert into item values('e001002', 'e001000', 3, '재산세', 2);
--insert into item values('e001003', 'e001000', 3, '자동차세', 3);
--insert into item values('e001004', 'e001000', 3, '종합소득세', 4);
--insert into item values('e001005', 'e001000', 3, '부동산세', 5);
--insert into item values('e002001', 'e002000', 3, '국민연금보험료', 1);
--insert into item values('e002002', 'e002000', 3, '건강보험료', 2);
--insert into item values('e002003', 'e002000', 3, '고용보험료', 3);
--insert into item values('e003001', 'e003000', 3, '가정식비', 1);
--insert into item values('e003002', 'e003000', 3, '외식비', 2);
--insert into item values('e003003', 'e003000', 3, '주류/담배비', 3);
--insert into item values('e004001', 'e004000', 3, '월세', 1);
--insert into item values('e004002', 'e004000', 3, '주거관리비', 2);
--insert into item values('e009001', 'e009000', 3, '공교육비', 1);
--insert into item values('e009002', 'e009000', 3, '사교육비', 2);
--insert into item values('e014001', 'e014000', 3, '경조비', 1);
--insert into item values('e014002', 'e014000', 3, '종교관련', 2);
--insert into item values('e014003', 'e014000', 3, '용돈', 3);
