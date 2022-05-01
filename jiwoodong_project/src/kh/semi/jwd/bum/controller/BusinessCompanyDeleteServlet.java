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
 * Servlet implementation class BusinessCompanyDeleteServlet
 */
@WebServlet("/bucpdelete")
public class BusinessCompanyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessCompanyDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int buNo = 5;
		int result = 0;	
		
		BumVo vo = new BumVo();
		vo.setBuNo(buNo);

		
		result =  new BumService().companyDelete(vo);
		System.out.println("BumVo vo:" +vo);
		System.out.println("int result:" +result);
		
		if(result < 1) {
			System.out.println("삭제 실패=============");
			request.getRequestDispatcher("WEB-INF/bum/bumCompanyCheckPage.jsp").forward(request, response);
		}else {
			System.out.println("삭제 *성공*");
			request.getRequestDispatcher("/WEB-INF/mainpage.jsp").forward(request, response);
		}
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//	}

}
