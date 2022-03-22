package co.kr.brain21c.dao;

import java.util.ArrayList;

import co.kr.brain21c.dto.board;
import co.kr.brain21c.paging.Criteria;

public interface EnquiryDao {
	public ArrayList<board> getEnquiryList(Criteria criteria, String search_key) throws Exception;

	public int getTotalCount(String search_key) throws Exception;

	public boolean checkPwProc(int seq, String passwd) throws Exception;

	public void updateHitCount(int seq) throws Exception;

	public board getEnquiryView(int seq) throws Exception;

	public int getArticleSeq(int grpno, int grpord) throws Exception;

	public int writeProc(board board) throws Exception;

	public int getMaxGrpno() throws Exception;
}
