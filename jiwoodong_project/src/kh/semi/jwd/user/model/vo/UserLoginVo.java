package kh.semi.jwd.user.model.vo;

public class UserLoginVo {
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
	private String umId;
	private String umPwd;
	private String umName;
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
	//생성자
	public UserLoginVo() {
		super();
	}
	public UserLoginVo(String umId, String umPwd) {
		super();
		this.umId = umId;
		this.umPwd = umPwd;
	}
	
	public UserLoginVo(String umId, String umPwd, String umName) {
		super();
		this.umId = umId;
		this.umPwd = umPwd;
		this.umName = umName;
	}
	@Override
	public String toString() {
		return "UserLoginVo [umId=" + umId + ", umPwd=" + umPwd + "]";
	}
	
	
}
