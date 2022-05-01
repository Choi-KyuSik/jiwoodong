package kh.semi.jwd.bum.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.semi.jwd.bum.model.vo.BumVo;

/**
 * Servlet implementation class BumLoginController
 */
@WebServlet("/bumLogin.lo")
public class BumLoginDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BumLoginDoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		request.getRequestDispatcher("WEB-INF/login/bumLogin.jsp").forward(request, response);
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bu_id = request.getParameter("bu_id");
		String password = request.getParameter("password");
		
		BumVo vo = new BumVo();
		vo.setBuId(bu_id);
		vo.setBuPwd(password);
		
		System.out.println("사업자 로그인 vo:"+vo);
		
		if(bu_id !=null) {
			request.setAttribute("bu_id", bu_id);
			request.setAttribute("password", password);
			
			response.sendRedirect("bumLogin.jsp");
		}else {
		    // 로그인 실패
		    request.setAttribute("LoginErrMsg", "로그인 오류입니다."); 
		    request.getRequestDispatcher("bumLogin.jsp").forward(request, response);
		}
	}

}
