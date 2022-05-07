package kh.semi.jwd.bum.model.vo;

import java.sql.Timestamp;

public class BumReservationVo {
	
	private int bkNo;
	private int cpNo;
	private String umId;
	private String bkName;
	private String bkPhone;
	private String bkRequire;
	private String bkDate;
	private String bkTime;
	private Timestamp bkCdate;
	private String bkStatus;
	private int bkTotalPrice;
	private String bkPay;
	private String bkVisit;
	private Timestamp bkWriteDate;
	private Timestamp bkUpdateDate;
	private String menuName;
	private int menuPrice;
	private int menuNo;
	private int menuCount;
	private int bkmCount;
	
	@Override
	public String toString() {
		return "BumReservationVo [bkNo=" + bkNo + ", cpNo=" + cpNo + ", umId=" + umId + ", bkName=" + bkName
				+ ", bkPhone=" + bkPhone + ", bkRequire=" + bkRequire + ", bkDate=" + bkDate + ", bkTime=" + bkTime
				+ ", bkCdate=" + bkCdate + ", bkStatus=" + bkStatus + ", bkTotalPrice=" + bkTotalPrice + ", bkPay="
				+ bkPay + ", bkVisit=" + bkVisit + ", bkWriteDate=" + bkWriteDate + ", bkUpdateDate=" + bkUpdateDate
				+ ", menuName=" + menuName + ", menuPrice=" + menuPrice + ", menuNo=" + menuNo + ", menuCount="
				+ menuCount + ", bkmCount=" + bkmCount + "]";
	}

	public BumReservationVo() {
		super();
	}

	public BumReservationVo(int bkNo, int cpNo, String umId, String bkName, String bkPhone, String bkRequire,
			String bkDate, String bkTime, Timestamp bkCdate, String bkStatus, int bkTotalPrice, String bkPay,
			String bkVisit, Timestamp bkWriteDate, Timestamp bkUpdateDate, String menuName, int menuPrice, int menuNo,
			int menuCount, int bkmCount) {
		super();
		this.bkNo = bkNo;
		this.cpNo = cpNo;
		this.umId = umId;
		this.bkName = bkName;
		this.bkPhone = bkPhone;
		this.bkRequire = bkRequire;
		this.bkDate = bkDate;
		this.bkTime = bkTime;
		this.bkCdate = bkCdate;
		this.bkStatus = bkStatus;
		this.bkTotalPrice = bkTotalPrice;
		this.bkPay = bkPay;
		this.bkVisit = bkVisit;
		this.bkWriteDate = bkWriteDate;
		this.bkUpdateDate = bkUpdateDate;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.menuNo = menuNo;
		this.menuCount = menuCount;
		this.bkmCount = bkmCount;
	}
	
	public int getBkmCount() {
		return bkmCount;
	}

	public void setBkmCount(int bkmCount) {
		this.bkmCount = bkmCount;
	}

	public int getMenuCount() {
		return menuCount;
	}

	public void setMenuCount(int menuCount) {
		this.menuCount = menuCount;
	}

	public int getBkNo() {
		return bkNo;
	}

	public void setBkNo(int bkNo) {
		this.bkNo = bkNo;
	}

	public int getCpNo() {
		return cpNo;
	}

	public void setCpNo(int cpNo) {
		this.cpNo = cpNo;
	}

	public String getUmId() {
		return umId;
	}

	public void setUmId(String umId) {
		this.umId = umId;
	}

	public String getBkName() {
		return bkName;
	}

	public void setBkName(String bkName) {
		this.bkName = bkName;
	}

	public String getBkPhone() {
		return bkPhone;
	}

	public void setBkPhone(String bkPhone) {
		this.bkPhone = bkPhone;
	}

	public String getBkRequire() {
		return bkRequire;
	}

	public void setBkRequire(String bkRequire) {
		this.bkRequire = bkRequire;
	}

	public String getBkDate() {
		return bkDate;
	}

	public void setBkDate(String bkDate) {
		this.bkDate = bkDate;
	}

	public String getBkTime() {
		return bkTime;
	}

	public void setBkTime(String bkTime) {
		this.bkTime = bkTime;
	}

	public Timestamp getBkCdate() {
		return bkCdate;
	}

	public void setBkCdate(Timestamp bkCdate) {
		this.bkCdate = bkCdate;
	}

	public String getBkStatus() {
		return bkStatus;
	}

	public void setBkStatus(String bkStatus) {
		this.bkStatus = bkStatus;
	}

	public int getBkTotalPrice() {
		return bkTotalPrice;
	}

	public void setBkTotalPrice(int bkTotalPrice) {
		this.bkTotalPrice = bkTotalPrice;
	}

	public String getBkPay() {
		return bkPay;
	}

	public void setBkPay(String bkPay) {
		this.bkPay = bkPay;
	}

	public String getBkVisit() {
		return bkVisit;
	}

	public void setBkVisit(String bkVisit) {
		this.bkVisit = bkVisit;
	}

	public Timestamp getBkWriteDate() {
		return bkWriteDate;
	}

	public void setBkWriteDate(Timestamp bkWriteDate) {
		this.bkWriteDate = bkWriteDate;
	}

	public Timestamp getBkUpdateDate() {
		return bkUpdateDate;
	}

	public void setBkUpdateDate(Timestamp bkUpdateDate) {
		this.bkUpdateDate = bkUpdateDate;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getMenuPrice() {
		return menuPrice;
	}

	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}

	public int getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	
	
	

}
