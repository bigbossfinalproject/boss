package boss.income.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boss.income.bean.IncomeBean;
import boss.income.bean.IncomeOptionBean;

@Repository
public class IncomeDaoImpl implements IncomeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<IncomeBean> getAllIncomeList(int root_idn) {

		List<IncomeBean> list = this.sqlSession.selectList("getIncome_Board", root_idn);

		return list;
	}

	@Override
	public void addIncomeList(IncomeBean bean) {
		int i = this.sqlSession.insert("addIncomeList", bean);
		if (i == 1) {
			System.out.println("저장 성공!");
		} else {
			System.out.println("저장 실패 ㅠ");
		}
	}

	@Override
	public void delIncomeList(int income_Id) {
		int i = this.sqlSession.delete("delIncomeList", income_Id);
		if (i == 1) {
			System.out.println("삭제 성공!!");
		} else {
			System.out.println("삭제 실패 ㅠ");
		}
	}

	@Override
	public void updateImcomeList(IncomeBean bean) {
		int i = this.sqlSession.update("modifyIncomeList", bean);
		if (i == 1) {
			System.out.println("수정 성공!!");
		} else {
			System.out.println("수정 실패 ㅠ");
		}
	}

	@Override
	public String getIncomeName(String income_Name) {
		return this.sqlSession.selectOne("setIncomeId",income_Name);
		
	}
	
	@Override
	public int incomeCodeCount(Map<String, String> income_code) {
		return this.sqlSession.selectOne("incomeCodeCount", income_code);
	}

	@Override
	public List<IncomeOptionBean> getIncomeOptions(int root_Idn) {

		return this.sqlSession.selectList("getIncomeOptions", root_Idn);
	}

	
}
