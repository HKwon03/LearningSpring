package com.springbook.biz.impl;

import com.springbook.biz.user.UserVO;

public interface UserService {

	//3. CRUD 기능의 메소드 구현
	//회원정보 검색(ID와 password를 매개변수로 받아서 처리)
	UserVO getUser(UserVO vo);
	
	//insert 메소드 정의
	void insertUser(UserVO vo);

}