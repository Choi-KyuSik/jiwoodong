package kh.semi.jwd.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.user.model.service.UserService;
import kh.semi.jwd.user.model.vo.UserLoginVo;

/**
 * Servlet implementation class UserLoginController
 */
@WebServlet("/userLogin.lo")
public class UserLoginDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginDoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("WEB-INF/login/umLogin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String um_id = request.getParameter("um_id");
		String password = request.getParameter("password");
		
		System.out.println("um_id : " + um_id);
		System.out.println("password : " + password);
		
		UserLoginVo vo = new UserLoginVo();
		vo.setUmId(um_id);
		vo.setUmPwd(password);
		UserLoginVo result = new UserService().loginUserMember(vo);
		System.out.println("controller UserLoginVo : " + result);
		
		if(result != null && result.getUmId() !=null) {
			
			
			request.setAttribute("um_id", result.getUmId());
			request.setAttribute("password", result.getUmPwd());
			
			System.out.println("um_id:"+um_id);
			System.out.println("password:"+password);
			System.out.println("로그인 성공한거지 여기가?네네 - 오늘의 명언... 언니 최고...");
			response.sendRedirect("bumMainPage");
		}else {
			System.out.println("로그인 해주세요");
			response.sendRedirect("userLogin");
		}
	}

}
