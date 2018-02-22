package boss.cashbook.model;

import java.sql.Date;

public class AssetBean {
	private String asset_code;
	private String trade_code;
	private int root_idn;
	private String root_id;
	private Date asset_date;
	private String asset_name;
	private String asset_purpose;
	private String bank_code;
	private int basic_amount;
	private int now_amount;
	
	public String getAsset_code() {
		return asset_code;
	}
	public void setAsset_code(String asset_code) {
		this.asset_code = asset_code;
	}
	public String getTrade_code() {
		return trade_code;
	}
	public void setTrade_code(String trade_code) {
		this.trade_code = trade_code;
	}
	public int getRoot_idn() {
		return root_idn;
	}
	public void setRoot_idn(int root_idn) {
		this.root_idn = root_idn;
	}
	public String getRoot_id() {
		return root_id;
	}
	public void setRoot_id(String root_id) {
		this.root_id = root_id;
	}
	public Date getAsset_date() {
		return asset_date;
	}
	public void setAsset_date(Date asset_date) {
		this.asset_date = asset_date;
	}
	public String getAsset_name() {
		return asset_name;
	}
	public void setAsset_name(String asset_name) {
		this.asset_name = asset_name;
	}
	public String getAsset_purpose() {
		return asset_purpose;
	}
	public void setAsset_purpose(String asset_purpose) {
		this.asset_purpose = asset_purpose;
	}
	public String getBank_code() {
		return bank_code;
	}
	public void setBank_code(String bank_code) {
		this.bank_code = bank_code;
	}
	public int getBasic_amount() {
		return basic_amount;
	}
	public void setBasic_amount(int basic_amount) {
		this.basic_amount = basic_amount;
	}
	public int getNow_amount() {
		return now_amount;
	}
	public void setNow_amount(int now_amount) {
		this.now_amount = now_amount;
	}
	
}
