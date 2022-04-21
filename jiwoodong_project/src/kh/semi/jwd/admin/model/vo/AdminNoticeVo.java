package kh.semi.jwd.admin.model.vo;

import java.sql.Timestamp;

public class AdminNoticeVo {
	
//	 이름            널?       유형             
//	------------- -------- -------------- 
//	NT_NO         NOT NULL NUMBER         
//	NT_TITLE      NOT NULL VARCHAR2(300)  
//	NT_CONTENT    NOT NULL VARCHAR2(4000) 
//	NT_WRITE_DATE NOT NULL TIMESTAMP(6)   
//	NT_COUNT      NOT NULL NUMBER         
//	FL_GNO                 VARCHAR2(4000) FK
	
	private int ntNo;
	private String ntTitle;
	private String ntContent;
	private Timestamp ntWriteDate;
	private int ntCount;
	private String flGno;
	
	public AdminNoticeVo() {
		super();
	}
	
	@Override
	public String toString() {
		return "\n공지사항NO : " + ntNo + ", 제목 : " + ntTitle + ", 내용 : " + ntContent + ", 작성일 : "
				+ ntWriteDate + ", 조회수 : " + ntCount + ", 파일 : " + flGno + "\n";
	}


	public int getNtNo() {
		return ntNo;
	}
	public void setNtNo(int ntNo) {
		this.ntNo = ntNo;
	}
	public String getNtTitle() {
		return ntTitle;
	}
	public void setNtTitle(String ntTitle) {
		this.ntTitle = ntTitle;
	}
	public String getNtContent() {
		return ntContent;
	}
	public void setNtContent(String ntContent) {
		this.ntContent = ntContent;
	}
	public Timestamp getNtWriteDate() {
		return ntWriteDate;
	}
	public void setNtWriteDate(Timestamp ntWriteDate) {
		this.ntWriteDate = ntWriteDate;
	}
	public int getNtCount() {
		return ntCount;
	}
	public void setNtCount(int ntCount) {
		this.ntCount = ntCount;
	}
	public String getFlGno() {
		return flGno;
	}
	public void setFlGno(String flGno) {
		this.flGno = flGno;
	}
	
	
	
	
	
	
}
