package kh.semi.jwd.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import kh.semi.jwd.admin.model.dao.AdminDao;
import kh.semi.jwd.admin.model.vo.AdminVo;
import kh.semi.jwd.bum.model.vo.BumVo;

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

	// 업체등록요청 현황 조회(상세)
	public ArrayList<Map<String, Object>> companyAcceptDetailList() {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result = dao.companyAcceptList(conn);
		close(conn);
		return result;
	}

	// 업체등록요청 세부 1개 조회
	public ArrayList<Map<String, Object>> companyAcceptDetailRead(int buNo) {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result = dao.companyAcceptDetailRead(conn, buNo);
		close(conn);
		return result;
	}

	// 승인 거절 시
	public int companyAcceptReject(String rejectMsg, int buNo) {
		int result = 0;

		Connection conn = getConnection();
		result = dao.companyAcceptReject(conn, rejectMsg, buNo);
		close(conn);

		return result;
	}

	// 승인 시
	public int companyAcceptApproval(int buNo) {

		int result = 0;

		Connection conn = getConnection();
		result = dao.companyAcceptApproval(conn, buNo);
		close(conn);

		return result;

	}
	
	// 승인 거절 리스트
	public ArrayList<Map<String, Object>> companyAcceptRejectList() {
		
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result = dao.companyAcceptRejectList(conn);
		close(conn);
		return result;
		
	}
	
	
	// 승인 수락 리스트
	public ArrayList<Map<String, Object>> companyAcceptApprovalList() {
		
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result = dao.companyAcceptApprovalList(conn);
		close(conn);
		return result;
		
	}
	
	// 사업자 정보 조회
	public ArrayList<BumVo> buMemberInfoList() {
		
		Connection conn = getConnection();
		ArrayList<BumVo> result = dao.buMemberInfoList(conn);
		close(conn);
		return result;
		
	}
	
	// 사업자 정보 상세 조회
	public BumVo buMemberDetailInfo(int buNo) {
		
		Connection conn = getConnection();
		BumVo result = dao.buMemberDetailInfo(conn, buNo);
		close(conn);
		return result; 
	}
	
	// 사업자 정보 수정
	public int updateBuInfo(BumVo bvo) {
		
		Connection conn = getConnection();
		int result = dao.updateBuInfo(conn, bvo);
		close(conn);
		return result;
	}
	
	// 사업자 회원 탈퇴
	public int deleteBuInfo(BumVo bvo) {
		
		Connection conn = getConnection();
		int result = dao.deleteBuInfo(conn, bvo);
		close(conn);
		return result;
		
	}
	
	// 사업자 탈퇴 리스트
	public ArrayList<BumVo> buMemberDeleteList() {
	
		Connection conn = getConnection();
		ArrayList<BumVo> result = dao.buMemberDeleteList(conn);
		close(conn);
		return result;
		
	}
	

}
