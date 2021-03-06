package boss.cashbook.service;

import java.sql.Date;

public class ExpenseViewBean {
	private int expense_seq;
	private String expense_id;
	private int root_idn;
	private String root_id;
	private Date expense_date;
	private String item_code;
	private String parent_code;
	private String item_name;
	private String trade_code;
	private String trade_name;
	private String asset_code;
	private String asset_name;
	private String expense_discription;
	private int expense_amount;
	private int expense_sum;
	
	public int getExpense_seq() {
		return expense_seq;
	}
	public void setExpense_seq(int expense_seq) {
		this.expense_seq = expense_seq;
	}
	public String getExpense_id() {
		return expense_id;
	}
	public void setExpense_id(String expense_id) {
		this.expense_id = expense_id;
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
	public Date getExpense_date() {
		return expense_date;
	}
	public void setExpense_date(Date expense_date) {
		this.expense_date = expense_date;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getParent_code() {
		return parent_code;
	}
	public void setParent_code(String parent_code) {
		this.parent_code = parent_code;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getTrade_code() {
		return trade_code;
	}
	public void setTrade_code(String trade_code) {
		this.trade_code = trade_code;
	}
	public String getTrade_name() {
		return trade_name;
	}
	public void setTrade_name(String trade_name) {
		this.trade_name = trade_name;
	}
	public String getAsset_code() {
		return asset_code;
	}
	public void setAsset_code(String asset_code) {
		this.asset_code = asset_code;
	}
	public String getAsset_name() {
		return asset_name;
	}
	public void setAsset_name(String asset_name) {
		this.asset_name = asset_name;
	}
	public String getExpense_discription() {
		return expense_discription;
	}
	public void setExpense_discription(String expense_discription) {
		this.expense_discription = expense_discription;
	}
	public int getExpense_amount() {
		return expense_amount;
	}
	public void setExpense_amount(int expense_amount) {
		this.expense_amount = expense_amount;
	}
	public int getExpense_sum() {
		return expense_sum;
	}
	public void setExpense_sum(int expense_sum) {
		this.expense_sum = expense_sum;
	}
	
}
