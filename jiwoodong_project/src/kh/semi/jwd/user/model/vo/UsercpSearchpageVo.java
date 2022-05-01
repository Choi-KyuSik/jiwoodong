package kh.semi.jwd.user.model.vo;

public class UsercpSearchpageVo {
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
	
	private String cpName;
	private String cpAddress;
	private String cpDTAddress;
	private String cpOpenTime;
	private String cpCloseTime;
	private String cpExplain;
	private int cpNo;
	private String flGno;
	
	public String getFlGno() {
		return flGno;
	}

	public void setFlGno(String flGno) {
		this.flGno = flGno;
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

	public int getCpNo() {
		return cpNo;
	}

	public void setCpNo(int cpNo) {
		this.cpNo = cpNo;
	}

	@Override
	public String toString() {
		return "UsercpSearchpageVo [cpName=" + cpName + ", cpAddress=" + cpAddress + ", cpDTAddress=" + cpDTAddress
				+ ", cpOpenTime=" + cpOpenTime + ", cpCloseTime=" + cpCloseTime + ", cpExplain=" + cpExplain + ", cpNo="
				+ cpNo + ", flGno=" + flGno + "]";
	}

	public UsercpSearchpageVo() {
		super();
	}
	
}
