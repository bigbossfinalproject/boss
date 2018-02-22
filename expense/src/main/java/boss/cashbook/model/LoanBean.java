package boss.cashbook.model;

import java.sql.Date;

public class LoanBean {
	private String loan_code;						// 부채코드
	private String item_code;						// 품목분류코드
	private int root_idn;							// 회원고유번호
	private String root_id;							// 회원아이디
	private Date loan_date;						// 입력일자
	private String loan_name;					// 부채명
	private String loan_purpose;					// 용도
	private Date loan_begin_date;				// 대출시작일
	private int loan_expense_date;				// 원금/이자 납입일
	private Date loan_end_date;				// 대출만료일
	private String asset_code;					// 자산 코드
	private String capital_code;					// 대출 금융사 코드
	private int loan_term;							// 대출기간
	private double loan_rate;					// 대출이율
	private String loan_mean_code;			// 상환방법코드
	private String loan_mean;					// 상환방법
	private int loan_amount;						// 총대출금
	private String loan_principal;				// 상환원금
	private String loan_interest;					// 상환이자
	
	public String getLoan_code() {
		return loan_code;
	}
	public void setLoan_code(String loan_code) {
		this.loan_code = loan_code;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
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
	public Date getLoan_date() {
		return loan_date;
	}
	public void setLoan_date(Date loan_date) {
		this.loan_date = loan_date;
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
	public int getLoan_expense_date() {
		return loan_expense_date;
	}
	public void setLoan_expense_date(int loan_expense_date) {
		this.loan_expense_date = loan_expense_date;
	}
	public Date getLoan_end_date() {
		return loan_end_date;
	}
	public void setLoan_end_date(Date loan_end_date) {
		this.loan_end_date = loan_end_date;
	}
	public String getAsset_code() {
		return asset_code;
	}
	public void setAsset_code(String asset_code) {
		this.asset_code = asset_code;
	}
	public String getCapital_code() {
		return capital_code;
	}
	public void setCapital_code(String capital_code) {
		this.capital_code = capital_code;
	}
	public int getLoan_term() {
		return loan_term;
	}
	public void setLoan_term(int loan_term) {
		this.loan_term = loan_term;
	}
	public double getLoan_rate() {
		return loan_rate;
	}
	public void setLoan_rate(double loan_rate) {
		this.loan_rate = loan_rate;
	}
	public String getLoan_mean_code() {
		return loan_mean_code;
	}
	public void setLoan_mean_code(String loan_mean_code) {
		this.loan_mean_code = loan_mean_code;
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
	public String getLoan_principal() {
		return loan_principal;
	}
	public void setLoan_principal(String loan_principal) {
		this.loan_principal = loan_principal;
	}
	public String getLoan_interest() {
		return loan_interest;
	}
	public void setLoan_interest(String loan_interest) {
		this.loan_interest = loan_interest;
	}
	
}
