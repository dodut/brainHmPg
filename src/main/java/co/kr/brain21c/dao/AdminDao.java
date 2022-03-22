package co.kr.brain21c.dao;

import java.util.ArrayList;

import co.kr.brain21c.dto.admin;
import co.kr.brain21c.dto.board;
import co.kr.brain21c.dto.contact;
import co.kr.brain21c.dto.history;


public interface AdminDao{

	ArrayList<history> getBoard() throws Exception;
	ArrayList<contact> getContact();
	ArrayList<board> getMainNotic();
	
	ArrayList<admin> getLogin(admin member);
	
	int insSignUp(admin member);

}
