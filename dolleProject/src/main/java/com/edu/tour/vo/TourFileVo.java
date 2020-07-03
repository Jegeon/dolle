package com.edu.tour.vo;

import java.util.Date;

public class TourFileVo {

	private int tourFileNo;
	private int tourNo;
	private String tourOriginalFileName;
	private String tourStoredFileName;
	private int tourFileSize;
	private Date tourFileCreDate;
	private Date tourFileModDate;
	
	public TourFileVo(int tourFileNo, int tourNo, String tourOriginalFileName, String tourStoredFileName,
			int tourFileSize, Date tourFileCreDate, Date tourFileModDate) {
		super();
		this.tourFileNo = tourFileNo;
		this.tourNo = tourNo;
		this.tourOriginalFileName = tourOriginalFileName;
		this.tourStoredFileName = tourStoredFileName;
		this.tourFileSize = tourFileSize;
		this.tourFileCreDate = tourFileCreDate;
		this.tourFileModDate = tourFileModDate;
	}

	public TourFileVo() {
		super();
	}

	public int getTourFileNo() {
		return tourFileNo;
	}

	public void setTourFileNo(int tourFileNo) {
		this.tourFileNo = tourFileNo;
	}

	public int getTourNo() {
		return tourNo;
	}

	public void setTourNo(int tourNo) {
		this.tourNo = tourNo;
	}

	public String getTourOriginalFileName() {
		return tourOriginalFileName;
	}

	public void setTourOriginalFileName(String tourOriginalFileName) {
		this.tourOriginalFileName = tourOriginalFileName;
	}

	public String getTourStoredFileName() {
		return tourStoredFileName;
	}

	public void setTourStoredFileName(String tourStoredFileName) {
		this.tourStoredFileName = tourStoredFileName;
	}

	public int getTourFileSize() {
		return tourFileSize;
	}

	public void setTourFileSize(int tourFileSize) {
		this.tourFileSize = tourFileSize;
	}

	public Date getTourFileCreDate() {
		return tourFileCreDate;
	}

	public void setTourFileCreDate(Date tourFileCreDate) {
		this.tourFileCreDate = tourFileCreDate;
	}

	public Date getTourFileModDate() {
		return tourFileModDate;
	}

	public void setTourFileModDate(Date tourFileModDate) {
		this.tourFileModDate = tourFileModDate;
	}

	@Override
	public String toString() {
		return "TourFileVo [tourFileNo=" + tourFileNo + ", tourNo=" + tourNo + ", tourOriginalFileName="
				+ tourOriginalFileName + ", tourStoredFileName=" + tourStoredFileName + ", tourFileSize=" + tourFileSize
				+ ", tourFileCreDate=" + tourFileCreDate + ", tourFileModDate=" + tourFileModDate + "]";
	}
	
}
