package vo;

public class MemberVO {
	private int mem_no;
	private String mem_id;
	private String mem_pw;
	private String mem_regdate;
	
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_regdate() {
		return mem_regdate;
	}
	public void setMem_regdate(String mem_regdate) {
		this.mem_regdate = mem_regdate;
	}
	@Override
	public String toString() {
		return "MemberVO [mem_no=" + mem_no + ", mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_regdate="
				+ mem_regdate + "]";
	}

}
