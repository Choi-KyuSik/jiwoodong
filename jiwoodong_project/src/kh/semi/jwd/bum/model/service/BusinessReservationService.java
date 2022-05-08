package kh.semi.jwd.bum.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.swing.Scrollable;

import kh.semi.jwd.bum.model.dao.BusinessReservationDao;
import kh.semi.jwd.bum.model.vo.BumReservationVo;
import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class BusinessReservationService {
	
	public ArrayList<BumReservationVo>  BusinessReservationCheck(int cpNo){
		Connection conn = getConnection();
		ArrayList<BumReservationVo> result = new  BusinessReservationDao().BusinessReservationCheck(conn, cpNo);
		close(conn);
		return result;
	}
	
	public ArrayList<BumReservationVo>  BusinessReservationCheckCafe(int cpNo){
		Connection conn = getConnection();
		ArrayList<BumReservationVo> result = new  BusinessReservationDao().BusinessReservationCheckCafe(conn, cpNo);
		close(conn);
		return result;
	}
	
	public ArrayList<Map<String, Object>> menuList(int cpNo) {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result = new  BusinessReservationDao().menuList(conn, cpNo);
		close(conn);
		return result;
		}
	
	public Map<String,Object> priceSelect(Map<String,Object> map){
		Connection conn = getConnection();
		Map<String,Object> priceMap = new BusinessReservationDao().priceSelect(conn, map);
		close(conn);
		return priceMap;
	}

	public int reservationAdd(Map<String, Object> map, int cpNo){
		Connection conn = getConnection();
		int result = new BusinessReservationDao().reservationAdd(conn, map, cpNo);
		close(conn);
		return result;
	}
	
	public int reservationAddMenu(Map<String, Object> map , int cpNo) {
		Connection conn = getConnection();
		int result = new BusinessReservationDao().reservationAddMenu(conn, map, cpNo);
		close(conn);
		return result;
	}
	
	public int reservationAddMenuCafe(Map<String, Object> map, String menuNo, String menuCount , int cpNo) {
		Connection conn = getConnection();
		int result = new BusinessReservationDao().reservationAddMenuCafe(conn, map, menuNo, menuCount, cpNo);
		close(conn);
		return result;
	}

	public int reservationCancle(String bkNo) {
		Connection conn = getConnection();
		int result = new BusinessReservationDao().reservationCancle(conn, bkNo);
		close(conn);
		return result;
	}

	public int reservationUpdate(Map<String, Object> map, int cpNo) {
		Connection conn = getConnection();
		int result = new BusinessReservationDao().reservationUpdate(conn, map, cpNo);
		close(conn);
		return result;
	}

	public int reservationUpdateCafe(Map<String, Object> map, int cpNo) {
		Connection conn = getConnection();
		int result = new BusinessReservationDao().reservationUpdateCafe(conn, map, cpNo);
		close(conn);
		return result;
	}

	public ArrayList<BumReservationVo> AllStatus(String date, int cpNo) {
		Connection conn = getConnection();
		ArrayList<BumReservationVo> result = new  BusinessReservationDao().AllStatus(conn, date, cpNo);
		close(conn);
		return result;
	}
	
	public ArrayList<BumReservationVo> AllStatusCafe(String date, int cpNo) {
		Connection conn = getConnection();
		ArrayList<BumReservationVo> result = new  BusinessReservationDao().AllStatusCafe(conn, date, cpNo);
		close(conn);
		return result;
	}

	public ArrayList<BumReservationVo> selectStatus(String date, int cpNo, String status) {
		Connection conn = getConnection();
		ArrayList<BumReservationVo> result = new  BusinessReservationDao().selectStatus(conn, date, cpNo, status);
		close(conn);
		return result;
	}
	
	public ArrayList<BumReservationVo> selectStatusCafe(String date, int cpNo, String status) {
		Connection conn = getConnection();
		ArrayList<BumReservationVo> result = new  BusinessReservationDao().selectStatusCafe(conn, date, cpNo, status);
		close(conn);
		return result;
	}

	public ArrayList<Map<String, Object>> reservationMenuList(int cpNo) {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result = new  BusinessReservationDao().reservationMenuList(conn, cpNo);
		close(conn);
		return result;
	}

	/*
	 * public int fileUpload(Map<String, Object> map, int cpNo) { Connection conn =
	 * getConnection(); int result = new BusinessReservationDao().fileUpload(conn,
	 * map, cpNo); close(conn); return result; }
	 */

	public int reservationMenuInsert(Map<String, Object> map, int cpNo) {
		Connection conn = getConnection();
		int result = new BusinessReservationDao().reservationMenuInsert(conn,map, cpNo);
		close(conn);
		return result;
	}

	public int reservationMenuDelete(int menuNo) {
		Connection conn = getConnection();
		int result = new BusinessReservationDao().reservationMenuDelete(conn,menuNo);
		close(conn);
		return result;
	}

	public String cpCatecoryCheck(int cpNo) {
		Connection conn = getConnection();
		String result = new BusinessReservationDao().cpCatecoryCheck(conn,cpNo);
		close(conn);
		return result;
	}

	public ArrayList<Map<String, Object>> bmenuList(String bkno) {
		Connection conn = getConnection();
		ArrayList<Map<String, Object>> result = new BusinessReservationDao().bmenuList(conn,bkno);
		close(conn);
		return result;
	}

	public int reservationMenuPrice(String string) {
		Connection conn = getConnection();
		int result = new BusinessReservationDao().reservationMenuPrice(conn,string);
		close(conn);
		return result;
	}

}
