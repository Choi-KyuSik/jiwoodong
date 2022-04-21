package kh.semi.jwd.bum.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static kh.semi.jwd.common.jdbc.JdbcDBCP. *;

public class BumDao {
	
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	//jw
	public ArrayList<Map<String, Object>> mainPageBookingList(Connection conn) {
		
		String sql = "select * from(select rownum,x.* from (select a.* from booking a order by a.bk_write_date desc) x) where rownum between 1 and 7 and cp_no = 14";
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String , Object> map  = new HashMap<String,Object>();
				map.put("bkName", rs.getString("bk_name"));
				map.put("bkPhone", rs.getString("bk_phone"));
				map.put("bkNo", rs.getInt("bk_no"));
				map.put("bkDate", rs.getString("bk_date"));
				map.put("bkTime", rs.getString("bk_time"));
				map.put("bsStatus", rs.getString("bk_status"));
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
	//wj
	 public ArrayList<Map<String, Object>> mainPageReviewList(Connection conn) {
	      
	      
	      String sql="select * from(select rownum, x.* from (select r.rv_content, to_char(rv_write_date, 'yyyy/mm/dd'), b.um_id, r.rv_score from booking b join review r using(bk_no) order by b.bk_write_date desc) x) where rownum between 1 and 7";
	      
	      ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            Map<String, Object> map = new HashMap<String, Object>();
	            map.put("rownum", rs.getInt(1));            
	            map.put("rvContent", rs.getString(2));
	            map.put("rvWriteDate", rs.getString(3));
	            map.put("umId", rs.getString(4));
	            map.put("rvScore", rs.getInt(5));
	            
	            list.add(map);
	            System.out.println("BumDao result:" + sql);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return list;
	   }
	//jw
	public ArrayList<Map<String, Object>> mainPageStatisticsVisit(Connection conn) {
		
		String sql = "select \r\n"
				+ "(select count(*) from booking where bk_status = 'C' and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(add_months(sysdate, -4),'mm') and cp_no=14) 취소내역, \r\n"
				+ "(select count(*) from booking where bk_status = 'R' and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(add_months(sysdate, -4),'mm') and cp_no=14) 예약내역, \r\n"
				+ "to_char(add_months(sysdate, -4),'mm') 몇월 from dual\r\n"
				+ "union all\r\n"
				+ "select \r\n"
				+ "(select count(*) from booking where bk_status = 'C' and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(add_months(sysdate, -3),'mm') and cp_no=14) 취소내역, \r\n"
				+ "(select count(*) from booking where bk_status = 'R' and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(add_months(sysdate, -3),'mm') and cp_no=14) 예약내역, \r\n"
				+ "to_char(add_months(sysdate, -3),'mm') 몇월 from dual\r\n"
				+ "union all\r\n"
				+ "select \r\n"
				+ "(select count(*) from booking where bk_status = 'C' and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(add_months(sysdate, -2),'mm') and cp_no=14) 취소내역, \r\n"
				+ "(select count(*) from booking where bk_status = 'R' and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(add_months(sysdate, -2),'mm') and cp_no=14) 예약내역, \r\n"
				+ "to_char(add_months(sysdate, -2),'mm') 몇월 from dual\r\n"
				+ "union all\r\n"
				+ "select \r\n"
				+ "(select count(*) from booking where bk_status = 'C' and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(add_months(sysdate, -1),'mm') and cp_no=14) 취소내역, \r\n"
				+ "(select count(*) from booking where bk_status = 'R' and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(add_months(sysdate, -1),'mm') and cp_no=14) 예약내역, \r\n"
				+ "to_char(add_months(sysdate, -1),'mm') 몇월 from dual\r\n"
				+ "union all\r\n"
				+ "select \r\n"
				+ "(select count(*) from booking where bk_status = 'C' and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(sysdate,'mm') and cp_no=14) 취소내역, \r\n"
				+ "(select count(*) from booking where bk_status = 'R' and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(sysdate,'mm') and cp_no=14) 예약내역, \r\n"
				+ "to_char(sysdate, 'mm') 몇월 from dual";
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("cancle",  rs.getInt(1));
				map.put("booking", rs.getInt(2));
				map.put("month", rs.getString(3));
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
	//jw
	public ArrayList<Map<String, Object>> mainPageStatisticsReview(Connection conn){
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		String sql = "select count(*) from review join booking using (bk_no) where rv_score = 1 and cp_no = 14\r\n"
				+ "union all\r\n"
				+ "select count(*) from review join booking using (bk_no) where rv_score = 2 and cp_no = 14\r\n"
				+ "union all\r\n"
				+ "select count(*) from review join booking using (bk_no) where rv_score = 3 and cp_no = 14\r\n"
				+ "union all\r\n"
				+ "select count(*) from review join booking using (bk_no) where rv_score = 4 and cp_no = 14\r\n"
				+ "union all\r\n"
				+ "select count(*) from review join booking using (bk_no) where rv_score = 5 and cp_no = 14";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("count", rs.getInt(1));
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
