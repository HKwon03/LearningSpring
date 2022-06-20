package com.springbook.biz.view.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

@Controller
public class UpdateBoardController {

	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardVO vo, BoardDAO boardDAO) {
		System.out.println("글 수정 처리 - Spring MVC 호출 - Controller 분리");
		
		System.out.println(vo.getTitle());
		System.out.println(vo.getContent());
		System.out.println(vo.getSeq());
		
		boardDAO.updateBoard(vo);
		
		// 3. 화면 네비게이션
		
		return "redirect:getBoardList.do";
	}

}
