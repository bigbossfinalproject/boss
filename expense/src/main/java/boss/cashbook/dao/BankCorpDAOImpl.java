package boss.cashbook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boss.cashbook.model.BankCorpBean;

@Repository
public class BankCorpDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	// 은행 목록을 가져오기
	public List<BankCorpBean> allBankList() {
		List<BankCorpBean> list = sql.selectList("allBankList");
		return list;
	}
		
	// 은행 목록을 가져오기
	public List<BankCorpBean> bankList() {
		List<BankCorpBean> list = sql.selectList("bankList");
		return list;
	}
	
	// 비은행 목록을 가져오기
	public List<BankCorpBean> unBankList() {
		List<BankCorpBean> list = sql.selectList("unBankList");
		return list;
	}

	
	// 은행 1개 코드 정보를 가져오기
	public BankCorpBean bankOne(String bank_code) {
		BankCorpBean bean = sql.selectOne("bank_one", bank_code);
		return bean;
	}
	
}
