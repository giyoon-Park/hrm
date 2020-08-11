package com.pinosoft.hrm.util;

/**
 * 
 * @author 	박기윤
 * @since	2020.07.30
 * @version	v.1.0
 *
 */

public class PageUtil {
	//변수 선언
	private int nowPage;
	private int totalPage;
	private int totalCount;
	
	private int pageRow;
	private int pageGroup;
	
	private int startPage;
	private int endPage;
	
	private int startCont;
	private int endCont;
	
	public void setPage(int nowPage, int totalCount) {
		setPage(nowPage, totalCount, 10, 10);
	}
	public void setPage(int nowPage, int totalCount, int pageRow, int pageGroup) {
		this.nowPage = nowPage;
		this.totalCount = totalCount;
		this.pageRow = pageRow;
		this.pageGroup = pageGroup;
		
		calcPage();
		calcStart();
		calcEnd();
		calcCont();
	}
	
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageRow() {
		return pageRow;
	}

	public void setPageRow(int pageRow) {
		this.pageRow = pageRow;
	}

	public int getPageGroup() {
		return pageGroup;
	}

	public void setPageGroup(int pageGroup) {
		this.pageGroup = pageGroup;
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

	public int getStartCont() {
		return startCont;
	}

	public void setStartCont(int startCont) {
		this.startCont = startCont;
	}

	public int getEndCont() {
		return endCont;
	}

	public void setEndCont(int endCont) {
		this.endCont = endCont;
	}

	// 총 페이지 수 계산하는 함수
	public void calcPage() {
		totalPage = (totalCount % pageRow == 0)?(totalCount / pageRow):(totalCount / pageRow + 1);
	}
	
	// 시작페이지를 계산할 함수
	public void calcStart() {
		int tmpGroup = (nowPage - 1) / pageGroup;
		startPage = tmpGroup * pageGroup + 1;
	}
	
	// 마지막페이지를 계산할 함수
	public void calcEnd() {
		int tmpGroup = (nowPage - 1) / pageGroup;
		endPage = (tmpGroup + 1) * pageGroup;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
	}
	
	// 시작과 종료 게시물 번호를 계산해주는 함수
	public void calcCont() {
		startCont = (nowPage - 1) * pageRow + 1;
		endCont = nowPage * pageRow;
	}
	@Override
	public String toString() {
		return "PageUtil [nowPage=" + nowPage + ", totalPage=" + totalPage + ", totalCount=" + totalCount + ", pageRow="
				+ pageRow + ", pageGroup=" + pageGroup + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", startCont=" + startCont + ", endCont=" + endCont + "]";
	}
}
