package boss.cashbook.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boss.cashbook.model.CardBean;
import boss.cashbook.model.ExpenseBean;

@Repository
public class CardDAOImpl {

	@Autowired
	private SqlSessionTemplate sql;
	
	// 카드 정보 등록하기
	public void cardInsert(CardBean cardInfo) {
		int result = sql.insert("cardInsert", cardInfo);
		System.out.println(result+"개의 card정보가 저장되었습니다.");
	}
	
	// 지출 정보에 해당하는 1개의 카드 정보 가져오기
	public CardBean cardOne(ExpenseBean expense) {
		CardBean card = sql.selectOne("cardOne", expense);
		return card;
	}
	
	// 사용자 개인별 등록 카드 목록 가져오기
	public List<CardBean> cardList(int root_idn) {
		List<CardBean> list = sql.selectList("cardList", root_idn);
		return list;
	}
	
	// 사용자 개인별 카드 등록 개수 카운트 값 가져오기
	public List<CardBean> cardTypeList(Map<String, String> cardInfo) {
		List<CardBean> list = sql.selectList("cardTypeList", cardInfo);
		return list;
	}
	
	// 사용자 개인별 카드 등록 개수 카운트 값 가져오기
	public int cardCount(Map<String, String> cardInfo) {
		int count = sql.selectOne("cardCount", cardInfo);
		return count;
	}
}
