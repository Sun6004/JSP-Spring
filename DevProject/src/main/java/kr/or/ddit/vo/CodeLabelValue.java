package kr.or.ddit.vo;

import lombok.Data;

@Data
public class CodeLabelValue {
	private String label;
	private String value;
	
	public CodeLabelValue() {}
	public CodeLabelValue(String value, String label) {
		this.value = value;
		this.label = label;
	}
}
