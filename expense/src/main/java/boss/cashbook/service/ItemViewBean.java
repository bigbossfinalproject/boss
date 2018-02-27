package boss.cashbook.service;

public class ItemViewBean {
	private int seq;					// 순번
	private String high_code;		// 대분류 항목코드
	private String high_item;		// 대분류 항목명
	private String mid_code;		// 중분류 항목코드
	private String mid_item;		// 중분류 항목명
	private String low_code;		// 세부 항목코드
	private String low_item;		// 세부 항목명
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getHigh_code() {
		return high_code;
	}
	public void setHigh_code(String high_code) {
		this.high_code = high_code;
	}
	public String getHigh_item() {
		return high_item;
	}
	public void setHigh_item(String high_item) {
		this.high_item = high_item;
	}
	public String getMid_code() {
		return mid_code;
	}
	public void setMid_code(String mid_code) {
		this.mid_code = mid_code;
	}
	public String getMid_item() {
		return mid_item;
	}
	public void setMid_item(String mid_item) {
		this.mid_item = mid_item;
	}
	public String getLow_code() {
		return low_code;
	}
	public void setLow_code(String low_code) {
		this.low_code = low_code;
	}
	public String getLow_item() {
		return low_item;
	}
	public void setLow_item(String low_item) {
		this.low_item = low_item;
	}
	
}
