package kh.semi.jwd.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import kh.semi.jwd.admin.model.dao.AdminNoticeDao;
import kh.semi.jwd.admin.model.vo.AdminNoticeVo;
import kh.semi.jwd.admin.model.vo.AdminVo;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class AdminNoticeService {
	
	public int insertNotice(AdminNoticeVo adnvo) {
		Connection conn = getConnection();
		int result = AdminNoticeDao.insertNotice(conn, adnvo);
		
		close(conn);
		return result;
	}
	
}
