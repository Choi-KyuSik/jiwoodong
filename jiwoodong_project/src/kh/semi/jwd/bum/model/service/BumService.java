package kh.semi.jwd.bum.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import kh.semi.jwd.bum.model.dao.BumDao;
import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class BumService {
	//jw
	public ArrayList<Map<String, Object>> mainPageBookingList() {
		Connection conn = getConnection();
		ArrayList<Map<String,Object>> list = new BumDao().mainPageBookingList(conn);
		close(conn);

		return list;
	}
	//wj
	 public ArrayList<Map<String, Object>> mainPageReviewList(){
	      Connection conn = getConnection();
	      ArrayList<Map<String, Object>> result = new BumDao().mainPageReviewList(conn);
	      close(conn);
	      System.out.println("BumService result:" + result);
	      return result;
	   }
	//jw
	public ArrayList<Map<String, Object>> mainPageStatisticsVisit(){
		Connection conn = getConnection();
		ArrayList<Map<String,Object>> list = new BumDao().mainPageStatisticsVisit(conn);
		close(conn);
		return list;
	}
	//jw
	public ArrayList<Map<String, Object>> mainPageStatisticsReview(){
		Connection conn = getConnection();
		ArrayList<Map<String,Object>> list = new BumDao().mainPageStatisticsReview(conn);
		close(conn);
		return list;
	}

}
