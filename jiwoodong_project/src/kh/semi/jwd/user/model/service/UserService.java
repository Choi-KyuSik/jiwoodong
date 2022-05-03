package kh.semi.jwd.user.model.service;


import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

import java.sql.Connection;

import kh.semi.jwd.user.model.dao.UserDao;
import kh.semi.jwd.user.model.vo.UserLoginVo;
import kh.semi.jwd.user.model.vo.UserVo;

public class UserService {

	//승희 - 사용자 회원가입 
	public int insertUserMember(UserVo vo) {
		int result = 0;
		Connection conn = getConnection();
		result = new UserDao().insertUserMember(conn, vo);
		if(result > 0) {
			commit(conn);
		}else {
			close(conn);
		}
			return result;			
	}
	//승희 - 아이디 중복 체크
	public int checkUmId(String umId) {
		int result;
		Connection conn = getConnection();
		result = new UserDao().checkUmId(conn, umId);
		close(conn);
		System.out.println("checkUmId result:" + result);
		return result;
		
	}
	//승희 - 사용자 로그인
	public UserLoginVo loginUserMember(UserLoginVo vo) {
		UserLoginVo uvo = new UserLoginVo();
		Connection conn = getConnection();
		uvo = new UserDao().loginUserMember(conn, vo);
		close(conn);
		// System.out.println("loginBuMember bvo:" + bvo);
		return uvo;
		
	}
	
	// 내 정보 수정 : 손은진
	public int updateUmInfo(UserVo uvo) {
		int result = 0;
		
		Connection conn = getConnection();
		result = new UserDao().updateUmInfo(conn, uvo);
		close(conn);
		
		return result;
	}
	
	// 내 정보 조회 : 손은진
	public UserVo usMemberListInfo(String umId) {
		UserVo result = null;

		Connection conn = getConnection();
		result = new UserDao().usMemberListInfo(conn, umId);
		close(conn);

		return result;
	}
	
	// 회원 탈퇴 : 손은진
	public int deleteUmInfo(UserVo uvo) {
		int result = 0;

		Connection conn = getConnection();
		result = new UserDao().deleteUmInfo(conn, uvo);
		close(conn);

		return result;
	}
}
