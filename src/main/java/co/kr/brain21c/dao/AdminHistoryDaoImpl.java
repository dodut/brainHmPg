package co.kr.brain21c.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import co.kr.brain21c.dto.history;
import co.kr.brain21c.paging.Criteria;

@Repository("AdminHistoryDao")
public class AdminHistoryDaoImpl implements AdminHistoryDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public ArrayList<history> getBoard() throws Exception{				
		String sql = "SELECT * FROM history ORDER BY hisord DESC, hisyear DESC, hismonth DESC";
		System.out.println(sql);
		
		List<history> testList = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(history.class));		
		
//		System.out.println(testList);
		
//		testList.forEach(System.out :: println);
		
		return (ArrayList<history>) testList;
	}

	
	@Override
	public int getHistoryTotalCount() throws Exception {
		
		String sql = "SELECT COUNT(*) FROM history";
		
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		
		return count;
	}
	
	
	@Override
	public ArrayList<history> getHistory(Criteria criteria) throws Exception {
		
		int startPage = (criteria.getCurrentPageNo() - 1) * criteria.getRecordsPerPage();
		
		String sql = "SELECT * FROM history ORDER BY hisord DESC, hisyear DESC, hismonth DESC LIMIT " 
					+ startPage + ", " + criteria.getRecordsPerPage();
		System.out.println(sql);
		
		List<history> hList = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(history.class));
		
		return (ArrayList<history>) hList;
	}


	@Override
	public void updateOrd(List<String> seqList, List<String> ordList) {
		
		for(int i=0; i<seqList.size(); i++) {
			String sql = "UPDATE history "
					+ "SET hisord = '" + ordList.get(i) + "' "
					+ "WHERE seq = '" + seqList.get(i) + "'"
					;
				
			System.out.println(sql);
			jdbcTemplate.update(sql);
		}
	}


	@Override
	public int insertHistory(history hisData) {
		
		String sql = "INSERT INTO history (hisyear, hismonth, hiscntn, rgdtm) VALUES ("
				+ "'" + hisData.getHisyear() + "', "
				+ "'" + hisData.getHismonth() + "', "
				+ "'" + hisData.getHiscntn() + "', "
				+ "'" + hisData.getRgdtm() + "')"
				;
				
		System.out.println(sql);
		
		int result = jdbcTemplate.update(sql);
		
		return result;
	}


	@Override
	public ArrayList<history> getHistoryBySeq(String hisseq) {
		String sql = "SELECT * FROM history WHERE seq = " + hisseq ;
		System.out.println(sql);
		
		List<history> hisList = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(history.class));		
		
		System.out.println(hisList);
		
		return (ArrayList<history>) hisList;
	}
	

	@Override
	public int updateHistory(String hisseq, history updateData) {
		
		String sql = "UPDATE history SET hisyear = '"	 + updateData.getHisyear() + "', "
									   + "hismonth = '"	 + updateData.getHismonth() + "', "
									   + "hiscntn = '" 	 + updateData.getHiscntn() + "', "
									   + "rgdtm = '"	 + updateData.getRgdtm() + "' "
					+ "WHERE seq = '" + hisseq + "'"
					;
		
		System.out.println(sql);
		
		int result = jdbcTemplate.update(sql);
		
		return result;
	}
	
	
	@Override
	public int deleteHistory(String hisseq) {
		String sql = "DELETE FROM history WHERE seq = '" + hisseq + "'";
		
		System.out.println(sql);
		
		int result = jdbcTemplate.update(sql);
		
		return result;
		
	}





	
	
}
