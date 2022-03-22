package co.kr.brain21c.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.kr.brain21c.dto.board;
import co.kr.brain21c.paging.Criteria;
import co.kr.brain21c.service.NoticeService;

@Controller
public class Noticecontroller {

	@Autowired
	private NoticeService noticeService;

	private static final Logger logger = LoggerFactory.getLogger(Comcontroller.class);

	@RequestMapping(value = "/bbs/sub3_1", method = RequestMethod.GET)
	public ModelAndView noticeList(@ModelAttribute("criteria") Criteria criteria, HttpServletRequest req,
			@RequestParam(defaultValue = "") String search_key) throws Exception {

		int totalCount = noticeService.getNoticeTotalCount(search_key);

		int currentPageNo;
		if (req.getParameter("page") != null) {
			currentPageNo = Integer.parseInt(req.getParameter("page"));
		} else {
			currentPageNo = 1;
		}

		Criteria criteria2 = new Criteria(currentPageNo, totalCount);

		ModelAndView mv = new ModelAndView();
		ArrayList<board> nList = new ArrayList<board>();

		try {
			nList = noticeService.getNoticeList(criteria2, search_key);
		} catch (Exception e) {
			e.printStackTrace();
		}

		int listNo = totalCount - criteria2.getRecordsPerPage() * (currentPageNo - 1);

		mv.addObject("board_code", "sub3_1");
		mv.addObject("listNo", listNo);
		mv.addObject("search_key", search_key);
		mv.addObject("currentPageNo", currentPageNo);
		mv.addObject("criteria2", criteria2);
		mv.addObject("nList", nList);
		mv.setViewName("sub3_1");

		return mv;
	}

	@RequestMapping(value = "/bbs/sub3_1_view", method = RequestMethod.GET)
	public ModelAndView noticeView(@RequestParam(defaultValue = "") String search_key,
			@RequestParam(defaultValue = "1") int currentPageNo, HttpServletRequest req) throws Exception {
		ModelAndView mv = new ModelAndView();

		int seq = Integer.parseInt(req.getParameter("seq"));

		noticeService.updateHitCount(seq);
		board board = noticeService.getNoticeView(seq);

		mv.addObject("board_code", "sub3_1");
		mv.addObject("dto", board);
		mv.addObject("search_key", search_key);
		mv.addObject("currentPageNo", currentPageNo);
		mv.setViewName("sub3_1_view");

		return mv;
	}

	@RequestMapping(value = "/bbs/sub3_1_print", method = RequestMethod.GET)
	public ModelAndView noticeViewPrint(@RequestParam("seq") int seq, HttpServletRequest req) throws Exception {
		ModelAndView mv = new ModelAndView();

		board board = noticeService.getNoticeView(seq);
		//System.out.println("board_code : " + req.getParameter("board_code"));
		// System.out.println("currentPageNo : " + currentPageNo);
		// System.out.println("search_key : " + search_key);

		mv.addObject("board_code", "sub3_1");
		mv.addObject("dto", board);
		mv.setViewName("sub3_1_print");

		return mv;
	}

}
