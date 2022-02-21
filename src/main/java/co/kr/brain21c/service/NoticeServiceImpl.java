package co.kr.brain21c.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.brain21c.dao.NoticeDao;
import co.kr.brain21c.dto.board;
import co.kr.brain21c.paging.Criteria;


@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao NoticeDao;
	
	@Override
	public ArrayList<board> getNoticeList(Criteria criteria) {
		ArrayList<board> boardList = new ArrayList<board>();
		
		int boardTotalCount = NoticeDao.selectNoticeTotalCount(criteria);
		
		if (boardTotalCount > 0) {
			boardList = NoticeDao.getNoticeList(criteria);
		}
		
		return boardList;
	}

}
