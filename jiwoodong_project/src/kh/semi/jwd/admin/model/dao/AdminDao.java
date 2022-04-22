package kh.semi.jwd.admin.model.dao;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import kh.semi.jwd.admin.model.vo.AdminVo;
//import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class AdminDao {
	private static PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 관리자 추가 - 연습
	public static int insertAdmin(Connection conn, AdminVo advo) {
		int result = 0;
		
		String adId = "ADMIN1";
		String adPw = "ADMIN1";
		
		String sql = "INSERT INTO ADMIN VALUES (ADMIN_SEQ.NEXTVAL, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adId);
			pstmt.setString(2, adPw);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 관리자 멤버 리스트
	public ArrayList<AdminVo> listAdmin(Connection conn){
		ArrayList<AdminVo> result = null;
		String sql = "SELECT * FROM ADMIN";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			result = new ArrayList<AdminVo>();
			while(rs.next()) {
				AdminVo avo = new AdminVo();
				avo.setAdNo(rs.getInt("AD_NO"));
				avo.setAdId(rs.getString("AD_ID"));
				avo.setAdPw(rs.getString("AD_PW"));
				result.add(avo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	// 업체등록요청 현황 조회
	public ArrayList<Map<String, Object>> companyAcceptList(Connection conn) {

		String sql = "SELECT * \r\n"
				+ "FROM (\r\n"
				+ "    SELECT ROWNUM, A.* \r\n"
				+ "    FROM (\r\n"
				+ "        SELECT CP_CATEGORY, CP_NAME, BU_NUMBER, TO_CHAR(CP_WRITE_DATE, 'YYYY/MM/DD')\r\n"
				+ "        FROM COMPANY C\r\n"
				+ "        JOIN B_MEMBER B USING(BU_NO)\r\n"
				+ "        WHERE CP_SIGNYN = 'N'\r\n"
				+ "        ORDER BY CP_WRITE_DATE DESC) A )\r\n"
				+ "WHERE ROWNUM BETWEEN 1 AND 9";
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String,Object>>();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("rownum", rs.getString(1));
					map.put("cpCategory", rs.getString(2));
					map.put("cpName", rs.getString(3));
					map.put("buNumber", rs.getString(4));
					map.put("cpWriteDate", rs.getString(5));

					list.add(map);

				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}


		return list;


	}
	
}
