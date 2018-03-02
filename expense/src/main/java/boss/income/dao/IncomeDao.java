package boss.income.dao;

import java.util.List;
import java.util.Map;

import boss.income.bean.IncomeBean;
import boss.income.bean.IncomeOptionBean;

public interface IncomeDao { // 소득 관련 dao 인터페이스

	public List<IncomeBean> getAllIncomeList(int root_idn); // 해당 회원의 소득리스트 불러오기

	public void addIncomeList(IncomeBean bean);

	public void delIncomeList(int income_Id);
	
	public void updateImcomeList(IncomeBean bean);
	
	public String getIncomeName(String income_Name);
	
	public int incomeCodeCount(Map<String, String> income_code);
	
	public List<IncomeOptionBean> getIncomeOptions(int root_Idn);
}
