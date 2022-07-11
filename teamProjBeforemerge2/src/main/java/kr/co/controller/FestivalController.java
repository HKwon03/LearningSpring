package kr.co.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.FestivalService;
import kr.co.vo.FestivalVO;
import kr.co.vo.PageMaker;
import kr.co.vo.SearchCriteria;

@Controller
@RequestMapping("/festival/*")
public class FestivalController {
	
	private static final Logger logger = LoggerFactory.getLogger(FestivalController.class);
	
	@Inject
	FestivalService service;
	
	// 축제 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("list");
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "festival/list";
		
	}
	
	// 축제 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(FestivalVO festivalVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("read");
		
		model.addAttribute("read", service.read(festivalVO.getF_code()));
		model.addAttribute("scri", scri);
		
		return "festival/readView";
	}
	
}
