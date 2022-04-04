package co.kr.brain21c.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.kr.brain21c.dto.history;
import co.kr.brain21c.dto.message;
import co.kr.brain21c.paging.Criteria;
import co.kr.brain21c.service.AdminHistoryService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminHistoryController {

	@Autowired
	private AdminHistoryService AdminHistoryService;
	
	
	// 연혁 & 실적
	@RequestMapping("/myboard/sub1_2") 
	public ModelAndView test(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		ArrayList<history> returnList   = new ArrayList<history>();
		ArrayList<history> list2011   = new ArrayList<history>();
		ArrayList<history> list2001   = new ArrayList<history>();
		ArrayList<history> list1984   = new ArrayList<history>();
		
		try {
			returnList = AdminHistoryService.getBoard();
			
			for(int i=0; i<returnList.size(); i++) {
				int compYear = Integer.parseInt(returnList.get(i).getHisyear());
				if( compYear > 2010  ) {
					list2011.add(returnList.get(i));
				} else if(compYear < 2011 && compYear > 1999){
					list2001.add(returnList.get(i));
				} else {
					list1984.add(returnList.get(i));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("list2011",list2011);
		mv.addObject("list2001",list2001);
		mv.addObject("list1984",list1984);
		
		mv.setViewName("sub1_2");
		
		return mv;
	}
	
	//===========================================================

	// 관리자 페이지 - 연혁 & 실적
	@RequestMapping(value = "/admin1_2", method = RequestMethod.GET)
	public ModelAndView historyList(@ModelAttribute("criteria") Criteria criteria, HttpServletRequest req) throws Exception {
		
		int totalCount = AdminHistoryService.getHistoryTotalCount();
		
		int currentPageNo;
		if (req.getParameter("page") != null) {
			currentPageNo = Integer.parseInt(req.getParameter("page"));
		} else {
			currentPageNo = 1;
		}
		
		Criteria criteria2 = new Criteria(currentPageNo, totalCount);
		
		ModelAndView mv = new ModelAndView();
		ArrayList<history> hList   = new ArrayList<history>();
		
		try {
			hList = AdminHistoryService.getHistoryList(criteria2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("currentPageNo", currentPageNo);
		mv.addObject("criteria2", criteria2);
		mv.addObject("hList", hList);
		mv.setViewName("admin1_2");
		
		return mv;
	}
	
	@RequestMapping(value = "/admin1_2", method = RequestMethod.POST)
	@ResponseBody public void orderUpdate(@RequestParam (value = "seq[]") List<String> seqList,
										  @RequestParam (value = "ord[]") List<String> ordList,
										  HttpServletRequest req) {
		
		AdminHistoryService.updateOrd(seqList, ordList);
	}
	
	
	@RequestMapping(value = "/bbs/popup/his_insert_form", method = RequestMethod.GET)
	public String insertHis() {
		return "bbs/popup/his_insert_form"; 
	}
	
	@RequestMapping(value = "/bbs/popup/map", method = RequestMethod.GET)
	public String mapApi() {
		return "bbs/popup/map"; 
	}
	
	@RequestMapping(value = "/bbs/popup/his_insert_form", method = RequestMethod.POST)
	public ModelAndView insertProc(history hisData, ModelAndView mv, HttpServletRequest req) {
		
		int result = 0;
		String msg = "";
		String href = "";
		
		// 값 받아오기
		int nowYear = Integer.parseInt(req.getParameter("now_y"));
		int nowMonth = Integer.parseInt(req.getParameter("now_m"));
		int nowDay  = Integer.parseInt(req.getParameter("now_d"));
		String nowDate = nowYear + "-" + nowMonth + "-" + nowDay; 	// 등록일
		
		hisData.setRgdtm(nowDate);
		hisData.setHisyear(req.getParameter("his_y"));
		hisData.setHismonth(req.getParameter("his_m"));
		hisData.setHiscntn(req.getParameter("hiscntn"));

		log.info("insertData {}", hisData);
		result = AdminHistoryService.insertHistory(hisData);
		
		if(result == 1) {
			msg = "정상적으로 등록이 되었습니다.";
		} else {
			msg = "등록에 실패했습니다.";
		}
		
		mv.addObject("data", new message(msg, href));
		mv.setViewName("message");
		
		return mv; 
	}
	
	
	@RequestMapping(value = "/bbs/popup/his_update_form", method = RequestMethod.GET)
	public ModelAndView updateHis (HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String hisseq = req.getParameter("seq");
		ArrayList<history> adminHistoryList = new ArrayList<history>();
		adminHistoryList = AdminHistoryService.getHistoryBySeq(hisseq);
		
//		log.info("getHis {} ", adminHistoryList);
		
		mv.addObject("hisData", adminHistoryList);
		mv.setViewName("bbs/popup/his_update_form");
		
		return mv; 
	}
	
	@RequestMapping(value = "/bbs/popup/his_update_form", method = RequestMethod.POST)
	public ModelAndView updateProc (history updateData, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		String msg = "";
		String href = "";
		
		String hisseq = req.getParameter("seq");
		
		int newYear = Integer.parseInt(req.getParameter("now_y"));
		int newMonth = Integer.parseInt(req.getParameter("now_m"));
		int newDay  = Integer.parseInt(req.getParameter("now_d"));
		String newDate = newYear + "-" + newMonth + "-" + newDay; 	// 등록일
		
		updateData.setRgdtm(newDate);
		updateData.setHisyear(req.getParameter("his_y"));
		updateData.setHismonth(req.getParameter("his_m"));
		updateData.setHiscntn(req.getParameter("hiscntn"));
		
		log.info("updateData {}", updateData);
		result = AdminHistoryService.updateHistory(hisseq, updateData);
		
		if (result == 1) {
			msg = "정상적으로 수정되었습니다.";
			href = "his_update_form?seq=" + hisseq;
		} else {
			msg = "수정에 실패했습니다.";
			href = "his_update_form?seq=" + hisseq;
		}
		
		mv.addObject("data", new message(msg, href));
		mv.setViewName("message");
		
		return mv;
	}
	
	
	@RequestMapping("/admin1_2/delete")
	public String deleteProc (HttpServletRequest req) {

		String hisseq = req.getParameter("seq");
		
		AdminHistoryService.deleteHistory(hisseq);
//		int result = AdminHistoryService.deleteHistory(hisseq);
		
		return "redirect:/admin1_2";
	}
	
}
