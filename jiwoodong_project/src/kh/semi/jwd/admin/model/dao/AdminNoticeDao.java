package kh.semi.jwd.admin.model.dao;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kh.semi.jwd.admin.model.vo.AdminNoticeVo;

public class AdminNoticeDao {
	private static PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// 글쓰기
	public int insertNotice(Connection conn, AdminNoticeVo adnvo) {
		int result = 0;

//		NT_NO         NOT NULL NUMBER         
//		NT_TITLE      NOT NULL VARCHAR2(300)  
//		NT_CONTENT    NOT NULL VARCHAR2(4000) 
//		NT_WRITE_DATE NOT NULL TIMESTAMP(6)   
//		NT_COUNT      NOT NULL NUMBER         

		String sql = "INSERT INTO NOTICE VALUES (ADMIN_SEQ.NEXTVAL, ?, ?, DEFAULT, DEFAULT, NULL)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adnvo.getNtTitle());
			pstmt.setString(2, adnvo.getNtContent());
			result = pstmt.executeUpdate();
			return result; // 성공 시 result 반환
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return -1; // 오류면 -1 반환
	}
	
	// 글조회
	public ArrayList<AdminNoticeVo> noticeList(Connection conn) {
		
		ArrayList<AdminNoticeVo> voList = null;
		
//		String sql = "SELECT * FROM NOTICE ORDER BY NT_WRITE_DATE DESC";
//		String sql = "SELECT * FROM(SELECT A.*, ROWNUM RNUM FROM (SELECT NT_NO, NT_TITLE, NT_CONTENT, TO_CHAR(NT_WRITE_DATE, 'YYYY/MM/DD') FROM NOTICE ORDER BY NT_WRITE_DATE DESC) A) WHERE RNUM BETWEEN 1 AND 10";
		String sql = "SELECT B.NT_NO, B.NT_TITLE, B.NT_CONTENT, B.NT_WRITE_DATE\r\n"
				+ "FROM(SELECT ROWNUM RNUM, A.* \r\n"
				+ "     FROM (SELECT NT_NO, NT_TITLE, NT_CONTENT, TO_CHAR(NT_WRITE_DATE, 'YYYY/MM/DD') AS NT_WRITE_DATE\r\n"
				+ "           FROM NOTICE ORDER BY NT_NO DESC) A) B\r\n"
				+ "WHERE RNUM BETWEEN 1 AND 10";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				voList = new ArrayList<AdminNoticeVo>();
//				NT_NO         NOT NULL NUMBER         
//				NT_TITLE      NOT NULL VARCHAR2(300)  
//				NT_CONTENT    NOT NULL VARCHAR2(4000) 
//				NT_WRITE_DATE NOT NULL TIMESTAMP(6)   
//				NT_COUNT      NOT NULL NUMBER 
				do {
					AdminNoticeVo adnvo = new AdminNoticeVo();
					adnvo.setNtNo(rs.getInt(1));
					adnvo.setNtTitle(rs.getString(2));
					adnvo.setNtContent(rs.getString(3));
					adnvo.setNtDate(rs.getString(4));
					
					voList.add(adnvo);
//					System.out.println("dao다. 값 담겼니?" + voList);
					
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return voList;
	}
}
