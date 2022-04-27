package kh.semi.jwd.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kh.semi.jwd.user.model.vo.UsercpSearchpageVo;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class UsercpSearchpageDao {
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<UsercpSearchpageVo> listCompany(Connection conn) {
		ArrayList<UsercpSearchpageVo> result = new ArrayList<UsercpSearchpageVo>();
		
		String sql = "select * from company";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UsercpSearchpageVo vo = new UsercpSearchpageVo();
				vo.setCpNo(rs.getInt("CP_NO"));
				vo.setCpName(rs.getString("CP_NAME"));
				vo.setCpExplain(rs.getString("CP_EXPLAIN"));
				vo.setCpOpenTime(rs.getString("CP_OPEN_TIME"));
				vo.setCpCloseTime(rs.getString("CP_CLOSE_TIME"));
				vo.setCpAddress(rs.getString("CP_ADDRESS"));
				vo.setCpDTAddress(rs.getString("CP_DTADDRESS"));
				result.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
}
