package kh.semi.jwd.bum.model.vo;

public class BumLoginVo {
//	BU_ID          NOT NULL VARCHAR2(20)   
//	BU_PWD         NOT NULL VARCHAR2(40)   
	
	private String buId;
	private String buPwd;
	private String buName;
	private int buNo;
	private String buUseYn;
	
	
	
	public String getBuUseYn() {
		return buUseYn;
	}
	public void setBuUseYn(String buUseYn) {
		this.buUseYn = buUseYn;
	}
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
	
	public int getBuNo() {
		return buNo;
	}
	public void setBuNo(int buNo) {
		this.buNo = buNo;
	}	
	@Override
	public String toString() {
		return "BumLoginVo [buId=" + buId + ", buPwd=" + buPwd + ", buName=" + buName + ", buNo=" + buNo + "]";
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
	public BumLoginVo(String buId, String buPwd, String buName, int buNo, String buUseYn) {
		super();
		this.buId = buId;
		this.buPwd = buPwd;
		this.buName = buName;
		this.buNo = buNo;
		this.buUseYn = buUseYn;
	}
	
	
	
}
