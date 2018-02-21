package boss.cashbook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boss.cashbook.model.TradeBean;

@Repository
public class TradeDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public TradeBean tradeOne(String tradeCode) {
		TradeBean trade = sql.selectOne("tradeOne", tradeCode);
		return trade;
	}
	
	public List<TradeBean> tradeList() {
		List<TradeBean> list = sql.selectList("tradeList");
		return list;
	}
}
