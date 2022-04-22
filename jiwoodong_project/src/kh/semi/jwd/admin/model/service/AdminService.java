package kh.semi.jwd.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import kh.semi.jwd.admin.model.dao.AdminDao;
import kh.semi.jwd.admin.model.vo.AdminVo;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class AdminService {
	private AdminDao dao = new AdminDao();

	public int insertAdmin(AdminVo advo) {
		Connection conn = getConnection();
		int result = AdminDao.insertAdmin(conn, advo);

		close(conn);
		return result;
	}

	// 관리자 멤버 리스트 보기
	public ArrayList<AdminVo> listAdmin(){
		ArrayList<AdminVo> result = null;
		Connection conn = getConnection();
		result = dao.listAdmin(conn);
		close(conn);
		return result;
	}

	// 업체등록요청 현황 조회
	public ArrayList<Map<String, Object>> companyAcceptList() {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result = dao.companyAcceptList(conn);
		close(conn);
		return result;
	}

}
