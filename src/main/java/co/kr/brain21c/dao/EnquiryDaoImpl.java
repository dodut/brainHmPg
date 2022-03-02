package co.kr.brain21c.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import co.kr.brain21c.dto.board;

@Repository("EnquiryDao")
public class EnquiryDaoImpl  implements EnquiryDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public ArrayList<board> getEnquiryList() throws Exception {
		String sql = "SELECT CAST(@num:=@num-1 AS CHAR) as num,  DATE_FORMAT(B.rgdtm, '%Y-%m-%d') AS subDate, B.* FROM (SELECT @num:=(SELECT COUNT(*)+1 FROM board WHERE gnb='A02')) A, board B WHERE B.gnb = 'A02' ORDER BY grpno DESC, grpord LIMIT 15";
		System.out.println(sql);
		
		List<board> nList = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(board.class));
		
		nList.forEach(System.out :: println);
		
		return (ArrayList<board>) nList;
	}
}
