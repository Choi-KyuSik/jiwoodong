package kh.semi.jwd.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.user.model.service.UserService;

/**
 * Servlet implementation class UserReviewUpdateController
 */
@WebServlet("/userUpdateReview.lo")
public class UserReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rvScoreStr = request.getParameter("rvScore");
		int rvScore = Integer.parseInt(rvScoreStr);
		String rvNoStr = request.getParameter("rvNo");
		int rvNo = Integer.parseInt(rvNoStr);
		String rvContent = request.getParameter("rvContent");
		String fileUrl = request.getParameter("fileUrl");
		
		System.out.println("리뷰 수정 doPost");
		System.out.println("rvScore:"+rvScore);
		System.out.println("rvContent:"+rvContent);
		System.out.println("fileUrl:"+fileUrl);
		System.out.println("rvNo:"+rvNo);
		
		PrintWriter out = response.getWriter();
		String m = "";
		
		int result = new UserService().updateUserReview(rvContent, fileUrl, rvScore, rvNo);
		System.out.println("result: "+result);
		if(result <1) {
			m="리뷰 등록에 실패했습니다. 다시 작성해주세요.";
			System.out.println("리뷰 수정 실패! ");
			
		}else {
			m="리뷰가 정상적으로 등록되었습니다.";
			System.out.println("리뷰 수정 성공");
		}
		out.print(m);
		out.flush();
		out.close();
	}

}
