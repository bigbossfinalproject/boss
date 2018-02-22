package boss.cashbook.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boss.cashbook.model.ObjectRootBean;

@Repository
public class MemberDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	
	// 중복 아이디 체크 및 아이디 존재 여부 체크
	public ObjectRootBean idSearch(String id){
		ObjectRootBean user = null;
		user = (ObjectRootBean)this.sqlTemplate.selectOne("id_search", id);
		/*System.out.println("고유번호 : "+user.getRoot_idn());
		System.out.println("아이디 : "+user.getRoot_id());
		System.out.println("이름 : "+user.getRoot_name());
		System.out.println("이메일 : "+user.getRoot_email());
		System.out.println("생일 : "+user.getRoot_birth());
		System.out.println("성별 : "+user.getRoot_gender());
		System.out.println("직업 : "+user.getRoot_job());
		System.out.println("주소 : "+user.getRoot_address());
		System.out.println("등급 : "+user.getRoot_grade());*/
		return user;
	}
}
