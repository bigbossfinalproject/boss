package boss.cashbook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boss.cashbook.model.CardCorpBean;

@Repository
public class CardCorpDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	// 카드회사 전체 정보를 가져오기
	public List<CardCorpBean> cardCorpList() {
		List<CardCorpBean> list = sql.selectList("card_corp_all_list");
		return list;
	}
	
	// 카드회사 1개의 정보만 가져오기
	public CardCorpBean cardCorpOne(String card_corp_code) {
		CardCorpBean bean = sql.selectOne("card_corp_one", card_corp_code);
		return bean;
	}
	
}
