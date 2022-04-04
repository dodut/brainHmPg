package co.kr.brain21c.dao;

import java.util.ArrayList;
import java.util.List;

import co.kr.brain21c.dto.history;
import co.kr.brain21c.paging.Criteria;

public interface AdminHistoryDao {

	ArrayList<history> getBoard() throws Exception;

	int getHistoryTotalCount() throws Exception;
	ArrayList<history> getHistory(Criteria criteria) throws Exception;

	void updateOrd(List<String> seqList, List<String> ordList);
	int insertHistory(history hisData);
	ArrayList<history> getHistoryBySeq(String hisseq);
	int updateHistory(String hisseq, history updateData);
	int deleteHistory(String hisseq);

}
