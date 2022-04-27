package kh.semi.jwd.user.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import kh.semi.jwd.user.model.dao.UsercpDetailpageDao;
import kh.semi.jwd.user.model.vo.UsercpDetailpageVo;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class UsercpDetailpageService {
	public ArrayList<UsercpDetailpageVo> companyDetail() {
		Connection conn = getConnection();
		
		ArrayList<UsercpDetailpageVo> result = new UsercpDetailpageDao().companyDetail(conn);
		
		close(conn);
		
		return result;
	}

}
