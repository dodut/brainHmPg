package co.kr.brain21c.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView; 
import java.util.*;

import co.kr.brain21c.dto.*;
import co.kr.brain21c.service.*;

@Controller 
public class Comcontroller { 
	
	@Autowired
	private AdminService AdminService;
	
	@RequestMapping("/index") 
	public String index() { 
		return "index"; 
	}
	
	@RequestMapping("/main") 
	public String main() { 
		return "main"; 
	}
	
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
		//ArrayList<contact> ctList   = new ArrayList<contact>();
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
