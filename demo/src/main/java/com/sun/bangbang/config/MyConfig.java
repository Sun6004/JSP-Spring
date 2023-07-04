package com.sun.bangbang.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
//@EnableWebMvc
public class MyConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		System.out.println("요기가 실행되었는지 check?");
		registry.addResourceHandler("/upload/**") // 웹 접근 경로
				.addResourceLocations("file:///d:/upload/"); // 서버내 실제 경로
	}

}