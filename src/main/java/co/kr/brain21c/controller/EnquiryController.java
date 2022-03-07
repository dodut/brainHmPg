package co.kr.brain21c.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.kr.brain21c.dto.board;
import co.kr.brain21c.service.EnquiryService;

@Controller
public class EnquiryController {
	
	@Autowired
	private EnquiryService enquiryService;
	
	private static final Logger logger = LoggerFactory.getLogger(Comcontroller.class);
	
	@RequestMapping("/bbs/sub3_2") 
	public ModelAndView enquiry(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		ArrayList<board> ntList  = new ArrayList<board>();
		
		try {
			ntList = enquiryService.getEnquiry();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		mv.addObject("ntList", ntList);
		mv.addObject("board_code", "sub3_2");
		mv.setViewName("sub3_2");
		
		return mv;
	}
	
	@RequestMapping(value = "/bbs/popup/pwd_chk_form", method = RequestMethod.GET)
	public ModelAndView checkPw(@RequestParam("seq") int seq, HttpServletRequest req) throws Exception {
		ModelAndView mv = new ModelAndView();

	//	board board = NoticeService.getNoticeView(seq);
		
		//System.out.println("board_code : " + req.getParameter("board_code"));
		//System.out.println("currentPageNo : " + currentPageNo);
		//System.out.println("search_key : " + search_key);

		mv.addObject("board_code", "sub3_2");
	//	mv.addObject("dto", board);
		mv.setViewName("/bbs/popup/pwd_chk_form");

		return mv;
	}	
	
}
