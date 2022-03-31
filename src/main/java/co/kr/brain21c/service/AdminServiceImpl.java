package co.kr.brain21c.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.brain21c.dao.AdminDao;
import co.kr.brain21c.dto.admin;
import co.kr.brain21c.dto.board;


@Service("AdminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao AdminDao;

	@Override
	public ArrayList<board> getMainNotic() {
		ArrayList<board> noticList = new ArrayList<board>();
		noticList = AdminDao.getMainNotic();
		return noticList;
	}
	
	@Override
	public ArrayList<admin> getLogin(admin member) {
		ArrayList<admin> loginList = new ArrayList<admin>();
		loginList = AdminDao.getLogin(member);
		return loginList;
	}
	
	@Override
	public int insSignUp(admin member) {
		int result = AdminDao.insSignUp(member);
		return result;
	}

	

	
	/*
	
	
	
	@Override
	public ArrayList<famFood> get_ResStore(Map menuMap) throws Exception{
		return AdminDao.get_ResStore(menuMap);
	}
	
	@Override
	public ArrayList<famFood> getFood() throws Exception{
		return AdminDao.getFood();
	}
	
	@Override
	public ArrayList<famFood> getFood(Map menuMap) throws Exception{
		return AdminDao.getFood(menuMap);
	}	
	@Override
	public ArrayList<famFood> get_ResFood(Map menuMap) throws Exception{
		return AdminDao.get_ResFood(menuMap);
	}
	
	@Override
	public ArrayList<famFood> get_ResFood2(Map menuMap) throws Exception{
		return AdminDao.get_ResFood2(menuMap);
	}	
	
	@Override
	public ArrayList<famFood> get_FoodList(Map menuMap) throws Exception {
		// TODO Auto-generated method stub
		return AdminDao.get_FoodList(menuMap); 
	}
	
	
	@Override
	public ArrayList<famFood> get_FoodList_Search(Map menuMap) throws Exception {
		// TODO Auto-generated method stub
		return AdminDao.get_FoodList_Search(menuMap);   
	}	
	public int setStore_Ins(Map storeMap) throws Exception{
		// TODO Auto-generated method stub
		int result = AdminDao.setStore_Ins(storeMap);
		return result;
	}
	
	public int setStore_Upd(Map storeMap) throws Exception{
		// TODO Auto-generated method stub
		int result = AdminDao.setStore_Upd(storeMap);
		return result;
	}	
	
	public int setMenu_Ins(Map menuMap) throws Exception{
		// TODO Auto-generated method stub
		int result = AdminDao.setMenu_Ins(menuMap);
		return result;
	}
	
	public int setMenu_Upd(Map menuMap) throws Exception{
		// TODO Auto-generated method stub
		int result = AdminDao.setMenu_Upd(menuMap);
		return result;
	}	
	
	public int setMenu_Del(Map menuMap) throws Exception{
		// TODO Auto-generated method stub
		int result = AdminDao.setMenu_Del(menuMap);
		return result;
	}
	
	@Override
	public ArrayList<famQR> getQR() throws Exception{
		return AdminDao.getQR();
	}
	
	public int setQR_Ins(Map qrMap) throws Exception{
		// TODO Auto-generated method stub
		int result = AdminDao.setQR_Ins(qrMap);
		return result;
	}
	*/
}