package co.kr.brain21c.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import co.kr.brain21c.dto.admin;
import co.kr.brain21c.dto.board;
import co.kr.brain21c.dto.contact;
import co.kr.brain21c.dto.history;

@Repository("AdminDao")
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public ArrayList<history> getBoard() throws Exception {
		String sql = "SELECT * FROM history ORDER BY hisyear desc, hismonth desc";
		System.out.println(sql);

		List<history> testList = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(history.class));

		System.out.println(testList);

		testList.forEach(System.out::println);

		return (ArrayList<history>) testList;
	}

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
	public ArrayList<board> getMainNotic() {
		String sql = "SELECT LPAD(@num:=@num+1, '2', '0') as num, b.* FROM (SELECT @num:=0) A, (SELECT *, DATE_FORMAT(rgdtm, '%Y-%m-%d') AS subDate FROM board WHERE gnb = 'A01' ORDER BY rgdtm DESC LIMIT 4) B";
		System.out.println(sql);

		List<board> ntList = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(board.class));

		System.out.println(ntList);

		ntList.forEach(System.out::println);

		return (ArrayList<board>) ntList;
	}

	@Override
	public int insSignUp(admin member) {

		String sql = "INSERT INTO member VALUES(" + "'" + member.getUserid() + "', " + "'" + member.getUsername()
				+ "', " + "'" + member.getEmail() + "', " + "'" + member.getPassword() + "', " + "now(), now(), now())";

		System.out.println(sql);

		int result = jdbcTemplate.update(sql);

		return result;
	}

	@Override
	public ArrayList<admin> getLogin(admin member) {
		String sql = "SELECT * FROM member WHERE " + "userid = '" + member.getUserid() + "'";
		System.out.println(sql);

		List<admin> loginList = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(admin.class));

		System.out.println(loginList);

		loginList.forEach(System.out::println);

		return (ArrayList<admin>) loginList;
	}
	


	/*
	 * @Override public ArrayList<famFood> get_ResStore(Map menuMap) throws
	 * Exception{ String sql = "SELECT * FROM TB_STORE" + " WHERE STONO = " +
	 * menuMap.get("storeId"); List<famFood> foods = jdbcTemplate.query(sql,
	 * BeanPropertyRowMapper.newInstance(famFood.class));
	 * 
	 * //foods.forEach(System.out :: println);
	 * 
	 * return (ArrayList<famFood>) foods; }
	 * 
	 * @Override public ArrayList<famFood> getFood() throws Exception{ String sql =
	 * "SELECT A.STONO   " + "     , A.STONM    " + "     , A.STOTEL   " +
	 * "     , B.FDNO     " + "     , B.FDNM     " +
	 * "     , Replace(Convert(Varchar, Convert(Money, B.FDPRICE),112),'.00','') AS FDPRICE  "
	 * +
	 * "     , CASE WHEN B.FDOP_YN = 1 THEN '占쎈쐻占쎈윥占쎈㎍占쎈쐻占쎈윥占쎌몗占쎈쐻占쎈윥占쎈윫占쎈쐻占쎈윥占쎈㎍占쎈쐻占쎈윥占쎌몗占쎈쐻占쎈윪筌륁빢�삕占쎈쐪占쎈쐻占쎈짗占쎌굲占쎈쨨占쎈묄占쎌굲占쎄국�뜝�럩援뀐옙�쐻占쎈윥占쎈윫占쎈쐻占쎈윥占쎈㎍占쎈쐻占쎈윥占쎌몗占쎈쐻占쎈윪筌륁�λ쐻占쎈윥占쎈㎍占쎈쐻占쎈윥占쎌맽�뜝�럥�떛占쎈쐻�뜝占�' ELSE '占쎈쐻占쎈윪占쎌맚�뜝�럥�맶�뜝�럥�몷�뜝�럩�눁占쎈쐻占쎈윥占쎈열占쎈쐻占쎈윞占쎈㎝占쎌녇占쎄틓占쎈뮦�뜝�럩援꿰솾�꺂�뒧占쎈뮚�뜝�럥爾�占쎈쐻占쎈윞占쎈젇�뜝�럩�쐪占쎈쐻占쎈짗占쎌굲占쎈쨨占쎈묄占쎌굲占쎄국�뜝�럩援뀐옙�쐻占쎈윥占쎈윫占쎈쐻占쎈윥占쎈㎍占쎈쐻占쎈윥占쎌몗占쎈쐻占쎈윪筌륁�λ쐻占쎈윥占쎈㎍占쎈쐻占쎈윥占쎌맽�뜝�럥�떛占쎈쐻�뜝占�' END AS FDOP_YN   "
	 * //+ "     , B.FDIMG    " + "     , B.TIMG    " + "  FROM TB_STORE A " +
	 * "     , TB_FOOD  B " + " WHERE A.STONO = B.STONO " +
	 * " ORDER BY A.STONO ASC, B.FDNO "; List<famFood> foods =
	 * jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(famFood.class));
	 * 
	 * for(int i=0; i<foods.size(); i++) { if(foods.get(i).getTimg() != null) {
	 * byte[] bt = foods.get(i).getTimg(); String vimg = new String(
	 * Base64.encodeBase64(bt)); foods.get(i).setVimg(vimg); } }
	 * 
	 * return (ArrayList<famFood>) foods; }
	 * 
	 * @Override public ArrayList<famFood> getFood(Map menuMap) throws Exception {
	 * String sql = "SELECT A.STONO   " + "     , A.STONM    " +
	 * "     , A.STOTEL   " + "     , B.FDNO     " + "     , B.FDNM     " +
	 * "     , B.FDPRICE  " + "     , B.FDOP_YN   " + "     , B.TIMG    " +
	 * "  FROM TB_STORE A " + "     , TB_FOOD  B " + " WHERE A.STONO = B.STONO " +
	 * "   AND B.FDNO = " + menuMap.get("menuId") +
	 * " ORDER BY A.STONO ASC, B.FDNO ";
	 * 
	 * List<famFood> foods = jdbcTemplate.query(sql,
	 * BeanPropertyRowMapper.newInstance(famFood.class));
	 * 
	 * for(int i=0; i<foods.size(); i++) { if(foods.get(i).getTimg() != null) {
	 * byte[] bt = foods.get(i).getTimg(); String vimg = new String(
	 * Base64.encodeBase64(bt)); foods.get(i).setVimg(vimg); } }
	 * 
	 * return (ArrayList<famFood>) foods; }
	 * 
	 * @Override public ArrayList<famFood> get_ResFood(Map menuMap) throws
	 * Exception{ String sql = "SELECT A.STONO   " + "     , A.STONM    " +
	 * "     , A.STOTEL   " + "     , B.FDNO     " + "     , B.FDNM     " +
	 * "     , Replace(Convert(Varchar, Convert(Money, B.FDPRICE),112),'.00','') AS FDPRICE  "
	 * +
	 * "     , CASE WHEN B.FDOP_YN = 1 THEN '占쎈쐻占쎈윥占쎈㎍占쎈쐻占쎈윥占쎌몗占쎈쐻占쎈윥占쎈윫占쎈쐻占쎈윥占쎈㎍占쎈쐻占쎈윥占쎌몗占쎈쐻占쎈윪筌륁빢�삕占쎈쐪占쎈쐻占쎈짗占쎌굲占쎈쨨占쎈묄占쎌굲占쎄국�뜝�럩援뀐옙�쐻占쎈윥占쎈윫占쎈쐻占쎈윥占쎈㎍占쎈쐻占쎈윥占쎌몗占쎈쐻占쎈윪筌륁�λ쐻占쎈윥占쎈㎍占쎈쐻占쎈윥占쎌맽�뜝�럥�떛占쎈쐻�뜝占�' ELSE '占쎈쐻占쎈윪占쎌맚�뜝�럥�맶�뜝�럥�몷�뜝�럩�눁占쎈쐻占쎈윥占쎈열占쎈쐻占쎈윞占쎈㎝占쎌녇占쎄틓占쎈뮦�뜝�럩援꿰솾�꺂�뒧占쎈뮚�뜝�럥爾�占쎈쐻占쎈윞占쎈젇�뜝�럩�쐪占쎈쐻占쎈짗占쎌굲占쎈쨨占쎈묄占쎌굲占쎄국�뜝�럩援뀐옙�쐻占쎈윥占쎈윫占쎈쐻占쎈윥占쎈㎍占쎈쐻占쎈윥占쎌몗占쎈쐻占쎈윪筌륁�λ쐻占쎈윥占쎈㎍占쎈쐻占쎈윥占쎌맽�뜝�럥�떛占쎈쐻�뜝占�' END AS FDOP_YN   "
	 * //+ "     , B.FDIMG    " + "     , B.TIMG    " + "  FROM TB_STORE A " +
	 * "     , TB_FOOD  B " + " WHERE A.STONO = B.STONO " + "   AND A.STONO = " +
	 * menuMap.get("storeId") + " ORDER BY A.STONO ASC, B.FDNO "; List<famFood>
	 * foods = jdbcTemplate.query(sql,
	 * BeanPropertyRowMapper.newInstance(famFood.class));
	 * 
	 * for(int i=0; i<foods.size(); i++) { if(foods.get(i).getTimg() != null) {
	 * byte[] bt = foods.get(i).getTimg(); String vimg = new String(
	 * Base64.encodeBase64(bt)); foods.get(i).setVimg(vimg); } }
	 * 
	 * return (ArrayList<famFood>) foods; }
	 * 
	 * @Override public ArrayList<famFood> get_ResFood2(Map menuMap) throws
	 * Exception { String sql = "SELECT A.STONO   " + "     , A.STONM    " +
	 * "     , A.STOTEL   " + "     , B.FDNO     " + "     , B.FDNM     " +
	 * "     , B.FDPRICE  " + "     , B.FDOP_YN   " + "     , B.TIMG    " +
	 * "  FROM TB_STORE A " + "     , TB_FOOD  B " + " WHERE A.STONO = B.STONO " +
	 * "   AND B.FDNO = " + menuMap.get("menuId") +
	 * " ORDER BY A.STONO ASC, B.FDNO ";
	 * 
	 * List<famFood> foods = jdbcTemplate.query(sql,
	 * BeanPropertyRowMapper.newInstance(famFood.class));
	 * 
	 * for(int i=0; i<foods.size(); i++) { if(foods.get(i).getTimg() != null) {
	 * byte[] bt = foods.get(i).getTimg(); String vimg = new String(
	 * Base64.encodeBase64(bt)); foods.get(i).setVimg(vimg); } }
	 * 
	 * return (ArrayList<famFood>) foods; }
	 * 
	 * @Override public ArrayList<famFood> get_FoodList(Map menuMap) throws
	 * Exception{ String sql = " SELECT A.ORDNO      \r\n" +
	 * " 	    , A.FDNO       \r\n" + " 	    , A.ORDCNT     \r\n" +
	 * " 	    , B.FDNM       \r\n" +
	 * " 	    , CONVERT(VARCHAR,A.RG_DT,120) AS RG_DT  \r\n" +
	 * " 	    , CONVERT(VARCHAR,A.UD_DT,120) AS UD_DT  \r\n" +
	 * " 	 FROM TB_ORDER A, TB_FOOD B                  \r\n" +
	 * " 	WHERE A.FDNO = B.FDNO                        \r\n" +
	 * "       AND B.STONO = " + menuMap.get("stono") + "\r\n" +
	 * "     ORDER BY RG_DT DESC ";
	 * 
	 * List<famFood> foods = jdbcTemplate.query(sql,
	 * BeanPropertyRowMapper.newInstance(famFood.class));
	 * 
	 * //foods.forEach(System.out :: println);
	 * 
	 * return (ArrayList<famFood>) foods; }
	 * 
	 * 
	 * @Override public ArrayList<famFood> get_FoodList_Search(Map menuMap) throws
	 * Exception{ String sql = " SELECT A.ORDNO      \r\n" +
	 * " 	    , A.FDNO       \r\n" + " 	    , A.ORDCNT     \r\n" +
	 * " 	    , B.FDNM       \r\n" +
	 * " 	    , CONVERT(VARCHAR,A.RG_DT,120) AS RG_DT  \r\n" +
	 * " 	    , CONVERT(VARCHAR,A.UD_DT,120) AS UD_DT  \r\n" +
	 * " 	 FROM TB_ORDER A, TB_FOOD B                  \r\n" +
	 * " 	WHERE A.FDNO = B.FDNO                        \r\n" +
	 * "       AND B.STONO = " + menuMap.get("stono") + "\r\n" +
	 * "       AND CONVERT(char(10),A.RG_DT,120) = CONVERT(char(10),'" +
	 * menuMap.get("pDate") + "',120) \r\n" + "     ORDER BY RG_DT DESC ";
	 * 
	 * List<famFood> foods = jdbcTemplate.query(sql,
	 * BeanPropertyRowMapper.newInstance(famFood.class));
	 * 
	 * //foods.forEach(System.out :: println);
	 * 
	 * return (ArrayList<famFood>) foods; }
	 * 
	 * @Override public int setStore_Ins(Map storeMap) throws Exception { String sql
	 * =
	 * "INSERT INTO TB_STORE(stono, stonm, stotel) VALUES ((select isnull(max(stono)+1,1) from tb_store), ?, ?)"
	 * ; jdbcTemplate.update(sql, storeMap.get("storeName") ,
	 * storeMap.get("storeTel"));
	 * 
	 * return 0; }
	 * 
	 * @Override public int setStore_Upd(Map storeMap) throws Exception { //String
	 * sql = "UPDATE TB_STORE SET stonm = ?, stoopyn = ? WHERE stono = ? "; String
	 * sql = "UPDATE TB_STORE SET stonm = ?, stotel = ? WHERE stono = ? ";
	 * jdbcTemplate.update(sql, storeMap.get("sName") //, storeMap.get("sYn") ,
	 * storeMap.get("sTel") , storeMap.get("sId"));
	 * 
	 * return 0; }
	 * 
	 * @Override public int setMenu_Ins(Map MenuMap) throws Exception {
	 * 
	 * String sql =
	 * "INSERT INTO TB_FOOD(fdno, fddiv, fdnm, fdprice, fdop_yn, stono, timg) VALUES "
	 * + " ((select isnull(max(fdno)+1,1) from tb_food), 1, ?, ?, '1', ?, ?)";
	 * jdbcTemplate.update(sql, MenuMap.get("menuName") , MenuMap.get("menuPrice") ,
	 * MenuMap.get("selectStore") , MenuMap.get("menuImage"));
	 * 
	 * //System.out.println("!!"+MenuMap.get("menuImage")+"!!");
	 * 
	 * // String sql =
	 * "INSERT INTO TB_FOOD(fdno, fdnm, fdprice, fdopyn, stono) VALUES ((select max(fdno)+1 from tb_food), ?, ?, '1', ?)"
	 * ; // jdbcTemplate.update(sql, MenuMap.get("menuName") // ,
	 * MenuMap.get("menuPrice") // , MenuMap.get("selectStore"));
	 * 
	 * return 0; }
	 * 
	 * @Override public int setMenu_Upd(Map MenuMap) throws Exception { String sql =
	 * "";
	 * 
	 * if(!MenuMap.get("mSize").toString().equals("0")) { sql =
	 * "UPDATE TB_FOOD SET fdnm = ?, fdprice = ?, fdop_yn = ?, timg = ? WHERE fdno = ? "
	 * ; jdbcTemplate.update(sql, MenuMap.get("mName") , MenuMap.get("mPrice") ,
	 * MenuMap.get("mYn") , MenuMap.get("mImage") , MenuMap.get("mNo")); } else {
	 * sql =
	 * "UPDATE TB_FOOD SET fdnm = ?, fdprice = ?, fdop_yn = ? WHERE fdno = ? ";
	 * jdbcTemplate.update(sql, MenuMap.get("mName") , MenuMap.get("mPrice") ,
	 * MenuMap.get("mYn") , MenuMap.get("mNo")); }
	 * 
	 * return 0; }
	 * 
	 * @Override public int setMenu_Del(Map MenuMap) throws Exception { String sql =
	 * "DELETE FROM TB_FOOD WHERE fdno = ? "; jdbcTemplate.update(sql,
	 * MenuMap.get("mNo"));
	 * 
	 * return 0; }
	 * 
	 * @Override public ArrayList<famQR> getQR() throws Exception{ //String sql =
	 * "SELECT QR_SEQ, QR_DIV, QR_CODE, QR_IMG FROM TB_QR"; String sql =
	 * "SELECT QRNO, DIV, URL, QIMG FROM TB_QR"; List<famQR> qrs =
	 * jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(famQR.class));
	 * 
	 * //sqrs.forEach(System.out :: println);
	 * 
	 * return (ArrayList<famQR>) qrs; }
	 * 
	 * @Override public int setQR_Ins(Map qrMap) throws Exception { //String sql =
	 * "INSERT INTO TB_QR(qr_seq, qr_div, qr_code, qr_img) VALUES ((select isnull(max(qr_seq)+1,1) from tb_qr), ?, ?, ?)"
	 * ; String sql =
	 * "INSERT INTO TB_QR(qrno, div, url, qimg) VALUES ((select isnull(max(qrno)+1,1) from tb_qr), ?, ?, ?)"
	 * ;
	 * 
	 * // System.out.println(qrMap.get("sYn")); //
	 * System.out.println(qrMap.get("sUrl")); //
	 * System.out.println(qrMap.get("sImg"));
	 * 
	 * jdbcTemplate.update(sql, qrMap.get("sYn") , qrMap.get("sUrl") ,
	 * qrMap.get("sImg"));
	 * 
	 * //System.out.println("!!"+MenuMap.get("menuImage")+"!!");
	 * 
	 * // String sql =
	 * "INSERT INTO TB_FOOD(fdno, fdnm, fdprice, fdopyn, stono) VALUES ((select max(fdno)+1 from tb_food), ?, ?, '1', ?)"
	 * ; // jdbcTemplate.update(sql, MenuMap.get("menuName") // ,
	 * MenuMap.get("menuPrice") // , MenuMap.get("selectStore"));
	 * 
	 * return 0; }
	 */
}