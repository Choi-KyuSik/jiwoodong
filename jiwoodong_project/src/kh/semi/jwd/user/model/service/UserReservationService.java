package kh.semi.jwd.user.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import kh.semi.jwd.bum.model.vo.CompanyVo;
import kh.semi.jwd.user.model.dao.UserReservationDao;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class UserReservationService {
	
	public ArrayList<CompanyVo> cpInfo(int cpNo){
		Connection conn = getConnection();
		ArrayList<CompanyVo> result  = new UserReservationDao().cpInfo(conn, cpNo);
		close(conn);
		return result;
	}

	public ArrayList<Map<String, Object>> reservationTimeCheck(String rsdate, int cpNo) {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result  = new UserReservationDao().reservationTimeCheck(conn, rsdate, cpNo);
		close(conn);
		return result;
	}

	public ArrayList<Map<String, Object>> cpmenu(int cpNo) {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result  = new UserReservationDao().cpmenu(conn, cpNo);
		close(conn);
		return result;
	}

	public ArrayList<Map<String, Object>> menuInfo(String menuNo) {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result  = new UserReservationDao().menuInfo(conn, menuNo);
		close(conn);
		return result;
	}

	public int reservationInsertCafe(Map<String, Object> map) {
		Connection conn = getConnection();
		int result = new UserReservationDao().reservationInsertCafe(conn, map);
		close(conn);
		return result;
	}

	public int reservationInsertCafemenu(Map<String, Object> map, String menuno, String menucount) {
		Connection conn = getConnection();
		int result = new UserReservationDao().reservationInsertCafemenu(conn, map, menuno, menucount);
		close(conn);
		return result;
	}
	
	public int reservationInsertSalonmenu(Map<String, Object> map) {
		Connection conn = getConnection();
		int result = new UserReservationDao().reservationInsertSalonmenu(conn, map);
		close(conn);
		return result;
	}

}
