package kh.semi.jwd.user.model.vo;

import java.sql.Date;

public class UsercpDetailpageVo {

//	CP_NO          NOT NULL NUMBER 
//	CP_NAME        NOT NULL VARCHAR2(20)   
//	CP_ADDRESS     NOT NULL VARCHAR2(200)  
//	CP_DTADDRESS   NOT NULL VARCHAR2(1000) 
//	CP_OPEN_TIME            VARCHAR2(40)   
//	CP_CLOSE_TIME           VARCHAR2(40)
//	CP_EXPLAIN              VARCHAR2(4000)
//	RV_NO          NOT NULL NUMBER
//	RV_SCORE       NOT NULL NUMBER         
//	RV_CONTENT     NOT NULL VARCHAR2(4000)
//	RV_WRITE_DATE  NOT NULL TIMESTAMP(6)
//	BU_TEL         NOT NULL VARCHAR2(20) 

	private int cpNo;
	private String cpName;
	private String cpAddress;
	private String cpDTAddress;
	private String cpOpenTime;
	private String cpCloseTime;
	private String cpExplain;
	private int rvNo;
	private int rvScore;
	private String rvContent;
	private Date rvWriteDate;
	private String buTel;
	private String flGno;
	private String flGno2;
	private String flGno3;
	private String umId;
	private String cpClassify;
	private String cpCategory;
	


	public UsercpDetailpageVo() {
		super();
	}

	
	@Override
	public String toString() {
		return "UsercpDetailpageVo [cpNo=" + cpNo + ", cpName=" + cpName + ", cpAddress=" + cpAddress + ", cpDTAddress="
				+ cpDTAddress + ", cpOpenTime=" + cpOpenTime + ", cpCloseTime=" + cpCloseTime + ", cpExplain="
				+ cpExplain + ", rvNo=" + rvNo + ", rvScore=" + rvScore + ", rvContent=" + rvContent + ", rvWriteDate="
				+ rvWriteDate + ", buTel=" + buTel + ", flGno=" + flGno + ", flGno2=" + flGno2 + ", flGno3=" + flGno3
				+ ", umId=" + umId + ", cpClassify=" + cpClassify + ", cpCategory=" + cpCategory + "]";
	}




	public String getCpClassify() {
		return cpClassify;
	}


	public void setCpClassify(String cpClassify) {
		this.cpClassify = cpClassify;
	}


	public String getCpCategory() {
		return cpCategory;
	}


	public void setCpCategory(String cpCategory) {
		this.cpCategory = cpCategory;
	}


	public String getFlGno2() {
		return flGno2;
	}


	public void setFlGno2(String flGno2) {
		this.flGno2 = flGno2;
	}


	public String getFlGno3() {
		return flGno3;
	}


	public void setFlGno3(String flGno3) {
		this.flGno3 = flGno3;
	}


	public int getCpNo() {
		return cpNo;
	}

	public void setCpNo(int cpNo) {
		this.cpNo = cpNo;
	}

	public String getCpName() {
		return cpName;
	}

	public void setCpName(String cpName) {
		this.cpName = cpName;
	}

	public String getCpAddress() {
		return cpAddress;
	}

	public void setCpAddress(String cpAddress) {
		this.cpAddress = cpAddress;
	}

	public String getCpDTAddress() {
		return cpDTAddress;
	}

	public void setCpDTAddress(String cpDTAddress) {
		this.cpDTAddress = cpDTAddress;
	}

	public String getCpOpenTime() {
		return cpOpenTime;
	}

	public void setCpOpenTime(String cpOpenTime) {
		this.cpOpenTime = cpOpenTime;
	}

	public String getCpCloseTime() {
		return cpCloseTime;
	}

	public void setCpCloseTime(String cpCloseTime) {
		this.cpCloseTime = cpCloseTime;
	}

	public String getCpExplain() {
		return cpExplain;
	}

	public void setCpExplain(String cpExplain) {
		this.cpExplain = cpExplain;
	}

	public int getRvNo() {
		return rvNo;
	}

	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}

	public int getRvScore() {
		return rvScore;
	}

	public void setRvScore(int rvScore) {
		this.rvScore = rvScore;
	}

	public String getRvContent() {
		return rvContent;
	}

	public void setRvContent(String rvContent) {
		this.rvContent = rvContent;
	}

	public Date getRvWriteDate() {
		return rvWriteDate;
	}

	public void setRvWriteDate(Date rvWriteDate) {
		this.rvWriteDate = rvWriteDate;
	}

	public String getBuTel() {
		return buTel;
	}

	public void setBuTel(String buTel) {
		this.buTel = buTel;
	}
	public String getFlGno() {
		return flGno;
	}

	public void setFlGno(String flGno) {
		this.flGno = flGno;
	}

	public String getUmId() {
		return umId;
	}

	public void setUmId(String umId) {
		this.umId = umId;
	}
}
