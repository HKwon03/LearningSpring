package com.springbook.biz.common;

public class AfterAdvice {
	public void afterLog() {
		System.out.println("[사후처리] 비즈니스 로직 수행후 작동");
	}
}
