package kh.semi.jwd.bum.model.vo;

import java.sql.Date;

public class CompanyVo {

//	CP_NO          NOT NULL NUMBER         
//	BU_NO          NOT NULL NUMBER         
//	CP_CATEGORY    NOT NULL VARCHAR2(20)   
//	CP_NAME        NOT NULL VARCHAR2(20)   
//	CP_EXPLAIN              VARCHAR2(4000) 
//	CP_CLASSIFY    NOT NULL VARCHAR2(1)    
//	CP_SIGNYN      NOT NULL VARCHAR2(1)    
//	CP_OPEN_DATE            VARCHAR2(40)   
//	CP_CLOSE_DATE           VARCHAR2(40)   
//	CP_OPEN_TIME            VARCHAR2(40)   
//	CP_CLOSE_TIME           VARCHAR2(40)   
//	CP_TERM                 VARCHAR2(100)  
//	CP_POSTCODE    NOT NULL VARCHAR2(20)   
//	CP_ADDRESS     NOT NULL VARCHAR2(200)  
//	CP_DTADDRESS   NOT NULL VARCHAR2(1000) 
//	CP_WRITE_DATE           TIMESTAMP(6)   
//	CP_UPDATE_DATE          TIMESTAMP(6)   
//	FL_GNO                  VARCHAR2(4000) 
//	CP_REJECT_MSG           VARCHAR2(200) 
	
	//Company table	
	private int cpNo;
	private int buNo;
	private String cpCategory;
	private String cpName;
	private String cpExplain;
	private String cpClassify;
	private String cpSignyn;
	private String cpOpenDate;
	private String cpCloseDate;
	private String cpOpenTime;
	private String cpCloseTime;
	private String cpTerm;
	private String cpPostcode;
	private String cpAddress;
	private String cpDtaddress;
	private Date cpWriteDate;
	private Date cpUpdateDate;
	private String flGno;
	private String flGno2;
	private String flGno3;
	private String cpRejectMsg;
	
	
	@Override
	public String toString() {
		return "CompanyVo [cpNo=" + cpNo + ", buNo=" + buNo + ", cpCategory=" + cpCategory + ", cpName=" + cpName
				+ ", cpExplain=" + cpExplain + ", cpClassify=" + cpClassify + ", cpSignyn=" + cpSignyn + ", cpOpenDate="
				+ cpOpenDate + ", cpCloseDate=" + cpCloseDate + ", cpOpenTime=" + cpOpenTime + ", cpCloseTime="
				+ cpCloseTime + ", cpTerm=" + cpTerm + ", cpPostcode=" + cpPostcode + ", cpAddress=" + cpAddress
				+ ", cpDtaddress=" + cpDtaddress + ", cpWriteDate=" + cpWriteDate + ", cpUpdateDate=" + cpUpdateDate
				+ ", flGno=" + flGno + ", flGno2=" + flGno2 + ", flGno3=" + flGno3 + ", cpRejectMsg=" + cpRejectMsg
				+ "]";
	}


	public int getCpNo() {
		return cpNo;
	}


	public void setCpNo(int cpNo) {
		this.cpNo = cpNo;
	}


	public int getBuNo() {
		return buNo;
	}


	public void setBuNo(int buNo) {
		this.buNo = buNo;
	}


	public String getCpCategory() {
		return cpCategory;
	}


	public void setCpCategory(String cpCategory) {
		this.cpCategory = cpCategory;
	}


	public String getCpName() {
		return cpName;
	}


	public void setCpName(String cpName) {
		this.cpName = cpName;
	}


	public String getCpExplain() {
		return cpExplain;
	}


	public void setCpExplain(String cpExplain) {
		this.cpExplain = cpExplain;
	}


	public String getCpClassify() {
		return cpClassify;
	}


	public void setCpClassify(String cpClassify) {
		this.cpClassify = cpClassify;
	}


	public String getCpSignyn() {
		return cpSignyn;
	}


	public void setCpSignyn(String cpSignyn) {
		this.cpSignyn = cpSignyn;
	}


	public String getCpOpenDate() {
		return cpOpenDate;
	}


	public void setCpOpenDate(String cpOpenDate) {
		this.cpOpenDate = cpOpenDate;
	}


	public String getCpCloseDate() {
		return cpCloseDate;
	}


	public void setCpCloseDate(String cpCloseDate) {
		this.cpCloseDate = cpCloseDate;
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


	public String getCpTerm() {
		return cpTerm;
	}


	public void setCpTerm(String cpTerm) {
		this.cpTerm = cpTerm;
	}


	public String getCpPostcode() {
		return cpPostcode;
	}


	public void setCpPostcode(String cpPostcode) {
		this.cpPostcode = cpPostcode;
	}


	public String getCpAddress() {
		return cpAddress;
	}


	public void setCpAddress(String cpAddress) {
		this.cpAddress = cpAddress;
	}


	public String getCpDtaddress() {
		return cpDtaddress;
	}


	public void setCpDtaddress(String cpDtaddress) {
		this.cpDtaddress = cpDtaddress;
	}


	public Date getCpWriteDate() {
		return cpWriteDate;
	}


	public void setCpWriteDate(Date cpWriteDate) {
		this.cpWriteDate = cpWriteDate;
	}


	public Date getCpUpdateDate() {
		return cpUpdateDate;
	}


	public void setCpUpdateDate(Date cpUpdateDate) {
		this.cpUpdateDate = cpUpdateDate;
	}


	public String getFlGno() {
		return flGno;
	}


	public void setFlGno(String flGno) {
		this.flGno = flGno;
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


	public String getCpRejectMsg() {
		return cpRejectMsg;
	}


	public void setCpRejectMsg(String cpRejectMsg) {
		this.cpRejectMsg = cpRejectMsg;
	}
		
}
