package kh.semi.jwd.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kh.semi.jwd.bum.model.vo.CompanyVo;
import kh.semi.jwd.user.model.vo.UserBookingListVo;
import kh.semi.jwd.user.model.vo.UserLoginVo;
import kh.semi.jwd.user.model.vo.UserVo;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class UserDao {
	
	// DB를 왔다갔다 하는것
	private PreparedStatement pstmt = null;
	// DB를 Java용 언어로 바꿔주는것
	private ResultSet rs = null;
	
	//승희 - 사용자 회원가입
	public int insertUserMember(Connection conn, UserVo vo) {
//		UM_ID             NOT NULL VARCHAR2(20)  
//		UM_PWD            NOT NULL VARCHAR2(40)  
//		UM_NAME           NOT NULL VARCHAR2(20)  
//		UM_GENDER         NOT NULL VARCHAR2(1)   
//		UM_BIRTH          NOT NULL VARCHAR2(20)  
//		UM_TEL            NOT NULL VARCHAR2(20)  
//		UM_EMAIL          NOT NULL VARCHAR2(100) 
//		UM_POSTCODE       NOT NULL VARCHAR2(20)  
//		UM_ADDRESS        NOT NULL VARCHAR2(100) 
//		UM_DETAIL_ADDRESS NOT NULL VARCHAR2(100)
		int result = 0;
		String sql = "INSERT INTO u_member(UM_ID,UM_PWD,UM_NAME,UM_GENDER,UM_BIRTH,UM_TEL,UM_EMAIL,UM_POSTCODE,UM_ADDRESS,UM_DETAIL_ADDRESS) VALUES(?,?,?,?,REPLACE(?,'-','/'),?,?,?,?,?)";
//		UM_ID,UM_PWD,UM_NAME,UM_GENDER,UM_BIRTH,UM_TEL,UM_EMAIL
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getUmId());
			pstmt.setString(2, vo.getUmPwd());
			pstmt.setString(3, vo.getUmName());
			pstmt.setString(4, vo.getUmGender());
			pstmt.setString(5, vo.getUmBirth());
			pstmt.setString(6, vo.getUmTel());
			pstmt.setString(7, vo.getUmEmail());
			pstmt.setString(8, vo.getUmPostode());
			pstmt.setString(9, vo.getUmAddress());
			pstmt.setString(10, vo.getUmDetailAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			//디버깅
			System.out.println("UserDao result:"+result);
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	// 승희 - 사용자 아이디 중복체크
	
	public int checkUmId(Connection conn, String umId) {
		
		int result = 0;
		
		String sql = "select um_id from u_member where um_id=?";
		System.out.println(umId);
		try {
//			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, umId);
			rs = pstmt.executeQuery();
			
			if(rs.next() || umId.equals("")) {
				result = 0; 
				System.out.println("이미 존재 하는 아이디 입니다.");
			}else {
				result = 1;
				System.out.println("사용가능한 아이디입니다.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		System.out.println("아이디 중복체크 결과: "+result);
		return result;
	}
	
	// 내 정보 수정 : 손은진
	public int updateUmInfo(Connection conn, UserVo uvo) {
		
		int result = 0;
		
		String umId = uvo.getUmId();
		
		String sql = "UPDATE U_MEMBER SET UM_PWD = ?, UM_NAME = ?, UM_BIRTH = ?, "
				+ " UM_TEL = ?, UM_EMAIL = ?, UM_POSTCODE = ?, UM_ADDRESS = ?, "
				+ " UM_DETAIL_ADDRESS = ?, UM_UPDATE_DATE = SYSTIMESTAMP WHERE UM_ID = '" + umId + "'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uvo.getUmPwd());
			pstmt.setString(2, uvo.getUmName());
			pstmt.setString(3, uvo.getUmBirth());
			pstmt.setString(4, uvo.getUmTel());
			pstmt.setString(5, uvo.getUmEmail());
			pstmt.setString(6, uvo.getUmPostode());
			pstmt.setString(7, uvo.getUmAddress());
			pstmt.setString(8, uvo.getUmDetailAddress());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 내 정보 조회 : 손은진
	public UserVo usMemberListInfo(Connection conn, String umId) {
		
		UserVo uvo = new UserVo();
		
		String sql = "SELECT UM_ID, UM_NAME, UM_BIRTH, UM_TEL, UM_POSTCODE, UM_ADDRESS, "
				+ " UM_DETAIL_ADDRESS, UM_EMAIL, UM_PWD FROM U_MEMBER "
				+ " WHERE UM_ID = '" + umId + "'";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				uvo.setUmId(rs.getString(1)); // 아이디
				uvo.setUmName(rs.getString(2)); // 이름
				uvo.setUmBirth(rs.getString(3)); // 생년월일
				uvo.setUmTel(rs.getString(4)); // 전화번호
				uvo.setUmPostode(rs.getString(5)); // 우편번호
				uvo.setUmAddress(rs.getString(6)); // 주소
				uvo.setUmDetailAddress(rs.getString(7)); // 상세주소
				uvo.setUmEmail(rs.getString(8)); // 이메일
				uvo.setUmPwd(rs.getString(9)); // 비밀번호
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return uvo;
	}

	//승희 - 사용자 로그인
	public UserLoginVo loginUserMember(Connection conn,UserLoginVo vo) {
		UserLoginVo uvo = new UserLoginVo();
		String sql = "SELECT * FROM u_member WHERE UM_ID = ? AND UM_PWD= ?";
		
		try {
			System.out.println("vo.getUmId() :"+ vo.getUmId());
			System.out.println("vo.getUmPwd() : "+vo.getUmPwd());
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUmId());
			pstmt.setString(2, vo.getUmPwd());
			rs = pstmt.executeQuery(); // 괄호안에 작성X
			
			if(rs.next()) {
				uvo.setUmId(rs.getString("um_Id"));
				uvo.setUmPwd(rs.getString("um_Pwd")); 
				uvo.setUmName(rs.getString(3)); //사용자 이름 저장.
				uvo.setUmTel(rs.getString(6)); // 전화번호
				uvo.setUmPostcode(rs.getString(7)); // 우편번호
				uvo.setUmAddress(rs.getString(8)); // 주소
				uvo.setUmUseYn(rs.getString(12));//탈퇴 여부
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("로그인 오류");
		}finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		System.out.println("UserDao loginUserMember uvo:"+ uvo);
		return uvo;
	}
	
	// 회원 탈퇴 : 손은진
	public int deleteUmInfo(Connection conn, UserVo uvo) {
		
		int result = 0;
		
		String sql = "UPDATE U_MEMBER SET UM_OUT_DATE = SYSTIMESTAMP, UM_USEYN = 'N' WHERE UM_ID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uvo.getUmId());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		  close(pstmt);
		}
		
		return result;
		
	}
	
	// 사용자 마이페이지 - 업체 조회 : 최규식
		public ArrayList<CompanyVo> usCpList(Connection conn) {
			
			ArrayList<CompanyVo> volist = null;
			
			String sql = "SELECT CP_NAME, CP_ADDRESS, CP_DTADDRESS, FL_GNO FROM COMPANY WHERE CP_SIGNYN IN ('Y','y')";
			
			volist = new ArrayList<CompanyVo>();
			
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					CompanyVo cvo = new CompanyVo();
					cvo.setCpName(rs.getString("CP_NAME"));
					cvo.setCpAddress(rs.getString("CP_ADDRESS"));
					cvo.setCpDtaddress(rs.getString("CP_DTADDRESS"));
					cvo.setFlGno(rs.getString("FL_GNO"));
					
					volist.add(cvo);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			
			return volist;
			
			
		}
		
		// 사용자 마이페이지 - 예약 현황 조회 : 최규식
		public ArrayList<Map<String, Object>> usBkList(Connection conn, String umId) {
			
			 ArrayList<Map<String, Object>> volist = null;
			 
			 String sql = "select * from"
			 		+ "    (select rownum rnum, a.*"
			 		+ "     from (select cp_name,bk_date, substr(bk_time, 1, 5), REPLACE(REPLACE(REPLACE (BK_STATUS,'R','예약완료'),'H','예약대기'),'C','예약취소') as bk_statusC"
			 		+ "            from booking b"
			 		+ "            join company c on b.cp_no = c.cp_no where um_id = ?) a)"
			 		+ "where rnum between 1 and 3";
					 
					/* "select * from "
			 		+ " (select rownum rnum, a.*"
			 		+ " from (select cp_name,bk_date, bk_status"
			 		+ " from booking b"
			 		+ " join company c on b.cp_no = c.cp_no) a)"
			 		+ " where rnum between 1 and 3";*/
			 
			 try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, umId);
				rs = pstmt.executeQuery();
				
				volist = new ArrayList<Map<String,Object>>();
				while(rs.next()) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("rownum", rs.getInt(1));
					map.put("cpName", rs.getString(2));
					map.put("bkDate", rs.getString(3));
					map.put("bkTime", rs.getString(4));
					map.put("bkStatus", rs.getString(5));
					
					volist.add(map);
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			 
			 return volist;
		}
		// 사용자 마이페이지 - 리뷰리스트 : 최규식
		public ArrayList<Map<String, Object>> usRvList(Connection conn, String umId) {
			
			ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

			// 파란색하트
			String sql = "select * from(select rownum rnum, A.*"
					+ " from (select r.rv_content 리뷰내용, c.cp_name 업체명 "
					+ "    , case r.rv_score "
					+ "           when 1 then '💙🤍🤍🤍🤍' "
					+ "           when 2 then '💙💙🤍🤍🤍' "
					+ "           when 3 then '💙💙💙🤍🤍' "
					+ "           when 4 then '💙💙💙💙🤍' "
					+ "           when 5 then '💙💙💙💙💙' "
					+ "           else '평점이 없습니다.' "
					+ "      end 평점 "
					+ "    , to_char(rv_write_date, 'yyyy/mm/dd') 작성일 "
					+ "      from booking b join review r using(bk_no) join company c using (cp_no) "
					+ "      where b.um_id = ? order by b.bk_write_date desc) A)"
					+ " where rnum between 1 and 5";
			
			// 노란색하트
//			String sql = "select * from(select rownum rnum, A.*"
//					+ " from (select r.rv_content 리뷰내용, c.cp_name 업체명 "
//					+ "    , case r.rv_score "
//					+ "           when 1 then '💛🤍🤍🤍🤍' "
//					+ "           when 2 then '💛💛🤍🤍🤍' "
//					+ "           when 3 then '💛💛💛🤍🤍' "
//					+ "           when 4 then '💛💛💛💛🤍' "
//					+ "           when 5 then '💛💛💛💛💛' "
//					+ "           else '평점이 없습니다.' "
//					+ "      end 평점 "
//					+ "    , to_char(rv_write_date, 'yyyy/mm/dd') 작성일 "
//					+ "      from booking b join review r using(bk_no) join company c using (cp_no) "
//					+ "      where b.um_id = 'apple' order by b.bk_write_date desc) A)"
//					+ " where rnum between 1 and 5";
			
			// 진한노랑하트 이 아니라 주황색이었음
//			String sql = "select * from(select rownum rnum, A.*"
//					+ " from (select r.rv_content 리뷰내용, c.cp_name 업체명 "
//					+ "    , case r.rv_score "
//					+ "           when 1 then '🧡🤍🤍🤍🤍' "
//					+ "           when 2 then '🧡🧡🤍🤍🤍' "
//					+ "           when 3 then '🧡🧡🧡🤍🤍' "
//					+ "           when 4 then '🧡🧡🧡🧡🤍' "
//					+ "           when 5 then '🧡🧡🧡🧡🧡' "
//					+ "           else '평점이 없습니다.' "
//					+ "      end 평점 "
//					+ "    , to_char(rv_write_date, 'yyyy/mm/dd') 작성일 "
//					+ "      from booking b join review r using(bk_no) join company c using (cp_no) "
//					+ "      where b.um_id = 'apple' order by b.bk_write_date desc) A)"
//					+ " where rnum between 1 and 5";
			
//			String sql = "select * from(select rownum rnum, A.* "
//					+ "from (select r.rv_content 리뷰내용, c.cp_name 업체명 "
//					+ "    , REPLACE(REPLACE(REPLACE(REPLACE(REPLACE (R.RV_SCORE,'1','☆'),'2','☆☆'),'3','☆☆☆'),'4','☆☆☆☆'),'5','☆☆☆☆☆') 평점 "
//					+ "    , to_char(rv_write_date, 'yyyy/mm/dd') 작성일 "
//					+ "      from booking b join review r using(bk_no) join company c using (cp_no) "
//					+ "      where b.um_id = 'apple' order by b.bk_write_date desc) A) "
//					+ "where rnum between 1 and 5";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, umId);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("rownum", rs.getInt(1));
					map.put("rvContent", rs.getString(2));
					map.put("cpName", rs.getString(3));
					map.put("rvScore", rs.getString(4));
					map.put("rvWriteDate", rs.getString(5));
	
					list.add(map);
					System.out.println("UserDao result:" + sql);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		// 사용자 마이페이지 - 예약 현황(취소/c) 조회 : 최규식
		public ArrayList<Map<String, Object>> usBkList_c(Connection conn, String umId) {
			System.out.println("umId : " + umId);
			ArrayList<Map<String, Object>> volist = null;
			String sql = "select bk_no, um_id, cp_name, cp_address, bk_date, substr(bk_time,1,5), REPLACE(REPLACE(BK_STATUS,'R','예약완료'),'C','예약취소') as bk_statusC, fl_gno, CP_SIGNYN ,BK_TIME"
					+ " from booking b "
					+ " join company c using (cp_no) "
					+ " where bk_status in ('c','C') and um_id = ? "
					+ " order by um_id, bk_date desc";
			
			volist = new ArrayList<Map<String, Object>>();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, umId);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Map<String, Object> map	= new HashMap<String, Object>();
					map.put("bkNo", rs.getInt(1));
					map.put("umId", rs.getString(2));
					map.put("cpName", rs.getString(3));
					map.put("cpAddress", rs.getString(4));
					map.put("bkDate", rs.getString(5));
					map.put("bkTime", rs.getString(6));
					map.put("bkStatus", rs.getString(7));
					map.put("flGno", rs.getString(8));
					map.put("cpSignyn", rs.getString(9));
					map.put("bkTime", rs.getString(10));
					volist.add(map);
					
					System.out.println("volist 는 " + volist);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			
			return volist;
			
		}
		
		// 사용자 마이페이지 - 예약 현황(완료/r) 조회 : 최규식
		public ArrayList<Map<String, Object>> usBkList_r(Connection conn, String umId) {
			System.out.println(" ============= ");
			System.out.println("umId : " + umId);
			ArrayList<Map<String, Object>> volist = null;
			String sql = "select bk_no, um_id, cp_name, cp_address, bk_date, substr(bk_time,1,5), REPLACE(REPLACE(BK_STATUS,'R','예약완료'),'C','예약취소') as bk_statusC, fl_gno, CP_SIGNYN, BK_TIME"
					+ " from booking b "
					+ " join company c using (cp_no) "
					+ " where bk_status in ('r','R') and um_id = ? "
					+ " order by um_id, bk_date desc";
			
			volist = new ArrayList<Map<String, Object>>();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, umId);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Map<String, Object> map	= new HashMap<String, Object>();
					map.put("bkNo", rs.getInt(1));
					map.put("umId", rs.getString(2));
					map.put("cpName", rs.getString(3));
					map.put("cpAddress", rs.getString(4));
					map.put("bkDate", rs.getString(5));
					map.put("bkTime", rs.getString(6));
					map.put("bkStatus", rs.getString(7));
					map.put("flGno", rs.getString(8));
					map.put("cpSignyn", rs.getString(9));
					map.put("bkTime", rs.getString(10));
					volist.add(map);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			
			return volist;
			
		}
}

