package kh.semi.jwd.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import kh.semi.jwd.bum.model.vo.ReviewVo;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;
public class UserReviewDao {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//사용자 리뷰 리스트 : 전승희
	public ArrayList<Map<String, Object>> userRvlist(Connection conn,String umId){
		
		ArrayList<Map<String, Object>> volist = null;
		
		String sql = "SELECT RV_NO 리뷰번호, UM_ID 예약자명\r\n"
				+ "    , CASE RV_SCORE\r\n"
				+ "            WHEN 1 THEN '♥♡♡♡♡'\r\n"
				+ "            WHEN 2 THEN '♥♥♡♡♡'\r\n"
				+ "            WHEN 3 THEN '♥♥♥♡♡'\r\n"
				+ "            WHEN 4 THEN '♥♥♥♥♡'\r\n"
				+ "            WHEN 5 THEN '♥♥♥♥♥'\r\n"
				+ "            ELSE '평점이 없습니다.'\r\n"
				+ "      END 별점    \r\n"
				+ "    , TO_CHAR(RV_WRITE_DATE, 'YY/MM/DD') 리뷰작성일, RV_CONTENT 리뷰내용\r\n"
				+ "    , R.FL_GNO 리뷰사진, CP_NAME 업체명\r\n"
				+ "FROM BOOKING B\r\n"
				+ "JOIN REVIEW R ON B.BK_NO = R.BK_NO\r\n"
				+ "JOIN COMPANY C ON B.CP_NO = C.CP_NO\r\n"
				+ "WHERE UM_ID = ? \r\n"
				+ "ORDER BY RV_WRITE_DATE DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, umId);
			System.out.println(umId);
			rs = pstmt.executeQuery();
			
			volist = new ArrayList<Map<String,Object>>();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("rvNo", rs.getInt(1)); //리뷰 번호
				map.put("umId", rs.getString(2));	//작성자아이디
				map.put("rvScore", rs.getString(3));	//별점
				map.put("rvWriteDate", rs.getString(4)); //리뷰작성일
				map.put("rvContent", rs.getString(5)); //리뷰내용
				map.put("flGno", rs.getString(6)); //리뷰 사진
				map.put("cpName", rs.getString(7)); //업체명
				
				volist.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return volist;
	}

	// 리뷰 상세 조회 : 전승희
	public ArrayList<Map<String, Object>> userRvDetailList(Connection conn,int rvNo){
		
		ArrayList<Map<String, Object>> volist = null;
		
		String sql = "SELECT * FROM(SELECT ROWNUM RNUM, A.* FROM "
				+ "				 (SELECT B.CP_NO 업체번호, UM_ID 예약자명 "
				+ "				    , CASE RV_SCORE "
				+ "				            WHEN 1 THEN '💙🤍🤍🤍🤍' "
				+ "				            WHEN 2 THEN '💙💙🤍🤍🤍' "
				+ "				            WHEN 3 THEN '💙💙💙🤍🤍' "
				+ "				            WHEN 4 THEN '💙💙💙💙🤍' "
				+ "				            WHEN 5 THEN '💙💙💙💙💙' "
				+ "				            ELSE '평점이 없습니다.'"
				+ "				      END 별점    "
				+ "				    , TO_CHAR(RV_WRITE_DATE, 'YY/MM/DD') 리뷰작성일, RV_CONTENT 리뷰내용"
				+ "				    , R.FL_GNO 리뷰사진, CP_NAME 업체명, RV_NO 리뷰번호"
				+ "				FROM BOOKING B "
				+ "				JOIN REVIEW R ON B.BK_NO = R.BK_NO "
				+ "				JOIN COMPANY C ON B.CP_NO = C.CP_NO "
				+ "                WHERE RV_NO = ? ORDER BY RV_WRITE_DATE DESC) A)"
				+ "                WHERE RNUM BETWEEN 1 AND 10 ";
		
		volist = new ArrayList<Map<String, Object>>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rvNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("rnum", rs.getInt(1)); // rownum
				map.put("cpNo", rs.getInt(2)); // 업체번호
				map.put("umId", rs.getString(3)); // 예약자명
				map.put("rvScore", rs.getString(4)); // 별점
				map.put("rvWriteDate", rs.getString(5)); // 리뷰작성일
				map.put("rvContent", rs.getString(6)); // 리뷰내용
				map.put("flGno", rs.getString(7)); // 리뷰사진
				map.put("cpName", rs.getString(8)); // 업체명
				map.put("rvNo", rs.getInt(9)); // 리뷰번호
				volist.add(map);
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return volist;
	}
	
}
