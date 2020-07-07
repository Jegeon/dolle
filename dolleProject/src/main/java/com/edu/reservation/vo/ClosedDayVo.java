package com.edu.reservation.vo;

import java.util.Date;

public class ClosedDayVo {

	private int closedNo;
	private int tourNo;
	private Date closedStartDate;
	private Date closedEndDate;
	private String closedContent;
	
	public ClosedDayVo(int closedNo, int tourNo, Date closedStartDate, Date closedEndDate, String closedContent) {
		super();
		this.closedNo = closedNo;
		this.tourNo = tourNo;
		this.closedStartDate = closedStartDate;
		this.closedEndDate = closedEndDate;
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
	public int getTourNo() {
		return tourNo;
	}
	public void setTourNo(int tourNo) {
		this.tourNo = tourNo;
	}
	public Date getClosedStartDate() {
		return closedStartDate;
	}
	public void setClosedStartDate(Date closedStartDate) {
		this.closedStartDate = closedStartDate;
	}
	public Date getClosedEndDate() {
		return closedEndDate;
	}
	public void setClosedEndDate(Date closedEndDate) {
		this.closedEndDate = closedEndDate;
	}
	public String getClosedContent() {
		return closedContent;
	}
	public void setClosedContent(String closedContent) {
		this.closedContent = closedContent;
	}
	
	@Override
	public String toString() {
		return "ClosedDayVo [closedNo=" + closedNo + ", tourNo=" + tourNo + ", closedStartDate=" + closedStartDate
				+ ", closedEndDate=" + closedEndDate + ", closedContent=" + closedContent + "]";
	}
		
}
