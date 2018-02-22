package boss.income.dao;

import java.util.List;

import boss.income.bean.IncomeBean;

public interface IncomeDao { //소득 관련 dao 인터페이스

	public List<IncomeBean> getAllIncomeList(int root_idn); //해당 회원의 소득리스트 불러오기
	
	
	
}
