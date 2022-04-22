package kh.semi.jwd.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import kh.semi.jwd.admin.model.dao.AdminNoticeDao;
import kh.semi.jwd.admin.model.vo.AdminNoticeVo;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class AdminNoticeService {
	
	AdminNoticeDao dao = new AdminNoticeDao();
	
	// 글 등록
	public int insertNotice(AdminNoticeVo adnvo) {
		Connection conn = getConnection();
		int result = dao.insertNotice(conn, adnvo);
		
		close(conn);
		return result;
	}
	
	// 글 조회
	public ArrayList<AdminNoticeVo> noticeList() {
		
		Connection conn = getConnection();
		ArrayList<AdminNoticeVo> voList = dao.noticeList(conn);
		close(conn);
		
//		System.out.println("service다. 담겼니?" + voList);
		
		return voList;
	}
	
	// 글 수정
	public int updateNotice(AdminNoticeVo adnvo) {
		Connection conn = getConnection();
		int result = dao.updateNotice(conn, adnvo);
		
		close(conn);
		return result;
	}
	
	
}
