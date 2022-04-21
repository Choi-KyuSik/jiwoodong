package kh.semi.jwd.admin.model.dao;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kh.semi.jwd.admin.model.vo.AdminNoticeVo;

public class AdminNoticeDao {
	private static PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public static int insertNotice(Connection conn, AdminNoticeVo adnvo) {
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
}
