package co.kr.brain21c.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		mv.setViewName("sub3_2");
		
		return mv;
	}
}
