package kh.semi.jwd.user.model.vo;

public class UserLoginVo {
//	UM_ID             NOT NULL VARCHAR2(20)  
//	UM_PWD            NOT NULL VARCHAR2(40)  
	
	private String umId;
	private String umPwd;
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
	
	//생성자
	public UserLoginVo() {
		super();
	}
	public UserLoginVo(String umId, String umPwd) {
		super();
		this.umId = umId;
		this.umPwd = umPwd;
	}
	
	@Override
	public String toString() {
		return "UserLoginVo [umId=" + umId + ", umPwd=" + umPwd + "]";
	}
	
	
}
