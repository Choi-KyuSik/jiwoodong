package kh.semi.jwd.bum.model.vo;

public class BumVo {
	
//	BU_NO          NOT NULL NUMBER         
//	BU_ID          NOT NULL VARCHAR2(20)   
//	BU_NUMBER      NOT NULL VARCHAR2(20)   
//	BU_PWD         NOT NULL VARCHAR2(40)   
//	BU_NAME        NOT NULL VARCHAR2(20)   
//	BU_BIRTH       NOT NULL VARCHAR2(20)   
//	BU_GENDER      NOT NULL VARCHAR2(1)    
//	BU_EMAIL       NOT NULL VARCHAR2(100)  
//	BU_TEL         NOT NULL VARCHAR2(20)   
//	BU_USEYN       NOT NULL VARCHAR2(1)   
	
	private int buNo ;
	private String buId;
	private String buNumber;
	private String buPwd;
	private String buName;
	private String buBirth;
	private String buGender;
	private String buEmail;
	private String buTel;
	private String buUseYn;
	private String flGno;
	
	//우진
	public int getBuNo() {
		return buNo;
	}
	public void setBuNo(int buNo) {
		this.buNo = buNo;
	}
	public String getBuNumber() {
		return buNumber;
	}
	public void setBuNumber(String buNumber) {
		this.buNumber = buNumber;
	}
	public String getBuPwd() {
		return buPwd;
	}
	public void setBuPwd(String buPwd) {
		this.buPwd = buPwd;
	}
	public String getBuName() {
		return buName;
	}
	public void setBuName(String buName) {
		this.buName = buName;
	}
	public String getBuBirth() {
		return buBirth;
	}
	public void setBuBirth(String buBirth) {
		this.buBirth = buBirth;
	}
	public String getBuGender() {
		return buGender;
	}
	public void setBuGender(String buGender) {
		this.buGender = buGender;
	}
	public String getBuEmail() {
		return buEmail;
	}
	public void setBuEmail(String buEmail) {
		this.buEmail = buEmail;
	}
	public String getFlGno() {
		return flGno;
	}
	public void setFlGno(String flGno) {
		this.flGno = flGno;
	}
	public BumVo() {}
	public BumVo(int buNo, String buNumber, String buPwd, String buName, String buBirth, String buGender,
			String buEmail, String flGno) {
		super();
		this.buNo = buNo;
		this.buNumber = buNumber;
		this.buPwd = buPwd;
		this.buName = buName;
		this.buBirth = buBirth;
		this.buGender = buGender;
		this.buEmail = buEmail;
		this.flGno = flGno;
	}
	@Override
	public String toString() {
		return "BumVo [buNo=" + buNo + ", buNumber=" + buNumber + ", buPwd=" + buPwd + ", buName=" + buName
				+ ", buBirth=" + buBirth + ", buGender=" + buGender + ", buEmail=" + buEmail + ", flGno=" + flGno + "]";
	}
	
	//승희
	public String getBuId() {
		return buId;
	}
	public void setBuId(String buId) {
		this.buId = buId;
	}
	public String getBuTel() {
		return buTel;
	}
	public void setBuTel(String buTel) {
		this.buTel = buTel;
	}
	public String getBuUseYn() {
		return buUseYn;
	}
	public void setBuUseYn(String buUseYn) {
		this.buUseYn = buUseYn;
	}
	
	
}
