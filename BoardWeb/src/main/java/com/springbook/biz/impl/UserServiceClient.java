package com.springbook.biz.impl;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.springbook.biz.user.UserVO;

public class UserServiceClient {

	public static void main(String[] args) {
		//1. Spring 컨테이너 구동
		
		AbstractApplicationContext container = 
				new GenericXmlApplicationContext("applicationContext.xml");
		
		//2. Spring 컨테이너로부터 UserServiceImpl 객체를 Lookup (가져온다)
			//UserService : 인터페이스
		UserService userService = (UserService)container.getBean("userService");
		
		//3. 로그인 기능 테스트 
		UserVO vo = new UserVO();
		vo.setId("admin");
		vo.setPassword("1234");
		
		UserVO user = userService.getUser(vo);
		
		if(user != null) {	//로그인이 성공한 상태
			System.out.println(user.getName() + " 님 환영합니다.");
			System.out.println("리턴 받아온 DB에 저장된 ID : " + user.getId());
			System.out.println("리턴 받아온 DB에 저장된 Password : " + user.getPassword());
			System.out.println("리턴 받아온 DB에 저장된 Name : " + user.getName());
			System.out.println("리턴 받아온 DB에 저장된 role : " + user.getRole());
			
		} else {	//로그인이 실패한 상태
			System.out.println("로그인이 실패 했습니다.");
		}
		
		//3-2 insert 메소드 호출(수정 사항)
		vo.setId("bts200");
		vo.setPassword("1234");
		vo.setName("뷔200");
		vo.setRole("BTS");
	
		userService.insertUser(vo);
		
		//4. Spring 컨테이너 종료
		container.close();
		
		
	}

}
