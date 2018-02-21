package boss.com.vs.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boss.com.vs.model.BudgetBean;
import boss.com.vs.model.User;


@Repository
public class BudgetDaoImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;


	public void insertBudget(BudgetBean bean) {
		this.sqlSession.insert("budget_insert", bean);
	}
	public void insertUser(User bean){
		this.sqlSession.insert("user_insert",bean);
	}
	public void deleteBudget(int root_idn){
		this.sqlSession.delete("budget_delete",root_idn);
	}
	public void modifyBudget(BudgetBean bean){
		this.sqlSession.update("budget_modify",bean);
	}
	
	public List<BudgetBean> budget_list(){
		List<BudgetBean> bean=this.sqlSession.selectList("budget_list");
		return bean;
	}
	
	public BudgetBean budget_list_total(){
		BudgetBean bean=this.sqlSession.selectOne("budget_list_total");
		return bean;
	}
	
	public List<User> user_list(){
		List<User> bean= this.sqlSession.selectList("user_list");
		return bean;
	}
	
	public List<User> user_search(String userName){
		List<User> bean= this.sqlSession.selectList("user_search",userName);
		return bean;
	}
	
	
	
}