package boss.com.vs.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boss.com.vs.model.BudgetBean;
import boss.com.vs.model.Budget_excelBean;


@Repository
public class BudgetDaoImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertBudget(BudgetBean bean) {
		this.sqlSession.insert("budget_insert", bean);
	}
	public int insert_check(BudgetBean bean){
		int insert_check=this.sqlSession.selectOne("insert_check",bean);
		return insert_check;
	}
	public int modify_check(BudgetBean bean){
		int insert_check=this.sqlSession.selectOne("modify_check",bean);
		return insert_check;
	}
	
	public List<BudgetBean> budget_excel_list(Budget_excelBean excel_bean){
		
		List<BudgetBean> bean=this.sqlSession.selectList("budget_excel_list",excel_bean);
		
		return bean;
	}
	
	public void deleteBudget(int root_idn){
		this.sqlSession.delete("budget_delete",root_idn);
	}
	public void modifyBudget(BudgetBean bean){
		this.sqlSession.update("budget_modify",bean);
	}
	
	public List<String> item_list(int root_idn){
		List<String> bean=this.sqlSession.selectList("item_list",root_idn);
		return bean;
	}
	
	
	public List<BudgetBean> budget_list(BudgetBean bean2){
		List<BudgetBean> bean=this.sqlSession.selectList("budget_list",bean2);
		
		return bean;
	}
	public List<BudgetBean> budget_item_list(BudgetBean bean2){
		List<BudgetBean> bean=this.sqlSession.selectList("budget_item_list",bean2);
		return bean;
	}
	
	public BudgetBean budget_list_total(){
		BudgetBean bean=this.sqlSession.selectOne("budget_list_total");
		return bean;
	}
	public int budgetItemCount(Map<String, String> item_code) {
		int result = this.sqlSession.selectOne("budgetItemCount", item_code);
		return result;
	}
	
	public List<BudgetBean> budget_total_list(Budget_excelBean date_bean){
		List<BudgetBean> bean= this.sqlSession.selectList("budget_total_list",date_bean);
		return bean;
	}
	public List<BudgetBean> budget_expense_list(Budget_excelBean date_bean){
		List<BudgetBean> bean= this.sqlSession.selectList("budget_expense_list",date_bean);
		return bean;
	}
	
}