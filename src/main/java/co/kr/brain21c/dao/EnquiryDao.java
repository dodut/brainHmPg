package co.kr.brain21c.dao;

import java.util.ArrayList;

import co.kr.brain21c.dto.board;

public interface EnquiryDao {
	ArrayList<board> getEnquiryList() throws Exception;
}
