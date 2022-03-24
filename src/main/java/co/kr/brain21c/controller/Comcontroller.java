package co.kr.brain21c.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.ModelAndView;

import co.kr.brain21c.dto.admin;
import co.kr.brain21c.dto.board;
import co.kr.brain21c.dto.contact;
import co.kr.brain21c.dto.history;
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

	private static final Logger logger = LoggerFactory.getLogger(Comcontroller.class);

//	@RequestMapping("/")
//	public String GetMainPage() {
//		return "main";
//	}

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

		if (loginList.size() == 0) {
			msg = "아이디 또는 패스워드를 확인해주세요.";
			href = "sub_login";
		} else {

			if (passwordEncoder.matches(member.getPassword(), loginList.get(0).getPassword().toString())) {

				msg = "환영합니다.";
				href = "sub_main";

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

		if (result == 1) {
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

	@RequestMapping(value = { "/main", "/" })
	public ModelAndView notice(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		ArrayList<board> ntList = new ArrayList<board>();

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

	@RequestMapping("/myboard/sub1_2")
	public ModelAndView test(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		ArrayList<history> returnList = new ArrayList<history>();
		ArrayList<history> list2011 = new ArrayList<history>();
		ArrayList<history> list2001 = new ArrayList<history>();
		ArrayList<history> list1984 = new ArrayList<history>();

		try {
			returnList = AdminService.getBoard();

			for (int i = 0; i < returnList.size(); i++) {
				int compYear = Integer.parseInt(returnList.get(i).getHisyear());
				if (compYear > 2010) {
					list2011.add(returnList.get(i));
				} else if (compYear < 2011 && compYear > 1999) {
					list2001.add(returnList.get(i));
				} else {
					list1984.add(returnList.get(i));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("list2011", list2011);
		mv.addObject("list2001", list2001);
		mv.addObject("list1984", list1984);

		mv.setViewName("sub1_2");

		return mv;
	}

	@RequestMapping("/myboard/sub3_3")
	public ModelAndView contact(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		ArrayList<contact> ctList = new ArrayList<contact>();

		try {
			ctList = AdminService.getContact();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("ctList", ctList);
		mv.addObject("board_code", "sub3_3");
		mv.setViewName("sub3_3");

		return mv;
	}

	@RequestMapping(value = "/admin3_3", method = RequestMethod.GET)
	public ModelAndView adminContact(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		ArrayList<contact> adminContactList = new ArrayList<contact>();

		// int seq = Integer.parseInt(req.getParameter("seq"));
		adminContactList = AdminService.getContact();

		mv.addObject("ctList", adminContactList);
		mv.setViewName("/admin3_3");

		return mv;
	}

	@RequestMapping(value = "/admin3_3", method = RequestMethod.POST)
	public void orderUpdate(@RequestParam Map<String, Object> param, HttpServletRequest req) {
		// ModelAndView mv = new ModelAndView();

		log.info("param {} ", param);

		// return null;
	}

	@RequestMapping(value = "/bbs/popup/ct_update_form", method = RequestMethod.GET)
	public ModelAndView updateCt(@RequestParam("seq") int seq, HttpServletRequest req) throws Exception {
		ModelAndView mv = new ModelAndView();

		mv.addObject("board_code", "admin3_3");
		mv.setViewName("/bbs/popup/ct_update_form");

		return mv;
	}

}