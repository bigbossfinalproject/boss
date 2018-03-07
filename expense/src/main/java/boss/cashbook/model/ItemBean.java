package boss.cashbook.model;

public class ItemBean {
	private String item_code;			// 아이템 코드
	private String parent_code;		// 부모 코드			
	private int item_level;				// 아이템 레벨
	private String item_name;		// 아이템 이름
	private int item_seq;				// 아이템 순번
	private int root_idn;				// 회원 고유번호
	private String item_class;		// 아이템 분류
	
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
	public int getItem_level() {
		return item_level;
	}
	public void setItem_level(int item_level) {
		this.item_level = item_level;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_seq() {
		return item_seq;
	}
	public void setItem_seq(int item_seq) {
		this.item_seq = item_seq;
	}
	public int getRoot_idn() {
		return root_idn;
	}
	public void setRoot_idn(int root_idn) {
		this.root_idn = root_idn;
	}
	public String getItem_class() {
		return item_class;
	}
	public void setItem_class(String item_class) {
		this.item_class = item_class;
	}
	
}
