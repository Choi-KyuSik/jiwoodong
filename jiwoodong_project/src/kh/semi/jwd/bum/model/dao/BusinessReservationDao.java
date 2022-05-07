package kh.semi.jwd.bum.model.dao;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import kh.semi.jwd.bum.model.vo.BumReservationVo;
import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class BusinessReservationDao {
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<BumReservationVo>  BusinessReservationCheck(Connection conn, int cpNo){
		
		String sql = "select * from booking join b_menu using(bk_no) join menu using(menu_no, cp_no) where cp_no=? and to_char(to_date(bk_date, 'yy/mm/dd'),'dd') in to_char(sysdate,'dd') order by to_date(bk_date, 'yyyy-mm-dd') desc, bk_time desc";
		ArrayList<BumReservationVo> result = new ArrayList<BumReservationVo>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BumReservationVo vo = new BumReservationVo();
				vo.setBkTotalPrice(rs.getInt("bk_total_price"));
				vo.setBkNo(rs.getInt("bk_no"));
				vo.setCpNo(rs.getInt("cp_no"));
				vo.setUmId(rs.getString("um_id"));
				vo.setBkName(rs.getString("bk_name"));
				vo.setBkPhone(rs.getString("bk_phone"));
				vo.setBkDate(rs.getString("bk_date"));
				vo.setBkTime(rs.getString("bk_time"));
				vo.setMenuName(rs.getString("menu_name"));
				vo.setMenuPrice(rs.getInt("menu_price"));
				vo.setBkRequire(rs.getString("bk_require"));
				vo.setBkStatus(rs.getString("bk_status"));
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
	
public ArrayList<BumReservationVo>  BusinessReservationCheckCafe(Connection conn, int cpNo){
		
		String sql = "select * from booking join (select bk_no, count(bk_no) menu_count from b_menu group by bk_no) using(bk_no) join (select bk_no, min(menu_name) menu_name from b_menu join menu using(menu_no) group by bk_no) using(bk_no) where cp_no = ? and to_char(to_date(bk_date, 'yy/mm/dd'),'dd') in to_char(sysdate,'dd') order by to_date(bk_date, 'yyyy-mm-dd') desc, bk_time desc";
		ArrayList<BumReservationVo> result = new ArrayList<BumReservationVo>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BumReservationVo vo = new BumReservationVo();
				vo.setBkTotalPrice(rs.getInt("bk_total_price"));
				vo.setBkNo(rs.getInt("bk_no"));
				vo.setCpNo(rs.getInt("cp_no"));
				vo.setUmId(rs.getString("um_id"));
				vo.setBkName(rs.getString("bk_name"));
				vo.setBkPhone(rs.getString("bk_phone"));
				vo.setBkDate(rs.getString("bk_date"));
				vo.setBkTime(rs.getString("bk_time"));
				vo.setMenuName(rs.getString("menu_name"));
				vo.setMenuCount(rs.getInt("menu_count"));
				vo.setBkRequire(rs.getString("bk_require"));
				vo.setBkStatus(rs.getString("bk_status"));
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
	
	public ArrayList<Map<String, Object>> menuList(Connection conn, int cpNo) {
		
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		String sql = "select * from menu where cp_no=? and menu_useyn = 'Y'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("menuNo", rs.getInt("menu_no"));
				map.put("cpNo", rs.getInt("cp_no"));
				map.put("menuName", rs.getString("menu_name"));
				map.put("menuPrice", rs.getInt("menu_price"));
				map.put("menuExplain", rs.getString("menu_explain"));
				map.put("menuUseyn", rs.getString("menu_useyn"));
				map.put("menuWriteDate", rs.getTimestamp("menu_write_date"));
				map.put("menuUpdateDate", rs.getTimestamp("menu_update_date"));
				map.put("flGno", rs.getString("fl_gno"));
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
	
	public Map<String,Object> priceSelect(Connection conn,  Map<String,Object> map){
		Map<String, Object> priceMap = new HashMap<String, Object>();
		String sql = "select menu_price from menu where MENU_NO=?";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, (String) map.get("bkMenuNo")); 
			rs = pstmt.executeQuery();
			while(rs.next()) {
				priceMap.put("menuPrice", rs.getInt("menu_price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return priceMap;
	}
	
	public int reservationAdd(Connection conn, Map<String, Object> map, int cpNo){
		int result = 0;
		String sql = "insert into booking(bk_no, cp_no, um_id, bk_name, bk_phone, bk_require, bk_date, bk_time, bk_status) values(booking_seq.nextval, ?, '직접추가', ?, ?, ?, REPLACE(?, '-', '/'), ?, 'M')";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			pstmt.setString(2, (String)map.get("bkName"));
			pstmt.setString(3, (String)map.get("bkPhone"));
			pstmt.setString(4, (String)map.get("bkRequire"));
			pstmt.setString(5, (String)map.get("bkDate"));
			pstmt.setString(6, (String)map.get("bkTime"));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int reservationAddMenu(Connection conn, Map<String, Object> map, int cpNo) {
		int result = 0;
		String sql = "insert into b_menu(bk_no, menu_no) values((select max(bk_no) from booking where cp_no = ? and bk_name = ?), ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			pstmt.setString(2, (String)map.get("bkName"));
			pstmt.setString(3, (String)map.get("bkMenuNo"));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int reservationCancle(Connection conn, String bkNo) {
		int result = 0;
		String sql = "update booking set bk_status = 'C' where bk_no = to_number(?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bkNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int reservationUpdate(Connection conn, Map<String, Object> map, int cpNo) {
		int result = 0;
		String sql = "update booking set bk_date =  REPLACE(?, '-', '/'), bk_time = ? where cp_no = ? and bk_no = to_number(?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, (String)map.get("bkDate"));
			pstmt.setString(2, (String)map.get("bkTime"));
			pstmt.setInt(3, cpNo);
			pstmt.setString(4, (String)map.get("bkNo"));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int reservationUpdateCafe(Connection conn, Map<String, Object> map, int cpNo) {
		int result = 0;
		String sql = "update booking set bk_date =  REPLACE(?, '-', '/'), bk_time = ?, bk_name = ?, bk_phone =?, bk_require=? where cp_no = ? and bk_no = to_number(?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, (String)map.get("bkDate"));
			pstmt.setString(2, (String)map.get("bkTime"));
			pstmt.setString(3, (String)map.get("bkName"));
			pstmt.setString(4, (String)map.get("bkPhone"));
			pstmt.setString(5, (String)map.get("bkRequire"));
			pstmt.setInt(6, cpNo);
			pstmt.setString(7, (String)map.get("bkNo"));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int reservationUpdateMenu(Connection conn, Map<String, Object> map, int cpNo) {
		int result = 0;
		String sql = "update b_menu set menu_no = ?, bkm_update_date = sysdate where bk_no = to_number(?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, (String)map.get("bkMenuNo"));
			pstmt.setString(2, (String)map.get("bkNo"));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<BumReservationVo> AllStatus(Connection conn, String date, int cpNo) {
		String sql = "select * from booking join b_menu using(bk_no) join menu using(menu_no, cp_no) where cp_no=? and to_char(to_date(bk_date, 'yy/mm/dd'),'dd') in to_char(to_date(?, 'yy/mm/dd'),'dd') order by to_date(bk_date, 'yyyy-mm-dd') desc, bk_time desc";
		ArrayList<BumReservationVo> result = new ArrayList<BumReservationVo>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			pstmt.setString(2, date);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BumReservationVo vo = new BumReservationVo();
				vo.setBkNo(rs.getInt("bk_no"));
				vo.setUmId(rs.getString("um_id"));
				vo.setBkName(rs.getString("bk_name"));
				vo.setBkPhone(rs.getString("bk_phone"));
				vo.setBkDate(rs.getString("bk_date"));
				vo.setBkTime(rs.getString("bk_time"));
				vo.setMenuName(rs.getString("menu_name"));
				vo.setBkRequire(rs.getString("bk_require"));
				vo.setBkStatus(rs.getString("bk_status"));
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
	
	public ArrayList<BumReservationVo> AllStatusCafe(Connection conn, String date, int cpNo) {
		String sql = "select * from booking join (select bk_no, count(bk_no) menu_count, bkm_count from b_menu group by bk_no, bkm_count) using(bk_no) join (select bk_no, min(menu_name) menu_name from b_menu join menu using(menu_no) group by bk_no) using(bk_no) where cp_no = ? and to_char(to_date(bk_date, 'yy/mm/dd'),'dd') in to_char(to_date(?, 'yy/mm/dd'),'dd') order by to_date(bk_date, 'yyyy-mm-dd') desc, bk_time desc";
		ArrayList<BumReservationVo> result = new ArrayList<BumReservationVo>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			pstmt.setString(2, date);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BumReservationVo vo = new BumReservationVo();
				vo.setBkTotalPrice(rs.getInt("bk_total_price"));
				vo.setBkNo(rs.getInt("bk_no"));
				vo.setUmId(rs.getString("um_id"));
				vo.setBkName(rs.getString("bk_name"));
				vo.setBkPhone(rs.getString("bk_phone"));
				vo.setBkDate(rs.getString("bk_date"));
				vo.setBkTime(rs.getString("bk_time"));
				vo.setMenuCount(rs.getInt("menu_count"));
				vo.setMenuName(rs.getString("menu_name"));
				vo.setBkRequire(rs.getString("bk_require"));
				vo.setBkStatus(rs.getString("bk_status"));
				vo.setBkmCount(rs.getInt("bkm_count"));
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

	public ArrayList<BumReservationVo> selectStatus(Connection conn, String date, int cpNo, String status) {
		String sql = "select * from booking join b_menu using(bk_no) join menu using(menu_no, cp_no) where cp_no=? and bk_status = ? and to_char(to_date(bk_date, 'yy/mm/dd'),'dd') in to_char(to_date(?, 'yy/mm/dd'),'dd') order by to_date(bk_date, 'yyyy-mm-dd') desc, bk_time desc";
		ArrayList<BumReservationVo> result = new ArrayList<BumReservationVo>();
		if(status.equals("예약")) {
			status = "R";
		} else if(status.equals("취소")) {
			status = "C";
		} else if(status.equals("매장예약")) {
			status = "M";
		} else {
			status = "?";
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			pstmt.setString(3, date);
			pstmt.setString(2, status);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BumReservationVo vo = new BumReservationVo();
				vo.setBkNo(rs.getInt("bk_no"));
				vo.setUmId(rs.getString("um_id"));
				vo.setBkName(rs.getString("bk_name"));
				vo.setBkPhone(rs.getString("bk_phone"));
				vo.setBkDate(rs.getString("bk_date"));
				vo.setBkTime(rs.getString("bk_time"));
				vo.setMenuName(rs.getString("menu_name"));
				vo.setMenuPrice(rs.getInt("menu_price"));
				vo.setBkRequire(rs.getString("bk_require"));
				vo.setBkStatus(rs.getString("bk_status"));
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
	
	public ArrayList<BumReservationVo> selectStatusCafe(Connection conn, String date, int cpNo, String status) {
		String sql = "select * from booking join (select bk_no, count(bk_no) menu_count, bkm_count from b_menu group by bk_no, bkm_count) using(bk_no) join (select bk_no, min(menu_name) menu_name from b_menu join menu using(menu_no) group by bk_no) using(bk_no) where cp_no = ? and bk_status = ? and to_char(to_date(bk_date, 'yy/mm/dd'),'dd') in to_char(to_date(?, 'yy/mm/dd'),'dd') order by to_date(bk_date, 'yyyy-mm-dd') desc, bk_time desc";
		ArrayList<BumReservationVo> result = new ArrayList<BumReservationVo>();
		if(status.equals("예약")) {
			status = "R";
		} else if(status.equals("취소")) {
			status = "C";
		} else if(status.equals("매장예약")) {
			status = "M";
		} else {
			status = "?";
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			pstmt.setString(2, status);
			pstmt.setString(3, date);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BumReservationVo vo = new BumReservationVo();
				vo.setBkTotalPrice(rs.getInt("bk_total_price"));
				vo.setBkNo(rs.getInt("bk_no"));
				vo.setUmId(rs.getString("um_id"));
				vo.setBkName(rs.getString("bk_name"));
				vo.setBkPhone(rs.getString("bk_phone"));
				vo.setBkDate(rs.getString("bk_date"));
				vo.setBkTime(rs.getString("bk_time"));
				vo.setMenuCount(rs.getInt("menu_count"));
				vo.setMenuName(rs.getString("menu_name"));
				vo.setBkRequire(rs.getString("bk_require"));
				vo.setBkStatus(rs.getString("bk_status"));
				vo.setBkmCount(rs.getInt("bkm_count"));
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

	public ArrayList<Map<String, Object>> reservationMenuList(Connection conn, int cpNo) {
		String sql = "select * from menu where cp_no = ? and menu_useyn = 'Y' order by menu_no desc";
		 ArrayList<Map<String, Object>>list = new  ArrayList<Map<String, Object>>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("menuNo", rs.getString("menu_no"));
				map.put("menuName", rs.getString("menu_name"));
				map.put("menuPrice", rs.getString("menu_price"));
				map.put("menuExplain", rs.getString("menu_explain"));
				map.put("fileUrl", rs.getString("fl_gno"));
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

	/*
	 * public int fileUpload(Connection conn, Map<String, Object> map, int cpNo) {
	 * int result = 0; // src 수정해야함 String sql =
	 * "insert into jwd_file(fl_gno, fl_name, fl_rename, fl_src) VALUES(?,?,?,'C:/z_workspace/z_java/jiwoodong_project/web/upload')"
	 * ; try { pstmt = conn.prepareStatement(sql); pstmt.setString(1,
	 * Integer.toString(cpNo)+map.get("menuName")); pstmt.setString(2, file);
	 * pstmt.setString(3, fileSysName); result = pstmt.executeUpdate(); } catch
	 * (SQLException e) { e.printStackTrace(); } finally { close(pstmt); }
	 * 
	 * return result; }
	 */

	public int reservationMenuInsert(Connection conn, Map<String, Object> map, int cpNo) {
		int result = 0;
		String sql = "insert into menu(menu_no, cp_no, menu_name, menu_price, menu_explain, fl_gno) VALUES(menu_seq.nextval, ?, ?, to_number(?), ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			pstmt.setString(2, (String) map.get("menuName"));
			pstmt.setString(3, (String) map.get("menuPrice"));
			pstmt.setString(4, (String) map.get("menuExplain"));
			pstmt.setString(5, (String) map.get("fileUrl"));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int reservationMenuDelete(Connection conn, int menuNo) {
		int result = 0;
		String sql = "update menu set menu_useyn = 'N', menu_update_date = sysdate where menu_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, menuNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public String cpCatecoryCheck(Connection conn, int cpNo) {
		String result = "";
		String sql = "select cp_category from company where cp_no=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				result = rs.getString("cp_category");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Map<String, Object>> bmenuList(Connection conn, String bkno) {
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		String sql = "select menu_name, bkm_count from b_menu join menu using(menu_no) where bk_no = to_number(?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bkno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("menuName", rs.getString("menu_name"));
				map.put("bkmCount", rs.getString("bkm_count"));
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return list;
	}
}
