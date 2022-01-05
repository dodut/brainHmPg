package co.kr.brain21c.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping; 

@Controller 
public class Comcontroller { 
	
	@RequestMapping("/main") 
	public String index() { 
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

}
