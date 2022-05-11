package co.kr.brain21c.controller;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import co.kr.brain21c.dto.FileDto;
import co.kr.brain21c.dto.admin;
import co.kr.brain21c.dto.board;
import co.kr.brain21c.dto.message;
import co.kr.brain21c.service.AdminService;
import lombok.extern.slf4j.Slf4j;

@Slf4j

@Controller 
public class Comcontroller {  

	@Autowired
	private AdminService AdminService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired ServletContext context;
	
	private static final Logger logger = LoggerFactory.getLogger(Comcontroller.class);
	
//	@RequestMapping("/")
//	public String GetMainPage() {
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
	
	@RequestMapping(value = {"/main", "/"})
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
		mv.setViewName("/main");
		
		return mv;
	}
	
	//===========================================================
	
	// 관리자 페이지 - 로그인
	
	@RequestMapping("/sign_up") 
	public String index() { 
		return "sign_up"; 
	}
	
	@RequestMapping("/sub_main") 
	public String sub_main(@SessionAttribute(name = "loginMember", required = false) admin loginMember, Model model) { 
		
		if (loginMember == null) {
            return "sub_login";
        }
		
        model.addAttribute("member", loginMember);
		
		return "sub_main";
	}
	
	@RequestMapping("/message") 
	public String message() { 
		return "message"; 
	}
	
	@RequestMapping("/sub_login") 
	public String sub_login() {
		return "sub_login"; 
	}
	
	@RequestMapping("/login") 
	public ModelAndView login(@ModelAttribute admin member, HttpServletRequest request) { 
		
		String msg = "";
		String href = "";
		
		ModelAndView mv = new ModelAndView();
		ArrayList<admin> loginList = new ArrayList<admin>();
		
		try {
			loginList = AdminService.getLogin(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(loginList.size() == 0) {
			msg = "아이디 또는 패스워드를 확인해주세요.";
			href = "sub_login";
		} else {
			
			if(passwordEncoder.matches(member.getPassword(), loginList.get(0).getPassword().toString())) {
				
				
				msg = "환영합니다.";
				href = "admin1_2";
			    
				HttpSession session = request.getSession();
			    session.setAttribute("loginMember", loginList);

			} else {
				msg = "아이디 또는 패스워드를 확인해주세요.";
				href = "sub_login";
			}
			
		}
		
		mv.addObject("data", new message(msg, href));
		mv.setViewName("message");
		
		return mv; 
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
	    if (session != null) {
	        session.invalidate();
	    }
		
		return "redirect:/sub_login";
	}
	
	@RequestMapping("/admin_sign_up")
	public ModelAndView sign_up(@ModelAttribute admin member) {
		
		int result = 0;
		String msg = "";
		String href = "";
		ModelAndView mv = new ModelAndView();
		
		String encodePassword = passwordEncoder.encode(member.getPassword());
		member.setPassword(encodePassword);
		
		try {
			result = AdminService.insSignUp(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result == 1) {
			msg = "정상적으로 등록이 되었습니다.";
			href = "sub_login";
		} else {
			msg = "회원가입에 실패했습니다.";
			href = "sign_up";
		}
		
		mv.addObject("data", new message(msg, href));
		mv.setViewName("message");
		
		return mv; 
	}

	
	
	//===========================================================
	
	// 관리자 페이지 - 조직도

	@RequestMapping(value = "/admin1_3", method = RequestMethod.GET)
	public ModelAndView imgUpload() {
		ModelAndView mv = new ModelAndView();		
		
		String dirPath = context.getRealPath("/resources/adminupload");
		File folder = new File(dirPath);
		String[] fileList = folder.list();
		
		log.info("fileList {}", fileList);
		
		mv.addObject("fileName", fileList);
		mv.setViewName("admin1_3");
		
		return mv;
	}
	
	
	
	@RequestMapping(value = "/admin1_3/fileUploadProc", method = RequestMethod.POST)
	public void fileUploadProc (@RequestParam("up_file") MultipartFile uploadfile, Model model) {
		
		int result = 0;
		String msg = "";
		String href = "";
		ModelAndView mv = new ModelAndView();
		
//		String newName = UUID.randomUUID().toString() + "_" + uploadfile.getOriginalFilename();
		String newName = "adminuploadfile_" + uploadfile.getOriginalFilename();
		
		try {
	    	String dirPath = context.getRealPath("/resources/adminupload");
	    	
	    	File folder = new File(dirPath);
	    	
	    	if(folder.exists())  {
	    		if(folder.isDirectory()) {
	    			File[] exist = folder.listFiles();
	    			
	    			for (int i=0; i<exist.length; i++) {
	    				if(exist[i].delete()) {
	    					System.out.println(exist[i].getName() + "삭제성공");
	    				} else {
	    					System.out.println(exist[i].getName() + "삭제실패");
	    				}
	    			}
	    		}
	    		if (folder.delete()) {
	    			System.out.println("파일삭제 성공");
	    		} else {
	    			System.out.println("파일삭제 실패");
	    		}
	    	} else {
	    		System.out.println("파일이 존재하지 않습니다.");
	    	}
	    	
	    	if (!folder.exists()) {
	    		folder.mkdirs();
	    		System.out.println("파일 생성 완료");
	    	}
	    	
	    	
	    	File destination = new File(dirPath + File.separator + newName);
			uploadfile.transferTo(destination);
				
			result = 1;
	    	
		} catch (Exception e) {
			log.error("에러: " + e.getMessage());
		} 
		
		
//		if(result == 1) {
//			msg = "정상적으로 등록이 되었습니다.";
//			href = "/admin1_3";
//		} else {
//			msg = "등록에 실패했습니다.";
//			href = "/admin1_3";
//		}
//		
//		mv.addObject("data", new message(msg, href));
//		mv.setViewName("message");
		
//		mv.addObject("fileName", newName);
//		mv.setViewName("redirect:/admin1_3");
		
//		return mv; 
		
	}
	
	
}
