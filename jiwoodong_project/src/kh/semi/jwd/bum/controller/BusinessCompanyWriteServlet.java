package kh.semi.jwd.bum.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.service.BumService;
import kh.semi.jwd.bum.model.vo.BumVo;

/**
 * Servlet implementation class BusinessCompanyWriteServlet
 */
@WebServlet("/bucompany")
public class BusinessCompanyWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessCompanyWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int buNo = 32;
		response.setContentType("text/html; charset=utf-8");
		BumVo bvo = new BumService().companyCheck(buNo);
		request.setAttribute("bvo", bvo);
		request.getRequestDispatcher("WEB-INF/bum/businessCompanyWritePage.jsp").forward(request, response);
		
		
//		String result2 = new BumService().companyWriteCheck(buNo);
//		request.setAttribute("cpSignYn", result2);
//		//업체등록 중복여부 확인
//		System.out.println(result2);
//		if(result2.length() < 1) {
//			request.getRequestDispatcher("WEB-INF/bum/businessCompanyWritePage.jsp").forward(request, response);
//		} else {
//			request.setAttribute("msg", "이미 등록되었거나 승인 대기중입니다.");
//			response.sendRedirect(request.getContextPath()+"/BumMainPage?msg=a");
//		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
