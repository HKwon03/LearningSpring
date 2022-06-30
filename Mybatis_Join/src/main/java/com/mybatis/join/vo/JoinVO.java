package com.mybatis.join.vo;


public class JoinVO {
	
	private EmployeeVO empJ; 
	private DepartmentVO deptJ;
	
	public JoinVO () {}
	
	public JoinVO(EmployeeVO empJ, DepartmentVO deptJ) {
		super();
		this.empJ = empJ;
		this.deptJ = deptJ;
	}

	public EmployeeVO getEmpJ() {
		return empJ;
	}

	public void setEmpJ(EmployeeVO empJ) {
		this.empJ = empJ;
	}

	public DepartmentVO getDeptJ() {
		return deptJ;
	}

	public void setDeptJ(DepartmentVO deptJ) {
		this.deptJ = deptJ;
	}



	@Override
	public String toString() {
		return "JoinVO [empJ=" + empJ + ", deptJ=" + deptJ + "]";
	}
	
	
	
}
