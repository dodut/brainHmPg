package co.kr.brain21c.service;

import java.util.ArrayList;

import co.kr.brain21c.dto.board;
import co.kr.brain21c.paging.Criteria;

public interface NoticeService {
	
	ArrayList<board> getNoticeList(Criteria criteria);

}
