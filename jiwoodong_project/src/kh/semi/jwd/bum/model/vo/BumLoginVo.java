package kh.semi.jwd.bum.model.vo;

public class BumLoginVo {
//	BU_ID          NOT NULL VARCHAR2(20)   
//	BU_PWD         NOT NULL VARCHAR2(40)   
	
	private String buId;
	private String buPwd;
	private String buName;
	public String getBuId() {
		return buId;
	}
	public void setBuId(String buId) {
		this.buId = buId;
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
	@Override
	public String toString() {
		return "BumLoginVo [buId=" + buId + ", buPwd=" + buPwd + "]";
	}
	
	public BumLoginVo() {
		super();
	}
	public BumLoginVo(String buId, String buPwd) {
		super();
		this.buId = buId;
		this.buPwd = buPwd;
	}
	public BumLoginVo(String buId, String buPwd, String buName) {
		super();
		this.buId = buId;
		this.buPwd = buPwd;
		this.buName = buName;
	}
	
	
	
}
