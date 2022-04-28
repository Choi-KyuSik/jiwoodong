package kh.semi.jwd.user.model.vo;

import java.sql.Date;

public class UserVo {
//	UM_ID             NOT NULL VARCHAR2(20)  
//	UM_PWD            NOT NULL VARCHAR2(40)  
//	UM_NAME           NOT NULL VARCHAR2(20)  
//	UM_GENDER         NOT NULL VARCHAR2(1)   
//	UM_BIRTH          NOT NULL VARCHAR2(20)  
//	UM_TEL            NOT NULL VARCHAR2(20)  
//	UM_POSTCODE       NOT NULL VARCHAR2(20)  
//	UM_ADDRESS        NOT NULL VARCHAR2(100) 
//	UM_DETAIL_ADDRESS NOT NULL VARCHAR2(100) 
//	UM_EMAIL          NOT NULL VARCHAR2(100) 
//	UM_POINT          NOT NULL NUMBER(10)    
//	UM_USEYN          NOT NULL VARCHAR2(1)   
//	UM_WRITE_DATE              TIMESTAMP(6)  
//	UM_UPDATE_DATE             TIMESTAMP(6)  
//	UM_OUT_DATE                TIMESTAMP(6)
	
	//승희
	private String umId;
	private String umPwd;
	private String umName;
	private String umGender;
	private String umBirth;
	private String umTel;
	private String umPostode;
	private String umAddress;
	private String umDetailAddress;
	private String umEmail;
	private String umPoint;
	private String umUseYn;
	private Date umWriteDate;
	private Date umUpdateDate;
	private Date umOutDate;
	
	
	
	
	//생성자
	public UserVo() {
		super();
	}
	
	
	//회원가입시 사용할 생성자
	public UserVo(String umId, String umPwd, String umName, String umGender, String umBirth, String umTel,
			String umEmail, String umUseYn) {
		super();
		this.umId = umId;
		this.umPwd = umPwd;
		this.umName = umName;
		this.umGender = umGender;
		this.umBirth = umBirth;
		this.umTel = umTel;
		this.umEmail = umEmail;
		this.umUseYn = umUseYn;
	}

	
	public UserVo(String umId, String umPwd, String umName, String umGender, String umBirth, String umTel,
			String umPostode, String umAddress, String umDetailAddress, String umEmail, String umPoint, String umUseYn,
			Date umWriteDate, Date umUpdateDate, Date umOutDate) {
		super();
		this.umId = umId;
		this.umPwd = umPwd;
		this.umName = umName;
		this.umGender = umGender;
		this.umBirth = umBirth;
		this.umTel = umTel;
		this.umPostode = umPostode;
		this.umAddress = umAddress;
		this.umDetailAddress = umDetailAddress;
		this.umEmail = umEmail;
		this.umPoint = umPoint;
		this.umUseYn = umUseYn;
		this.umWriteDate = umWriteDate;
		this.umUpdateDate = umUpdateDate;
		this.umOutDate = umOutDate;
	}

	//toSTring
	@Override
	public String toString() {
		return "UserVo [umId=" + umId + ", umPwd=" + umPwd + ", umName=" + umName + ", umGender=" + umGender
				+ ", umBirth=" + umBirth + ", umTel=" + umTel + ", umPostode=" + umPostode + ", umAddress=" + umAddress
				+ ", umDetailAddress=" + umDetailAddress + ", umEmail=" + umEmail + ", umPoint=" + umPoint
				+ ", umUseYn=" + umUseYn + ", umWriteDate=" + umWriteDate + ", umUpdateDate=" + umUpdateDate
				+ ", umOutDate=" + umOutDate + "]";
	}
	
	// getter setter 
	public String getUmId() {
		return umId;
	}
	public void setUmId(String umId) {
		this.umId = umId;
	}
	public String getUmPwd() {
		return umPwd;
	}
	public void setUmPwd(String umPwd) {
		this.umPwd = umPwd;
	}
	public String getUmName() {
		return umName;
	}
	public void setUmName(String umName) {
		this.umName = umName;
	}
	public String getUmGender() {
		return umGender;
	}
	public void setUmGender(String umGender) {
		this.umGender = umGender;
	}
	public String getUmBirth() {
		return umBirth;
	}
	public void setUmBirth(String umBirth) {
		this.umBirth = umBirth;
	}
	public String getUmTel() {
		return umTel;
	}
	public void setUmTel(String umTel) {
		this.umTel = umTel;
	}
	public String getUmPostode() {
		return umPostode;
	}
	public void setUmPostode(String umPostode) {
		this.umPostode = umPostode;
	}
	public String getUmAddress() {
		return umAddress;
	}
	public void setUmAddress(String umAddress) {
		this.umAddress = umAddress;
	}
	public String getUmDetailAddress() {
		return umDetailAddress;
	}
	public void setUmDetailAddress(String umDetailAddress) {
		this.umDetailAddress = umDetailAddress;
	}
	public String getUmEmail() {
		return umEmail;
	}
	public void setUmEmail(String umEmail) {
		this.umEmail = umEmail;
	}
	public String getUmPoint() {
		return umPoint;
	}
	public void setUmPoint(String umPoint) {
		this.umPoint = umPoint;
	}
	public String getUmUseYn() {
		return umUseYn;
	}
	public void setUmUseYn(String umUseYn) {
		this.umUseYn = umUseYn;
	}
	public Date getUmWriteDate() {
		return umWriteDate;
	}
	public void setUmWriteDate(Date umWriteDate) {
		this.umWriteDate = umWriteDate;
	}
	public Date getUmUpdateDate() {
		return umUpdateDate;
	}
	public void setUmUpdateDate(Date umUpdateDate) {
		this.umUpdateDate = umUpdateDate;
	}
	public Date getUmOutDate() {
		return umOutDate;
	}
	public void setUmOutDate(Date umOutDate) {
		this.umOutDate = umOutDate;
	}
	
	
}
