package boss.cashbook.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExpenseMonthSumDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	
}
