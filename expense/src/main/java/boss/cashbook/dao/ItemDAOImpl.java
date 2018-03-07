package boss.cashbook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boss.cashbook.model.ItemBean;

@Repository
public class ItemDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	// 분류 항목을 저장하기
	public void addItem(ItemBean item) {
		int result = sql.insert("addItem", item);
		//System.out.println(result+"개의 분류항목이 저장되었습니다.");
	}
	
	// 분류 항목 수정하기
	public void updateItem(ItemBean item) {
		int result = sql.update("updateItem", item);
	}
	
	// 분류 항목 삭제하기
	public void deleteItem(String item_code) {
		int result = sql.delete("deleteItem", item_code);
	}
	
	
	// 기본 저장할 분류코드 목록을 가져오기
	public List<ItemBean> basicItem(String item_code) {
		List<ItemBean> list = sql.selectList("basicItem", item_code);
		return list;
	}
	
	// 해당 항목에 대한 분류 항목 목록을 가져오기
	public List<ItemBean> itemList(String item_code) {
		List<ItemBean> list = sql.selectList("itemList", item_code);
		return list;
	}
	
	// 해당 항목에 대한 분류 항목 목록을 가져오기
	public List<ItemBean> itemDetailList(String item_code) {
		List<ItemBean> list = sql.selectList("itemDetailList", item_code);
		return list;
	}
	
	// 세부 항목에 대한 분류 항목 목록을 가져오기
	public List<ItemBean> detailItemList(String item_code) {
		List<ItemBean> list = sql.selectList("detailItemList", item_code);
		return list;
	}
	
	// 세부 항목에 대한 분류 항목 목록을 가져오기
	public ItemBean itemOne(String item_code) {
		ItemBean bean = sql.selectOne("itemOne", item_code);
		return bean;
	}
	
	// 해당 분류 항목에서 레벨 3에 해당하는 개수 가져오기
	public int itemCount(String item_code) {
		int result = sql.selectOne("itemCount", item_code);
		return result;
	}
	
	// 해당 분류 항목에 대한 순번 값을 가져오기
	public int maxSeq(String item_code) {
		int result = sql.selectOne("maxSeq", item_code);
		return result;
	}
	
	// 사용자의 모든 분류항목 삭제하기
	public void idnDeleteItem(int root_idn) {
		sql.delete("idnDeleteItem", root_idn);
	}
	
	// 분류항목 기초데이터 정보 가져오기
	public List<ItemBean> basicItemList() {
		return sql.selectList("basicItemList");
	}
}
