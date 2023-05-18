package kr.or.ddit.vo;

import java.util.List;

public class PaginationInfoVO<T> { // <T> : 원하는 제네릭 타입을 넣어 커스텀 가능한 태그
	private int totalRecord; // 게시글수
	private int totalpage; // 페이지수
	private int currentpage; // 현재페이지
	private int screenSize = 10; // 페이지당 게시글 수
	private int blockSize = 5; // 페이지 블록 수
	private int startRow; // 시작row
	private int endRow; // 끝 row
	private int startPage; // 시작페이지
	private int endPage; // 끝 페이지
	private List<T> dataList; // 결과를 넣을 데이터 리스트
	private String searchType; // 검색타입(제목,내용,작성자,작성일 등..)
	private String searchWord; // 검색단어(키워드)

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		// 총 페이지 수 구하기
		// ceil 올림
		totalpage = (int) Math.ceil(totalRecord / (double) screenSize);
	}

	public int getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}

	public int getCurrentpage() {
		return currentpage;
	}

	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage; // 현재 페이지
		endRow = currentpage * screenSize; // 끝row = 현재 페이지* 한 페이지당 게시글 수
		startRow = endRow - (screenSize - 1); // 시작row = 끝row -(한 페이지당 게시글수 -1)
		// 마지막 페이지 = (현재 페이지 + (페이지 블록 사이즈 -1)) / 페이지 블록 사이즈 * 페이지 블록 사이즈
		endPage = (currentpage + (blockSize - 1)) / blockSize * blockSize;
		startPage = endPage - (blockSize - 1); // 시작 페이지= 마지막 페이지 -(페이지 블록 사이즈-1)
	}

	public int getScreenSize() {
		return screenSize;
	}

	public void setScreenSize(int screenSize) {
		this.screenSize = screenSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public List<T> getDataList() {
		return dataList;
	}

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public PaginationInfoVO() {

	}

	// PaginationInfoVO 객체를 만들 떄, 한 페이지당 게시글 수와 페이지 블록 수를
	// 원하는 값으로 초기화 할 수 있도록 Custom생성자 생성
	public PaginationInfoVO(int screenSize, int blockSize) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}

	public String getPagingHTML() {
		StringBuffer html = new StringBuffer();

		// 부트스트랩을 이용하던 여러 css요소를 이용해서 페이징 UI를 구현하는 곳입니다!
		html.append("<ul class='pagination pagination-sm m-0 float-right'>");

		if (startPage > 1) {
			html.append("<li class='page-item'><a href='' class='page-link' data-page='" + (startPage - blockSize)
					+ "'>Prev</a></li>");
		}
		for (int i = startPage; i <= (endPage < totalpage ? endPage : totalpage); i++) {
			if (i == currentpage) {
				html.append("<li class='page-item active'><span class='page-link'>" + i + "</span></li>");
			} else {
				html.append(
						"<li class='page-item'><a href='' class='page-link' data-page='" + i + "'>" + i + "</a></li>");
			}
		}

		if (endPage < totalpage) {
			html.append("<li class='page-item'><a href='' class='page-link' data-page='" + (endPage + 1)
					+ "'>Next</a></li>");
		}
		html.append("</ul>");
		return html.toString();
	}
}
