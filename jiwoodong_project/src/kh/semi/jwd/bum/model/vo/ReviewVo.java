package kh.semi.jwd.bum.model.vo;

import java.sql.Timestamp;

public class ReviewVo {
       
//	CP_NO          NOT NULL NUMBER         
//	UM_ID          NOT NULL VARCHAR2(20) 
//	BK_NAME        NOT NULL VARCHAR2(20)
//	RV_NO          NOT NULL NUMBER         
//	BK_NO          NOT NULL NUMBER         
//	RV_SCORE       NOT NULL NUMBER         
//	RV_CONTENT     NOT NULL VARCHAR2(4000) 
//	RV_WRITE_DATE  NOT NULL TIMESTAMP(6)   
//	RV_MODIFY_DATE          TIMESTAMP(6)   
//	FL_GNO                  VARCHAR2(4000)
	private String cpName;
	private int cpNo;
	private String umID;
	private String bkName;
	
	
	private int rvNo;
	private int bkNo;
	private int rvScore;
	private String rvContent;
	private Timestamp rvWriteDate;
	private Timestamp rvModifyDate;
	private String flGno;
	
	
	
	public String getCpName() {
		return cpName;
	}
	public void setCpName(String cpName) {
		this.cpName = cpName;
	}
	public int getCpNo() {
		return cpNo;
	}
	public void setCpNo(int cpNo) {
		this.cpNo = cpNo;
	}
	public String getUmID() {
		return umID;
	}
	public void setUmID(String umID) {
		this.umID = umID;
	}
	
	public String getBkName() {
		return bkName;
	}
	public void setBkName(String bkName) {
		this.bkName = bkName;
	}
	public int getRvNo() {
		return rvNo;
	}
	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}
	public int getBkNo() {
		return bkNo;
	}
	public void setBkNo(int bkNo) {
		this.bkNo = bkNo;
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
	public Timestamp getRvWriteDate() {
		return rvWriteDate;
	}
	public void setRvWriteDate(Timestamp rvWriteDate) {
		this.rvWriteDate = rvWriteDate;
	}
	public Timestamp getRvModifyDate() {
		return rvModifyDate;
	}
	public void setRvModifyDate(Timestamp rvModifyDate) {
		this.rvModifyDate = rvModifyDate;
	}
	public String getFlGno() {
		return flGno;
	}
	public void setFlGno(String flGno) {
		this.flGno = flGno;
	}
	
	public ReviewVo() {
		super();
	}
	public ReviewVo(int rvNo, int bkNo, int rvScore, String rvContent, Timestamp rvWriteDate) {
		super();
		this.rvNo = rvNo;
		this.bkNo = bkNo;
		this.rvScore = rvScore;
		this.rvContent = rvContent;
		this.rvWriteDate = rvWriteDate;
	}
	public ReviewVo(int rvNo, int bkNo, int rvScore, String rvContent, Timestamp rvWriteDate, Timestamp rvModifyDate,
			String flGno) {
		super();
		this.rvNo = rvNo;
		this.bkNo = bkNo;
		this.rvScore = rvScore;
		this.rvContent = rvContent;
		this.rvWriteDate = rvWriteDate;
		this.rvModifyDate = rvModifyDate;
		this.flGno = flGno;
	}
	
	public ReviewVo(int cpNo, String umID, int rvNo, int bkNo, int rvScore, String rvContent, Timestamp rvWriteDate,
			Timestamp rvModifyDate, String flGno) {
		super();
		this.cpNo = cpNo;
		this.umID = umID;
		this.rvNo = rvNo;
		this.bkNo = bkNo;
		this.rvScore = rvScore;
		this.rvContent = rvContent;
		this.rvWriteDate = rvWriteDate;
		this.rvModifyDate = rvModifyDate;
		this.flGno = flGno;
	}
	
	public ReviewVo(int cpNo, String umID, String bkName, int rvNo, int bkNo, int rvScore, String rvContent,
			Timestamp rvWriteDate, String flGno) {
		super();
		this.cpNo = cpNo;
		this.umID = umID;
		this.bkName = bkName;
		this.rvNo = rvNo;
		this.bkNo = bkNo;
		this.rvScore = rvScore;
		this.rvContent = rvContent;
		this.rvWriteDate = rvWriteDate;
		this.flGno = flGno;
	}
	
	public ReviewVo(String cpName, int cpNo, String umID, String bkName, int rvNo, int bkNo, int rvScore,
			String rvContent, Timestamp rvWriteDate, Timestamp rvModifyDate, String flGno) {
		super();
		this.cpName = cpName;
		this.cpNo = cpNo;
		this.umID = umID;
		this.bkName = bkName;
		this.rvNo = rvNo;
		this.bkNo = bkNo;
		this.rvScore = rvScore;
		this.rvContent = rvContent;
		this.rvWriteDate = rvWriteDate;
		this.rvModifyDate = rvModifyDate;
		this.flGno = flGno;
	}
	
	public ReviewVo(String cpName, int cpNo, String umID, String bkName, int rvNo, int rvScore, Timestamp rvWriteDate,String flGno) {
		super();
		this.cpName = cpName;
		this.cpNo = cpNo;
		this.umID = umID;
		this.bkName = bkName;
		this.rvNo = rvNo;
		this.rvScore = rvScore;
		this.rvWriteDate = rvWriteDate;
		this.flGno = flGno;
	}
	@Override
	public String toString() {
		return "ReviewVo [cpName=" + cpName + ", cpNo=" + cpNo + ", umID=" + umID + ", bkName=" + bkName + ", rvNo="
				+ rvNo + ", bkNo=" + bkNo + ", rvScore=" + rvScore + ", rvContent=" + rvContent + ", rvWriteDate="
				+ rvWriteDate + ", rvModifyDate=" + rvModifyDate + ", flGno=" + flGno + "]";
	}



	
	
}
