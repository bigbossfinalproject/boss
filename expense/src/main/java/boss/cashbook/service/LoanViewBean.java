package boss.cashbook.service;

import java.sql.Date;

public class LoanViewBean {
	private String item_name;				// 분류이름
	private String loan_name;				// 대출이름
	private String loan_purpose;				// 대출용도
	private Date loan_begin_date;			// 대출시작일
	private int loan_term;						// 대출기간
	private Date loan_end_date;			// 대출만료일
	private String capital_name;				// 대출금융사
	private String loan_mean;				// 대출 상환방법
	private int loan_amount;					// 대출금액
	private double loan_rate;				// 대출이율
	private int loan_interest_date;			// 대출이자일
	private String asset_name;				// 자산 계좌이름
	
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getLoan_name() {
		return loan_name;
	}
	public void setLoan_name(String loan_name) {
		this.loan_name = loan_name;
	}
	public String getLoan_purpose() {
		return loan_purpose;
	}
	public void setLoan_purpose(String loan_purpose) {
		this.loan_purpose = loan_purpose;
	}
	public Date getLoan_begin_date() {
		return loan_begin_date;
	}
	public void setLoan_begin_date(Date loan_begin_date) {
		this.loan_begin_date = loan_begin_date;
	}
	public int getLoan_term() {
		return loan_term;
	}
	public void setLoan_term(int loan_term) {
		this.loan_term = loan_term;
	}
	public Date getLoan_end_date() {
		return loan_end_date;
	}
	public void setLoan_end_date(Date loan_end_date) {
		this.loan_end_date = loan_end_date;
	}
	public String getCapital_name() {
		return capital_name;
	}
	public void setCapital_name(String capital_name) {
		this.capital_name = capital_name;
	}
	public String getLoan_mean() {
		return loan_mean;
	}
	public void setLoan_mean(String loan_mean) {
		this.loan_mean = loan_mean;
	}
	public int getLoan_amount() {
		return loan_amount;
	}
	public void setLoan_amount(int loan_amount) {
		this.loan_amount = loan_amount;
	}
	public double getLoan_rate() {
		return loan_rate;
	}
	public void setLoan_rate(double loan_rate) {
		this.loan_rate = loan_rate;
	}
	public int getLoan_interest_date() {
		return loan_interest_date;
	}
	public void setLoan_interest_date(int loan_interest_date) {
		this.loan_interest_date = loan_interest_date;
	}
	public String getAsset_name() {
		return asset_name;
	}
	public void setAsset_name(String asset_name) {
		this.asset_name = asset_name;
	}
	
}
