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
	
	public ArrayList<BumReservationVo>  BusinessReservationCheck(Connection conn){
		
		String sql = "select * from booking join b_menu using(bk_no) join menu using(menu_no, cp_no) where cp_no='14' order by bk_date desc, bk_time desc";
		ArrayList<BumReservationVo> result = new ArrayList<BumReservationVo>();
		try {
			pstmt = conn.prepareStatement(sql);
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
		String sql = "select * from menu where cp_no=14";
		
		try {
			pstmt = conn.prepareStatement(sql);
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
				map.put("fl_gno", rs.getInt("fl_gno"));
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
	
	public int reservationAdd(Connection conn, Map<String, Object> map){
		int result = 0;
		String sql = "";
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
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

}
