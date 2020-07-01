package com.edu.vo;

import java.util.Date;

public class TownVo {
	
	private int townNo;
	private String townName;
	private String townAddress;
	private String townDel;
	
	public TownVo(int townNo, String townName, String townAddress, String townDel) {
		super();
		this.townNo = townNo;
		this.townName = townName;
		this.townAddress = townAddress;
		this.townDel = townDel;
	}

	public TownVo() {
		super();
	}

	public int getTownNo() {
		return townNo;
	}

	public void setTownNo(int townNo) {
		this.townNo = townNo;
	}

	public String getTownName() {
		return townName;
	}

	public void setTownName(String townName) {
		this.townName = townName;
	}

	public String getTownAddress() {
		return townAddress;
	}

	public void setTownAddress(String townAddress) {
		this.townAddress = townAddress;
	}

	public String getTownDel() {
		return townDel;
	}

	public void setTownDel(String townDel) {
		this.townDel = townDel;
	}

	@Override
	public String toString() {
		return "TownVo [townNo=" + townNo + ", townName=" + townName + ", townAddress=" + townAddress + ", townDel="
				+ townDel + "]";
	}
		
}
