package kh.semi.jwd.bum.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import kh.semi.jwd.bum.model.vo.BumLoginVo;
import kh.semi.jwd.bum.model.vo.BumVo;
import kh.semi.jwd.bum.model.vo.CompanyVo;
import kh.semi.jwd.bum.model.vo.ReviewVo;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.*;

public class BumDao {
	private Statement stmt = null;
	// DB를 왔다갔다 하는것
	private PreparedStatement pstmt = null;
	// DB를 Java용 언어로 바꿔주는것
	private ResultSet rs = null;

	// 재우
	public ArrayList<Map<String, Object>> mainPageBookingList(Connection conn, int cpNo) {

		String sql = "select * from(select rownum,x.* from (select a.* from booking a order by a.bk_write_date desc) x) where rownum between 1 and 7 and cp_no = ?";
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("bkName", rs.getString("bk_name"));
				map.put("bkPhone", rs.getString("bk_phone"));
				map.put("bkNo", rs.getInt("bk_no"));
				map.put("bkDate", rs.getString("bk_date"));
				map.put("bkTime", rs.getString("bk_time"));
				map.put("bsStatus", rs.getString("bk_status"));
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	// 우진
	public ArrayList<Map<String, Object>> mainPageReviewList(Connection conn, int cpNo) {

		String sql = "select * from(select rownum, x.* from "
				+ " (select case r.rv_score "
				+ "	         when 1 then '💙🤍🤍🤍🤍' "
				+ "	         when 2 then '💙💙🤍🤍🤍' "
				+ "	         when 3 then '💙💙💙🤍🤍' "
				+ "	         when 4 then '💙💙💙💙🤍' "
				+ "	         when 5 then '💙💙💙💙💙' "
				+ "	         else '평점이 없습니다.' "
				+ "	         end 평점, to_char(rv_write_date, 'yyyy/mm/dd'), "
				+ " b.um_id, r.rv_content from booking b join review r using(bk_no) "
				+ " where b.cp_no = ? order by b.bk_write_date desc) x) "
				+ " where rownum between 1 and 7";

		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("rownum", rs.getInt(1));
				map.put("rvScore", rs.getString(2));
				map.put("rvWriteDate", rs.getString(3));
				map.put("umId", rs.getString(4));
				map.put("rvContent", rs.getString(5));

				list.add(map);
				System.out.println("BumDao result:" + sql);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 재우
	public ArrayList<Map<String, Object>> mainPageStatisticsVisit(Connection conn, int cpNo) {

		String sql = "select \r\n"
				+ "(select count(*) from booking where bk_status = 'C' and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(add_months(sysdate, -4),'mm') and cp_no=?) 취소내역, \r\n"
				+ "(select count(*) from booking where (bk_status = 'R' or bk_status = 'M') and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(add_months(sysdate, -4),'mm') and cp_no=?) 예약내역, \r\n"
				+ "to_char(add_months(sysdate, -4),'mm') 몇월 from dual\r\n"
				+ "union all\r\n"
				+ "select \r\n"
				+ "(select count(*) from booking where bk_status = 'C' and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(add_months(sysdate, -3),'mm') and cp_no=?) 취소내역, \r\n"
				+ "(select count(*) from booking where (bk_status = 'R' or bk_status = 'M') and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(add_months(sysdate, -3),'mm') and cp_no=?) 예약내역, \r\n"
				+ "to_char(add_months(sysdate, -3),'mm') 몇월 from dual\r\n"
				+ "union all\r\n"
				+ "select \r\n"
				+ "(select count(*) from booking where bk_status = 'C' and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(add_months(sysdate, -2),'mm') and cp_no=?) 취소내역, \r\n"
				+ "(select count(*) from booking where (bk_status = 'R' or bk_status = 'M') and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(add_months(sysdate, -2),'mm') and cp_no=?) 예약내역, \r\n"
				+ "to_char(add_months(sysdate, -2),'mm') 몇월 from dual\r\n"
				+ "union all\r\n"
				+ "select \r\n"
				+ "(select count(*) from booking where bk_status = 'C' and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(add_months(sysdate, -1),'mm') and cp_no=?) 취소내역, \r\n"
				+ "(select count(*) from booking where (bk_status = 'R' or bk_status = 'M') and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(add_months(sysdate, -1),'mm') and cp_no=?) 예약내역, \r\n"
				+ "to_char(add_months(sysdate, -1),'mm') 몇월 from dual\r\n"
				+ "union all\r\n"
				+ "select \r\n"
				+ "(select count(*) from booking where bk_status = 'C' and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(sysdate,'mm') and cp_no=?) 취소내역, \r\n"
				+ "(select count(*) from booking where (bk_status = 'R' or bk_status = 'M') and to_char(TO_date(bk_date, 'yy/mm/dd'),'mm') in to_char(sysdate,'mm') and cp_no=?) 예약내역, \r\n"
				+ "to_char(sysdate, 'mm') 몇월 from dual";
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			pstmt.setInt(2, cpNo);
			pstmt.setInt(3, cpNo);
			pstmt.setInt(4, cpNo);
			pstmt.setInt(5, cpNo);
			pstmt.setInt(6, cpNo);
			pstmt.setInt(7, cpNo);
			pstmt.setInt(8, cpNo);
			pstmt.setInt(9, cpNo);
			pstmt.setInt(10, cpNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("cancle",  rs.getInt(1));
				map.put("booking", rs.getInt(2));
				map.put("month", rs.getString(3));
				list.add(map);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	// 재우
	public ArrayList<Map<String, Object>> mainPageStatisticsReview(Connection conn, int cpNo) {
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		String sql = "select count(*) from review join booking using (bk_no) where rv_score = 1 and cp_no = ?\r\n"
				+ "union all\r\n"
				+ "select count(*) from review join booking using (bk_no) where rv_score = 2 and cp_no = ?\r\n"
				+ "union all\r\n"
				+ "select count(*) from review join booking using (bk_no) where rv_score = 3 and cp_no = ?\r\n"
				+ "union all\r\n"
				+ "select count(*) from review join booking using (bk_no) where rv_score = 4 and cp_no = ?\r\n"
				+ "union all\r\n"
				+ "select count(*) from review join booking using (bk_no) where rv_score = 5 and cp_no = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cpNo);
			pstmt.setInt(2, cpNo);
			pstmt.setInt(3, cpNo);
			pstmt.setInt(4, cpNo);
			pstmt.setInt(5, cpNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("count", rs.getInt(1));
				list.add(map);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}
	
	//승희 - 회원가입..도전..!
	
	
	public int insertBuMember(Connection conn, BumVo vo) {
		
//		BU_NO          NOT NULL NUMBER         
//		BU_ID          NOT NULL VARCHAR2(20)   
//		BU_NUMBER      NOT NULL VARCHAR2(20)   
//		BU_PWD         NOT NULL VARCHAR2(40)   
//		BU_NAME        NOT NULL VARCHAR2(20)   
//		BU_BIRTH       NOT NULL VARCHAR2(20)   
//		BU_GENDER      NOT NULL VARCHAR2(1)    
//		BU_EMAIL       NOT NULL VARCHAR2(100)  
//		BU_TEL         NOT NULL VARCHAR2(20)   
//		BU_USEYN       NOT NULL VARCHAR2(1)    

		int result = 0 ;
		String sql = "INSERT INTO b_member(BU_NO,BU_ID,BU_NUMBER,BU_PWD,BU_NAME,BU_BIRTH,BU_GENDER,BU_EMAIL,BU_TEL) "
				+ "values(B_MEMBER_SEQ.NEXTVAL,?,?,?,?,REPLACE(?,'-','/'),?,?,?)";
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getBuId());
			pstmt.setString(2, vo.getBuNumber());
			pstmt.setString(3, vo.getBuPwd());
			pstmt.setString(4, vo.getBuName());
			pstmt.setString(5, vo.getBuBirth());
			pstmt.setString(6, vo.getBuGender());
			pstmt.setString(7, vo.getBuEmail());
			pstmt.setString(8, vo.getBuTel());

			result = pstmt.executeUpdate();
			
			System.out.println("SQL문장 실행 성공.");
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	//승희 - 아이디 중복확인
	
	public int checkBuId(Connection conn, String buId) {
		
		int result = -1;
		
		String sql = "select bu_id from b_member where bu_id=?";
		System.out.println(buId);
		try {
//			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, buId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 0;
			}else {
				result = 1;
			}
			System.out.println("아이디 중복체크 결과: "+result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		return result;
	}
	
	
	//승희 - 사업자 로그인
	

	public BumLoginVo loginBuMember(Connection conn,BumLoginVo vo) {
		String sql = "";
		BumLoginVo bvo = new BumLoginVo();
		
		sql = "SELECT * FROM b_member WHERE BU_ID = ? AND BU_PWD= ?";
		try {
			System.out.println("vo.getBuId()" + vo.getBuId());
			System.out.println("vo.getBuPwd()" + vo.getBuPwd());
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getBuId());
			pstmt.setString(2, vo.getBuPwd());
			rs=pstmt.executeQuery();
			//id와 pwd 가 일치하는 것이 나올때만 rs에 값이 있다.
			if(rs.next()) {
				bvo.setBuId(rs.getString("bu_id"));
				bvo.setBuPwd(rs.getString("bu_pwd")); // 여기 컬럼명 썼어야했어
				bvo.setBuName(rs.getString(5)); // 사업자이름 저장.
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("로그인 오류");
		}
		finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		System.out.println("DAO loginBuMember bvo:" + bvo);
		return bvo;
	}
	
	// 승희 - 이메일 중복확인.
	public String emailDupleCheck(Connection conn,String inputEmail) {
		String result = "unuseable";
		String sql = "SELECT bu_email FROM b_member WHERE bu_email = ?";
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputEmail);
			rs = pstmt.executeQuery();
	
			if (!rs.next()) {
				result = "useable";
				System.out.println("사용가능한 이메일 입니다.");
			} else {
				result = "unuseable";
				System.out.println("존재하는 이메일 입니다");
			}
		} catch (Exception e) {
			System.out.println("이메일 중복확인 실패! 여기는 bumdao다!!!");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
			}
		return result;
		}
	
// TODO 우진 :내 정보 조회
	public BumVo companyCheck(Connection conn, String buId) {
		// public return 값이 BumVo이므로 result의 변수값은 null
		BumVo bvo = null;
		// sql문 작성
		// sql문 실행, 변수에 담기
		String sql = "select bu_number, bu_name, bu_birth, bu_id, bu_pwd, bu_pwd, bu_email, bu_tel "
				+ "from b_member where bu_id = ?";
		// try-catch문
		// where절에 ?가 있으므로 stmt가 아닌 pstmt 사용
		try {
			pstmt = conn.prepareStatement(sql);
			// list의 값을 담아서 DB로 보낸다.
			pstmt.setString(1, buId);
		

			rs = pstmt.executeQuery();
			if (rs.next()) {
				bvo = new BumVo();
//				BU_NO          NOT NULL NUMBER         
//				BU_ID          NOT NULL VARCHAR2(20)   
//				BU_NUMBER      NOT NULL VARCHAR2(20)   
//				BU_PWD         NOT NULL VARCHAR2(40)   
//				BU_NAME        NOT NULL VARCHAR2(20)   
//				BU_BIRTH       NOT NULL VARCHAR2(20)      
//				BU_EMAIL       NOT NULL VARCHAR2(100)  
//				BU_TEL         NOT NULL VARCHAR2(20)   	  
//				FL_GNO                  VARCHAR2(4000)

//				bvo.setBuNo(rs.getInt("bu_No"));
				bvo.setBuNumber(rs.getString("bu_Number"));
				bvo.setBuName(rs.getString("bu_Name"));
				bvo.setBuBirth(rs.getString("bu_Birth"));
				bvo.setBuId(rs.getString("bu_Id"));
				bvo.setBuPwd(rs.getString("bu_Pwd"));
				bvo.setBuPwd(rs.getString("bu_Pwd"));
				bvo.setBuEmail(rs.getString("bu_Email"));
				bvo.setBuTel(rs.getString("bu_Tel"));

				System.out.println("companyCheckDao:" + bvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// finally 작성, pstmt close하기
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("companyCheck:" + bvo);
		return bvo;
	}

	//우진 - 내 정보관리 수정
	public int companyUpdate(Connection conn, String buId, BumVo vo) {
		System.out.println("companyUpdate Dao:"+vo);
		int result = 0;
		String sql = "update b_member set bu_pwd = ?, bu_email = ?, bu_tel = ?, bu_name = ?, bu_id = ?, bu_birth = ? where BU_ID=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getBuPwd()); 		//비밀번호
			pstmt.setString(2, vo.getBuEmail()); 	//이메일
			pstmt.setString(3, vo.getBuTel());		//핸드폰번호
			pstmt.setString(4, vo.getBuName());		//이름
			pstmt.setString(5, vo.getBuId());		//아이디
			pstmt.setString(6, vo.getBuBirth());	//생년월일
			pstmt.setString(7, buId);
			
			result = pstmt.executeUpdate();
			System.out.println("BoardDao companyUpdate:" + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("Dao companyUpdate:" + result);
		return result;
	}

	// 우진 - 업체등록
	public int companyWrite(Connection conn, CompanyVo cvo, int buNo) {

		int result = 0;

//	CP_NO          NOT NULL NUMBER         
//	BU_NO          NOT NULL NUMBER         
//	CP_CATEGORY    NOT NULL VARCHAR2(20)   
//	CP_NAME        NOT NULL VARCHAR2(20)   
//	CP_EXPLAIN              VARCHAR2(4000) 
//	CP_CLASSIFY    NOT NULL VARCHAR2(1)    
//	CP_SIGNYN      NOT NULL VARCHAR2(1)    
//	CP_OPEN_DATE            VARCHAR2(40)   
//	CP_CLOSE_DATE           VARCHAR2(40)   
//	CP_OPEN_TIME            VARCHAR2(40)   
//	CP_CLOSE_TIME           VARCHAR2(40)   
//	CP_TERM                 VARCHAR2(100)  
//	CP_POSTCODE    NOT NULL VARCHAR2(20)   
//	CP_ADDRESS     NOT NULL VARCHAR2(200)  
//	CP_DTADDRESS   NOT NULL VARCHAR2(1000) 
//	CP_WRITE_DATE           TIMESTAMP(6)   
//	CP_UPDATE_DATE          TIMESTAMP(6)   
//	FL_GNO                  VARCHAR2(4000) 
//	CP_REJECT_MSG           VARCHAR2(200) 

		String sql = "INSERT INTO company(CP_NO, BU_NO, CP_NAME, CP_CATEGORY, CP_CLASSIFY , CP_OPEN_DATE , CP_CLOSE_DATE, CP_POSTCODE, CP_ADDRESS, CP_DTADDRESS, CP_OPEN_TIME, CP_CLOSE_TIME ,CP_EXPLAIN, FL_GNO, FL_GNO2, FL_GNO3)"
				+ " VALUES(COMPANY_SEQ.NEXTVAL,?,?,?,?,REPLACE(?, '-', '/'),REPLACE(?, '-', '/'),?,?,?,?,?,?,?,?,?)";
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cvo.getBuNo());
			pstmt.setString(2, cvo.getCpName());
			pstmt.setString(3, cvo.getCpCategory());
			pstmt.setString(4, cvo.getCpClassify());
			pstmt.setString(5, cvo.getCpOpenDate());
			pstmt.setString(6, cvo.getCpCloseDate());
			pstmt.setString(7, cvo.getCpPostcode());
			pstmt.setString(8, cvo.getCpAddress());
			pstmt.setString(9, cvo.getCpDtaddress());
			pstmt.setString(10, cvo.getCpOpenTime());
			pstmt.setString(11, cvo.getCpCloseTime());
			pstmt.setString(12, cvo.getCpExplain());
			pstmt.setString(13, cvo.getFlGno());
			pstmt.setString(14, cvo.getFlGno2());
			pstmt.setString(15, cvo.getFlGno3());

			result = pstmt.executeUpdate();
			System.out.println("companyWrite Dao result:" + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(conn);
		}
		System.out.println("companyWrite Dao return result:" + result);
		return result;

	}

	// 우진 - 내 정보 삭제
	public int bumDelete(Connection conn, BumVo vo, int buNo) {
		System.out.println("companyDelete buNo:" + vo);
		int result = 0;
		String sql = "update b_member set bu_useyn = 'N', BU_OUT_DATE = SYSTIMESTAMP where bu_no = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBuNo() );
			result = pstmt.executeUpdate();
			System.out.println("BoardDao companyUpdate:" + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("Dao companyUpdate:" + result);
		return result;
	}
	
	//우진 - 내 업체 삭제
	public int companyDelete(Connection conn, CompanyVo cvo) {
		System.out.println("companyDelete buNo:" + cvo);
		int result = 0;
		String sql = "update company set CP_SIGNYN = 'N', CP_UPDATE_DATE = SYSTIMESTAMP where bu_no = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cvo.getBuNo());
			result = pstmt.executeUpdate();
			System.out.println("BoardDao companyDelete:" + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("Dao companyDelete:" + result);
		return result;
	}
	
	//우진 - 업체등록 여부 확인
	public String companyWriteCheck(Connection conn, int buNo) {
		System.out.println("companyWriteCheck buNo:"+ buNo);
		String result2 = "";
		
		String sql = "select cp_signyn from company where bu_no = ?";
		try {
//			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, buNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			result2 = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}
		System.out.println("companyWriteCheck 값 담겼나?:" + result2);
		return result2;
	}
	
	//우진 - buNo 뽑아오기

	public int getBuno(Connection conn, String bu_id) {
		int list = 0;
		String sql = "select bu_no from b_member where bu_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bu_id);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {

				list = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return list;
	}


	//승희 - 리뷰 리스트
	// 검색 조건에 맞는 게시물의 개수를 반환합니다.
    public int selectRvCount(Map<String, Object> map) {
        int totalCount = 0; // 결과(게시물 수)를 담을 변수

        // 게시물 수를 얻어오는 쿼리문 작성
        String query = "SELECT COUNT(*) FROM review";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%'";
        }

        try {
        	Connection conn= getConnection();
            stmt = conn.createStatement();   // 쿼리문 생성
            rs = stmt.executeQuery(query);  // 쿼리 실행
            rs.next();  // 커서를 첫 번째 행으로 이동
            totalCount = rs.getInt(1);  // 첫 번째 칼럼 값을 가져옴
        }
        catch (Exception e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount; 
    }
    // 검색 조건에 맞는 게시물 목록을 반환합니다.
    public List<ReviewVo> selectRvList(Map<String, Object> map) { 
        List<ReviewVo> volist = new Vector<ReviewVo>();  // 결과(게시물 목록)를 담을 변수

        String query = "select c.cp_name,c.cp_no,b.um_id,b.bk_name,r.*"
        		+ "    from booking b join review r"
        		+ "                on r.bk_no = b.bk_no"
        		+ "                join company c "
        		+ "                on b.cp_no = c.cp_no";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += " ORDER BY rv_score DESC "; 


        try {
        	Connection conn = getConnection();
        	//ReviewVo vo = new ReviewVo();
           stmt = conn.createStatement();  // 쿼리문 생성
            //pstmt.setInt(1, vo.getCpNo());
            rs = stmt.executeQuery(query);  // 쿼리 실행

            while (rs.next()) {  // 결과를 순화하며...
                // 한 행(게시물 하나)의 내용을 rvo에 저장
            	ReviewVo rvo = new ReviewVo(); 

            	rvo.setCpName(rs.getString("cp_Name"));
                rvo.setCpNo(rs.getInt("cp_No"));
                rvo.setUmID(rs.getString("um_ID"));
                rvo.setBkName(rs.getString("bk_Name"));
                rvo.setRvNo(rs.getInt("rv_No"));
                rvo.setRvNo(rs.getInt("bk_No"));
                rvo.setRvScore(rs.getInt("rv_Score"));
                rvo.setRvContent(rs.getString("rv_Content"));
                rvo.setRvWriteDate(rs.getTimestamp("rv_Write_Date"));
                rvo.setRvModifyDate(rs.getTimestamp("rv_Modify_Date"));
                rvo.setFlGno(rs.getString("fl_Gno"));
            	 

                volist.add(rvo);  // 결과 목록에 저장
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }finally {
			close(rs);
			close(pstmt);
		}

        return volist;
    }
	//승희- 리뷰 상세 조회
	 public ReviewVo detailRv(Connection conn,ReviewVo vo) { 
		 	ReviewVo rvo = new ReviewVo();
	        
	        // 쿼리문 준비
	        String query = "select c.cp_name,c.cp_no,b.um_id,b.bk_name,r.*"
	        		+ "    from booking b join review r"
	        		+ "                on r.bk_no = b.bk_no"
	        		+ "                join company c"
	        		+ "                on b.cp_no = c.cp_no"
	        		+ "                where rv_no=?";
	        try {
	            pstmt = conn.prepareStatement(query);
	            pstmt.setInt(1, vo.getRvNo());   
	            System.out.println("vo.getRvNo():"+vo.getRvNo());
	            rs = pstmt.executeQuery();  // 쿼리 실행 

	            // 결과 처리
	            if (rs.next()) {
	            	rvo.setCpName(rs.getString("cp_Name"));
	                rvo.setCpNo(rs.getInt("cp_No"));
	                rvo.setUmID(rs.getString("um_ID"));
	                rvo.setBkName(rs.getString("bk_Name"));
	                rvo.setRvScore(rs.getInt("rv_Score"));
	                rvo.setRvContent(rs.getString("rv_Content"));
	                rvo.setRvWriteDate(rs.getTimestamp("rv_WriteDate"));
	                rvo.setFlGno(rs.getString("fl_Gno"));
	            }
	        } 
	        catch (Exception e) {
	            System.out.println("리뷰 상세보기 중 예외 발생");
	            e.printStackTrace();
	        }
	        System.out.println(rvo);
	        return rvo; 
	    }
	 
	
	
}
