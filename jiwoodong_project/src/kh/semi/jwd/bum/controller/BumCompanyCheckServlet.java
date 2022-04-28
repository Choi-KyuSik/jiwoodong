package kh.semi.jwd.bum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.service.BumService;
import kh.semi.jwd.bum.model.vo.BumVo;

/**
 * Servlet implementation class BumCompanyCheckServlet
 */
@WebServlet("/bucpcheck")
public class BumCompanyCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BumCompanyCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//TODO Session 값을 넣을 수 있으면 나중에 변경 할 것.
		int buNo = 5;
		
		BumVo bvo = new BumService().companyCheck(buNo);
	
		request.setAttribute("bvo", bvo);
		System.out.println("cotroller에 접속완료:" +bvo);
		request.getRequestDispatcher("WEB-INF/bum/bumCompanyCheckPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("BumCompanyCheckServelt doPost ajax로 진입");
//		PrintWriter out = response.getWriter();
//		
//		//TODO: login session 정보를 읽어와 buNo값 바꾸기
//		int buNo = 3;
//		
//		BumVo result = new BumService().companyCheck(buNo);
//		
//		
//		//예시2
//		out.print("sss");
//		out.flush();
//		out.close();
//	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
