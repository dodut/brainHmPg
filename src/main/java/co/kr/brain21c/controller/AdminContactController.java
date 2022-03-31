package co.kr.brain21c.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.kr.brain21c.dto.contact;
import co.kr.brain21c.dto.message;
import co.kr.brain21c.service.AdminContactService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller 
public class AdminContactController {
	
	@Autowired
	private AdminContactService AdminContactService;

	
	// 담당자 안내
	@RequestMapping("/myboard/sub3_3") 
	public ModelAndView contact(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		ArrayList<contact> ctList  = new ArrayList<contact>();
		
		try {
			ctList = AdminContactService.getContact();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("ctList", ctList);
		mv.addObject("board_code", "sub3_3");
		mv.setViewName("sub3_3"); 
		
		return mv;
	}

	//===========================================================

	// 관리자 페이지 - 담당자 안내
	@RequestMapping(value = "/admin3_3", method = RequestMethod.GET)
	public ModelAndView adminContact(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		ArrayList<contact> adminContactList  = new ArrayList<contact>();
		
		adminContactList = AdminContactService.getContact();
		
		mv.addObject("ctList", adminContactList);
		mv.setViewName("admin3_3"); 
		
		return mv;
	}
	
	@RequestMapping(value = "/admin3_3", method = RequestMethod.POST)
	@ResponseBody public void orderUpdate(@RequestParam (value = "seq[]") List<String> seqList,
										  @RequestParam (value = "ord[]") List<String> ordList,
										  HttpServletRequest req) {
		
//			for(int i=0; i<seqList.size(); i++) {
//				log.info(seqList.get(i));
//			}
//			for(int i=0; i<ordList.size(); i++) {
//				log.info(ordList.get(i));
//			}

		AdminContactService.updateOrd(seqList, ordList);
	}
	
	
	@RequestMapping(value = "/bbs/popup/ct_insert_form", method = RequestMethod.GET)
	public String insertCt() {
		return "bbs/popup/ct_insert_form"; 
	}
	
	@RequestMapping(value = "/bbs/popup/ct_insert_form", method = RequestMethod.POST)
	public ModelAndView insertProc(contact insertData, HttpServletRequest req) throws Exception {
		
		int result = 0;
		String msg = "";
		String href = "";
		ModelAndView mv = new ModelAndView();
		
		insertData.setCtpart(req.getParameter("ctpart"));
		insertData.setCtchr(req.getParameter("ctchr"));
		insertData.setCtphone(req.getParameter("ctphone"));
		insertData.setCtmail(req.getParameter("ctmail"));

		log.info("insertData {}", insertData);
		result = AdminContactService.insertContact(insertData);
		
		if(result == 1) {
			msg = "정상적으로 등록이 되었습니다.";
		} else {
			msg = "등록에 실패했습니다.";
		}
		
		mv.addObject("data", new message(msg, href));
		mv.setViewName("message");
		
		return mv;
	}
		
	@RequestMapping(value = "/bbs/popup/ct_update_form", method = RequestMethod.GET)
	public ModelAndView updateCt (HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String ctseq = req.getParameter("seq");
		ArrayList<contact> adminContactList  = new ArrayList<contact>();
		adminContactList = AdminContactService.getContactBySeq(ctseq);

		//logger.info(adminContactList.toString());
		mv.addObject("ctData", adminContactList);
		mv.setViewName("/bbs/popup/ct_update_form");
		
		return mv;
	}
	
	@RequestMapping(value = "/bbs/popup/ct_update_form", method = RequestMethod.POST)
	public ModelAndView updateProc (contact updateData, HttpServletRequest req) {
		
		int result = 0;
		String msg = "";
		String href = "";
		
		ModelAndView mv = new ModelAndView();
		
		String ctseq = req.getParameter("seq");
		updateData.setCtpart(req.getParameter("ctpart"));
		updateData.setCtchr(req.getParameter("ctchr"));
		updateData.setCtphone(req.getParameter("ctphone"));
		updateData.setCtmail(req.getParameter("ctmail"));
		
		result = AdminContactService.updateContact(ctseq, updateData);
		
		if (result == 1) {
			msg = "정상적으로 수정되었습니다.";
			href = "ct_update_form?seq=" + ctseq;
		} else {
			msg = "수정에 실패했습니다.";
			href = "ct_update_form?seq=" + ctseq;
		}
		
		mv.addObject("data", new message(msg, href));
		mv.setViewName("message");
		
		return mv;
	}
	
	@RequestMapping("/admin3_3/delete")
	public String deleteProc (HttpServletRequest req) {

		String ctseq = req.getParameter("seq");
		
		AdminContactService.deleteContact(ctseq);
		
		return "redirect:/admin3_3";
	}
		
}
