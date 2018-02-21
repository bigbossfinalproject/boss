package boss.cashbook.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boss.cashbook.model.ItemAuthBean;

@Repository
public class ItemAuthDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	// 개인별 분류 목록을 가져오는 것임
	public ItemAuthBean userItem(int memberId) {
		ItemAuthBean bean = sql.selectOne("userItem", memberId);
		return bean;
	}
}
