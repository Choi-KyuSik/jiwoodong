package kh.semi.jwd.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.service.BumService;
import kh.semi.jwd.user.model.dao.UserDao;
import kh.semi.jwd.user.model.service.UserService;

/**
 * Servlet implementation class UserIdCheckController
 */
@WebServlet("/userIdCheck")
public class UserIdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserIdCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.getRequestDispatcher("WEB-INF/enroll/userIdCheck.jsp").forward(request, response);
		
//		String user_id = request.getParameter("user_id");
//
////		BumVo vo = new BumVo();
////		vo.setBuId(bu_id);
//		//2. DAO객체생성 -> 전달받은 정보 모두 저장
////		BumDao dao = new BumDao();
//
//		PrintWriter out = response.getWriter();
//		
//		
//		int result = new UserService().checkUmId(user_id);
//		if (result == 0){
//			System.out.println("중복된 아이디입니다");
//		}else if(result == 0){
//			System.out.println("사용가능한 아이디입니다");
//		}else{
//			System.out.println("에러 발생!!!(-1)"); 
//		}
////		out.println("<script language='javascript'>");
////		out.println("alert('정상적으로 등록하였습니다.'); location.href='userreviewlist'");
////		out.println("</script>");
//		out.write(result + ""); // ajax 결과값인 result가 됨. 
//		
//		out.flush();
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");

//		BumVo vo = new BumVo();
//		vo.setBuId(bu_id);
		//2. DAO객체생성 -> 전달받은 정보 모두 저장
//		BumDao dao = new BumDao();

		PrintWriter out = response.getWriter();
		
		
		int result = new UserService().checkUmId(user_id);
		if (result == 0){
			System.out.println("중복된 아이디입니다");
		}else if(result == 0){
			System.out.println("사용가능한 아이디입니다");
		}else{
			System.out.println("에러 발생!!!(-1)"); 
		}
//		out.println("<script language='javascript'>");
//		out.println("alert('정상적으로 등록하였습니다.'); location.href='userreviewlist'");
//		out.println("</script>");
		out.write(result + ""); // ajax 결과값인 result가 됨. 
		
		out.flush();
	
	}

}
