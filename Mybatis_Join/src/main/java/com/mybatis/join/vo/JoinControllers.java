package com.mybatis.join.vo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinControllers {
	
	@Autowired
	private MybatisDAOs mybatisDAOs;
	
	@RequestMapping("/joinLists.do")
	public String selectLists(JoinVOs vos, Model models) {
		System.out.println("��Ʈ�ѷ� ȣ�� ���� : /joinLists.do");
		List<JoinVOs> joinLists = mybatisDAOs.selectListJoins(vos);
		System.out.println("���̹�Ƽ���� ���� List��ü ���� ����");
		
		JoinVOs joinVOs = joinLists.get(0);
		JoinVOs joinVOs1 = joinLists.get(1);
		JoinVOs joinVOs2 = joinLists.get(2);
		
		System.out.println(joinVOs.toString());
		System.out.println(joinVOs1.toString());
		System.out.println(joinVOs2.toString());
		
		models.addAttribute("joinVOs", joinVOs);
		
		return "joinLists.jsp";
	}
	
	

}
