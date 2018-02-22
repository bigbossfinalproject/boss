package boss.cashbook.service;

public class CardViewBean {
	private String card_name;				// 카드 이름
	private String card_type_name;		// 카드 타입명(체크카드, 신용카드)
	private int card_expense_date;			// 결재일
	private String card_use_term;			// 사용 기간
	private String bank_name;				// 은행 이름 
	private String account_name;			// 결재 계좌
	
	public String getCard_name() {
		return card_name;
	}
	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}
	public String getCard_type_name() {
		return card_type_name;
	}
	public void setCard_type_name(String card_type_name) {
		this.card_type_name = card_type_name;
	}
	public int getCard_expense_date() {
		return card_expense_date;
	}
	public void setCard_expense_date(int card_expense_date) {
		this.card_expense_date = card_expense_date;
	}
	public String getCard_use_term() {
		return card_use_term;
	}
	public void setCard_use_term(String card_use_term) {
		this.card_use_term = card_use_term;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getAccount_name() {
		return account_name;
	}
	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}
	
}