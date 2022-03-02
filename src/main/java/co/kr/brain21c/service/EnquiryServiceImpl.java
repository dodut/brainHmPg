package co.kr.brain21c.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.brain21c.dao.EnquiryDao;
import co.kr.brain21c.dto.board;

@Service("EnquiryService")
public class EnquiryServiceImpl implements EnquiryService {
	
	@Autowired
	private EnquiryDao enquiryDao;
	
	@Override
	public ArrayList<board> getEnquiry() throws Exception {
		
		return enquiryDao.getEnquiryList();
		
	}
}
