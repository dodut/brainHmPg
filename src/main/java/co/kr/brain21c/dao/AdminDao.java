package co.kr.brain21c.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import co.kr.brain21c.dto.*;


public interface AdminDao{

	ArrayList<history> getBoard() throws Exception;
	
	//ArrayList<contact> getContact() throws Exception;
/*
	ArrayList<famFood> getFood() throws Exception;
	ArrayList<famFood> getFood(Map menuMap) throws Exception;
	ArrayList<famFood> get_ResStore(Map menuMap) throws Exception;
	ArrayList<famFood> get_ResFood(Map menuMap) throws Exception;
	ArrayList<famFood> get_ResFood2(Map menuMap) throws Exception;
	ArrayList<famFood> get_FoodList(Map menuMap) throws Exception;
	ArrayList<famFood> get_FoodList_Search(Map menuMap) throws Exception;  
	
	ArrayList<famQR> getQR() throws Exception;;
	int setStore_Ins(Map map) throws Exception;
	int setStore_Upd(Map map) throws Exception;
	int setMenu_Ins(Map map) throws Exception;
	int setMenu_Upd(Map map) throws Exception;
	int setMenu_Del(Map MenuMap) throws Exception;
	int setQR_Ins(Map MenuMap) throws Exception;
*/

	ArrayList<contact> getContact();


}
