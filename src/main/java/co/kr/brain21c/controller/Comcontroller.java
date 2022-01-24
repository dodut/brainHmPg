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
		List testList   = new ArrayList<history>();
		//Map testMap     = new HashMap<String, Map<String, Object>>();
		try {
			testList = AdminService.getBoard();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("testList",testList);
		mv.setViewName("sub1_2");
		
		return mv;
	}

}
