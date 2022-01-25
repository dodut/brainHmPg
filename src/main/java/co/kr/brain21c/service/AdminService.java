package co.kr.brain21c.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import co.kr.brain21c.dto.*;

public interface AdminService{
	
	ArrayList<history> getBoard() throws Exception;

	//ArrayList<contact> getContact() throws Exception;

	ArrayList<contact> getContact();
	
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
