package boss.cashbook.service;

import java.sql.Date;

public class AssetViewBean {
	private int asset_seq;
	private String trade_name;
	private Date asset_date;
	private String asset_name;
	private String asset_purpose;
	private String bank_name;
	private int basic_amount;
	private int now_amount;
	private int root_idn;
	private String root_id;
	private String asset_code;
	
	public int getAsset_seq() {
		return asset_seq;
	}
	public void setAsset_seq(int asset_seq) {
		this.asset_seq = asset_seq;
	}
	public String getTrade_name() {
		return trade_name;
	}
	public void setTrade_name(String trade_name) {
		this.trade_name = trade_name;
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
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
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
	public String getAsset_code() {
		return asset_code;
	}
	public void setAsset_code(String asset_code) {
		this.asset_code = asset_code;
	}
	
}
