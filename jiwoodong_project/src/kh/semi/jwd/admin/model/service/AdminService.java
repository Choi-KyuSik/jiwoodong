package kh.semi.jwd.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import kh.semi.jwd.admin.model.dao.AdminDao;
import kh.semi.jwd.admin.model.vo.AdminVo;
import kh.semi.jwd.bum.model.vo.BumVo;
import kh.semi.jwd.user.model.dao.UserDao;
import kh.semi.jwd.user.model.vo.AdminUserVo;
import kh.semi.jwd.user.model.vo.UserLoginVo;

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
	public ArrayList<Map<String, Object>> companyAcceptDetailList(int startRnum, int endRnum) {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result = dao.companyAcceptDetailList(conn, startRnum, endRnum);
		close(conn);
		return result;
	}
	
	// 업체등록요청 현황 조회(상세) - 페이징, 검색처리
	public ArrayList<Map<String, Object>> companyAcceptDetailSearchList(String field, String query, int startRnum, int endRnum) {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result = dao.companyAcceptDetailSearchList(conn, field, query, startRnum, endRnum);
		close(conn);
		return result;
	}

	// 업체등록요청 세부 1개 조회
	public ArrayList<Map<String, Object>> companyAcceptDetailRead(int cpNo) {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result = dao.companyAcceptDetailRead(conn, cpNo);
		close(conn);
		return result;
	}

	// 승인 거절 시
	public int companyAcceptReject(String rejectMsg, int cpNo) {
		int result = 0;

		Connection conn = getConnection();
		result = dao.companyAcceptReject(conn, rejectMsg, cpNo);
		close(conn);

		return result;
	}

	// 승인 시
	public int companyAcceptApproval(int cpNo) {

		int result = 0;

		Connection conn = getConnection();
		result = dao.companyAcceptApproval(conn, cpNo);
		close(conn);

		return result;

	}

	// 승인 거절 리스트
	public ArrayList<Map<String, Object>> companyAcceptRejectList(int startRnum, int endRnum) {

		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result = dao.companyAcceptRejectList(conn, startRnum, endRnum);
		close(conn);
		return result;

	}


	// 승인 수락 리스트
	public ArrayList<Map<String, Object>> companyAcceptApprovalList(int startRnum, int endRnum) {

		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result = dao.companyAcceptApprovalList(conn, startRnum, endRnum);
		close(conn);
		return result;

	}

	// 사업자 정보 조회
	public ArrayList<BumVo> buMemberInfoList(int startRnum, int endRnum) {

		Connection conn = getConnection();
		ArrayList<BumVo> result = dao.buMemberInfoList(conn, startRnum, endRnum);
		close(conn);
		return result;

	}
	
	// 사업자 정보 조회 - 검색
	public ArrayList<BumVo> buMemberInfoSearchList(String field, String query, int startRnum, int endRnum) {

		Connection conn = getConnection();
		ArrayList<BumVo> result = dao.buMemberInfoSearchList(conn, field, query, startRnum, endRnum);
		close(conn);
		return result;

	}

	// 사업자 정보 상세 조회
	public BumVo buMemberDetailInfo(int cpNo) {

		Connection conn = getConnection();
		BumVo result = dao.buMemberDetailInfo(conn, cpNo);
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
	public ArrayList<BumVo> buMemberDeleteList(int startRnum, int endRnum) {

		Connection conn = getConnection();
		ArrayList<BumVo> result = dao.buMemberDeleteList(conn, startRnum, endRnum);
		close(conn);
		return result;

	}

	// 사용자 정보 조회
	public ArrayList<AdminUserVo> usMemberInfoList(int startRnum, int endRnum) {

		Connection conn = getConnection();
		ArrayList<AdminUserVo> result = dao.usMemberInfoList(conn, startRnum, endRnum);
		close(conn);
		return result;

	}
	
	// 사용자 정보 조회 : 검색
	public ArrayList<AdminUserVo> usMemberInfoSearchList(String field, String query, int startRnum, int endRnum) {

		Connection conn = getConnection();
		ArrayList<AdminUserVo> result = dao.usMemberInfoSearchList(conn, field, query, startRnum, endRnum);
		close(conn);
		return result;

	}
	
	// 사업자 정보 상세 조회
	public AdminUserVo usMemberDetailInfo(AdminUserVo uvo) {

		Connection conn = getConnection();
		AdminUserVo result = dao.usMemberDetailInfo(conn, uvo);
		close(conn);
		return result; 
	}

	// 사용자 회원 탈퇴
	public int deleteUmInfo(AdminUserVo uvo) {

		Connection conn = getConnection();
		int result = dao.deleteUmInfo(conn, uvo);
		close(conn);
		return result;

	}

	// 사용자 정보 수정
	public int updateUmInfo(AdminUserVo uvo) {

		Connection conn = getConnection();
		int result = dao.updateUmInfo(conn, uvo);
		close(conn);
		return result;
	}

	// 사용자 탈퇴 리스트
	public ArrayList<AdminUserVo> umMemberDeleteList(int startRnum, int endRnum) {

		Connection conn = getConnection();
		ArrayList<AdminUserVo> result = dao.umMemberDeleteList(conn, startRnum, endRnum);
		close(conn);
		return result;

	}

	// 업체 신청 리스트 글 개수
	public int countBuAcceptList() {
		Connection conn = getConnection();
		int result = dao.countBuAcceptList(conn);
		close(conn);
		return result;
	}
	
	// 업체 신청 검색 리스트 카운트 만들기
	public int countBuAcceptSearchList(String field, String query) {
		Connection conn = getConnection();
		int result = dao.countBuAcceptSearchList(conn, field, query);
		close(conn);
		return result;
	}

	// 업체 수락 리스트 글 개수
	public int countBuAcceptApprovalList() {
		Connection conn = getConnection();
		int result = dao.countBuAcceptApprovalList(conn);
		close(conn);
		return result;
	}

	// 업체 거절 리스트 글 개수
	public int countBuAcceptRejectList() {
		Connection conn = getConnection();
		int result = dao.countBuAcceptRejectList(conn);
		close(conn);
		return result;
	}

	// 사업자 정보 리스트 글 개수
	public int countBuMemberInfoList() {
		Connection conn = getConnection();
		int result = dao.countBuMemberInfoList(conn);
		close(conn);
		return result;
	}
	
	// 사업자 정보 리스트 글 개수
	public int countBuMemberInfoSearchList(String field, String query) {
		Connection conn = getConnection();
		int result = dao.countBuMemberInfoSearchList(conn, field, query);
		close(conn);
		return result;
	}

	// 사업자 탈퇴자 정보 리스트 글 개수
	public int countBuMemberInfoDeleteList() {
		Connection conn = getConnection();
		int result = dao.countBuMemberInfoDeleteList(conn);
		close(conn);
		return result;
	}

	// 사용자 정보 리스트 글 개수
	public int countUsMemberInfoList() {
		Connection conn = getConnection();
		int result = dao.countUsMemberInfoList(conn);
		close(conn);
		return result;
	}
	
	// 사용자 정보 검색 리스트 글 개수
	public int countUsMemberInfoSearchList(String field, String query) {
		Connection conn = getConnection();
		int result = dao.countUsMemberInfoSearchList(conn, field, query);
		close(conn);
		return result;
	}

	// 사업자 탈퇴자 정보 리스트 글 개수
	public int countUsMemberInfoDeleteList() {
		Connection conn = getConnection();
		int result = dao.countUsMemberInfoDeleteList(conn);
		close(conn);
		return result;
	}
	
	// 업종별 예약현황 통계 count
	public ArrayList<Map<String, Object>> bookingCount() {
		
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result = dao.bookingCount(conn);
		close(conn);
		return result;
	}
	//관리자 로그인 
	
	public AdminVo loginAdmin(AdminVo vo) {
		AdminVo avo = new AdminVo();
		Connection conn = getConnection();
		avo = new AdminDao().loginAdmin(conn, vo);
		close(conn);
		// System.out.println("loginBuMember bvo:" + bvo);
		return avo;
		
	}
}
