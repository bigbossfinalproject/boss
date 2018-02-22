package boss.cashbook.service;

public class ItemViewBean {
	private int seq;					// 순번
	private String high_item;		// 대분류 항목명
	private String mid_item;		// 중분류 항목명
	private String low_item;		// 세부 항목명
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getHigh_item() {
		return high_item;
	}
	public void setHigh_item(String high_item) {
		this.high_item = high_item;
	}
	public String getMid_item() {
		return mid_item;
	}
	public void setMid_item(String mid_item) {
		this.mid_item = mid_item;
	}
	public String getLow_item() {
		return low_item;
	}
	public void setLow_item(String low_item) {
		this.low_item = low_item;
	}
	
}
