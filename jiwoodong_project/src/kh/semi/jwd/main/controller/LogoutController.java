package kh.semi.jwd.main.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BumLogoutController
 */
@WebServlet("/logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//  모든 속성 한꺼번에 삭제 
		session.invalidate();
		
		System.out.println("로그아웃 완료");
		PrintWriter out = response.getWriter();
		
		out.println("<script>alert('로그아웃 되었습니다! 움마쪽~!!! '); location.href='/jwd';</script>");
		//out.println("<script>alert('로그아웃 되었습니다! 움마쪽~!!! ');</script>");
		//request.getRequestDispatcher("WEB-INF/mainpage.jsp").forward(request, response);
		
		//request.getRequestDispatcher("loginMain").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
