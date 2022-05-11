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
 * Servlet implementation class UserReviewDeleteDoController
 */
@WebServlet("/deleteReview")
public class UserReviewDeleteDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReviewDeleteDoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rvNoStr = request.getParameter("rvNo");
		int rvNo = Integer.parseInt(rvNoStr);
		
		ReviewVo rvo = new ReviewVo();
		rvo.setRvNo(rvNo);
		
		int result = new UserService().deleteReview(rvNo);
		PrintWriter out = response.getWriter();
		
		if(result<1) {
			System.out.println("리뷰 삭제 실패!");
			out.println("<script language='javascript'>");
			out.println("alert('글 삭제에 실패하였습니다.'); location.href='userreviewlist';");
			out.println("</script>");
		}else {
			System.out.println("리뷰 삭제 성공!");
			out.println("<script language='javascript'>");
			out.println("alert('리뷰가 삭제되었습니다.'); location.href='userreviewlist';");
			out.println("</script>");			
		}
		out.flush();
		out.close();
	}

}
