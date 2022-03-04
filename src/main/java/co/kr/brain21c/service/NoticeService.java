package co.kr.brain21c.service;

import java.util.ArrayList;

import co.kr.brain21c.dto.board;
import co.kr.brain21c.paging.Criteria;

public interface NoticeService {

	public int getNoticeTotalCount(String search_key) throws Exception;

	public ArrayList<board> getNoticeList(Criteria criteria, String search_key) throws Exception;

	public board getNoticeView(int seq) throws Exception;
}
