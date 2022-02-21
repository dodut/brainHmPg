package co.kr.brain21c.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.kr.brain21c.dto.board;
import co.kr.brain21c.paging.Criteria;
import co.kr.brain21c.service.NoticeService;

@Controller
public class Noticecontroller {
	

	@Autowired
	private NoticeService NoticeService;
	
	private static final Logger logger = LoggerFactory.getLogger(Comcontroller.class);

	
	@RequestMapping("/bbs/sub3_1")
	public ModelAndView noticeList(@ModelAttribute("criteria") Criteria criteria, HttpServletRequest req) {
		//logger.info("### 공지사항 페이지 로드!!!!");
		
		ModelAndView mv = new ModelAndView();
		ArrayList<board> nList = NoticeService.getNoticeList(criteria);
	
		mv.addObject("nList", nList);
		mv.setViewName("sub3_1");
		
		return mv;
	}
}
