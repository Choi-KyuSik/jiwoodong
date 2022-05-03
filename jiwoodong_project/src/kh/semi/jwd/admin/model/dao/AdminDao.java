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
import kh.semi.jwd.bum.model.vo.BumVo;
import kh.semi.jwd.user.model.vo.AdminUserVo;

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

		String sql = "SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT BU_NO, CP_CATEGORY, CP_NAME, BU_NUMBER, TO_CHAR(CP_WRITE_DATE, 'YYYY/MM/DD'), BU_TEL FROM COMPANY C JOIN B_MEMBER B USING(BU_NO) WHERE CP_SIGNYN IN ('N', 'n') ORDER BY CP_WRITE_DATE DESC) A ) WHERE RNUM BETWEEN 1 AND 9";
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
	public ArrayList<Map<String, Object>> companyAcceptDetailList(Connection conn, int startRnum, int endRnum) {

		String sql = "SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM "
				+ " (SELECT BU_NO, CP_CATEGORY, CP_NAME, BU_NUMBER, TO_CHAR(CP_WRITE_DATE, 'YYYY/MM/DD'), "
				+ " BU_TEL FROM COMPANY C JOIN B_MEMBER B USING(BU_NO) WHERE CP_SIGNYN IN ('N', 'n') ORDER BY CP_WRITE_DATE DESC) A )"
				+ "  WHERE RNUM BETWEEN ? AND ?";
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRnum);
			pstmt.setInt(2, endRnum);

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
		System.out.println(list);
		return list;
	}
	
	// 업체등록요청 현황 조회(상세)
	public ArrayList<Map<String, Object>> companyAcceptDetailSearchList(Connection conn, String field, String query, int startRnum, int endRnum) {

		String cpName = '%' + query + '%';
		
		String sql = "SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM "
				+ " (SELECT BU_NO, CP_CATEGORY, CP_NAME, BU_NUMBER, TO_CHAR(CP_WRITE_DATE, 'YYYY/MM/DD'), "
				+ " BU_TEL FROM COMPANY C JOIN B_MEMBER B USING(BU_NO) WHERE CP_SIGNYN IN ('N', 'n') AND " + field + " LIKE ? "
				+ " ORDER BY CP_WRITE_DATE DESC) A ) WHERE RNUM BETWEEN ? AND ?";
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cpName);
			pstmt.setInt(2, startRnum);
			pstmt.setInt(3, endRnum);

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
		System.out.println(list);
		return list;
	}

	// 업체등록요청 세부 1개 조회
	public ArrayList<Map<String, Object>> companyAcceptDetailRead(Connection conn, int buNo) {

		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		String sql = "SELECT BU_NO, BU_ID, CP_CATEGORY, BU_NUMBER, CP_NAME, CP_EXPLAIN, BU_NAME, BU_TEL, CP_POSTCODE, CP_ADDRESS, CP_DTADDRESS FROM COMPANY C JOIN B_MEMBER B USING(BU_NO) WHERE CP_SIGNYN IN ('N', 'n') AND BU_NO = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, buNo);
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

	// 승인 거절 시
	public int companyAcceptReject(Connection conn, String rejectMsg, int buNo) {

		int result = 0;

		String sql = "UPDATE COMPANY SET CP_SIGNYN = 'R', CP_REJECT_MSG = ? WHERE BU_NO = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rejectMsg);
			pstmt.setInt(2, buNo);
			result = pstmt.executeUpdate();
			System.out.println("승인 거절 결과 : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 승인 수락 시
	public int companyAcceptApproval(Connection conn, int buNo) {

		int result = 0;

		String sql = "UPDATE COMPANY SET CP_SIGNYN = 'Y' WHERE BU_NO = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, buNo);
			result = pstmt.executeUpdate();

			System.out.println("승인 수락 결과 : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	// 승인 거절 리스트
	public ArrayList<Map<String, Object>> companyAcceptRejectList(Connection conn, int startRnum, int endRnum) {
		String sql = "SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT BU_NO, CP_CATEGORY, CP_NAME, BU_NUMBER, TO_CHAR(CP_WRITE_DATE, 'YYYY/MM/DD'), BU_TEL, CP_REJECT_MSG FROM COMPANY C JOIN B_MEMBER B USING(BU_NO) WHERE CP_SIGNYN IN ('R', 'r') ORDER BY CP_WRITE_DATE DESC) A ) WHERE RNUM BETWEEN ? AND ?";
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String,Object>>();

		System.out.println("startRnum ? : " + startRnum + ", endRnum ? : " + endRnum);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRnum);
			pstmt.setInt(2, endRnum);
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
					map.put("cpRejectMsg", rs.getString(8));

					list.add(map);

				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("list : " + list);
		return list;
	}

	// 승인 수락 리스트
	public ArrayList<Map<String, Object>> companyAcceptApprovalList(Connection conn, int startRnum, int endRnum) {
		String sql = "SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT BU_NO, CP_CATEGORY, CP_NAME, BU_NUMBER, TO_CHAR(CP_WRITE_DATE, 'YYYY/MM/DD'), BU_TEL FROM COMPANY C JOIN B_MEMBER B USING(BU_NO) WHERE CP_SIGNYN IN ('Y', 'y') ORDER BY CP_WRITE_DATE DESC) A ) WHERE RNUM BETWEEN ? AND ?";
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String,Object>>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRnum);
			pstmt.setInt(2, endRnum);
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

	// 사업자 정보 리스트
	public ArrayList<BumVo> buMemberInfoList(Connection conn, int startRnum, int endRnum) {

		ArrayList<BumVo> voList = null;

		String sql = "SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT BU_NO, BU_ID, BU_NAME, BU_BIRTH, BU_TEL, BU_EMAIL, TO_CHAR(BU_WRITE_DATE,'YYYY/MM/DD') FROM B_MEMBER WHERE BU_USEYN = 'Y' ORDER BY BU_NO DESC) A) B WHERE RNUM BETWEEN ? AND ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRnum);
			pstmt.setInt(2, endRnum);
			rs = pstmt.executeQuery();

			voList = new ArrayList<BumVo>();

			while(rs.next()) {
				BumVo vo = new BumVo();
				vo.setRownum(rs.getInt(1));
				vo.setBuNo(rs.getInt(2));
				vo.setBuId(rs.getString(3));
				vo.setBuName(rs.getString(4));
				vo.setBuBirth(rs.getString(5));
				vo.setBuTel(rs.getString(6));
				vo.setBuEmail(rs.getString(7));
				vo.setToCharbuWriteDate(rs.getString(8));
				voList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return voList;

	}
	
	// 사업자 정보 리스트 - 검색
	public ArrayList<BumVo> buMemberInfoSearchList(Connection conn, String field, String query, int startRnum, int endRnum) {

		String buName = '%' + query + '%';
		
		ArrayList<BumVo> voList = null;

		String sql = "SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT BU_NO, BU_ID, BU_NAME, BU_BIRTH, "
				+ " BU_TEL, BU_EMAIL, TO_CHAR(BU_WRITE_DATE,'YYYY/MM/DD') FROM B_MEMBER WHERE BU_USEYN IN ('Y', 'y') AND " + field + " LIKE ? "
				+ " ORDER BY BU_NO DESC) A) B WHERE RNUM BETWEEN ? AND ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, buName);
			pstmt.setInt(2, startRnum);
			pstmt.setInt(3, endRnum);
			rs = pstmt.executeQuery();

			voList = new ArrayList<BumVo>();

			while(rs.next()) {
				BumVo vo = new BumVo();
				vo.setRownum(rs.getInt(1));
				vo.setBuNo(rs.getInt(2));
				vo.setBuId(rs.getString(3));
				vo.setBuName(rs.getString(4));
				vo.setBuBirth(rs.getString(5));
				vo.setBuTel(rs.getString(6));
				vo.setBuEmail(rs.getString(7));
				vo.setToCharbuWriteDate(rs.getString(8));
				voList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return voList;

	}

	// 사업자 정보 상세 리스트
	public BumVo buMemberDetailInfo(Connection conn, int buNo) {

		BumVo vo = null;

		String sql = "SELECT BU_NO, BU_ID, BU_NAME, BU_BIRTH, BU_TEL, BU_EMAIL, TO_CHAR(BU_WRITE_DATE,'YYYY/MM/DD') FROM B_MEMBER WHERE BU_NO = " + buNo;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				vo = new BumVo();
				vo.setBuNo(rs.getInt("BU_NO")); // 사업자번호
				vo.setBuId(rs.getString("BU_ID")); // 아이디
				vo.setBuName(rs.getString("BU_NAME")); // 이름
				vo.setBuBirth(rs.getString("BU_BIRTH")); // 생년월일
				vo.setBuTel(rs.getString("BU_TEL")); // 전화번호
				vo.setBuEmail(rs.getString("BU_EMAIL")); // 이메일
				vo.setToCharbuWriteDate(rs.getString(7)); // 가입일
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return vo;
	}

	// 사업자 정보 수정
	public int updateBuInfo(Connection conn, BumVo bvo) {

		int result = 0;

		String sql = "UPDATE B_MEMBER SET BU_NAME = ?, BU_BIRTH = ?, BU_TEL = ?, BU_EMAIL = ?, BU_UPDATE_DATE = SYSTIMESTAMP WHERE BU_NO = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getBuName());
			pstmt.setString(2, bvo.getBuBirth());
			pstmt.setString(3, bvo.getBuTel());
			pstmt.setString(4, bvo.getBuEmail());
			pstmt.setInt(5, bvo.getBuNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 사업자 정보 회원탈퇴
	public int deleteBuInfo(Connection conn, BumVo bvo) {

		int result = 0;

		String sql = "UPDATE B_MEMBER SET BU_USEYN = 'N', BU_OUT_DATE = SYSTIMESTAMP WHERE BU_NO = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bvo.getBuNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	// 사업자 탈퇴 리스트
	public ArrayList<BumVo> buMemberDeleteList(Connection conn, int startRnum, int endRnum) {

		ArrayList<BumVo> voList = null;

		String sql = "SELECT * FROM(SELECT ROWNUM RNUM, A.* FROM(SELECT BU_NO, BU_ID, BU_NAME, BU_BIRTH, BU_TEL, BU_EMAIL, TO_CHAR(BU_OUT_DATE,'YYYY/MM/DD') FROM B_MEMBER WHERE BU_USEYN IN ('N', 'n') ORDER BY BU_NO DESC) A) B WHERE RNUM BETWEEN ? AND ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRnum);
			pstmt.setInt(2, endRnum);
			rs = pstmt.executeQuery();

			voList = new ArrayList<BumVo>();

			while(rs.next()) {
				BumVo vo = new BumVo();
				vo.setRownum(rs.getInt(1));
				vo.setBuNo(rs.getInt(2));
				vo.setBuId(rs.getString(3));
				vo.setBuName(rs.getString(4));
				vo.setBuBirth(rs.getString(5));
				vo.setBuTel(rs.getString(6));
				vo.setBuEmail(rs.getString(7));
				vo.setToCharbuOutDate(rs.getString(8));
				voList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return voList;

	}

	// 사용자 정보 리스트
	public ArrayList<AdminUserVo> usMemberInfoList(Connection conn, int startRnum, int endRnum) {

		ArrayList<AdminUserVo> voList = null;

		String sql = "SELECT * FROM(SELECT ROWNUM RNUM, A.* FROM(SELECT UM_ID, UM_NAME, UM_BIRTH, UM_TEL, UM_EMAIL, TO_CHAR(UM_WRITE_DATE,'YYYY/MM/DD') FROM U_MEMBER WHERE UM_USEYN IN ('Y', 'y') ORDER BY UM_WRITE_DATE DESC) A) B WHERE RNUM BETWEEN ? AND ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRnum);
			pstmt.setInt(2, endRnum);
			rs = pstmt.executeQuery();

			voList = new ArrayList<AdminUserVo>();

			while(rs.next()) {
				AdminUserVo vo = new AdminUserVo();
				vo.setRownum(rs.getInt(1));
				vo.setUmId(rs.getString(2));
				vo.setUmName(rs.getString(3));
				vo.setUmBirth(rs.getString(4));
				vo.setUmTel(rs.getString(5));
				vo.setUmEmail(rs.getString(6));
				vo.setToCharUmWriteDate(rs.getString(7));
				voList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return voList;

	}
	
	// 사용자 정보 리스트 : 검색
	public ArrayList<AdminUserVo> usMemberInfoSearchList(Connection conn, String field, String query, int startRnum, int endRnum) {

		String umName = '%' + query + '%';
		
		ArrayList<AdminUserVo> voList = null;

		String sql = "SELECT * FROM(SELECT ROWNUM RNUM, A.* FROM(SELECT UM_ID, UM_NAME, UM_BIRTH, UM_TEL, "
				+ " UM_EMAIL, TO_CHAR(UM_WRITE_DATE,'YYYY/MM/DD') FROM U_MEMBER WHERE UM_USEYN IN ('Y', 'y') AND " + field + " LIKE ? "
				+ " ORDER BY UM_WRITE_DATE DESC) A) B WHERE RNUM BETWEEN ? AND ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, umName);
			pstmt.setInt(2, startRnum);
			pstmt.setInt(3, endRnum);
			rs = pstmt.executeQuery();

			voList = new ArrayList<AdminUserVo>();

			while(rs.next()) {
				AdminUserVo vo = new AdminUserVo();
				vo.setRownum(rs.getInt(1));
				vo.setUmId(rs.getString(2));
				vo.setUmName(rs.getString(3));
				vo.setUmBirth(rs.getString(4));
				vo.setUmTel(rs.getString(5));
				vo.setUmEmail(rs.getString(6));
				vo.setToCharUmWriteDate(rs.getString(7));
				voList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return voList;

	}


	// 사업자 정보 상세 리스트
	public AdminUserVo usMemberDetailInfo(Connection conn, AdminUserVo uvo) {


		String umId = '%' + uvo.getUmId() + '%'; 
		String sql = "SELECT UM_ID, UM_NAME, UM_BIRTH, UM_TEL, UM_EMAIL, UM_POSTCODE, UM_ADDRESS, UM_DETAIL_ADDRESS, TO_CHAR(UM_WRITE_DATE,'YYYY/MM/DD') FROM U_MEMBER WHERE UM_ID LIKE ? ";

		System.out.println("여기는 대문자니? " + uvo.getUmId());
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, umId);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				uvo = new AdminUserVo();
				uvo.setUmId(rs.getString("UM_ID")); // 아이디
				uvo.setUmName(rs.getString("UM_NAME")); // 이름
				uvo.setUmBirth(rs.getString("UM_BIRTH")); // 생년월일
				uvo.setUmTel(rs.getString("UM_TEL")); // 전화번호
				uvo.setUmEmail(rs.getString("UM_EMAIL")); // 이메일
				uvo.setUmPostcode(rs.getString("UM_POSTCODE")); // 우편번호
				uvo.setUmAddress(rs.getString("UM_ADDRESS")); // 주소
				uvo.setUmDetailAddress(rs.getString("UM_DETAIL_ADDRESS")); // 상세주소
				uvo.setToCharUmWriteDate(rs.getString(9)); // 가입일
				// System.out.println("값 담겼나?" + uvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return uvo;
	}

	// 사용자 정보 회원탈퇴
	public int deleteUmInfo(Connection conn, AdminUserVo uvo) {

		int result = 0;
		String umId = '%' + uvo.getUmId() + '%'; 
		String sql = "UPDATE U_MEMBER SET UM_USEYN = 'N', UM_OUT_DATE = SYSTIMESTAMP WHERE UM_ID LIKE ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, umId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	// 사업자 정보 수정
	public int updateUmInfo(Connection conn, AdminUserVo uvo) {

		int result = 0;

		String umId = '%' + uvo.getUmId() + '%'; 

		String sql = "UPDATE U_MEMBER SET UM_NAME = ?, UM_BIRTH = ?, UM_TEL = ?, UM_EMAIL =?, UM_POSTCODE = ?, UM_ADDRESS = ?, UM_DETAIL_ADDRESS = ?, UM_UPDATE_DATE = SYSTIMESTAMP WHERE UM_ID LIKE ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uvo.getUmName());
			pstmt.setString(2, uvo.getUmBirth());
			pstmt.setString(3, uvo.getUmTel());
			pstmt.setString(4, uvo.getUmEmail());
			pstmt.setString(5, uvo.getUmPostcode());
			pstmt.setString(6, uvo.getUmAddress());
			pstmt.setString(7, uvo.getUmDetailAddress());
			pstmt.setString(8, umId);

			// System.out.println("값 잘 담겼뉘 " + uvo);


			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 사용자 탈퇴 리스트
	public ArrayList<AdminUserVo> umMemberDeleteList(Connection conn, int startRnum, int endRnum) {

		ArrayList<AdminUserVo> voList = null;

		String sql = "SELECT * FROM(SELECT ROWNUM RNUM, A.* FROM(SELECT UM_ID, UM_NAME, UM_BIRTH, UM_TEL, UM_EMAIL, TO_CHAR(UM_OUT_DATE,'YYYY/MM/DD') FROM U_MEMBER WHERE UM_USEYN IN ('N', 'n') ORDER BY UM_WRITE_DATE DESC) A) B WHERE RNUM BETWEEN ? AND ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRnum);
			pstmt.setInt(2, endRnum);
			rs = pstmt.executeQuery();

			voList = new ArrayList<AdminUserVo>();

			while(rs.next()) {
				AdminUserVo vo = new AdminUserVo();
				vo.setRownum(rs.getInt(1));
				vo.setUmId(rs.getString(2));
				vo.setUmName(rs.getString(3));
				vo.setUmBirth(rs.getString(4));
				vo.setUmTel(rs.getString(5));
				vo.setUmEmail(rs.getString(6));
				vo.setToCharUmOutDate(rs.getString(7));
				voList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return voList;

	}

	// 업체 신청 리스트 글 개수
	public int countBuAcceptList(Connection conn) {

		int result = 0;

		String sql = "SELECT COUNT(*) FROM COMPANY C JOIN B_MEMBER B USING(BU_NO) WHERE CP_SIGNYN IN ('N', 'n')";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;

	}
	
	// 업체 신청 검색 리스트 카운트 만들기
	public int countBuAcceptSearchList(Connection conn, String field, String query) {


		String cpName = '%' + query + '%';

		int result = 0;

		String sql = "SELECT COUNT(*) FROM COMPANY C JOIN B_MEMBER B USING(BU_NO) WHERE CP_SIGNYN IN ('N', 'n')"
				+ " AND " + field + " LIKE '" + cpName + "'";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;

	}
			

	// 업체 수락 리스트 글 개수
	public int countBuAcceptApprovalList(Connection conn) {

		int result = 0;

		String sql = "SELECT COUNT(*) FROM COMPANY WHERE CP_SIGNYN IN ('Y', 'y')";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;

	}

	// 업체 수락 리스트 글 개수
	public int countBuAcceptRejectList(Connection conn) {

		int result = 0;

		String sql = "SELECT COUNT(*) FROM COMPANY WHERE CP_SIGNYN IN ('R', 'r')";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;

	}

	// 사업자 정보 리스트 글 개수
	public int countBuMemberInfoList(Connection conn) {

		int result = 0;

		String sql = "SELECT COUNT(*) FROM B_MEMBER WHERE BU_USEYN IN ('Y', 'y')";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;

	}
	
	// 사업자 정보 리스트 글 개수
	public int countBuMemberInfoSearchList(Connection conn, String field, String query) {

		String buName = '%' + query + '%';
		
		int result = 0;

		String sql = "SELECT COUNT(*) FROM B_MEMBER WHERE BU_USEYN IN ('Y', 'y') AND " + field + " LIKE '" + buName + "'";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
		
	}

	// 사업자 탈퇴자 정보 리스트 글 개수
	public int countBuMemberInfoDeleteList(Connection conn) {

		int result = 0;

		String sql = "SELECT COUNT(*) FROM B_MEMBER WHERE BU_USEYN IN ('N', 'n')";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;

	}

	// 사용자 정보 리스트 글 개수
	public int countUsMemberInfoList(Connection conn) {

		int result = 0;

		String sql = "SELECT COUNT(*) FROM U_MEMBER WHERE UM_USEYN IN ('Y', 'y')";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;

	}
	
	// 사용자 정보 검색 리스트 글 개수
	public int countUsMemberInfoSearchList(Connection conn, String field, String query) {
		
		String umName = '%' + query + '%';
		
		int result = 0;

		String sql = "SELECT COUNT(*) FROM U_MEMBER WHERE UM_USEYN IN ('Y', 'y') AND " + field + " LIKE '" + umName + "'";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
		
	}

	// 사용자 탈퇴자 정보 리스트 글 개수
	public int countUsMemberInfoDeleteList(Connection conn) {

		int result = 0;

		String sql = "SELECT COUNT(*) FROM U_MEMBER WHERE UM_USEYN IN ('N', 'n')";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;

	}
	
	// 업종별 예약현황 통계 count
	public ArrayList<Map<String, Object>> bookingCount(Connection conn) {
		
		ArrayList<Map<String, Object>> result = null;
		
		String sql = "SELECT COUNT(*)"
				+ " FROM BOOKING"
				+ " JOIN COMPANY USING (CP_NO)"
				+ " WHERE CP_CATEGORY = '카페'"
				+ " UNION ALL"
				+ " SELECT COUNT(*)"
				+ " FROM BOOKING"
				+ " JOIN COMPANY USING (CP_NO)"
				+ " WHERE CP_CATEGORY = '미용실'"
				+ " UNION ALL"
				+ " SELECT COUNT(*)"
				+ " FROM BOOKING"
				+ " JOIN COMPANY USING (CP_NO)"
				+ " WHERE CP_CATEGORY = '호텔'";
		
		result = new ArrayList<Map<String,Object>>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("bookingCnt", rs.getInt(1));
				result.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
		
	}


}
