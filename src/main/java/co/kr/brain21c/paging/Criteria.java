package co.kr.brain21c.paging;

public class Criteria {

	private static final int RECORD_SIZE = 15; // 페이지마다 출력할 데이터 개수 => PAGE_SCALE
	private static final int PAGE_SIZE = 10; // 화면 하단에 출력할 페이지 크기 => BLOCK_SCALE

	private int currentPageNo; // 현재 페이지 번호
	private String searchKeyword; // 검색 키워드
	// private String searchType; // 검색 유형

	// Page
	private int prevPageNo;
	private int nextPageNo;
	private int totalPageNo;

	private int pageBegin;
	private int pageEnd;

	// Block
	private int blockBegin;
	private int blockEnd;
	private int curBlock;
	private int totalBlock;

	public Criteria() {
		this.currentPageNo = 1;
		// this.recordsPerPage = 15;
		// this.pageSize = 10; // BLOCK_SCALE
	}

	// 2022.03.04 추가
	public Criteria(int currentPageNo, int totalPageNo) {
		this.currentPageNo = currentPageNo;
		curBlock = 1;

		setTotalPageNo(totalPageNo);
		setPageRange();
		setTotalBlock();
		setBlockRange();
	}

	public void setBlockRange() {

		curBlock = (int) (Math.ceil(currentPageNo - 1) / PAGE_SIZE) + 1; // 현재 블럭
		blockBegin = (curBlock - 1) * PAGE_SIZE + 1;// 블럭 시작
		blockEnd = blockBegin + PAGE_SIZE - 1; // 블럭 끝

		if (blockEnd > totalPageNo) {
			blockEnd = totalPageNo;
		}

		prevPageNo = (currentPageNo == 1) ? 1 : (curBlock - 1) * PAGE_SIZE; // 이전 블럭 버튼
		nextPageNo = curBlock > totalBlock ? (curBlock * PAGE_SIZE) : (curBlock * PAGE_SIZE) + 1; // 다음 블럭 버튼

		if (nextPageNo >= totalPageNo)
			nextPageNo = totalPageNo;

	}

	public void setPageRange() {
		pageBegin = (currentPageNo - 1) * RECORD_SIZE + 1;
		pageEnd = pageBegin + RECORD_SIZE - 1;
	}

	public void setTotalBlock() {
		totalBlock = (int) Math.ceil(totalPageNo / PAGE_SIZE);
	}

	public void setTotalPageNo(int count) {

		if ((int) Math.ceil(count % RECORD_SIZE) != 0) {
			this.totalPageNo = (int) Math.ceil(count / RECORD_SIZE) + 1;
		} else {
			this.totalPageNo = (int) Math.ceil(count / RECORD_SIZE);
		}

	}

	public int getPrevPageNo() {
		return prevPageNo;
	}

	public void setPrevPageNo(int prevPageNo) {
		this.prevPageNo = prevPageNo;
	}

	public int getNextPageNo() {
		return nextPageNo;
	}

	public void setNextPageNo(int nextPageNo) {
		this.nextPageNo = nextPageNo;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getBlockBegin() {
		return blockBegin;
	}

	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}

	public int getBlockEnd() {
		return blockEnd;
	}

	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public int getTotalPageNo() {
		return totalPageNo;
	}

	// =======

	public int getStartPage() { // LIMIT 구문 앞부분에 사용
		return (currentPageNo - 1) * RECORD_SIZE;
	}

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	public int getRecordsPerPage() {
		return RECORD_SIZE;
	}

	public int getPageSize() {
		return PAGE_SIZE;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	@Override
	public String toString() {
		return "Criteria [currentPageNo=" + currentPageNo + ", RECORD_SIZE=" + RECORD_SIZE + ", PAGE_SIZE=" + PAGE_SIZE
				+ ", searchKeyword=" + searchKeyword + ", prevPageNo=" + prevPageNo + ", nextPageNo=" + nextPageNo
				+ ", totalPageNo=" + totalPageNo + ", pageBegin=" + pageBegin + ", pageEnd=" + pageEnd + ", blockBegin="
				+ blockBegin + ", blockEnd=" + blockEnd + ", curBlock=" + curBlock + ", totalBlock=" + totalBlock + "]";
	}

	/*
	 * public String getSearchType() { return searchType; }
	 * 
	 * public void setSearchType(String searchType) { this.searchType = searchType;
	 * }
	 * 
	 */

}
