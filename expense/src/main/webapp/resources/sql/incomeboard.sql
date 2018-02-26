drop table income purge;

CREATE TABLE income
(
    root_idn              NUMBER          NOT NULL,  -- 회원 고유번호
    income_id             VARCHAR2(20)    NOT NULL, -- 거래 번호
    income_date           DATE            NOT NULL,  -- 거래 날짜
    income_code           VARCHAR2(20)    NOT NULL, -- 소득구분코드 
    income_amount         NUMBER          NOT NULL,  -- 금액
    trade_code            VARCHAR2(20)    NOT NULL,  -- 거래 코드
    bank_code             VARCHAR2(20)    NULL,  -- 금융사 코드
    income_description    VARCHAR2(20)    NULL   -- 비고
)

SELECT  table_name, table_type, comments FROM USER_TAB_COMMENTS WHERE comments IS NOT NULL;
-- 주석 단 테이블 확인.
SELECT table_name, column_name, comments FROM USER_COL_COMMENTS WHERE comments IS NOT NULL;
-- 주석 단 컬럼명 확인.

select root_idn, income_id, to_char(income_date,'yyyy.mm.dd') income_date, income_code, income_amount, trade_code, bank_code, income_description
from income
-- 날짜를 변환해서 불러오는방식


----------------테스트케이스
insert into INCOME values (1, 1, sysdate, 1, 10000, 1, 1, 1)
insert into INCOME values (1, 2, sysdate, 'i1', 10000, 1, 1, 1);
select * from INCOME

update income set income_code = 'i1' where income_id = 1

update income set
		Income_Date = #{income_Date}, Income_code =
		#{income_Code}, Trade_Code
		= #{trade_Code}, Bank_Code=#{bank_Code}, Income_Amount =
		#{income_Amount}, Income_Description = #{income_Description} where root_idn = ${root_Idn}


select i.root_idn, i.income_id, i.income_date, ic.item_name income_code, i.income_amount,i.trade_code, i.bank_code, i.income_description
		from income i, income_classification ic where i.income_code = ic.income_code and i.root_idn = 1;

select emp.ename, dept.dname, dept.loc from emp, dept where emp.deptno = dept.deptno and ename = 'SCOTT';



-----------------------------------------------------제약 설정(아직 반영안함)
ALTER TABLE income
    ADD CONSTRAINT FK_income_root_idn_object_root FOREIGN KEY (root_idn)
        REFERENCES object_root (root_idn)
/

ALTER TABLE income
    ADD CONSTRAINT FK_income_bank_code_bank_corp_ FOREIGN KEY (bank_code)
        REFERENCES bank_corp (bank_code)
/

ALTER TABLE income
    ADD CONSTRAINT FK_income_income_code_incone_c FOREIGN KEY (income_code)
        REFERENCES incone_classification (income_code)
/


------------------------------------------------------------------
alter table income rename column income_discription to income_description
