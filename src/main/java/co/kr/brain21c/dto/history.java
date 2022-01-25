package co.kr.brain21c.dto;

import org.apache.tomcat.util.codec.binary.Base64;

public class history {
	
	private int seq		    ;
	private String hisyear	;
	private String hismonth	;
	
	private String hiscntn  ;		
	private String rgdtm    ;
	

	@Override
	public String toString() {
		
		return "{seq=" + seq + ""
			 + ", hisyear=" + hisyear + ""
			 + ", hismonth=" + hismonth + ""
			 + ", hiscntn=" + hiscntn + "}"; 
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getHisyear() {
		return hisyear;
	}


	public void setHisyear(String hisyear) {
		this.hisyear = hisyear;
	}

	public String getHismonth() {
		return hismonth;
	}


	public void setHismonth(String hismonth) {
		this.hismonth = hismonth;
	}
	
	public String getHiscntn() {
		return hiscntn;
	}


	public void setHiscntn(String hiscntn) {
		this.hiscntn = hiscntn;
	}


	public String getRgdtm() {
		return rgdtm;
	}


	public void setRgdtm(String rgdtm) {
		this.rgdtm = rgdtm;
	}

}
