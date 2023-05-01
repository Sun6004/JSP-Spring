package vo;

public class BoardVO {
	private int bo_no;
	private String bo_title;
	private String bo_content;
	private String bo_writer;
	private int bo_hit;
	
	public int getBo_no() {
		return bo_no;
	}
	public void setBo_no(int bo_no) {
		this.bo_no = bo_no;
	}
	public String getBo_title() {
		return bo_title;
	}
	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}
	public String getBo_content() {
		return bo_content;
	}
	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}
	public String getBo_writer() {
		return bo_writer;
	}
	public void setBo_writer(String bo_writer) {
		this.bo_writer = bo_writer;
	}
	public int getBo_hit() {
		return bo_hit;
	}
	public void setBo_hit(int bo_hit) {
		this.bo_hit = bo_hit;
	}
	@Override
	public String toString() {
		return "BoardVO [bo_no=" + bo_no + ", bo_title=" + bo_title + ", bo_content=" + bo_content + ", bo_writer="
				+ bo_writer + ", bo_hit=" + bo_hit + "]";
	}
}
