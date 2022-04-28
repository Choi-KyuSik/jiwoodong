package kh.semi.jwd.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kh.semi.jwd.user.model.vo.UserVo;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class UserDao {
	
	// DB를 왔다갔다 하는것
	private PreparedStatement pstmt = null;
	// DB를 Java용 언어로 바꿔주는것
	private ResultSet rs = null;
	
	//승희 - 사용자 회원가입
	public int insetUserMember(Connection conn, UserVo vo) {
//		UM_ID             NOT NULL VARCHAR2(20)  
//		UM_PWD            NOT NULL VARCHAR2(40)  
//		UM_NAME           NOT NULL VARCHAR2(20)  
//		UM_GENDER         NOT NULL VARCHAR2(1)   
//		UM_BIRTH          NOT NULL VARCHAR2(20)  
//		UM_TEL            NOT NULL VARCHAR2(20)  
//		UM_EMAIL          NOT NULL VARCHAR2(100) 
		
		int result = 0;
		String sql = "INSERT INTO u_member(UM_ID,UM_PWD,UM_NAME,UM_GENDER,UM_BIRTH,UM_TEL,UM_EMAIL) VALUES (?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getUmId());
			pstmt.setString(2, vo.getUmPwd());
			pstmt.setString(3, vo.getUmName());
			pstmt.setString(4, vo.getUmGender());
			pstmt.setString(5, vo.getUmBirth());
			pstmt.setString(6, vo.getUmTel());
			pstmt.setString(7, vo.getUmEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			//디버깅
			System.out.println("UserDao result:"+result);
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
}
