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
	
	// 글 조회(공지사항조회)
	public ArrayList<AdminNoticeVo> noticeListDetail() {

		Connection conn = getConnection();
		ArrayList<AdminNoticeVo> voList = dao.noticeListDetail(conn);
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
	
	// 글 삭제
	public int deleteNotice(AdminNoticeVo adnvo) {
		Connection conn = getConnection();
		int result = dao.deleteNotice(conn, adnvo);

		close(conn);
		return result;
	}

	// 특정 게시글 번호의 모든 정보
	public AdminNoticeVo readNotice(int ntNo) {
		Connection conn = getConnection();
		AdminNoticeVo result = dao.readNotice(conn, ntNo);
		
		close(conn);
		return result;
	}


}
