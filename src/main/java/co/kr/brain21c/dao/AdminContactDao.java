package co.kr.brain21c.dao;

import java.util.ArrayList;
import java.util.List;

import co.kr.brain21c.dto.contact;

public interface AdminContactDao{

	ArrayList<contact> getContact();
	
	void updateOrd(List<String> seqList, List<String> ordList);
	int insertContact(contact insertData);
	ArrayList<contact> getContactBySeq(String ctseq);
	int updateContact(String ctseq, contact updateData);
	int deleteContact(String ctseq);

}
