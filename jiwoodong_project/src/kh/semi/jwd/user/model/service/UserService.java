package kh.semi.jwd.user.model.service;


import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

import java.sql.Connection;

import kh.semi.jwd.user.model.dao.UserDao;
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
}
