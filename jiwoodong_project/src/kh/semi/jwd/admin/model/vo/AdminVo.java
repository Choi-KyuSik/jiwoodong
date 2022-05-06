package kh.semi.jwd.admin.model.vo;

public class AdminVo {
	
	private int adNo;
	private String adId;
	private String adPw;
	
	public AdminVo() {
		super();
	}

	@Override
	public String toString() {
		return "\n관리자NO : " + adNo + ", 관리자ID : " + adId + ", 관리자PW : " + adPw + "\n";
	}

	public int getAdNo() {
		return adNo;
	}

	public void setAdNo(int adNo) {
		this.adNo = adNo;
	}

	public String getAdId() {
		return adId;
	}

	public void setAdId(String adId) {
		this.adId = adId;
	}

	public String getAdPw() {
		return adPw;
	}

	public void setAdPw(String adPw) {
		this.adPw = adPw;
	}

	

	public AdminVo(int adNo, String adId, String adPw) {
		super();
		this.adNo = adNo;
		this.adId = adId;
		this.adPw = adPw;
	}
	
	
	
}
