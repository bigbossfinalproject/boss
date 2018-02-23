package boss.income.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boss.income.bean.IncomeBean;

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
			System.out.println("저장 성공");
		} else {
			System.out.println("저장 실패 ㅠ");
		}
	}

}
