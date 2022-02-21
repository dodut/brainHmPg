package co.kr.brain21c.dao;

import java.util.ArrayList;

import co.kr.brain21c.dto.board;
import co.kr.brain21c.paging.Criteria;

public interface NoticeDao {
	

	int selectNoticeTotalCount(Criteria criteria);
	ArrayList<board> getNoticeList(Criteria criteria);

}
