drop table communite purge;

--   int bId;  //게시판 번호
--   String root_Id; //작성 자 ID   
--   String bTitle; //작성 제목
--   String bContent; //작성 내용
--   Date bDate; //작성 일자
--   int bHit; //조회수
--   int bGroup; //댓글 구분
--   int bStep; //댓글 구분
--   int bIndent; //댓글 구분
--   int bGrade; //게시물 권한
insert into communite(bId, root_Id, bTitle, bContent, bHit, bGroup, bIndent, bGrade)
values(communite_seq.nextval, 'com', 'com', 'com', 0, 0, 0, 0)

insert into notice(bId, root_Id, bTitle, bContent, bHit, bGroup, bIndent, bGrade)
values(notice_seq.nextval, 'not', 'not', 'not', 0, 0, 0, 1)

--생성
create table communite(

bId number(4) primary key, 
root_Id varchar2(20),
bTitle varchar2(100), 
bContent varchar2(300), 
bDate DATE DEFAULT SYSDATE, 
bHit Number(4) DEFAULT 0, 
bGroup number(4), 
bStep number(4), 
bIndent number(4),
bGrade number(4)
);

create table notice(
bId number(4) primary key, 
root_Id varchar2(20),
bTitle varchar2(100), 
bContent varchar2(300), 
bDate DATE DEFAULT SYSDATE, 
bHit Number(4) DEFAULT 0, 
bGroup number(4), 
bStep number(4), 
bIndent number(4),
bGrade number(4)
);

create sequence communite_seq;
create sequence notice_seq;

--조회
select * from communite;
select * from tab;

--삭제
drop table communite purge;
drop sequence communite_seq;
drop table notice purge;
drop sequence notice_seq;




--삭제
delete from communite;
delete from notice;
drop table communite purge;
drop sequence communite_seq;
