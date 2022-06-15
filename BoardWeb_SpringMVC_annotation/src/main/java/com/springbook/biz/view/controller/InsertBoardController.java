package com.springbook.biz.view.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

@Controller
public class InsertBoardController {
	
	@RequestMapping(value="/insertBoard.do")	//클라이언트 요청
	public String insertBoard(BoardVO vo, BoardDAO boardDAO) {
		System.out.println("글 등록 처리 - Spring MVC 어노테이션 작동");
	
		boardDAO.insertBoard(vo);
		
		return "getBoardList.do";	//Forward 방식으로 뷰 페이지 전송
		
	}

}
