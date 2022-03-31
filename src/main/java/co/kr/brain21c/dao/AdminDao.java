package co.kr.brain21c.dao;

import java.util.ArrayList;

import co.kr.brain21c.dto.admin;
import co.kr.brain21c.dto.board;


public interface AdminDao{

	ArrayList<board> getMainNotic();
	
	ArrayList<admin> getLogin(admin member);
	
	int insSignUp(admin member);
	

}
