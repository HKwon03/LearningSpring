package com.springbook.biz.view.controller;

public class ViewResolver {		
	//Controller���� Ȯ���� ������ �����ִ� �� �������� Ȯ���ڸ� �ϼ��ؼ� ó��(.jsp)
	
	public String prefix;	//���Ϲ޾ƿ��� �̸� �տ� ó���� ����
	public String suffix;	//���Ϲ޾ƿ��� �̸� �ڿ� ó���� ����
	
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}
	
	public String getView(String viewName) {	//�� �������̸��� �ϼ��ؼ� ������.
		return prefix + viewName + suffix;
	}
	
	

}