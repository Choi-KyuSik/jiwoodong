package kh.semi.jwd.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import kh.semi.jwd.user.model.vo.UsercpDetailpageVo;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class UsercpDetailpageDao {
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<UsercpDetailpageVo> companyDetail(Connection conn, int cpNo) {
		ArrayList<UsercpDetailpageVo> result = new ArrayList<UsercpDetailpageVo>();
		
//		String sql = "SELECT C.CP_NO, C.FL_GNO, C.CP_NAME, C.CP_ADDRESS, C.CP_DTADDRESS, C.CP_OPEN_TIME, C.CP_CLOSE_TIME, C.CP_EXPLAIN, "
//				+ " NVL(R.RV_NO,'') AS RV_NO, NVL(R.RV_CONTENT,'SA') AS RV_CONTENT, R.RV_WRITE_DATE, NVL(R.RV_SCORE,'') AS RV_SCORE, B.BU_TEL "
//				+ " FROM COMPANY C FULL OUTER JOIN REVIEW R "
//				+ " ON (C.FL_GNO=R.FL_GNO) LEFT JOIN B_MEMBER B ON (C.FL_GNO=B.FL_GNO) WHERE c.CP_NO = ? ";
		
//		  String sql = "SELECT DISTINCT C.CP_NO, C.FL_GNO, C.CP_NAME, C.CP_ADDRESS, C.CP_DTADDRESS, C.CP_OPEN_TIME, C.CP_CLOSE_TIME, C.CP_EXPLAIN, "
//		  + " NVL(r.RV_NO,'') AS RV_NO, NVL(R.RV_CONTENT,'등록된 리뷰가 없습니다.') AS RV_CONTENT, R.RV_WRITE_DATE, NVL(r.RV_SCORE,'') AS RV_SCORE, NVL(B.BU_TEL,'등록된 정보가 없습니다.') AS BU_TEL "
//		  + " FROM COMPANY C " 
//		  + " FULL OUTER JOIN REVIEW R ON (C.FL_GNO=R.FL_GNO) " 
//		  + " LEFT JOIN B_MEMBER B ON (C.FL_GNO=B.FL_GNO) " 
//		  + " JOIN BOOKING BK ON (c.CP_NO = BK.CP_NO) "
//		  + " WHERE c.CP_NO = ? ";
//		  + " AND BK.UM_ID = ? ";
		
		String sql = "SELECT C.CP_NO, CP_CATEGORY, CP_NAME, DECODE(CP_CLASSIFY, 'A', '월~일', 'B', '월~금') 운영날짜"
				+ " , CP_OPEN_TIME, CP_CLOSE_TIME, CP_ADDRESS, CP_DTADDRESS"
				+ " , C.FL_GNO, FL_GNO2, FL_GNO3, BU_TEL"
				+ " FROM COMPANY C"
				+ " JOIN B_MEMBER B ON(B.BU_NO = C.BU_NO)"
				+ " WHERE CP_NO = ?";
		 		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UsercpDetailpageVo vo = new UsercpDetailpageVo();
				
//				CP_NO          NOT NULL NUMBER 
//				FL_GNO
//				CP_NAME        NOT NULL VARCHAR2(20)   
//				CP_ADDRESS     NOT NULL VARCHAR2(200)  
//				CP_DTADDRESS   NOT NULL VARCHAR2(1000) 
//				CP_OPEN_TIME            VARCHAR2(40)   
//				CP_CLOSE_TIME           VARCHAR2(40)
//				CP_EXPLAIN              VARCHAR2(4000)
//				RV_NO          NOT NULL NUMBER
//				RV_SCORE       NOT NULL NUMBER         
//				RV_CONTENT     NOT NULL VARCHAR2(4000)
//				RV_WRITE_DATE  NOT NULL TIMESTAMP(6)
//				BU_TEL         NOT NULL VARCHAR2(20) 
				
				vo.setCpNo(rs.getInt(1));
				vo.setCpCategory(rs.getString(2));
				vo.setCpName(rs.getString(3));
				vo.setCpClassify(rs.getString(4));
				vo.setCpOpenTime(rs.getString(5));
				vo.setCpCloseTime(rs.getString(6));
				vo.setCpAddress(rs.getString(7));
				vo.setCpDTAddress(rs.getString(8));
				vo.setFlGno(rs.getString(9));
				vo.setFlGno2(rs.getString(10));
				vo.setFlGno3(rs.getString(11));
				vo.setBuTel(rs.getString(12));
				
//				vo.setCpNo(rs.getInt("CP_NO"));
//				vo.setCpName(rs.getString("CP_NAME"));
//				vo.setCpAddress(rs.getString("CP_ADDRESS"));
//				vo.setCpDTAddress(rs.getString("CP_DTADDRESS"));
//				vo.setCpOpenTime(rs.getString("CP_OPEN_TIME"));
//				vo.setCpCloseTime(rs.getString("CP_CLOSE_TIME"));
//				vo.setCpExplain(rs.getString("CP_EXPLAIN"));
//				vo.setRvNo(rs.getInt("RV_NO"));
//				vo.setRvScore(rs.getInt("RV_SCORE"));
//				vo.setRvContent(rs.getString("RV_CONTENT"));
//				vo.setRvWriteDate(rs.getDate("RV_WRITE_DATE"));
//				vo.setBuTel(rs.getString("BU_TEL"));
				// vo.setUmId(rs.getString("UM_ID"));
				result.add(vo);
				
				System.out.println("뭐가들어있니 : " + vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Map<String, Object>> uscpRvList(Connection conn, int cpNo) {
		
		ArrayList<Map<String, Object>> rvlist = null;

		String sql = "select * from(select rownum rnum, A.*"
				+ " from (select r.rv_content 리뷰내용, to_char(rv_write_date, 'yyyy/mm/dd') 작성일, b.um_id 작성자,  case r.rv_score "
				+ " when 1 then '💙🤍🤍🤍🤍' "
				+ "           when 2 then '💙💙🤍🤍🤍' "
				+ "           when 3 then '💙💙💙🤍🤍' "
				+ "           when 4 then '💙💙💙💙🤍' "
				+ "           when 5 then '💙💙💙💙💙' "
				+ " else '평점이 없습니다.' "
				+ " end 평점 "
				+ " from booking b join review r using(bk_no) "
				+ " where b.cp_no = ? order by b.bk_write_date desc) A)"
				+ " where rnum between 1 and 10;";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			rs = pstmt.executeQuery();
			
			rvlist = new ArrayList<Map<String, Object>>();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("rownum", rs.getInt(1));
				map.put("rvContent", rs.getString(2));
				map.put("rvWriteDate", rs.getString(3));
				map.put("umId", rs.getString(4));
				map.put("rvScore", rs.getString(5));

				rvlist.add(map);
				
				System.out.println("리뷰들아 어디갔어?ㅠ :" + sql);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return rvlist;
	}
}
