package kh.semi.jwd.bum.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.dao.BumDao;
import kh.semi.jwd.bum.model.service.BumService;
import kh.semi.jwd.bum.model.vo.BumVo;

/**
 * Servlet implementation class BumIdCheckContoroller
 */
@WebServlet("/bumIdCheck")
public class BumIdCheckContoroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BumIdCheckContoroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/enroll/bumIdCheck.jsp").forward(request, response);
		
		
		request.setCharacterEncoding("UTF-8");
		String bu_id = request.getParameter("bu_id");

//		BumVo vo = new BumVo();
//		vo.setBuId(bu_id);
		//2. DAO객체생성 -> 전달받은 정보 모두 저장
//		BumDao dao = new BumDao();

		//3.메서드
		int result = new BumService().checkBuId(bu_id);
		if (result == 1){
			System.out.println("사용가능한 아이디입니다");
			
		}else if(result == 0){
			System.out.println("중복된 아이디입니다");
		}else{
			System.out.println("에러 발생!!!(-1)"); 
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
//		request.setCharacterEncoding("UTF-8");
//		String bu_id = request.getParameter("bu_id");
//
////		BumVo vo = new BumVo();
////		vo.setBuId(bu_id);
//		//2. DAO객체생성 -> 전달받은 정보 모두 저장
////		BumDao dao = new BumDao();
//
//		//3.메서드
//		int result = new BumService().checkBuId(bu_id);
//		if (result == 1){
//			System.out.println("사용가능한 아이디입니다");
//			
//		}else if(result == 0){
//			System.out.println("중복된 아이디입니다");
//		}else{
//			System.out.println("에러 발생!!!(-1)"); 
//		}
//
	}
}
