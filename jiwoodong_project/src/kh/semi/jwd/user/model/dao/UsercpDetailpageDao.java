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
	
	public ArrayList<UsercpDetailpageVo> companyDetail(Connection conn) {
		ArrayList<UsercpDetailpageVo> result = new ArrayList<UsercpDetailpageVo>();
		
		String sql = "SELECT c.CP_NO, c.FL_GNO, c.CP_NAME, c.CP_ADDRESS, c.CP_DTADDRESS, c.CP_OPEN_TIME, c.CP_CLOSE_TIME, c.CP_EXPLAIN, r.RV_NO, r.RV_CONTENT, r.RV_WRITE_DATE, r.RV_SCORE, b.BU_TEL FROM COMPANY C FULL OUTER JOIN REVIEW R ON (c.FL_GNO=r.FL_GNO) LEFT JOIN B_MEMBER B ON (c.FL_GNO=B.FL_GNO)";
		
		try {
			pstmt = conn.prepareStatement(sql);
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
