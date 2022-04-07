package co.kr.brain21c.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.JsonObject;

import co.kr.brain21c.dto.FileDto;
import co.kr.brain21c.dto.board;
import co.kr.brain21c.paging.Criteria;
import co.kr.brain21c.service.EnquiryService;

@RestController
public class EnquiryController {

	@Autowired
	private EnquiryService enquiryService;

	private static final Logger logger = LoggerFactory.getLogger(Comcontroller.class);

	@RequestMapping("/bbs/sub3_2")
	public ModelAndView enquiryList(HttpServletRequest req, @RequestParam(defaultValue = "") String search_key)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		ArrayList<board> ntList = new ArrayList<board>();

		int totalCount = enquiryService.getTotalCount(search_key);

		int currentPageNo = 1;

		if (req.getParameter("page") != null) {
			currentPageNo = Integer.parseInt(req.getParameter("page"));
		}

		Criteria criteria = new Criteria(currentPageNo, totalCount);
		int listNo = totalCount - criteria.getRecordsPerPage() * (currentPageNo - 1);

		try {
			ntList = enquiryService.getEnquiryList(criteria, search_key);
		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("board_code", "sub3_2");
		mv.addObject("listNo", listNo);
		mv.addObject("search_key", search_key);
		mv.addObject("currentPageNo", currentPageNo);
		mv.addObject("criteria", criteria);
		mv.addObject("ntList", ntList);
		mv.setViewName("sub3_2");

		return mv;
	}

	@RequestMapping(value = "/bbs/popup/pwd_chk_form", method = RequestMethod.GET)
	public ModelAndView pwdChkForm(@RequestParam("seq") int seq, HttpServletRequest req) throws Exception {
		ModelAndView mv = new ModelAndView();

		mv.addObject("seq", seq);
		mv.addObject("board_code", "sub3_2");
		mv.setViewName("/bbs/popup/pwd_chk_form");

		return mv;
	}

	@RequestMapping(value = "/bbs/checkPwProc", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public String checkPwProc(@RequestBody Map<String, Object> map) throws Exception {

		int seq = Integer.parseInt(map.get("seq").toString());
		String passwd = (String) map.get("passwd");

		boolean result = enquiryService.checkPwProc(seq, passwd);

		JsonObject json = new JsonObject();

		if (result) {
			json.addProperty("status", "200"); // 입력한 비밀번호와 등록된 비밀번호 일치할경우
		} else {
			json.addProperty("status", "404"); // 비밀번호 오류
		}

		return json.toString();
	}

	@RequestMapping(value = "/bbs/sub3_2_view", method = RequestMethod.GET)
	public ModelAndView enquiryView(@RequestParam(defaultValue = "") String search_key,
			@RequestParam(defaultValue = "1") int page, HttpServletRequest req) throws Exception {
		ModelAndView mv = new ModelAndView();

		int seq = Integer.parseInt(req.getParameter("seq"));

		enquiryService.updateHitCount(seq);
		board board = enquiryService.getEnquiryView(seq);
		String view_code = (board.getGrpord() == 1) ? "Q" : "A";

		board ref_board = new board();

		// System.out.println("view_code : " + view_code);

		if (view_code == "Q") {
			int a_article_seq = enquiryService.getArticleSeq(board.getGrpno(), 2);

			if (a_article_seq != 0) {
				ref_board = enquiryService.getEnquiryView(a_article_seq);
			}

		} else if (view_code == "A") {
			int q_article_seq = enquiryService.getArticleSeq(board.getGrpno(), 1);
			ref_board = enquiryService.getEnquiryView(q_article_seq);
		}

		mv.addObject("board_code", "sub3_2");
		mv.addObject("view_code", view_code); // Q & A view 화면영역 구분

		mv.addObject("dto", board);
		mv.addObject("ref_dto", ref_board);

		mv.addObject("search_key", search_key);
		mv.addObject("currentPageNo", page);
		mv.setViewName("sub3_2_view");

		return mv;
	}

	@RequestMapping(value = "/bbs/sub3_2_form", method = RequestMethod.GET)
	public ModelAndView enquiryForm() throws Exception {
		ModelAndView mv = new ModelAndView();

		mv.addObject("board_code", "sub3_2");
		mv.setViewName("sub3_2_form");

		return mv;
	}

	@RequestMapping(value = "/bbs/popup/flash_fileup_form", method = RequestMethod.GET)
	public ModelAndView fileUploadForm(HttpServletRequest req) throws Exception {
		ModelAndView mv = new ModelAndView();

		mv.addObject("board_code", "sub3_2");
		mv.setViewName("/bbs/popup/flash_fileup_form");

		return mv;
	}

	@RequestMapping(value = "/bbs/enquiry_write_proc", method = RequestMethod.POST)
	public ModelAndView writeProc(@ModelAttribute board board, HttpServletRequest request) throws Exception {

		// System.out.println("writeProc 실행 board.toString() : " + board.toString());
		int result = enquiryService.writeProc(board);

		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("iframe_view");

		return mv;

	}
 

	// File Upload관련
	@ResponseBody
	@RequestMapping(value = "/bbs/fileUploadProc", method = RequestMethod.POST)
	public ModelAndView fileUploadProc(@RequestParam("add_file") MultipartFile upload , HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println("fileUploadProc 실행 --- ");
		System.out.println("upload.getOriginalFilename() :" + upload.getOriginalFilename());
		
		ModelAndView mv = new ModelAndView();
		
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		try {
			// 파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			long fileSize = upload.getSize(); // 파일 사이즈
			
			// 이미지 경로 생성
			String path = "C:\\upload/";
			// String path = request.getSession().getServletContext().getRealPath("/").concat("resources/ckupload/");
			//System.out.println("upload path: " + path);

			String ckUploadPath = path + uid + "_" + fileName;
			File folder = new File(path);

			// 해당 디렉토리 확인
			if (!folder.exists()) {
				try {
					folder.mkdirs(); // 폴더 생성
				} catch (Exception e) {
					e.getStackTrace();
				}
			}

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

			printWriter = response.getWriter();
			String fileUrl = "/bbs/file?uid=" + uid + "&fileName=" + fileName; // 작성화면

			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"fileSize\" : \"" + fileSize + "\", \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();

			
			
 
			// file 정보넘기기
			//mv.addObject("file_inform", "{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			mv.addObject("filename", fileName);
			mv.addObject("uploaded", 1);
			mv.addObject("url", fileUrl);
			
			mv.addObject("fileSize", fileSize);
			 
			System.out.println(mv.toString());
			
			
			mv.setViewName("/bbs/popup/flash_fileup_form");
			

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		return mv;
	}

	// editor 이미지 업로드
	@RequestMapping(value = "/bbs/ckUpload", method = RequestMethod.POST)
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		try {
			// 파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			// 이미지 경로 생성
			String path = "C:\\upload/";
			// String path =
			// request.getSession().getServletContext().getRealPath("/").concat("resources/ckupload/");
			System.out.println("upload path: " + path);

			String ckUploadPath = path + uid + "_" + fileName;
			File folder = new File(path);

			// 해당 디렉토리 확인
			if (!folder.exists()) {
				try {
					folder.mkdirs(); // 폴더 생성
				} catch (Exception e) {
					e.getStackTrace();
				}
			}

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

			String callback = request.getParameter("CKEditorFuncNum");
			printWriter = response.getWriter();
			String fileUrl = "/bbs/ckImgSubmit?uid=" + uid + "&fileName=" + fileName; // 작성화면

			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return;
	}

	// 서버로 전송
	@RequestMapping(value = "/bbs/ckImgSubmit")
	public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서버에 저장된 이미지 경로
		String path = "C:\\upload/";
		// String path =
		// request.getSession().getServletContext().getRealPath("/").concat("resources/ckupload/");

		String sDirPath = path + uid + "_" + fileName;
		File imgFile = new File(sDirPath);

		// 사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
		if (imgFile.isFile()) {
			byte[] buf = new byte[1024];
			int readByte = 0;
			int length = 0;
			byte[] imgBuf = null;

			FileInputStream fileInputStream = null;
			ByteArrayOutputStream outputStream = null;
			ServletOutputStream out = null;

			try {
				fileInputStream = new FileInputStream(imgFile);
				outputStream = new ByteArrayOutputStream();
				out = response.getOutputStream();

				while ((readByte = fileInputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, readByte);
				}

				imgBuf = outputStream.toByteArray();
				length = imgBuf.length;
				out.write(imgBuf, 0, length);
				out.flush();

			} catch (IOException e) {
				// logger.info(e);
			} finally {
				outputStream.close();
				fileInputStream.close();
				out.close();
			}
		}
	}

}
