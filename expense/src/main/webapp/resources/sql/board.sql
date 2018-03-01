

--	int bId;  //게시판 번호
--	String root_Id; //작성 자 ID	
--	String bTitle; //작성 제목
--	String bContent; //작성 내용
--	Date bDate; //작성 일자
--	int bHit; //조회수
--	int bGroup; //댓글 구분
--	int bStep; //댓글 구분
--	int bIndent; //댓글 구분
--	int bGrade; //게시물 권한
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


create sequence communite_seq;

--조회
select * from communite;
select * from tab;

SELECT * FROM COMMUNITE	where bGrade = 1;


--삭제
delete from communite;
drop table communite purge;
drop sequence communite_seq;

