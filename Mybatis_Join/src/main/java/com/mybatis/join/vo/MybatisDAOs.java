package com.mybatis.join.vo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MybatisDAOs {
	
	@Autowired
	private SqlSessionTemplate mybatiss;
	
	public List<JoinVOs> selectListJoins(JoinVOs vos) {
		System.out.println("selectListJoins() �޼ҵ� ȣ��");
		return mybatiss.selectList("joins.selectListJoins", vos);
	}
}
