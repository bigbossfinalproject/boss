/**
 * 
 * 화면에 뿌려줄 용도로 사용하는 bean (거래 코드, 자산 이름)
 * 
 * */

package boss.income.bean;

public class IncomeOptionBean {
	private String trade_Code;
	private String asset_Name;

	public String getTrade_Code() {
		return trade_Code;
	}

	public void setTrade_Code(String trade_Code) {
		this.trade_Code = trade_Code;
	}

	public String getAsset_Name() {
		return asset_Name;
	}

	public void setAsset_Name(String asset_Name) {
		this.asset_Name = asset_Name;
	}

}
