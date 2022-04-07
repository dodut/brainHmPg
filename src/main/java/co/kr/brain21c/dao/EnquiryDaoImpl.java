package co.kr.brain21c.dao;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import co.kr.brain21c.dto.board;
import co.kr.brain21c.paging.Criteria;

@Repository("EnquiryDao")
public class EnquiryDaoImpl implements EnquiryDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int getTotalCount(String search_key) throws Exception {

		String sql = "SELECT COUNT(*) FROM board WHERE gnb='A02'";
		if (search_key != null) {
			sql += "AND title LIKE '%" + search_key + "%' ";
		}

		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}

	@Override
	public ArrayList<board> getEnquiryList(Criteria criteria, String search_key) throws Exception {

		int startPage = (criteria.getCurrentPageNo() - 1) * criteria.getRecordsPerPage();
		String sql = "";

		if (search_key != null) {
			sql = "SELECT CAST(@num:=@num-1 AS CHAR) as num,  DATE_FORMAT(B.rgdtm, '%Y-%m-%d') AS subDate, B.* "
					+ "FROM (SELECT @num:=(SELECT COUNT(*)+1 FROM board WHERE gnb='A02')) A, board B "
					+ "WHERE B.gnb = 'A02'  AND B.title LIKE '%" + search_key + "%' "
					+ "ORDER BY B.grpno DESC, grpord ASC " + "LIMIT " + startPage + ", " + criteria.getRecordsPerPage();
		} else {
			sql = "SELECT CAST(@num:=@num-1 AS CHAR) as num,  DATE_FORMAT(B.rgdtm, '%Y-%m-%d') AS subDate, B.* "
					+ "FROM (SELECT @num:=(SELECT COUNT(*)+1 FROM board WHERE gnb='A02')) A, board B"
					+ "WHERE B.gnb = 'A02' " + "ORDER BY B.grpno DESC, grpord ASC " + "LIMIT " + startPage + ", "
					+ criteria.getRecordsPerPage();
		}

		List<board> nList = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(board.class));
		return (ArrayList<board>) nList;
	}

	@Override
	public boolean checkPwProc(int seq, String passwd) throws Exception {
		boolean result;
		String sql = "SELECT * " + "FROM board " + "WHERE gnb='A02' and seq =" + seq;
		List<board> nList = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(board.class));

		board board = new board();
		board = nList.get(0);

		if (board.getBdpw().equals(passwd)) {
			result = true;
		} else {
			result = false;
		}

		return result;
	}

	@Override
	public void updateHitCount(int seq) throws Exception { // 조회수 증가
		String sql = "UPDATE board SET hits = hits + 1 WHERE seq='" + seq + "'";

		int result = jdbcTemplate.update(sql);
		// System.out.println("조회수 update 결과 : " + result);
	}

	@Override
	public board getEnquiryView(int seq) throws Exception {
		String sql = "SELECT * FROM board WHERE gnb = 'A02' and seq='" + seq + "'";

		List<board> nList = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(board.class));

		return nList.get(0);
	}

	@Override
	public int getArticleSeq(int grpno, int grpord) throws Exception {
		String sql = "SELECT seq FROM board WHERE gnb = 'A02' and grpno =" + grpno + " and grpord =" + grpord;

		try {
			return jdbcTemplate.queryForObject(sql, Integer.class);

		} catch (EmptyResultDataAccessException e) {
			// EmptyResultDataAccessException 예외 발생시 null 리턴
			return 0;
		}
	}

	@Override
	public int writeProc(board board) throws Exception {

		String board_code = "A02";
		int grpord = 1; 	// 1로 고정
		int grpno = this.getMaxGrpno() + 1;

		System.out.println("EnquiryDao board : " + board.toString());

		String sql = "INSERT INTO board (gnb, grpno, grpord,  title, cntn, rgwriter, bdpw, rgdtm) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		int result = jdbcTemplate.update(sql, board_code, grpno, grpord, board.getTitle(), board.getCntn(),
				board.getRgwriter(), board.getBdpw(), Timestamp.valueOf(LocalDateTime.now()));

		System.out.println("result : " + result);

		return result;
	}

	@Override
	public int getMaxGrpno() throws Exception {

		String max_select_sql = "SELECT max(grpno) FROM board WHERE gnb = 'A02' ";

		int maxGrpno = jdbcTemplate.queryForObject(max_select_sql, Integer.class);

		return maxGrpno;
	}

}
