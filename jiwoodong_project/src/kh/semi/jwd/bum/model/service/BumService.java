package kh.semi.jwd.bum.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import kh.semi.jwd.bum.model.dao.BumDao;
import kh.semi.jwd.bum.model.vo.BumLoginVo;
import kh.semi.jwd.bum.model.vo.BumVo;
import kh.semi.jwd.bum.model.vo.CompanyVo;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class BumService {
	// 재우
	public ArrayList<Map<String, Object>> mainPageBookingList(int cpNo) {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> list = new BumDao().mainPageBookingList(conn, cpNo);
		close(conn);

		return list;
	}

	// 우진
	public ArrayList<Map<String, Object>> mainPageReviewList(int cpNo) {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result = new BumDao().mainPageReviewList(conn, cpNo);
		close(conn);
		System.out.println("BumService result:" + result);
		return result;
	}

	// 재우
	public ArrayList<Map<String, Object>> mainPageStatisticsVisit(int cpNo) {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> list = new BumDao().mainPageStatisticsVisit(conn, cpNo);
		close(conn);
		return list;
	}

	// 재우
	public ArrayList<Map<String, Object>> mainPageStatisticsReview(int cpNo) {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> list = new BumDao().mainPageStatisticsReview(conn, cpNo);
		close(conn);
		return list;
	}

	// 우진
	public BumVo companyCheck(String buId) {
		Connection conn = getConnection();
		BumVo vo = null;
		vo = new BumDao().companyCheck(conn, buId);
		close(conn);
		System.out.println("companyCheck result" + vo);
		return vo;

	}

	// 승희-회원가입
	public int insertBuMember(BumVo vo) {
		int result = 0;
		Connection conn = getConnection();
		result = new BumDao().insertBuMember(conn, vo);
		close(conn);
		return result;
	}
	//승희 - 아이디 중복 체크
	public String emailDupleCheck(String inputEmail) {
		String result;
		Connection conn = getConnection();
		result = new BumDao().emailDupleCheck(conn, inputEmail);
		close(conn);
		System.out.println("(bum)emailDupleCheck result:" + result);
		return result;
		
	}
	//승희 - 사업자 로그인
	public BumLoginVo loginBuMember(BumLoginVo vo) {
		BumLoginVo bvo = new BumLoginVo();
		Connection conn = getConnection();
		bvo = new BumDao().loginBuMember(conn, vo);
		close(conn);
		// System.out.println("loginBuMember bvo:" + bvo);
		return bvo;
		
	}
	//승희 - 사업자 이메일 중복 체크
	public int checkBuId(String buId) {
		int result;
		Connection conn = getConnection();
		result = new BumDao().checkBuId(conn, buId);
		close(conn);
		System.out.println("checkBuId result:" + result);
		return result;
		
	}	
	

	// 우진
	public int companyUpdate(String buId, BumVo vo) {
		Connection conn = getConnection();
		int result = 0;
		result = new BumDao().companyUpdate(conn, buId, vo);
		close(conn);
		System.out.println("companyCheckService result: " + result);
		return result;

	}

	// 우진
	public int companyWrite(CompanyVo cvo, int buNo) {
		Connection conn = getConnection();
		int result = new BumDao().companyWrite(conn, cvo, buNo);
		close(conn);
		System.out.println("companyWriteService result: " + result);
		return result;

	}
	// 우진
	public int bumDelete(BumVo vo){
		Connection conn = getConnection();
		int result = 0;
		result = new BumDao().bumDelete(conn, vo);
		close(conn);
		System.out.println("bumDelete result: " + result);
		return result;

	}	
	// 우진
	public int companyDelete(CompanyVo cvo){
		Connection conn = getConnection();
		int result = 0;
		result = new BumDao().companyDelete(conn, cvo);
		close(conn);
		System.out.println("companyDelete result: " + result);
		return result;
		
	}
	
	// 우진
		public String companyWriteCheck(int buNo) {
			Connection conn = getConnection();
			String result2 = new BumDao().companyWriteCheck(conn, buNo);
			close(conn);
			System.out.println("companyCheck result" + result2);
			return result2;
		}
	//우진
		public int getBuno(String bu_id) {
			Connection conn = getConnection();
			int list = new BumDao().getBuno(conn,bu_id);
			close(conn);
			return list;
		}
}
