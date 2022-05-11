package kh.semi.jwd.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import kh.semi.jwd.bum.model.vo.CompanyVo;
import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class UserReservationDao {
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public ArrayList<CompanyVo> cpInfo(Connection conn, int cpNo) {
		
		String sql = "select * from company where cp_no = ?";
		 ArrayList<CompanyVo> result = new ArrayList<CompanyVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CompanyVo vo = new CompanyVo();
				vo.setCpNo(rs.getInt("cp_no"));
				vo.setBuNo(rs.getInt("bu_no"));
				vo.setCpCategory(rs.getString("cp_category"));
				vo.setCpName(rs.getString("cp_name"));
				vo.setCpExplain(rs.getString("cp_explain"));
				vo.setCpClassify(rs.getString("CP_CLASSIFY"));
				vo.setCpSignyn(rs.getString("CP_SIGNYN"));
				vo.setCpOpenDate(rs.getString("CP_OPEN_DATE"));
				vo.setCpOpenTime(rs.getString("CP_OPEN_TIME"));
				vo.setCpCloseTime(rs.getString("CP_CLOSE_TIME"));
				vo.setCpTerm(rs.getString("CP_TERM"));
				result.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Map<String, Object>> reservationTimeCheck(Connection conn, String rsdate, int cpNo) {
		String sql = "select bk_time from booking where cp_no = ? and bk_date = replace(?,'-', '/') and (bk_status='R' or bk_status='M')";
		 ArrayList<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			pstmt.setString(2, rsdate);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("bkTime", rs.getString("bk_time"));
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

	public ArrayList<Map<String, Object>> cpmenu(Connection conn, int cpNo) {
		String sql = "select * from menu where cp_no = ? and menu_useyn = 'Y'";
		 ArrayList<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("menuNo", rs.getString("menu_no"));
				map.put("menuName", rs.getString("menu_name"));
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

	public ArrayList<Map<String, Object>> menuInfo(Connection conn, String menuNo) {
		String sql = "select menu_price, menu_explain, fl_gno from menu where menu_no = to_number(?)";
		 ArrayList<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, menuNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("menuPrice", rs.getString("menu_price"));
				map.put("menuExplain", rs.getString("menu_explain"));
				map.put("menuUrl", rs.getString("fl_gno"));
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

	public int reservationInsert(Connection conn, Map<String, Object> map) {
		int result = 0;
		String sql = "insert into booking(bk_no,cp_no, um_id, bk_name, bk_phone, bk_require, bk_date, bk_time, bk_status, bk_total_price) values(booking_seq.nextval, ?,?,?,?,?,replace(?, '-', '/'),?,'R',to_number(?))";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (int)map.get("cpno"));
			pstmt.setString(2, (String)map.get("umid"));
			pstmt.setString(3, (String)map.get("rsname"));
			pstmt.setString(4, (String)map.get("rsphone"));
			pstmt.setString(5, (String)map.get("rsrequire"));
			pstmt.setString(6, (String)map.get("rsdate"));
			pstmt.setString(7, (String)map.get("rstime"));
			pstmt.setString(8, (String)map.get("totalprice"));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int reservationInsertHotel(Connection conn, Map<String, Object> map) {
		int result = 0;
		String sql = "insert into booking(bk_no,cp_no, um_id, bk_name, bk_phone, bk_require, bk_date, bk_time, bk_status, bk_total_price) values(booking_seq.nextval, ?,?,?,?,?,replace(?, '-', '/'),'X','R',to_number(?))";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (int)map.get("cpno"));
			pstmt.setString(2, (String)map.get("umid"));
			pstmt.setString(3, (String)map.get("rsname"));
			pstmt.setString(4, (String)map.get("rsphone"));
			pstmt.setString(5, (String)map.get("rsrequire"));
			pstmt.setString(6, (String)map.get("rsdate"));
			pstmt.setString(7, (String)map.get("totalprice"));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int reservationInsertCafemenu(Connection conn, Map<String, Object> map, String menuno, String menucount) {
		int result = 0;
		String sql = "insert into b_menu(bk_no, menu_no, bkm_count) values((select bk_no from booking where cp_no=? and um_id=? and bk_name=? and bk_phone=? and bk_date=replace(?,'-','/') and bk_time=?), to_number(?), to_number(?))";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (int)map.get("cpno"));
			pstmt.setString(2, (String)map.get("umid"));
			pstmt.setString(3, (String)map.get("rsname"));
			pstmt.setString(4, (String)map.get("rsphone"));
			pstmt.setString(5, (String)map.get("rsdate"));
			pstmt.setString(6, (String)map.get("rstime"));
			pstmt.setString(7, menuno);
			pstmt.setString(8, menucount);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	
	}

	public int reservationInsertSalonmenu(Connection conn, Map<String, Object> map) {
		int result = 0;
		String sql = "insert into b_menu(bk_no, menu_no) values((select bk_no from booking where cp_no=? and um_id=? and bk_name=? and bk_phone=? and bk_date=replace(?,'-','/') and bk_time=?), to_number(?))";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (int)map.get("cpno"));
			pstmt.setString(2, (String)map.get("umid"));
			pstmt.setString(3, (String)map.get("rsname"));
			pstmt.setString(4, (String)map.get("rsphone"));
			pstmt.setString(5, (String)map.get("rsdate"));
			pstmt.setString(6, (String)map.get("rstime"));
			pstmt.setString(7, (String) map.get("menuNo"));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int reservationInsertHotelmenu(Connection conn, Map<String, Object> map) {
		int result = 0;
		String sql = "insert into b_menu(bk_no, menu_no) values((select bk_no from booking where cp_no=? and um_id=? and bk_name=? and bk_phone=? and bk_date=replace(?,'-','/')), to_number(?))";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (int)map.get("cpno"));
			pstmt.setString(2, (String)map.get("umid"));
			pstmt.setString(3, (String)map.get("rsname"));
			pstmt.setString(4, (String)map.get("rsphone"));
			pstmt.setString(5, (String)map.get("rsdate"));
			pstmt.setString(6, (String) map.get("menuNo"));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Map<String, Object>> hotelmenuCheck(Connection conn, int cpno, String date) {
		String sql = "select menu_no from booking join b_menu using(bk_no) where cp_no = ? and bk_date = replace(?, '-', '/') and bk_status <> 'C'";
		 ArrayList<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpno);
			pstmt.setString(2, date);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("menu_no", rs.getString("menu_no"));
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

	// 사용자 예약 취소 : 최규식
	public ArrayList<Map<String, Object>> userBKC(Connection conn, int bkNo) {
		
		ArrayList<Map<String, Object>> result = null;
		String sql = " UPDATE booking SET bk_status = 'R' where bk_no = ? ;";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bkNo);
			rs = pstmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
		
	}
}
