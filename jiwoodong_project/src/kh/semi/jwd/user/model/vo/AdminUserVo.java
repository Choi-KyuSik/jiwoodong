package kh.semi.jwd.user.model.vo;

import java.sql.Timestamp;

// 작성 : 손은진
public class AdminUserVo {

	private String umId;
	private String umPwd;
	private String umName;
	private String umGender;
	private String umBirth;
	private String umTel;
	private String umPostcode;
	private String umAddress;
	private String umDetailAddress;
	private String umEmail;
	private int umPoint;
	private String umUseyn;
	private Timestamp umWriteDate;
	private Timestamp umUpdateDate;
	private Timestamp umOutDate;
	
//	TO_CHAR로 받을 날짜
	private String toCharUmWriteDate;
	private String toCharUmOutDate;
	
	// rownum용 변수
	private int rownum;
	
	
	
	public AdminUserVo() {
		super();
	}
	@Override
	public String toString() {
		return "UserVo [umId=" + umId + ", umPwd=" + umPwd + ", umName=" + umName + ", umGender=" + umGender
				+ ", umBirth=" + umBirth + ", umTel=" + umTel + ", umPostcode=" + umPostcode + ", umAddress="
				+ umAddress + ", umDetailAddress=" + umDetailAddress + ", umEmail=" + umEmail + ", umPoint=" + umPoint
				+ ", umUseyn=" + umUseyn + ", umWriteDate=" + umWriteDate + ", umUpdateDate=" + umUpdateDate
				+ ", umOutDate=" + umOutDate + ", toCharUmWriteDate=" + toCharUmWriteDate + ", toCharUmOutDate="
				+ toCharUmOutDate + "]";
	}
	
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
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
	public String getUmPostcode() {
		return umPostcode;
	}
	public void setUmPostcode(String umPostcode) {
		this.umPostcode = umPostcode;
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
	public int getUmPoint() {
		return umPoint;
	}
	public void setUmPoint(int umPoint) {
		this.umPoint = umPoint;
	}
	public String getUmUseyn() {
		return umUseyn;
	}
	public void setUmUseyn(String umUseyn) {
		this.umUseyn = umUseyn;
	}
	public Timestamp getUmWriteDate() {
		return umWriteDate;
	}
	public void setUmWriteDate(Timestamp umWriteDate) {
		this.umWriteDate = umWriteDate;
	}
	public Timestamp getUmUpdateDate() {
		return umUpdateDate;
	}
	public void setUmUpdateDate(Timestamp umUpdateDate) {
		this.umUpdateDate = umUpdateDate;
	}
	public Timestamp getUmOutDate() {
		return umOutDate;
	}
	public void setUmOutDate(Timestamp umOutDate) {
		this.umOutDate = umOutDate;
	}
	public String getToCharUmWriteDate() {
		return toCharUmWriteDate;
	}
	public void setToCharUmWriteDate(String toCharUmWriteDate) {
		this.toCharUmWriteDate = toCharUmWriteDate;
	}
	public String getToCharUmOutDate() {
		return toCharUmOutDate;
	}
	public void setToCharUmOutDate(String toCharUmOutDate) {
		this.toCharUmOutDate = toCharUmOutDate;
	}
	
	
	
}
