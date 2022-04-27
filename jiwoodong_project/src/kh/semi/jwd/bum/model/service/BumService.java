package kh.semi.jwd.bum.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import kh.semi.jwd.bum.model.dao.BumDao;
import kh.semi.jwd.bum.model.vo.BumVo;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class BumService {
	//재우
	public ArrayList<Map<String, Object>> mainPageBookingList() {
		Connection conn = getConnection();
		ArrayList<Map<String,Object>> list = new BumDao().mainPageBookingList(conn);
		close(conn);

		return list;
	}
	//우진
	 public ArrayList<Map<String, Object>> mainPageReviewList(){
	      Connection conn = getConnection();
	      ArrayList<Map<String, Object>> result = new BumDao().mainPageReviewList(conn);
	      close(conn);
	      System.out.println("BumService result:" + result);
	      return result;
	   }
	//재우
	public ArrayList<Map<String, Object>> mainPageStatisticsVisit(){
		Connection conn = getConnection();
		ArrayList<Map<String,Object>> list = new BumDao().mainPageStatisticsVisit(conn);
		close(conn);
		return list;
	}
	//재우
	public ArrayList<Map<String, Object>> mainPageStatisticsReview(){
		Connection conn = getConnection();
		ArrayList<Map<String,Object>> list = new BumDao().mainPageStatisticsReview(conn);
		close(conn);
		return list;
	}
	//우진
	public ArrayList<BumVo> companyCheck(int buNo){
		Connection conn = getConnection();
		ArrayList<BumVo> list = null;
		list = new BumDao().companyCheck(conn, buNo);
		close(conn);
		System.out.println("companyCheck result" + list);
		return list;
		
	}
	//승희
	public int insertBuMember(BumVo vo) {
		int result = 0;
		Connection conn = getConnection();
		result = new BumDao().insertBuMember(conn, vo);
		if(result > 0) {
			commit(conn);
		}else {
			close(conn);
		}
			return result;			
	}
}
