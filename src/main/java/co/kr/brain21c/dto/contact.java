package co.kr.brain21c.dto;

public class contact {
	
	private int ctseq;
	private String ctpart;
	private String ctchr;
	private String ctphone;
	private String ctmail;

	@Override
	public String toString() {
		return "contact [ctseq=" + ctseq + ""
					+ ", ctpart=" + ctpart + ""
					+ ", ctchr=" + ctchr + ""
					+ ", ctphone=" + ctphone
					+ ", ctmail=" + ctmail + "]";
	}

	public int getCtseq() {
		return ctseq;
	}

	public void setCtseq(int ctseq) {
		this.ctseq = ctseq;
	}

	public String getCtpart() {
		return ctpart;
	}

	public void setCtpart(String ctpart) {
		this.ctpart = ctpart;
	}

	public String getCtchr() {
		return ctchr;
	}

	public void setCtchr(String ctchr) {
		this.ctchr = ctchr;
	}

	public String getCtphone() {
		return ctphone;
	}

	public void setCtphone(String ctphone) {
		this.ctphone = ctphone;
	}

	public String getCtmail() {
		return ctmail;
	}

	public void setCtmail(String ctmail) {
		this.ctmail = ctmail;
	}
	
	
}
