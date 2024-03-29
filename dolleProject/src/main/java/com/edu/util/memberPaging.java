package com.edu.util;

import java.io.Serializable;

public class memberPaging implements Serializable{
	
	// 페이지당 게시물수
	public int pageScale = 5;

	// 화면당 페이지 수
	public int blockScale = 5;

	private int curPage; // 현재 게시물
	private int prevPage; // 이전 게시물
	private int nextPage; // 다음 게시물
	private int totPage; // 전체 게시물
	private int totBlock; // 전체 페이지 갯수
	private int curBlock;
	private int prevBlock;
	private int nextBlock;

	private int pageBegin; // db 들고올 실제 게시물 위치 시작
	private int pageEnd; // db 들고올 실제 게시물 위치 끝

	private int blockBegin; // 블록의 시작번호
	private int blockEnd; // 블록의 끝번호

	// 생성자
	public memberPaging(int count, int curPage) {
		this.curBlock = 1;
		this.curPage = curPage;
		setTotPage(count);
		setPageRange();
		setTotBlock();
		setBlockRange();
	}

	public void setPageRange() {
		pageBegin = (curPage - 1) * pageScale + 1;
		pageEnd = pageBegin + pageScale - 1;
	}

	public void setBlockRange() {
		curBlock = (int) Math.ceil((curPage - 1) / blockScale) + 1;
		blockBegin = (curBlock - 1) * blockScale + 1;
		blockEnd = blockBegin + blockScale - 1;

		if (blockEnd > totPage) {
			blockEnd = totPage;
		}

		prevPage = (curPage == 1) ? 1 : (curBlock - 1) * blockScale;
		nextPage = curBlock > totBlock ? (curBlock * blockScale) : (curBlock * blockScale) + 1;

		if (prevPage <= 0) {
			prevPage = 1;
		}

		if (nextPage >= totPage) {
			nextPage = totPage;
		}
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int count) {
		this.totPage = (int) Math.ceil(count * 1.0 / pageScale);
	}

	public int getTotBlock() {
		return totBlock;
	}

	public void setTotBlock() {
		this.totBlock = (int) Math.ceil((double) totPage / (double) blockScale);
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getPrevBlock() {
		return prevBlock;
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
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
}
