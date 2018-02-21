drop table card_corp purge;

create table card_corp(
	card_corp_code  varchar2(20)  constraint card_corp_card_corp_code_pk primary key,
	card_corp_name  varchar2(50),
	card_expense_date  varchar2(4000),
	card_use_term  varchar2(4000)
);

create table card_corp(
	card_corp_code  varchar2(20)  constraint card_corp_card_corp_code_pk primary key,
	card_corp_name  varchar2(50)  constraint card_corp_card_corp_name_nn  not null,
	card_expense_date  varchar2(4000)  constraint card_corp_card_expense_date_nn not null,
	card_use_term  varchar2(4000)  constraint card_corp_card_use_term_nn not null
);

select * from card_corp;

insert into card_corp values('card001', '우리카드', '1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27', 'sdm18~esm17|sdm19~esm18|sdm20~esm19|sdm21~esm20|sdm22~esm21|sdm23~esm22|sdm24~esm23|sdm25~esm24|sdm26~esm25|sdm27~esm26|sdm28~esm27|sdm29~esm28|sdm30~esm29|ssm1~esm말|ssm2~enm1|ssm3~enm2|ssm4~enm3|ssm5~enm4|ssm6~enm5|ssm7~enm6|ssm8~enm7|ssm9~enm8|ssm10~enm9|ssm11~enm10|ssm12~enm11|ssm13~enm12|ssm14~enm13');
insert into card_corp values('card002', '신한카드', '1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27', 'sdm18~esm17|sdm19~esm18|sdm20~esm19|sdm21~esm20|sdm22~esm21|sdm23~esm22|sdm24~esm23|sdm25~esm24|sdm26~esm25|sdm27~esm26|sdm28~esm27|sdm29~esm28|sdm30~esm29|ssm1~esm말|ssm2~enm1|ssm3~enm2|ssm4~enm3|ssm5~enm4|ssm6~enm5|ssm7~enm6|ssm8~enm7|ssm9~enm8|ssm10~enm9|ssm11~enm10|ssm12~enm11|ssm13~enm12|ssm14~enm13');
insert into card_corp values('card003', 'KB국민카드', '1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27', 'sdm18~esm17|sdm19~esm18|sdm20~esm19|sdm21~esm20|sdm22~esm21|sdm23~esm22|sdm24~esm23|sdm25~esm24|sdm26~esm25|sdm27~esm26|sdm28~esm27|sdm29~esm28|sdm30~esm29|ssm1~esm말|ssm2~enm1|ssm3~enm2|ssm4~enm3|ssm5~enm4|ssm6~enm5|ssm7~enm6|ssm8~enm7|ssm9~enm8|ssm10~enm9|ssm11~enm10|ssm12~enm11|ssm13~enm12|ssm14~enm13');
insert into card_corp values('card004', 'NH농협카드', '1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27', 'sdm18~esm17|sdm19~esm18|sdm20~esm19|sdm21~esm20|sdm22~esm21|sdm23~esm22|sdm24~esm23|sdm25~esm24|sdm26~esm25|sdm27~esm26|sdm28~esm27|sdm29~esm28|sdm30~esm29|ssm1~esm말|ssm2~enm1|ssm3~enm2|ssm4~enm3|ssm5~enm4|ssm6~enm5|ssm7~enm6|ssm8~enm7|ssm9~enm8|ssm10~enm9|ssm11~enm10|ssm12~enm11|ssm13~enm12|ssm14~enm13');
insert into card_corp values('card005', '비씨카드', '1|5|8|12|15|23|25|27', 'sdm19~esm18|sdm23~esm22|sdm26~esm25|sdm30~esm29|ssm3~enm2|ssm11~enm10|ssm13~enm12|ssm15~enm14');
insert into card_corp values('card006', 'SC제일은행카드', '1|5|8|12|15|23|25|27', 'sdm19~esm18|sdm23~esm22|sdm26~esm25|sdm30~esm29|ssm3~enm2|ssm11~enm10|ssm13~enm12|ssm15~enm14');
insert into card_corp values('card007', 'BNK경남은행카드', '1|5|8|12|15|23|25|27', 'sdm19~esm18|sdm23~esm22|sdm26~esm25|sdm30~esm29|ssm3~enm2|ssm11~enm10|ssm13~enm12|ssm15~enm14');
insert into card_corp values('card008', '현대카드', '1|5|8|12|15|23|25|27', 'sdm19~esm18|sdm23~esm22|sdm26~esm25|sdm30~esm29|ssm3~enm2|ssm11~enm10|ssm13~enm12|ssm15~enm14');
insert into card_corp values('card009', 'KEB하나카드', '1|5|8|10|12|13|15|18|20|21|23|25|27', 'sdm19~esm18|sdm23~esm22|sdm26~esm25|sdm28~esm27|sdm30~esm29|ssm1~esm말|ssm3~enm2|ssm6~enm5|ssm8~enm7|ssm9~enm8|ssm11~enm10|ssm13~enm12|ssm15~enm14');
insert into card_corp values('card010', '롯데카드', '1|5|7|10|14|15|17|20|21|22|23|24|25', 'sdm18~esm17|sdm22~esm21|sdm24~esm23|sdm27~esm26|ssm1~esm말|ssm2~enm1|ssm4~enm3|ssm7~enm6|ssm8~enm7|ssm9~enm8|ssm10~enm9|ssm11~enm10|ssm12~enm11');
insert into card_corp values('card011', '씨티카드', '1|3|5|7|9|10|12|14|15|20|23|25|26|27|28', 'sdm19~esm18|sdm21~esm20|sdm23~esm22|sdm25~esm24|sdm27~esm26|sdm28~esm27|ssm1~esm말|ssm2~enm1|ssm3~enm2|ssm8~enm7|ssm11~enm10|ssm13~enm12|ssm14~enm13|ssm15~enm14|ssm16~enm15');
insert into card_corp values('card012', 'IBK기업은행', '1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27', 'sdm17~esm16|sdm18~esm17|sdm19~esm18|sdm20~esm19|sdm21~esm20|sdm22~esm21|sdm23~esm22|sdm24~esm23|sdm25~esm24|sdm26~esm25|sdm27~esm26|sdm28~esm27|sdm29~esm28|sdm30~esm29|ssm1~esm말|ssm2~enm1|ssm3~enm2|ssm4~enm3|ssm5~enm4|ssm6~enm5|ssm7~enm6|ssm8~enm7|ssm9~enm8|ssm10~enm9|ssm11~enm10|ssm12~enm11|ssm13~enm12');
insert into card_corp values('card013', 'BNK부산은행', '1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27', 'sdm19~esm18|sdm20~esm19|sdm21~esm20|sdm22~esm21|sdm23~esm22|sdm24~esm23|sdm25~esm24|sdm26~esm25|sdm27~esm26|sdm28~esm27|sdm29~esm28|sdm30~esm29|ssm1~esm말|ssm2~enm1|ssm3~enm2|ssm4~enm3|ssm5~enm4|ssm6~enm5|ssm7~enm6|ssm8~enm7|ssm9~enm8|ssm10~enm9|ssm11~enm10|ssm12~enm11|ssm13~enm12|ssm14~enm13|ssm15~enm14');
insert into card_corp values('card014', 'DGB대구은행', '1|5|8|10|12|15|18|20|23|25', 'sdm19~esm18|sdm23~esm22|sdm26~esm25|sdm28~esm27|sdm30~esm29|ssm3~enm2|ssm6~enm5|ssm8~enm7|ssm11~enm10|ssm13~enm12');
