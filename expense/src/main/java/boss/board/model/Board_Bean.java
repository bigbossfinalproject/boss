package boss.board.model;

import java.sql.Date;

public class Board_Bean {

	int bId;  //게시판 번호
	String root_Id; //작성 자 ID	
	String bTitle; //작성 제목
	String bContent; //작성 내용
	Date bDate; //작성 일자
	int bHit; //조회수
	int bGroup; //댓글 구분
	int bStep; //댓글 구분
	int bIndent; //댓글 구분
	int bGrade; //게시물 권한
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getRoot_Id() {
		return root_Id;
	}
	public void setRoot_Id(String root_Id) {
		this.root_Id = root_Id;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	public int getbGroup() {
		return bGroup;
	}
	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}
	public int getbStep() {
		return bStep;
	}
	public void setbStep(int bStep) {
		this.bStep = bStep;
	}
	public int getbIndent() {
		return bIndent;
	}
	public void setbIndent(int bIndent) {
		this.bIndent = bIndent;
	}
	public int getbGrade() {
		return bGrade;
	}
	public void setbGrade(int bGrade) {
		this.bGrade = bGrade;
	}
	
	
	
	
}
