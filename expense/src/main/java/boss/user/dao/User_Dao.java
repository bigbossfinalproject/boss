package boss.user.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	//일반회원가입
	public void userJoin(String root_Id, String root_Pwd,String root_Name,String root_Email) {
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("root_Id", root_Id);
		map.put("root_Pwd", root_Pwd);
		map.put("root_Name", root_Name);	
		map.put("root_Email", root_Email);		
		
		sqlSession.insert("userJoin", map);
	}
	
	
	//회원 탈퇴
	public void userDelete(String root_Id) {
		
		sqlSession.delete("userDelete", root_Id);
		
		
	}
	
	//회원정보 수정을 위해 현재 회원 정보 받아오기
	public User_Bean userModify_view(String root_Id) {
		
		User_Bean dto = sqlSession.selectOne("userModify_view", root_Id);
		
		return dto;
	}
	
	//회원정보 수정
	public void userModify(String root_Id, String root_Pwd, String root_Email , String root_Job, String root_Address) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("root_Id", root_Id);
		map.put("root_Pwd", root_Pwd);
		map.put("root_Email", root_Email);		
		map.put("root_Job", root_Job);
		map.put("root_Address", root_Address);
		
		
		sqlSession.update("userModify", map);
		
	}
	
	
	
}
