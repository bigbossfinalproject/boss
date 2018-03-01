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
	
	
	
	//게시판 목록 확인
	public List<Board_Bean> boardList(String root_Grade) {
		
		List<Board_Bean> list = sqlSession.selectList("boardList", root_Grade);
		
		
		return list;
	}
	
	//글 작성
	public void boardWrite(String root_Id, String bTitle, String bContent) {
		
		if(root_Id.equals("Admin")) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("root_Id", root_Id);
			map.put("bTitle", bTitle);
			map.put("bContent", bContent);
			
			sqlSession.insert("noticeWrite", map);
			return;
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("root_Id", root_Id);
		map.put("bTitle", bTitle);
		map.put("bContent", bContent);
		
		sqlSession.insert("boardWrite", map);
		
	}
	
	//글보기
	public Board_Bean boardContent(String bId) {
		
		boardCnt(bId);
		Board_Bean dto = sqlSession.selectOne("boardContent", bId);
		
		return dto;
	}
	
	//글 카운트 증가
	public void boardCnt(String bId) {
		
		sqlSession.update("boardCnt", bId);
	}
	
	//글삭제
	public void boardDelete(String bId) {
		
		sqlSession.delete("boardDelete", bId);
		
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
