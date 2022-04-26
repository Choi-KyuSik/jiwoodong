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
				+ "        SELECT BU_NO, CP_CATEGORY, CP_NAME, BU_NUMBER, TO_CHAR(CP_WRITE_DATE, 'YYYY/MM/DD'), BU_TEL\r\n"
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
					map.put("buNo", rs.getString(2));
					map.put("cpCategory", rs.getString(3));
					map.put("cpName", rs.getString(4));
					map.put("buNumber", rs.getString(5));
					map.put("cpWriteDate", rs.getString(6));
					map.put("buTel", rs.getString(7));

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

	// 업체등록요청 현황 조회(상세)
	public ArrayList<Map<String, Object>> companyAcceptDetailList(Connection conn) {

		String sql = "SELECT * \r\n"
				+ "FROM (\r\n"
				+ "    SELECT ROWNUM, A.* \r\n"
				+ "    FROM (\r\n"
				+ "        SELECT BU_NO, CP_CATEGORY, CP_NAME, BU_NUMBER, TO_CHAR(CP_WRITE_DATE, 'YYYY/MM/DD'), BU_TEL\r\n"
				+ "        FROM COMPANY C\r\n"
				+ "        JOIN B_MEMBER B USING(BU_NO)\r\n"
				+ "        WHERE CP_SIGNYN = 'N'\r\n"
				+ "        ORDER BY CP_WRITE_DATE DESC) A )\r\n"
				+ "WHERE ROWNUM BETWEEN 1 AND 18";
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String,Object>>();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("buNo", rs.getString(1));
					map.put("rownum", rs.getString(2));
					map.put("cpCategory", rs.getString(3));
					map.put("cpName", rs.getString(4));
					map.put("buNumber", rs.getString(5));
					map.put("cpWriteDate", rs.getString(6));
					map.put("buTel", rs.getString(7));

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
	
	// 업체등록요청 세부 1개 조회
	public ArrayList<Map<String, Object>> companyAcceptDetailRead(Connection conn, int buNo) {
		
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		String sql = "SELECT BU_NO, BU_ID, CP_CATEGORY, BU_NUMBER, CP_NAME, CP_EXPLAIN, BU_NAME, BU_TEL, CP_POSTCODE, CP_ADDRESS, CP_DTADDRESS\r\n"
				+ "FROM COMPANY C\r\n"
				+ "JOIN B_MEMBER B USING(BU_NO)\r\n"
				+ "WHERE CP_SIGNYN = 'N' AND BU_NO = " + buNo;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("buNo", rs.getInt(1)); // 사업자의 가입번호
				map.put("buId", rs.getString(2)); // 사업자 아이디
				map.put("cpCategory", rs.getString(3)); // 업종
				map.put("buNumber", rs.getString(4)); // 사업자등록번호
				map.put("cpName", rs.getString(5)); // 업체명
				map.put("cpExplain", rs.getString(6)); // 업체 상세설명
				map.put("buName", rs.getString(7)); // 사업자 이름
				map.put("buTel", rs.getString(8)); // 사업자 전화번호
				map.put("cpPostcode", rs.getString(9)); // 우편번호
				map.put("cpAddress", rs.getString(10)); // 주소
				map.put("cpDtaddress", rs.getString(11)); // 상세주소
				list.add(map);
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
