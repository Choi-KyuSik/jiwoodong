package kh.semi.jwd.bum.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import kh.semi.jwd.bum.model.dao.BusinessReservationDao;
import kh.semi.jwd.bum.model.vo.BumReservationVo;
import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class BusinessReservationService {
	
	public ArrayList<BumReservationVo>  BusinessReservationCheck(){
		Connection conn = getConnection();
		ArrayList<BumReservationVo> result = new  BusinessReservationDao().BusinessReservationCheck(conn);
		close(conn);
		return result;
	}
	
	public ArrayList<Map<String, Object>> menuList(int cpNo) {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result = new  BusinessReservationDao().menuList(conn, cpNo);
		close(conn);
		return result;
		}
	
	public int reservationAdd(Map<String, Object> map){
		Connection conn = getConnection();
		int result = new BusinessReservationDao().reservationAdd(conn, map);
		close(conn);
		return result;
	}
	
	public Map<String,Object> priceSelect(Map<String,Object> map){
		Connection conn = getConnection();
		Map<String,Object> priceMap = new BusinessReservationDao().priceSelect(conn, map);
		close(conn);
		return priceMap;
	}

}
