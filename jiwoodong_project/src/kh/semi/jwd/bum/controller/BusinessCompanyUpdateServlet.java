package kh.semi.jwd.bum.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.service.BumService;
import kh.semi.jwd.bum.model.vo.BumVo;

/**
 * Servlet implementation class BusinessCompanyUpdateServlet
 */
@WebServlet("/bucpupdate")
public class BusinessCompanyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessCompanyUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("테스트요");
//		DB로 가서 저장할 수 있는 것
//		buPwd
//		buEmail
//		buTel
		//TODO: session전까진 'buNo = 5'인 사업자로 바꿔보기	
		int buNo = 5;
		
		String buPwd = request.getParameter("buPwd");
		String buEmail = request.getParameter("buEmail");
		String buTel = request.getParameter("buTel");
		
		
		BumVo vo = new BumVo();
		vo.setBuPwd(buPwd);
		vo.setBuEmail(buEmail);
		vo.setBuTel(buTel);
		
		int result = new BumService().companyUpdate(buNo, vo);
		System.out.println("Controller result:" +result);
			
		if(result > 0) {
			System.out.println("정보 수정 *성공*");
//			request.getRequestDispatcher("WEB-INF/bum/bumCompanyUpdatePage.jsp").forward(request, response);
			BumVo bvo = new BumService().companyCheck(buNo);
			
			if(bvo != null ) {
				System.out.println("*정보수정 로딩완료*");
			}else {
				System.out.println("로딩 실패==================");
			}
			request.setAttribute("bvo", bvo);
			request.getRequestDispatcher("WEB-INF/bum/bumCompanyUpdatePage.jsp").forward(request, response);
			
		}else {
			System.out.println("수정 실패===========");
			request.getRequestDispatcher("WEB-INF/bum/bumCompanyCheckPage.jsp").forward(request, response);
		}
		
		
		
		
		
	}

}
