package co.kr.brain21c.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.brain21c.dao.AdminContactDao;
import co.kr.brain21c.dto.contact;


@Service("AdminContactService")
public class AdminContactServiceImpl implements AdminContactService{
	
	@Autowired
	private AdminContactDao AdminContactDao;

	@Override
	public ArrayList<contact> getContact() {
		return AdminContactDao.getContact();
	}
	
	@Override
	public void updateOrd(List<String> seqList, List<String> ordList) {
		AdminContactDao.updateOrd(seqList, ordList);
		
	}

	@Override
	public int insertContact(contact insertData) {
		int result = AdminContactDao.insertContact(insertData);
		return result;
	}

	@Override
	public ArrayList<contact> getContactBySeq(String ctseq) {
		return AdminContactDao.getContactBySeq(ctseq);
	}

	@Override
	public int updateContact(String ctseq, contact updateData) {
		int result = AdminContactDao.updateContact(ctseq, updateData);
		return result;
	}

	@Override
	public int deleteContact(String ctseq) {
		int result = AdminContactDao.deleteContact(ctseq);
		return result;
	}

}
