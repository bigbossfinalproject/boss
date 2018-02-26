package boss.cashbook.model;

import java.sql.Date;

public class ExpenseBean {
	private String expense_id;
	private int root_idn;
	private String root_id;
	private Date expense_date;
	private String item_code;
	private String parent_code;
	private String trade_code;
	private String asset_code;
	private String expense_discription;
	private int expense_amount;
	
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
	public String getTrade_code() {
		return trade_code;
	}
	public void setTrade_code(String trade_code) {
		this.trade_code = trade_code;
	}
	public String getAsset_code() {
		return asset_code;
	}
	public void setAsset_code(String asset_code) {
		this.asset_code = asset_code;
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
	
}
