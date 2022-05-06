package kh.semi.jwd.user.model.vo;

public class UserBookingListVo {

	private String umId;
	private String cpName;
	private String cpAddress;
	private String bkDate;
	private String bkStatus;
	
	public UserBookingListVo() {
		super();
	}

	@Override
	public String toString() {
		return "UserBookingListVo [umId=" + umId + ", cpName=" + cpName + ", cpAddress=" + cpAddress + ", bkDate="
				+ bkDate + ", bkStatus=" + bkStatus + "]";
	}

	public String getUmId() {
		return umId;
	}

	public void setUmId(String umId) {
		this.umId = umId;
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

	public String getBkDate() {
		return bkDate;
	}

	public void setBkDate(String bkDate) {
		this.bkDate = bkDate;
	}

	public String getBkStatus() {
		return bkStatus;
	}

	public void setBkStatus(String bkStatus) {
		this.bkStatus = bkStatus;
	}
	
}
