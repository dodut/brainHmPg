package co.kr.brain21c.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import co.kr.brain21c.dto.board;
import co.kr.brain21c.paging.Criteria;

@Repository("NoticeDao")
public class NoticeDaoImpl implements NoticeDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	@Override
	public int selectNoticeTotalCount(Criteria criteria) {
		String sql = "SELECT COUNT(*) FROM board WHERE gnb = 'A01'";
		
		int count = jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(Integer.class));
		
		return count;
	}

	@Override
	public ArrayList<board> getNoticeList(Criteria criteria) {
		String sql = "SELECT * FROM board WHERE gnb = 'A01' ORDER BY seq DESC LIMIT #{startPage}, #{recordsPerPage}";
		
		List<board> nList = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(board.class));
		//System.out.println(nList);
		
		nList.forEach(System.out :: println);
		
		return (ArrayList<board>) nList;
	}

}
