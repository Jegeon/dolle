package com.edu.vo;

import java.util.Date;

public class ClosedDayVo {

	private int closedNo;
	private Date closedDate;
	private String closedContent;
	
	public ClosedDayVo(int closedNo, Date closedDate, String closedContent) {
		super();
		this.closedNo = closedNo;
		this.closedDate = closedDate;
		this.closedContent = closedContent;
	}

	public ClosedDayVo() {
		super();
	}

	public int getClosedNo() {
		return closedNo;
	}

	public void setClosedNo(int closedNo) {
		this.closedNo = closedNo;
	}

	public Date getClosedDate() {
		return closedDate;
	}

	public void setClosedDate(Date closedDate) {
		this.closedDate = closedDate;
	}

	public String getClosedContent() {
		return closedContent;
	}

	public void setClosedContent(String closedContent) {
		this.closedContent = closedContent;
	}

	@Override
	public String toString() {
		return "ClosedDayVo [closedNo=" + closedNo + ", closedDate=" + closedDate + ", closedContent=" + closedContent
				+ "]";
	}
		
}
