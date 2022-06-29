package com.mybatis.join.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class EmployeeVOs {
	
	private int empno;
	private String ename;
	private int sal;
	private int deptno;
	
}
