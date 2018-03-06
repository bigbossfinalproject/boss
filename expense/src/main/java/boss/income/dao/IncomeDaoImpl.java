package boss.income.dao;

import java.util.HashMap;
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
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cost", bean.getIncome_Amount());
		map.put("assetCode", bean.getAsset_Code());
		int j = this.sqlSession.update("updateAsset", map);
		if (j == 1) {
			System.out.println("예산 증가 성공!");
		} else {
			System.out.println("예산 증가 실패 ㅠ");
		}

		int i = this.sqlSession.insert("addIncomeList", bean);
		if (i == 1) {
			System.out.println("저장 성공!");
		} else {
			System.out.println("저장 실패 ㅠ");
		}
	}

	@Override
	public void delIncomeList(int income_Id) {
		int amount = this.sqlSession.selectOne("getIncomeAmount", income_Id);
		String assetCode = this.sqlSession.selectOne("getAssetCode2", income_Id);
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("cost", amount * (-1));
		map.put("assetCode", assetCode);

		int j = this.sqlSession.update("updateAsset", map);
		if (j == 1) {
			System.out.println("예산 감소 성공!");
		} else {
			System.out.println("예산 감소 실패 ㅠ");
		}

		int i = this.sqlSession.delete("delIncomeList", income_Id);
		if (i == 1) {
			System.out.println("삭제 성공!!");
		} else {
			System.out.println("삭제 실패 ㅠ");
		}
	}

	@Override
	public void updateImcomeList(IncomeBean bean) {
		int ad_Amount = bean.getIncome_Amount();
		int ex_Amount = this.sqlSession.selectOne("getIncomeAmount", bean.getIncome_Id());
		int cur_Amount = ad_Amount - ex_Amount;
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("cost", cur_Amount);
		map.put("assetCode", bean.getAsset_Code());

		int j = this.sqlSession.update("updateAsset", map);
		if (j == 1) {
			System.out.println("예산 수정 성공!");
		} else {
			System.out.println("예산 수정 실패 ㅠ");
		}

		int i = this.sqlSession.update("modifyIncomeList", bean);
		if (i == 1) {
			System.out.println("수정 성공!!");
		} else {
			System.out.println("수정 실패 ㅠ");
		}
	}

	@Override
	public String getIncomeName(String income_Name) {
		return this.sqlSession.selectOne("setIncomeId", income_Name);

	}

	@Override
	public int incomeCodeCount(Map<String, String> income_code) {
		return this.sqlSession.selectOne("incomeCodeCount", income_code);
	}

	@Override
	public List<IncomeOptionBean> getIncomeOptions(int root_Idn) {
		return this.sqlSession.selectList("getIncomeOptions", root_Idn);
	}

	@Override
	public String getAssetCode(String assetName) {
		return this.sqlSession.selectOne("getAssetCode", assetName);

	}

	@Override
	public String getTradeCode(String tradeName) {
		return this.sqlSession.selectOne("getTradeCode", tradeName);
	}

	@Override
	public int getIncomeAmount_month(int root_Idn) {
		// TODO Auto-generated method stub
		return 0;
	}

}
