package kh.semi.jwd.user.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import kh.semi.jwd.user.model.dao.UsercpSearchpageDao;
import kh.semi.jwd.user.model.vo.UsercpSearchpageVo;
import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class UsercpSearchpageService {
	
	public ArrayList<UsercpSearchpageVo> listCompany() {
		
		Connection conn = getConnection(); 
		
		ArrayList<UsercpSearchpageVo> result = new UsercpSearchpageDao().listCompany(conn);
		
		close(conn);
		
		return result;
		
	}
}
