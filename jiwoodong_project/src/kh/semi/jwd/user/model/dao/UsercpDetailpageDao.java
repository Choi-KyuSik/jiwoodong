package kh.semi.jwd.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kh.semi.jwd.user.model.vo.UsercpDetailpageVo;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class UsercpDetailpageDao {
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<UsercpDetailpageVo> companyDetail(Connection conn, int cpNo) {
		ArrayList<UsercpDetailpageVo> result = new ArrayList<UsercpDetailpageVo>();
		
		String sql = "SELECT C.CP_NO, C.FL_GNO, C.CP_NAME, C.CP_ADDRESS, C.CP_DTADDRESS, C.CP_OPEN_TIME, C.CP_CLOSE_TIME, C.CP_EXPLAIN, "
				+ " NVL(R.RV_NO,'') AS RV_NO, NVL(R.RV_CONTENT,'SA') AS RV_CONTENT, R.RV_WRITE_DATE, NVL(R.RV_SCORE,'') AS RV_SCORE, B.BU_TEL "
				+ " FROM COMPANY C FULL OUTER JOIN REVIEW R "
				+ " ON (C.FL_GNO=R.FL_GNO) LEFT JOIN B_MEMBER B ON (C.FL_GNO=B.FL_GNO) WHERE CP_NO = ? ";
		/*
		 * String sql =
		 * "SELECT DISTINCT C.CP_NO, C.FL_GNO, C.CP_NAME, C.CP_ADDRESS, C.CP_DTADDRESS, C.CP_OPEN_TIME, C.CP_CLOSE_TIME, C.CP_EXPLAIN, "
		 * + " NVL(r.RV_NO,'') AS RV_NO, NVL(R.RV_CONTENT,'등록된 리뷰가 없습니다.') AS RV_CONTENT, R.RV_WRITE_DATE, NVL(r.RV_SCORE,'') AS RV_SCORE, NVL(B.BU_TEL,'등록된 정보가 없습니다.') AS BU_TEL, NVL(BK.UM_ID,'') AS UM_ID "
		 * + " FROM COMPANY C " + " FULL OUTER JOIN REVIEW R ON (C.FL_GNO=R.FL_GNO) " +
		 * " LEFT JOIN B_MEMBER B ON (C.FL_GNO=B.FL_GNO) " +
		 * " JOIN BOOKING BK ON (c.CP_NO = BK.CP_NO) WHERE CP_NO = ? ";
		 */		
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
				
				
				vo.setCpNo(rs.getInt("CP_NO"));
				
				vo.setCpName(rs.getString("CP_NAME"));
				vo.setCpAddress(rs.getString("CP_ADDRESS"));
				vo.setCpDTAddress(rs.getString("CP_DTADDRESS"));
				vo.setCpOpenTime(rs.getString("CP_OPEN_TIME"));
				vo.setCpCloseTime(rs.getString("CP_CLOSE_TIME"));
				vo.setCpExplain(rs.getString("CP_EXPLAIN"));
				vo.setRvNo(rs.getInt("RV_NO"));
				vo.setRvScore(rs.getInt("RV_SCORE"));
				vo.setRvContent(rs.getString("RV_CONTENT"));
				vo.setRvWriteDate(rs.getDate("RV_WRITE_DATE"));
				vo.setBuTel(rs.getString("BU_TEL"));
				vo.setUmId(rs.getString("UM_ID"));
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
}
