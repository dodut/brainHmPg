package co.kr.brain21c.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.brain21c.dao.EnquiryDao;
import co.kr.brain21c.dto.board;
import co.kr.brain21c.paging.Criteria;

@Service("EnquiryService")
public class EnquiryServiceImpl implements EnquiryService {
	
	@Autowired
	private EnquiryDao enquiryDao;
	
	@Override
	public ArrayList<board> getEnquiryList(Criteria criteria, String search_key) throws Exception {
		
		return enquiryDao.getEnquiryList(criteria, search_key);
		
	}

	@Override
	public int getTotalCount(String search_key) throws Exception {
		int totalCount = enquiryDao.getTotalCount(search_key);
		return totalCount;
	}

	@Override
	public boolean checkPwProc(int seq, String passwd) throws Exception {
		boolean result = enquiryDao.checkPwProc(seq, passwd);
		return result;
	}

	@Override
	public void updateHitCount(int seq) throws Exception {
		enquiryDao.updateHitCount(seq);
		
	}

	@Override
	public board getEnquiryView(int seq) throws Exception {
		board board = new board();
		board = enquiryDao.getEnquiryView(seq);
		return board;
	}

	@Override
	public int getArticleSeq(int grpno, int grpord) throws Exception {
		int result = enquiryDao.getArticleSeq(grpno, grpord);
		return result;
	}

	@Override
	public int writeProc(board board) throws Exception {
		int result = enquiryDao.writeProc(board);
		return result;
	}
}
