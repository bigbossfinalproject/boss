package boss.cashbook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boss.cashbook.model.CapitalCorpBean;

@Repository
public class CapitalCorpDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	// 모든 대출 금융사의 목록 가져오기
	public List<CapitalCorpBean> capitalList() {
		List<CapitalCorpBean> list = sql.selectList("capitalList");
		return list;
	}
	
	// 대출 금융사 코드를 비교한 정보 가져오기
	public CapitalCorpBean capitalOne(String capital_code) {
		CapitalCorpBean bean = sql.selectOne("capitalOne", capital_code);
		return bean;
	}
	
	// 1,2,3,4 금융권에 맞는 목록 가져오기
	public List<CapitalCorpBean> capitalLevelList(int capital_level) {
		List<CapitalCorpBean> list = sql.selectList("capitalLevelList", capital_level);
		return list;
	}
	
}
