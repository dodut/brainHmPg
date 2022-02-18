package co.kr.brain21c.dto;

import java.util.Date;

public class board {
	
	private String gnb;
	private int seq;
	private int grpno;
	private int grpord;
	private String title;
	private String cntn;
	private int hits;
	private Date rgdtm;
	private String rgwriter;
	private Date eddtm;
	private String edwriter;
	private String bdpw;
	

	@Override
	public String toString() {
		return "board [gnb=" + gnb + ""
				+ ", seq=" + seq + ""
				+ ", grpno=" + grpno + ""
				+ ", grpord=" + grpord + ""
				+ ", title=" + title+ ""
				+ ", cntn=" + cntn + ""
				+ ", hits=" + hits + ""
				+ ", rgdtm=" + rgdtm + ""
				+ ", rgwriter=" + rgwriter + ""
				+ ", eddtm="+ eddtm + ""
				+ ", edwriter=" + edwriter + ""
				+ ", bdpw=" + bdpw + "]";
	}

	public String getGnb() {
		return gnb;
	}
	public void setGnb(String gnb) {
		this.gnb = gnb;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getGrpno() {
		return grpno;
	}
	public void setGrpno(int grpno) {
		this.grpno = grpno;
	}
	public int getGrpord() {
		return grpord;
	}
	public void setGrpord(int grpord) {
		this.grpord = grpord;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCntn() {
		return cntn;
	}
	public void setCntn(String cntn) {
		this.cntn = cntn;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public Date getRgdtm() {
		return rgdtm;
	}
	public void setRgdtm(Date rgdtm) {
		this.rgdtm = rgdtm;
	}
	public String getRgwriter() {
		return rgwriter;
	}
	public void setRgwriter(String rgwriter) {
		this.rgwriter = rgwriter;
	}
	public Date getEddtm() {
		return eddtm;
	}
	public void setEddtm(Date eddtm) {
		this.eddtm = eddtm;
	}
	public String getEdwriter() {
		return edwriter;
	}
	public void setEdwriter(String edwriter) {
		this.edwriter = edwriter;
	}
	public String getBdpw() {
		return bdpw;
	}
	public void setBdpw(String bdpw) {
		this.bdpw = bdpw;
	}
	
	

}
