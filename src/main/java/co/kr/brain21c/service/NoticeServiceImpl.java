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
	public int getNoticeTotalCount(String search_key) throws Exception {
		int totalCount = NoticeDao.selectNoticeTotalCount(search_key);
		return totalCount;
	}

	@Override
	public ArrayList<board> getNoticeList(Criteria criteria, String search_key) throws Exception {

		ArrayList<board> boardList = new ArrayList<board>();
		int boardTotalCount = NoticeDao.selectNoticeTotalCount(search_key);

		if (boardTotalCount > 0) {
			boardList = NoticeDao.getNoticeList(criteria, search_key);
		}

		return boardList;
	}

	@Override
	public board getNoticeView(int seq) throws Exception {
		board board = new board();
		board = NoticeDao.getNoticeView(seq);
		return board;
	}

}
