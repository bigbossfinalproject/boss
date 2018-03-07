package boss.income.dao;

import java.util.List;
import java.util.Map;

import boss.income.bean.IncomeBean;
import boss.income.bean.IncomeOptionBean;

public interface IncomeDao { // 소득 관련 dao 인터페이스

	public List<IncomeBean> getAllIncomeList(int root_idn); // 해당 회원의 소득리스트 불러오기

	public void addIncomeList(IncomeBean bean); // 해당 정보를 DB에 저장

	public void delIncomeList(int income_Id); // 해당 고유번호의 소득정보를 DB에서 삭제

	public void updateImcomeList(IncomeBean bean); // 해당 정보를 DB에서 수정

	public String getIncomeName(String income_Name); // 소득 코드를 통해 소득 이름을
														// 불러옴(주요소득/기타소득)

	public int incomeCodeCount(Map<String, String> income_code);

	public List<IncomeOptionBean> getIncomeOptions(int root_Idn); // selectbox에
																	// 들어갈 값들을
																	// 불러옴

	public String getAssetCode(String assetName, int id); // 자산 이름으로 자산 코드를 불러옴

	public String getTradeCode(String tradeName); // 거래 이름으로 거래 코드를 불러옴

	public int getIncomeAmount_month(int root_Idn);

}
