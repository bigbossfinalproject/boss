package boss.com.vs.model;

import java.sql.Timestamp;

public class BudgetBean {
	int budget_code;
	int root_idn;                   
	int budget_amount;                    
	int budget_amount_spent;              
	Timestamp budget_date;  
	String item_code;
	
	
	public int getBudget_code() {
		return budget_code;
	}
	public void setBudget_code(int budget_code) {
		this.budget_code = budget_code;
	}
	public int getRoot_idn() {
		return root_idn;
	}
	public void setRoot_idn(int root_idn) {
		this.root_idn = root_idn;
	}

	public int getBudget_amount() {
		return budget_amount;
	}
	public void setBudget_amount(int budget_amount) {
		this.budget_amount = budget_amount;
	}
	public int getBudget_amount_spent() {
		return budget_amount_spent;
	}
	public void setBudget_amount_spent(int budget_amount_spent) {
		this.budget_amount_spent = budget_amount_spent;
	}
	public Timestamp getBudget_date() {
		return budget_date;
	}
	public void setBudget_date(Timestamp budget_date) {
		this.budget_date = budget_date;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	
}
