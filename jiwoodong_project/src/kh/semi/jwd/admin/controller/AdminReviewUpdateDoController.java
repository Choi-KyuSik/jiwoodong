package kh.semi.jwd.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminReviewUpdateDoController
 */
@WebServlet("/AdminReviewUpdateDo")
public class AdminReviewUpdateDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReviewUpdateDoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("값 넘어 왔을까 ? doGet ");
//		String  rvContent= request.getParameter("rvContent");
//		String fileUrl = request.getParameter("fileUrl");
//		String rvScoreStr = request.getParameter("rvScore");
//		String rvNoStr = request.getParameter("rvNo");
//		int rvNo = Integer.parseInt(rvNoStr);
//		int rvScore = Integer.parseInt(rvScoreStr);
//		System.out.println("rvContent : " + rvContent);
//		System.out.println("fileUrl : " + fileUrl);
//		System.out.println("rvScore : " + rvScore);
//		System.out.println("rvNo : " + rvNo);
//		
//		int result = new AdminService().updateReview(rvContent, fileUrl, rvScore, rvNo);
//		
//		request.getRequestDispatcher("WEB-INF/admin/AdminMainPage.jsp").forward(request, response);
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String msg = "";
		
		System.out.println("값 넘어 왔을까 ? doPost ");
		String rvContent = request.getParameter("rvContent");
		String fileUrl = request.getParameter("fileUrl");
		String rvScoreStr = request.getParameter("rvScore");
		String rvNoStr = request.getParameter("rvNo");
		int rvNo = Integer.parseInt(rvNoStr);
		int rvScore = Integer.parseInt(rvScoreStr);
//		System.out.println("rvContent : " + rvContent);
//		System.out.println("fileUrl : " + fileUrl);
//		System.out.println("rvScore : " + rvScore);
//		System.out.println("rvNo : " + rvNo);
		
		int result = 0;
		
		if(fileUrl != "") {
			result = new AdminService().updateReview(rvContent, fileUrl, rvScore, rvNo);
		} else {
			result = new AdminService().updateReviewCtScNo(rvContent, rvScore, rvNo);
		}
		
		System.out.println("결과는 ? : " + result);
		if(result < 1) {
			msg = "리뷰 수정 실패";
			System.out.println("리뷰 수정 실패");
		} else {
			msg = "리뷰 수정 성공";
			System.out.println("리뷰 수정 성공");
		}
		
		out.println(msg);
		out.flush();
		out.close();
		
	}

}
