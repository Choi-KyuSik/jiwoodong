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
	
	//승희 - 사용자 리뷰 작성
	public int insertReview(Connection conn, ReviewVo vo) {
		String um_id = vo.getUmID();	
		
		int result = 0;  // 1. 리턴자료형으로 변수 생성 [+ 초기값]
		// 2. sql문 작성. 메소드 기능을 기반으로 
		String sql = "INSERT INTO REVIEW VALUES (REVIEW_SEQ.Nextval,?,?,?,default,null,null)";
		try {  // 4. try-catch
			// 3. pstmt/stmt 생성 - 2.sql문을 실행해야하므로 pstmt(?,없는경우) / stmt(없는경우) 선택
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBkNo());
			pstmt.setInt(2, vo.getRvScore());
			pstmt.setString(3, vo.getRvContent());
			// 7. 2,3번을 기반으로 sql문에 채워줄 값을 채움. -? pstmt.setXxx(1,);  pstmt.setInt / setString / setDate..
			// 8. sql문 실행 + 결과값 변수에 담기 - 2기반으로 메소드(executeUpdate / executeQuery) 결정 및 리턴변수(int / ResultSet) 결정
			result = pstmt.executeUpdate();
			// 9.10.11. select 문의 결과 rs 인 경우 
			// 12. 리턴변수에 값 채움 - 목표한바 확인			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {  // 5. finally
			// 6. 사용한 객체 close - 2.sql문 기반 rs / stmt / pstmt
			close(pstmt);
		}
		// 목표 : 리턴변수에 값을 채움. 아마도 구현 마지막 단계에서 결과 값을 알 수 있어 수행절차상 마지막에 구현됨.
		
		System.out.println("userreviewdao의 result: "+result);
		return result;   // 1. 리턴변수 값을 리턴함.
		
	}
	//승희 - 사용자 리뷰 수정
	
	public int updateUserReview(Connection conn,String rvContent,String fileUrl,int rvScore,int rvNo) {
		int result = 0;
		String sql = "UPDATE REVIEW SET RV_CONTENT = ?, FL_GNO = ?, RV_SCORE = ?  WHERE RV_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rvContent);
			pstmt.setString(2, fileUrl);
			pstmt.setInt(3, rvScore);
			pstmt.setInt(4, rvNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("업데이트 실패다~! ");
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
}
