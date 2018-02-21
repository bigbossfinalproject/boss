package boss.cashbook.model;

public class CapitalCorpBean {
	private String capital_code;			// 대츨금융사 코드
	private String capital_name;			// 대출금융사 이름
	private int capital_level;				// 대출금융사 금융권
	
	public String getCapital_code() {
		return capital_code;
	}
	public void setCapital_code(String capital_code) {
		this.capital_code = capital_code;
	}
	public String getCapital_name() {
		return capital_name;
	}
	public void setCapital_name(String capital_name) {
		this.capital_name = capital_name;
	}
	public int getCapital_level() {
		return capital_level;
	}
	public void setCapital_level(int capital_level) {
		this.capital_level = capital_level;
	}
	
}
