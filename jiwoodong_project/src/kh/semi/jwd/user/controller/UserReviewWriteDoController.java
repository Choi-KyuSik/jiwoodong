package kh.semi.jwd.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.vo.ReviewVo;
import kh.semi.jwd.user.model.service.UserService;

/**
 * Servlet implementation class UserReviewWriteController
 */
@WebServlet("/userRvWrite.lo")
public class UserReviewWriteDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReviewWriteDoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.getRequestDispatcher("WEB-INF/review/reviewWrite.jsp").forward(request, response);
		//String bkNoStr = request.getParameter("bkNo");
		//int bkNo = Integer.parseInt(bkNoStr);
		int bkNo = 201;
		String rvScoreStr = request.getParameter("rvScore");
		int rvScore =  Integer.parseInt(rvScoreStr);
		String rvContent = request.getParameter("rvContent");
		//String rvWriteDate = request.getParameter("rvWriteDate");
		String flGno = request.getParameter("fileUrl");
		
		
		System.out.println("별점: " + rvScore + ", 내용 : " + rvContent);
//		pstmt.setInt(1, vo.getBkNo());
//		pstmt.setInt(2, vo.getRvScore());
//		pstmt.setString(3, vo.getRvContent());
//		pstmt.setTimestamp(4, vo.getRvWriteDate());
//		pstmt.setString(5, vo.getFlGno());
		ReviewVo rvo = new ReviewVo();
		rvo.setBkNo(bkNo);
		rvo.setRvScore(rvScore);
		rvo.setRvContent(rvContent);
		System.out.println("rvContent:"+rvContent);
		//rvo.setRvWriteDate(rvWriteDate);
		rvo.setFlGno(flGno);
		
		
		int result = new UserService().insertReview(rvo);
		if(result<1) {
			
			System.out.println("리뷰 등록 대실패~!");
			PrintWriter out = response.getWriter();
			out.println("<script language='javascript'>");
			out.println("alert('실패'); ");
			out.println("</script>");
			out.flush();
		}else {
			System.out.println("리뷰 등록 성공!");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('정상적으로 등록하였습니다.'); location.href='userreviewlist'");
			out.println("</script>");
			out.flush();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * //String bkNoStr = request.getParameter("bkNo"); //int bkNo =
		 * Integer.parseInt(bkNoStr); int bkNo = 201; String rvScoreStr =
		 * request.getParameter("rvScore"); int rvScore = Integer.parseInt(rvScoreStr);
		 * String rvContent = request.getParameter("rvContent"); //String rvWriteDate =
		 * request.getParameter("rvWriteDate"); String flGno =
		 * request.getParameter("fileUrl");
		 * 
		 * 
		 * System.out.println("별점: " + rvScore + ", 내용 : " + rvContent); //
		 * pstmt.setInt(1, vo.getBkNo()); // pstmt.setInt(2, vo.getRvScore()); //
		 * pstmt.setString(3, vo.getRvContent()); // pstmt.setTimestamp(4,
		 * vo.getRvWriteDate()); // pstmt.setString(5, vo.getFlGno()); ReviewVo rvo =
		 * new ReviewVo(); rvo.setBkNo(bkNo); rvo.setRvScore(rvScore);
		 * rvo.setRvContent(rvContent); //rvo.setRvWriteDate(rvWriteDate);
		 * rvo.setFlGno(flGno);
		 * 
		 * 
		 * int result = new UserService().insertReview(rvo); if(result<1) {
		 * 
		 * System.out.println("리뷰 등록 대실패~!"); PrintWriter out = response.getWriter();
		 * out.println("<script language='javascript'>");
		 * out.println("alert('z'); location.href='userRvDetailList'");
		 * out.println("</script>"); out.flush(); }else {
		 * System.out.println("리뷰 등록 성공!"); PrintWriter out = response.getWriter();
		 * response.setContentType("text/html; charset=utf-8");
		 * out.println("<script language='javascript'>");
		 * out.println("alert('정상적으로 등록하였습니다.'); location.href='userRvDetailList'");
		 * out.println("</script>"); out.flush(); }
		 */
		
		
	}

}
