package com.mybatis.join.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class DepartmentVOs {
	
	private int deptno;
	private String dname;
	private String loc;
	
}
