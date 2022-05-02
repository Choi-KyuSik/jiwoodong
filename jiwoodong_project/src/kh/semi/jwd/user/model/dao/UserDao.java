package kh.semi.jwd.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kh.semi.jwd.user.model.vo.UserLoginVo;
import kh.semi.jwd.user.model.vo.UserVo;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class UserDao {
	
	// DB를 왔다갔다 하는것
	private PreparedStatement pstmt = null;
	// DB를 Java용 언어로 바꿔주는것
	private ResultSet rs = null;
	
	//승희 - 사용자 회원가입
	public int insertUserMember(Connection conn, UserVo vo) {
//		UM_ID             NOT NULL VARCHAR2(20)  
//		UM_PWD            NOT NULL VARCHAR2(40)  
//		UM_NAME           NOT NULL VARCHAR2(20)  
//		UM_GENDER         NOT NULL VARCHAR2(1)   
//		UM_BIRTH          NOT NULL VARCHAR2(20)  
//		UM_TEL            NOT NULL VARCHAR2(20)  
//		UM_EMAIL          NOT NULL VARCHAR2(100) 
//		UM_POSTCODE       NOT NULL VARCHAR2(20)  
//		UM_ADDRESS        NOT NULL VARCHAR2(100) 
//		UM_DETAIL_ADDRESS NOT NULL VARCHAR2(100)
		int result = 0;
		String sql = "INSERT INTO u_member(UM_ID,UM_PWD,UM_NAME,UM_GENDER,UM_BIRTH,UM_TEL,UM_EMAIL,UM_POSTCODE,UM_ADDRESS,UM_DETAIL_ADDRESS) VALUES(?,?,?,?,REPLACE(?,'-','/'),?,?,?,?,?)";
//		UM_ID,UM_PWD,UM_NAME,UM_GENDER,UM_BIRTH,UM_TEL,UM_EMAIL
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getUmId());
			pstmt.setString(2, vo.getUmPwd());
			pstmt.setString(3, vo.getUmName());
			pstmt.setString(4, vo.getUmGender());
			pstmt.setString(5, vo.getUmBirth());
			pstmt.setString(6, vo.getUmTel());
			pstmt.setString(7, vo.getUmEmail());
			pstmt.setString(8, vo.getUmPostode());
			pstmt.setString(9, vo.getUmAddress());
			pstmt.setString(10, vo.getUmDetailAddress());
			
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
	
	// 내 정보 수정 : 손은진
	public int updateUmInfo(Connection conn, UserVo uvo) {
		
		int result = 0;
		
		String umId = uvo.getUmId();
		
		String sql = "UPDATE U_MEMBER SET UM_PWD = ?, UM_NAME = ?, UM_BIRTH = ?, "
				+ " UM_TEL = ?, UM_EMAIL = ?, UM_POSTCODE = ?, UM_ADDRESS = ?, "
				+ " UM_DETAIL_ADDRESS = ?, UM_UPDATE_DATE = SYSTIMESTAMP WHERE UM_ID = '" + umId + "'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uvo.getUmPwd());
			pstmt.setString(2, uvo.getUmName());
			pstmt.setString(3, uvo.getUmBirth());
			pstmt.setString(4, uvo.getUmTel());
			pstmt.setString(5, uvo.getUmEmail());
			pstmt.setString(6, uvo.getUmPostode());
			pstmt.setString(7, uvo.getUmAddress());
			pstmt.setString(8, uvo.getUmDetailAddress());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 내 정보 조회 : 손은진
	public UserVo usMemberListInfo(Connection conn, String umId) {
		
		UserVo uvo = new UserVo();
		
		String sql = "SELECT UM_ID, UM_NAME, UM_BIRTH, UM_TEL, UM_POSTCODE, UM_ADDRESS, "
				+ " UM_DETAIL_ADDRESS, UM_EMAIL, UM_PWD FROM U_MEMBER "
				+ " WHERE UM_ID = '" + umId + "'";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				uvo.setUmId(rs.getString(1)); // 아이디
				uvo.setUmName(rs.getString(2)); // 이름
				uvo.setUmBirth(rs.getString(3)); // 생년월일
				uvo.setUmTel(rs.getString(4)); // 전화번호
				uvo.setUmPostode(rs.getString(5)); // 우편번호
				uvo.setUmAddress(rs.getString(6)); // 주소
				uvo.setUmDetailAddress(rs.getString(7)); // 상세주소
				uvo.setUmEmail(rs.getString(8)); // 이메일
				uvo.setUmPwd(rs.getString(9)); // 비밀번호
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return uvo;
	}

	//승희 - 사용자 로그인
	public UserLoginVo loginUserMember(Connection conn,UserLoginVo vo) {
		UserLoginVo uvo = null;
		String sql = "SELECT * FROM u_member WHERE UM_ID = ? AND UM_PWD= ?";
		
		try {
			System.out.println("vo.getUmId() :"+ vo.getUmId());
			System.out.println("vo.getUmPwd() : "+vo.getUmPwd());
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUmId());
			pstmt.setString(2, vo.getUmPwd());
			rs = pstmt.executeQuery(); // 괄호안에 작성X
			
			if(rs.next()) {
				uvo = new UserLoginVo();
				uvo.setUmId(rs.getString("um_Id"));
				uvo.setUmPwd(rs.getString("um_Pwd")); 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		System.out.println("UserDao loginUserMember uvo:"+ uvo);
		return uvo;
	}
}

