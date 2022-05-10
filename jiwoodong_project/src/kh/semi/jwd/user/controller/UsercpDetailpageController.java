package kh.semi.jwd.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.user.model.service.UsercpDetailpageService;
import kh.semi.jwd.user.model.vo.UserVo;
import kh.semi.jwd.user.model.vo.UsercpDetailpageVo;

/**
 * Servlet implementation class UsercpDetailpageServlet
 */
@WebServlet("/uscpdetail")
public class UsercpDetailpageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsercpDetailpageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cpNoStr = request.getParameter("cpNo");
		int cpNo = Integer.parseInt(cpNoStr);
		System.out.println("cpNo : " + cpNo);
		
		ArrayList<UsercpDetailpageVo> uscpdetail = new UsercpDetailpageService().companyDetail(cpNo);
		UserVo uscpRvscoreAVG = new UsercpDetailpageService().uscpRvscoreAVG(cpNo);
		System.out.println("별점 평균은 ? : "+ uscpRvscoreAVG);
		
//		double rvScoreAvg = Double.parseDouble("rvScore");
		
		System.out.println("uscpdetail : " + uscpdetail);
		
		request.setAttribute("uscpdetail", uscpdetail);
		request.setAttribute("uscpRvscoreAVG", uscpRvscoreAVG);
		
		
		request.getRequestDispatcher("WEB-INF/user/userCompanyDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		 TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
