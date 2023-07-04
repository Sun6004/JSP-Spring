package com.sun.bangbang.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString //디버깅 용으로 유용
public class TestVO {
	private String name;
	private List<String> age;
}
