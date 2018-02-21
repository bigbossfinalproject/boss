package boss.cashbook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boss.cashbook.model.LoanBean;

@Repository
public class LoanDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	// 사용자 개인별 대출 개수를 가져오기
	public int userLoanCount(String loanCode) {
		int cnt = sql.selectOne("userLoanCount", loanCode);
		return cnt;
	}
	
	// 사용자별 대출 코드 값 가져오기
	public List<LoanBean> userLoanCodeList (String loanCode) {
		List<LoanBean> list = sql.selectList("userLoanCodeList", loanCode);
		return list;
	}
	
	// 사용자 개인별 대출 목록 가져오기
	public List<LoanBean> userLoanList(String loanCode) {
		List<LoanBean> list = sql.selectList("userLoanList", loanCode);
		return list;
	}
	
	public void loanAdd(LoanBean loan) {
		int result = sql.insert("loanAdd", loan);
		System.out.println(result+"개의 대출 정보가 DB에 저장되었습니다.");
	}
	
}
