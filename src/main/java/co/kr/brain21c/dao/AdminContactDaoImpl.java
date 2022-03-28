package co.kr.brain21c.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import co.kr.brain21c.dto.contact;

@Repository("AdminContactDao")
public class AdminContactDaoImpl implements AdminContactDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public ArrayList<contact> getContact() {
		String sql = "SELECT * FROM contact ORDER BY ctord, ctseq asc";
		System.out.println(sql);
		
		List<contact> ctList = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(contact.class));				
		//System.out.println(ctList);
		
		//ctList.forEach(System.out :: println);
		
		return (ArrayList<contact>) ctList;
	}


	@Override
	public void updateOrd(List<String> seqList, List<String> ordList) {
		
		for(int i=0; i<seqList.size(); i++) {
			String sql = "UPDATE contact "
						+ "SET ctord = '" + ordList.get(i) + "' "
						+ "WHERE ctseq = '" + seqList.get(i) + "'"
						;
					
			System.out.println(sql);
			jdbcTemplate.update(sql);
		}
	}
	
	@Override
	public int insertContact(contact insertData) {
		
		String sql = "INSERT INTO contact(ctpart, ctchr, ctphone, ctmail) VALUES ("
		+ "'" + insertData.getCtpart() + "', "
		+ "'" + insertData.getCtchr() + "', "
		+ "'" + insertData.getCtphone() + "', "
		+ "'" + insertData.getCtmail() + "')"
		;
		
		System.out.println(sql);
		
		int result = jdbcTemplate.update(sql);
		
		return result;
	}


	@Override
	public ArrayList<contact> getContactBySeq(String ctseq) {

		String sql = "SELECT * FROM contact WHERE ctseq = " + ctseq;
		System.out.println(sql);
		
		List<contact> ctList = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(contact.class));
//		System.out.println(ctList);
		
		return (ArrayList<contact>) ctList;
	}


	@Override
	public int updateContact(String ctseq, contact updateData) {
		
		String sql = "UPDATE contact SET ctpart = '"	 + updateData.getCtpart() + "', "
									   + "ctchr = '"	 + updateData.getCtchr() + "', "
									   + "ctphone = '" 	 + updateData.getCtphone() + "', "
									   + "ctmail = '"	 + updateData.getCtmail() + "' "
					+ "WHERE ctseq = '" + ctseq + "'"
					;
		
		System.out.println(sql);
		
		int result = jdbcTemplate.update(sql);
		
		return result;
		
	}


	@Override
	public int deleteContact(String ctseq) {
		
		String sql = "DELETE FROM contact WHERE ctseq = '" + ctseq + "'" ;
		
		System.out.println(sql);
		
		int result = jdbcTemplate.update(sql);
		
		return result;
	}


}
