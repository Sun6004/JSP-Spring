package vo;

public class MemberVO{
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_gend;
	private String filename;
	
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
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_sex() {
		return mem_gend;
	}
	public void setMem_sex(String mem_sex) {
		this.mem_gend = mem_sex;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}

}
