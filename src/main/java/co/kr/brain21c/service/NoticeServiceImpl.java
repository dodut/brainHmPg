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
	private NoticeDao noticeDao;

	@Override
	public int getNoticeTotalCount(String search_key) throws Exception {
		int totalCount = noticeDao.selectNoticeTotalCount(search_key);
		return totalCount;
	}

	@Override
	public ArrayList<board> getNoticeList(Criteria criteria, String search_key) throws Exception {

		ArrayList<board> boardList = new ArrayList<board>();
		int boardTotalCount = noticeDao.selectNoticeTotalCount(search_key);

		if (boardTotalCount > 0) {
			boardList = noticeDao.getNoticeList(criteria, search_key);
		}

		return boardList;
	}

	@Override
	public board getNoticeView(int seq) throws Exception {
		board board = new board();
		board = noticeDao.getNoticeView(seq);
		return board;
	}

	@Override
	public void updateHitCount(int seq) throws Exception {
		noticeDao.updateHitCount(seq);
	}

}
