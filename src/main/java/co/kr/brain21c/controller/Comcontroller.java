package co.kr.brain21c.controller;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.kr.brain21c.dto.board;
import co.kr.brain21c.dto.contact;
import co.kr.brain21c.dto.history;
import co.kr.brain21c.service.AdminService;
import co.kr.brain21c.service.EnquiryService;

@Controller 
public class Comcontroller {  
	
	@Autowired
	private AdminService AdminService;
	
	@Autowired
	private EnquiryService enquiryService;
	
	private static final Logger logger = LoggerFactory.getLogger(Comcontroller.class);
	
	
	@RequestMapping("/index") 
	public String index() { 
		return "index"; 
	}
	
//	@RequestMapping("/main") 
//	public String main() { 
//		return "main"; 
//	}
	
	@RequestMapping("/page/{subpage_path}") 
	public String sub_page(@PathVariable("subpage_path") String subpage_path) { 
		return subpage_path; 
	} 
	
	@RequestMapping("/myboard/{subpage_path}") 
	public String sub_board(@PathVariable("subpage_path") String subpage_path) { 
		return subpage_path;
	} 
	
	@RequestMapping("/bbs/{subpage_path}") 
	public String sub_bbs(@PathVariable("subpage_path") String subpage_path) { 
		return subpage_path;
	} 
	
	@RequestMapping("/shop_info/{subpage_path}") 
	public String shop_info(@PathVariable("subpage_path") String subpage_path) { 
		return subpage_path; 
	}
	
	@RequestMapping("/main") 
	public ModelAndView notice(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		ArrayList<board> ntList  = new ArrayList<board>();
		
		try {
			ntList = AdminService.getMainNotic();
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.debug(ntList.toString());
		mv.addObject("ntList", ntList);
		mv.setViewName("main");
		
		return mv;
	}
	
	@RequestMapping("/myboard/sub1_2") 
	public ModelAndView test(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		ArrayList<history> returnList   = new ArrayList<history>();
		ArrayList<history> list2011   = new ArrayList<history>();
		ArrayList<history> list2001   = new ArrayList<history>();
		ArrayList<history> list1984   = new ArrayList<history>();
		
		//Map testMap     = new HashMap<String, Map<String, Object>>();
		try {
			returnList = AdminService.getBoard();
			
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
	
	@RequestMapping("/myboard/sub3_3") 
	public ModelAndView contact(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		ArrayList<contact> ctList  = new ArrayList<contact>();
		
		try {
			ctList = AdminService.getContact();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("ctList", ctList);
		mv.setViewName("sub3_3"); 
		
		return mv;
	}

}
