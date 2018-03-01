drop table income_classification purge;

-- 소득 분류 테이블

CREATE TABLE income_classification
(
    income_code    VARCHAR2(20)    NOT NULL, 
    item_name      VARCHAR2(20)    NOT NULL, 
    CONSTRAINT INCONE_CLASSIFICATION_PK PRIMARY KEY (income_code)
);
/

-- 필수 입력 요소
insert into INCOME_CLASSIFICATION values('i1', '주요소득');
insert into INCOME_CLASSIFICATION values('i2', '기타소득');



select * from INCOME_CLASSIFICATION;





)