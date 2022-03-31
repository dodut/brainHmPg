package co.kr.brain21c.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.brain21c.dao.AdminHistoryDao;
import co.kr.brain21c.dto.history;
import co.kr.brain21c.paging.Criteria;

@Service("AdminHistoryService")
public class AdminHistoryServiceImpl implements AdminHistoryService {

	@Autowired
	private AdminHistoryDao AdminHistoryDao;
	

	public ArrayList<history> getBoard() throws Exception{
		return AdminHistoryDao.getBoard();
	}


	@Override
	public int getHistoryTotalCount() throws Exception {
		
		int totalCount = AdminHistoryDao.getHistoryTotalCount();
		
		return totalCount;
	}
	
	
	@Override
	public ArrayList<history> getHistoryList(Criteria criteria) throws Exception {
		
		ArrayList<history> historyList = new ArrayList<history>();
		int totalCount = AdminHistoryDao.getHistoryTotalCount();
		
		if (totalCount > 0) {
			historyList = AdminHistoryDao.getHistory(criteria);
		}
		
		return historyList;
	}


	@Override
	public void updateOrd(List<String> seqList, List<String> ordList) {
		AdminHistoryDao.updateOrd(seqList, ordList);
	}


	@Override
	public int insertHistory(history hisData) {
		
		int result = AdminHistoryDao.insertHistory(hisData);
		
		return result;
	}
	

	@Override
	public ArrayList<history> getHistoryBySeq(String hisseq) {
		return AdminHistoryDao.getHistoryBySeq(hisseq);
	}

	@Override
	public int updateHistory(String hisseq, history updateData) {
		
		int result = AdminHistoryDao.updateHistory(hisseq, updateData);
		
		return result;
	}

	
	@Override
	public int deleteHistory(String hisseq) {
		
		int result = AdminHistoryDao.deleteHistory(hisseq);
		
		return result;
	}



	
}
