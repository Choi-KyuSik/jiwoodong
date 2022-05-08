package kh.semi.jwd.user.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import kh.semi.jwd.user.model.dao.UsercpDetailpageDao;
import kh.semi.jwd.user.model.vo.UsercpDetailpageVo;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class UsercpDetailpageService {
	public ArrayList<UsercpDetailpageVo> companyDetail(int cpNo) {
		Connection conn = getConnection();
		
		ArrayList<UsercpDetailpageVo> result = new UsercpDetailpageDao().companyDetail(conn, cpNo);
		
		close(conn);
		
		return result;
	}
	
	// 사용자 업체 상세페이지 - 리뷰 내역 조회
	public ArrayList<Map<String, Object>> uscpRvList(int cpNo) {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> uscpRvList = new UsercpDetailpageDao().uscpRvList(conn, cpNo);
		close(conn);
		System.out.println("uscpRvList:" + uscpRvList);
		return uscpRvList;
	}

}
