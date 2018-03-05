package boss.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boss.board.model.Board_Bean;

@Repository
public class Board_Dao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//목록 확인(notice)
		public List<Board_Bean> noticeList() {
				List<Board_Bean> list = sqlSession.selectList("notice");
				return list;
		}
	
	//목록 확인(communite)
	public List<Board_Bean> boardList() {
		List<Board_Bean> list = sqlSession.selectList("boardList");
		return list;
	}
	//공지 내용 확인(notice)- 비로그인
	public Board_Bean noticeBoard_view(String bId){
		noticeCnt(bId);
		Board_Bean dto = sqlSession.selectOne("noticeView", bId);
		
		return dto;
	}
	
	//글내용(notice)
	public Board_Bean noticeContent(String bId){
		noticeCnt(bId);
		Board_Bean dto = sqlSession.selectOne("noticeContent", bId);		
		return dto;
	}
	
	//글내용(communite)
	public Board_Bean boardContent(String bId) {
		boardCnt(bId);
		Board_Bean dto = sqlSession.selectOne("boardContent", bId);		
		return dto;
	}
	
	//게시판 글 작성(notice)
	public void noticeWrite(String root_Id, String bTitle, String bContent){
		Map<String, String> map = new HashMap<String, String>();
		map.put("root_Id", root_Id);
		map.put("bTitle", bTitle);
		map.put("bContent", bContent);
		sqlSession.insert("noticeWrite", map);		
	}
	
	//게시판 글 작성(communite)
	public void boardWrite(String root_Id, String bTitle, String bContent) {		
		Map<String, String> map = new HashMap<String, String>();
		map.put("root_Id", root_Id);
		map.put("bTitle", bTitle);
		map.put("bContent", bContent);		
		sqlSession.insert("boardWrite", map);		
	}


	//카운트증가(notice)
	public void noticeCnt(String bId) {			
		sqlSession.update("noticeCnt", bId);
	}
	//카운트증가(communite)
	public void boardCnt(String bId) {		
		sqlSession.update("boardCnt", bId);
	}
	
	
	//글삭제(notice)
	public void noticeDelete(String bId) {		
		sqlSession.delete("noticeDelete", bId);		
	}
	//글삭제(communite)
	public void boardDelete(String bId) {		
		sqlSession.delete("boardDelete", bId);		
	}
	//글 수정(notice)
		public void noticeModify(String bId, String bTitle, String bContent) {
			
			Map<String, String>map = new HashMap<String, String>();
			map.put("bId", bId);
			map.put("bTitle", bTitle);
			map.put("bContent", bContent);
			
			sqlSession.update("noticeModify", map);
		}
	
	//글 수정
	public void boardModify(String bId, String bTitle, String bContent) {
		
		Map<String, String>map = new HashMap<String, String>();
		map.put("bId", bId);
		map.put("bTitle", bTitle);
		map.put("bContent", bContent);
		
		sqlSession.update("boardModify", map);
	}
	
	//답글 : 현재 게시물의 정보 가져오기 
	public Board_Bean boardReply_view(String bId) {
		
		Board_Bean dto = sqlSession.selectOne("board_reply_view", bId);	
		return dto;
	}
	
	//답글
	public void boardReply(String bId, String bGroup, String bStep, String bIndent, String root_Id, String bTitle, String bContent) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("bId", bId);
		map.put("bGroup", bGroup);
		map.put("bStep", bStep);
		map.put("bIndent", bIndent);
		map.put("root_Id", root_Id);
		map.put("bTitle", bTitle);
		map.put("bContent", bContent);
		
		sqlSession.insert("boardReply", map);
	}
}
