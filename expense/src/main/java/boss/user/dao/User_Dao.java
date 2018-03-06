package boss.user.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boss.board.model.Board_Bean;
import boss.user.model.User_Bean;

@Repository
public class User_Dao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	

	//로그인 체크
	public User_Bean loginCheck(String root_Id, String root_Pwd) {
	
		
		//쿼리 실행 인자값 전달 2개 불가하기 때문에 map 으로 
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("root_Id", root_Id);
		map.put("root_Pwd", root_Pwd);
		
		User_Bean dto = sqlSession.selectOne("loginCheck",map);
		
		return dto;
	}
	
	//dao.userId_Check(root_Id);
	public int userId_Check(String root_Id){
		int check = sqlSession.selectOne("userId_Check", root_Id);
		
		return check;
	}
	
	//일반회원가입
	public void userJoin(String root_Id, String root_Pwd,String root_Name,String root_Email, String root_Grade) {
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("root_Id", root_Id);
		map.put("root_Pwd", root_Pwd);
		map.put("root_Name", root_Name);	
		map.put("root_Email", root_Email);
		map.put("root_Grade", root_Grade);		
		
		sqlSession.insert("userJoin", map);
	}	
	//빅데이터회원가입
	public void bigDataJoin(String root_Address,String root_Birth,String root_Gender,String root_Edu,String root_Marry,String root_Job) {
	
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("root_Address", root_Address);
		map.put("root_Birth", root_Birth);
		map.put("root_Gender", root_Gender);
		map.put("root_Edu", root_Edu);
		map.put("root_Marry", root_Marry);
		map.put("root_Job", root_Job);
		
		sqlSession.insert("bigDataJoin", map);
		
	}
	
	
	
	//일반 유저회원 탈퇴
	public void userDelete(String root_Idn) {
		sqlSession.delete("userDelete", root_Idn);
	}
	//빅데이터 유저회원 탈퇴
		public void bigDataDelete(String root_Idn) {
			sqlSession.delete("bigDataDelete", root_Idn);
		}
	
	
	//회원정보 수정을 위해 현재 회원 정보 받아오기
	public User_Bean userModify_view(String root_Idn) { //일반 사용자 data
		
		User_Bean dto = sqlSession.selectOne("userModify_view", root_Idn);
		return dto;
	}
	public User_Bean userModify_view2(String root_Idn) { //빅데이터에있는 data 
		
		User_Bean dto = sqlSession.selectOne("userModify_view2", root_Idn);
		return dto;
	}
	
	//회원정보 수정
	public void userModify(String root_Idn, String root_Pwd, String root_Email , String root_Address, String root_Job) {
		
		Map<String, String> map = new HashMap<String, String>();
		Map<String, String> map2 = new HashMap<String, String>();
		map.put("root_Idn", root_Idn);
		map.put("root_Pwd", root_Pwd);
		map.put("root_Email", root_Email);
		
		map2.put("root_Idn", root_Idn);
		map2.put("root_Address", root_Address);
		map2.put("root_Job", root_Job);
		
		sqlSession.update("userModify1", map);
		sqlSession.update("userModify2", map2);
		
		
	}
	
	public int userIdnValue(String root_Id) {
		return sqlSession.selectOne("userIdnValue", root_Id);
	}
	
	
	
}
