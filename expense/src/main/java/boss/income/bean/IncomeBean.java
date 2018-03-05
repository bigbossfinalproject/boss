package boss.income.bean;

import java.sql.Date;

public class IncomeBean { // 소득테이블

	private int root_Idn;// 회원고유번호
	private String income_Id;// 거래번호
	private Date income_Date; // 일자
	private String income_Code;// 소득구분코드
	private int income_Amount;// 금액
	private String trade_Code;// 거래코드
	private String asset_Code;// 자산 코드
	private String income_Description; // 비고

	public int getRoot_Idn() {
		return root_Idn;
	}

	public void setRoot_Idn(int root_Idn) {
		this.root_Idn = root_Idn;
	}

	public String getIncome_Id() {
		return income_Id;
	}

	public void setIncome_Id(String income_Id) {
		this.income_Id = income_Id;
	}

	public Date getIncome_Date() {
		return income_Date;
	}

	public void setIncome_Date(Date income_Date) {
		this.income_Date = income_Date;
	}

	public String getIncome_Code() {
		return income_Code;
	}

	public void setIncome_Code(String income_Code) {
		this.income_Code = income_Code;
	}

	public int getIncome_Amount() {
		return income_Amount;
	}

	public void setIncome_Amount(int income_Amount) {
		this.income_Amount = income_Amount;
	}

	public String getTrade_Code() {
		return trade_Code;
	}

	public void setTrade_Code(String trade_Code) {
		this.trade_Code = trade_Code;
	}

	public String getAsset_Code() {
		return asset_Code;
	}

	public void setAsset_Code(String bank_Code) {
		this.asset_Code = bank_Code;
	}

	public String getIncome_Description() {
		return income_Description;
	}

	public void setIncome_Description(String income_Description) {
		this.income_Description = income_Description;
	}

}
