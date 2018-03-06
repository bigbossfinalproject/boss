package boss.cashbook.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boss.cashbook.model.AssetBean;
import boss.cashbook.model.ExpenseBean;

@Repository
public class ExpenseDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	// 지출 내역을 입력하기
	public void expenseInsert(ExpenseBean expense) {
		this.sql.insert("expense_insert", expense);
	}
	
	// 사용자의 지출 내역을 가져오기
	public List<ExpenseBean> expenseList(int idn) {
		List<ExpenseBean> list = this.sql.selectList("expense_list", idn);
		return list;
	}
	
	// 사용자의 지출 자산 목록별 내역을 가져오기
	public List<ExpenseBean> expenseTermList(Map<String, String> assetInfo) {
		List<ExpenseBean> list = sql.selectList("expenseTermList", assetInfo);
		return list;
	}
	
	// 사용자의 지출 자산 목록별 내역을 가져오기
	public int expenseTermAmount(Map<String, Object> assetInfo) {
		System.out.println("root_idn : "+assetInfo.get("idn"));
		System.out.println("StartDay : "+assetInfo.get("startDate"));
		System.out.println("trade_code : "+assetInfo.get("trade"));
		System.out.println("asset_code : "+assetInfo.get("asset"));
		int amount = sql.selectOne("expenseTermAmount", assetInfo);
		return amount;
	}
	
	/*// 사용자의 지출 자산 목록별 내역을 가져오기
	public int expenseTermAmount(AssetBean assetInfo) {
		//System.out.println("root_idn : "+assetInfo.get("idn"));
		//System.out.println("StartDay : "+assetInfo.get("startDate"));
		//System.out.println("trade_code : "+assetInfo.get("trade"));
		int amount = sql.selectOne("expenseTermList", assetInfo);
		return amount;
	}*/
	
	// 사용자의 지출 자산 개수를 가져오기
	public int expenseCount(int idn) {
		int cnt = sql.selectOne("expenseCount", idn);
		return cnt;
	}
	
	// 사용자 개인의 지출 정보를 수정하기
	public void expenseUpdate(ExpenseBean expense) {
		this.sql.update("expense_update", expense);
	}
	
	// 사용자 개인의 지출 정보를 삭제하기
	public void expenseDelete(String expense_id) {
		this.sql.delete("expense_delete", expense_id);
	}
	
	// 사용중인 세부항목 개수를 확인하기
	public int itemUsedCount(Map<String, String> item_code) {
		int result = this.sql.selectOne("itemUsedCount", item_code);
		return result;
	}
	
}
