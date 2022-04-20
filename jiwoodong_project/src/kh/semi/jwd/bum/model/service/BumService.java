package kh.semi.jwd.bum.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import kh.semi.jwd.bum.model.dao.BumDao;
import kh.semi.jwd.common.jdbc.JdbcDBCP;

public class BumService {
	
	public ArrayList<Map<String, Object>> mainPageBookingList() {
		Connection conn = JdbcDBCP.getConnection();
		ArrayList<Map<String,Object>> list = new BumDao().mainPageBookingList(conn);
		JdbcDBCP.close(conn);
		return list;
	}

}
