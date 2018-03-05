package boss.cashbook.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boss.cashbook.model.AssetBean;
import boss.cashbook.model.ExpenseBean;
import boss.cashbook.model.header_infoBean;
import boss.cashbook.model.header_infoBean;
import boss.cashbook.model.header_infoBean;
import boss.cashbook.model.header_infoBean;

@Repository
public class AssetDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	// 지출 조건에 맞는 1개의 자산 정보를 가져오기(인수값 : expense)
	public AssetBean assetOne(ExpenseBean expense) {
		AssetBean bean = sql.selectOne("assetOne", expense);
		return bean;
	}
	
	// 지출 조건에 맞는 1개의 자산 정보를 가져오기(인수값 : 문자열)
	public AssetBean codeAssetOne(String asset_code) {
		AssetBean bean = sql.selectOne("codeAssetOne", asset_code);
		return bean;
	}
	
	// 지출 조건에 맞는 카운트 값 가져오기
	public int codeConOne(String asset_code) {
		int result = sql.selectOne("codeConOne", asset_code);
		return result;
	}
	
	// 지출 조건에 맞는 1개의 자산 정보를 가져오기
	public AssetBean assetCodeOne(String asset_code) {
		AssetBean bean = sql.selectOne("assetCodeOne", asset_code);
		return bean;
	}
	
	// 지출 유형별 자산 목록 가져오기
	public List<AssetBean> tradeAssetList(String trade_code) {
		List<AssetBean> list = sql.selectList("tradeAssetList", trade_code);
		return list;
	}
	
	// 전체 자산 목록을 가져오기
	public List<AssetBean> assetList() {
		List<AssetBean> list = sql.selectList("assetList");
		return list;
	}
	
	public List<AssetBean> codeConList(String asset_code) {
		List<AssetBean> list = sql.selectList("codeConList", asset_code);
		return list;
	}
	
	// 사용자 개인별 자산 목록을 가져오기
	public List<AssetBean> memAssetList(int idn){
		List<AssetBean> list = sql.selectList("memAssetList", idn);
		return list;
	}
	
	// 사용자 개인별 해당하는 자산의 개수를 가져오기
	public int userTradeCount(Map<String, String> info) {
		int count = sql.selectOne("userTradeCount", info);
		return count;
	}
	
	// 사용자 개인의 추가 자산 정보를 입력하기
	public void userAssetInsert(AssetBean asset) {
		sql.insert("userAssetInsert", asset);
	}
	
	// 사용자 개인의 자산 정보를 수정하기
	public void userAssetUpdate(AssetBean asset){
		sql.update("userAssetUpdate", asset);
	}
	
	// 사용자 개인의 자산 정보를 삭제하기
	public void userAssetDelete(AssetBean asset) {
		sql.delete("userAssetDelete", asset);
	}
	
	//헤더info 가져오기
		public header_infoBean header_info(int root_idn){
			header_infoBean bean=sql.selectOne("header_info",root_idn);
			return bean;
		}
	
}
