package com.springbook.biz.view.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

public class GetBoardListController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) 
	throws Exception {
		System.out.println("글 목록 검색 처리 - Spring MVC 호출 - Controller 분리");
		// 1. 사용자 입력 정보 추출(검색 기능은 나중에 구현)
		// 2. DB 연동 처리
		BoardVO vo = new BoardVO();
		BoardDAO boardDAO = new BoardDAO();
		List<BoardVO> boardList = boardDAO.getBoardList(vo);
		// 3. 검색 결과를 세션에 저장하고 목록 화면을 리턴한다.
		HttpSession session = request.getSession();
		session.setAttribute("boardList", boardList);
		
		
		//4. View 페이지
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("getBoardList");
			//redirect : viewResolver설정을 무시하고 강제로 리다이렉트
			//forward로 뷰페이지 전달, viewResolver가 작동 됨, prefix + getBoardList + suffix
		return mav;
	}
}