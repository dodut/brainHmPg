package co.kr.brain21c.service;

import java.util.ArrayList;

import co.kr.brain21c.dto.admin;
import co.kr.brain21c.dto.board;

public interface AdminService{
	
	ArrayList<board> getMainNotic();
	ArrayList<admin> getLogin(admin member);
	
	int insSignUp(admin member);
	

	
	/*
	ArrayList<famFood> getStore() throws Exception;	
	ArrayList<famFood> getFood() throws Exception;
	ArrayList<famFood> getFood(Map menuMap) throws Exception;
	ArrayList<famFood> get_ResStore(Map menuMap) throws Exception;
	ArrayList<famFood> get_ResFood(Map menuMap) throws Exception;
	ArrayList<famFood> get_ResFood2(Map menuMap) throws Exception;
	ArrayList<famFood> get_FoodList(Map menuMap) throws Exception;
	ArrayList<famFood> get_FoodList_Search(Map menuMap) throws Exception;  
	
	ArrayList<famQR> getQR() throws Exception;
	int setStore_Ins(Map map) throws Exception;
	int setStore_Upd(Map map) throws Exception;
	int setMenu_Ins(Map map) throws Exception;
	int setMenu_Upd(Map map) throws Exception;
	int setMenu_Del(Map map) throws Exception;
	int setQR_Ins(Map qrMap) throws Exception;
	*/
}
