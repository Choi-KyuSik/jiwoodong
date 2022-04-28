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
 * Servlet implementation class BumEnrollController
 */
@WebServlet("/bumenroll")
public class BumEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BumEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/enroll/bumEnrollPage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////		bu_num 사업자 번호
////		name 사업자 이름
////		birth 사업자 생년월일
////		gender 사업자 성별
////		phone 사업자 폰번호
////		email 사업자 이메일
////		bu_id 사업자 아이디
////		password 사업자 비밀번호
////		password_check 사업자 비밀번호 재확인
////		clause1 이용약과
////		clause2 개인정보 약관
////		clause3 위치 정보 서비스 약관
//		
//		String bu_num = request.getParameter("bu_num");
//		String name = request.getParameter("name");
//		String birth = request.getParameter("birth");
//		String gender = request.getParameter("gender");
//		String phone = request.getParameter("phone");
//		String email = request.getParameter("email");
//		String bu_id = request.getParameter("bu_id");
//		String password = request.getParameter("password");
////		String clause1 = request.getParameter("clause1");
////		String clause2 = request.getParameter("clause2");
////		String clause3 = request.getParameter("clause3");
//		
//		BumVo vo = new BumVo();
//		vo.setBuNumber(bu_num);
//		vo.setBuName(name);
//		vo.setBuBirth(birth);
//		vo.setBuGender(gender);
//		vo.setBuTel(phone);
//		vo.setBuEmail(email);
//		vo.setBuId(bu_id);
//		vo.setBuPwd(password);
//		
//		System.out.println("BumEnrollcotroller vo:"+vo);
//		
//		int result = new BumService().insertBuMember(vo);
//		
//		System.out.println("BumEnrollcontroller result: "+ result);
//		
//		if(result == 0) {
//			//회원가입 실패
//			System.out.println("회원가입 실패=======");
//			
//		} else {
//			System.out.println("회원가입 성공!");
//			response.sendRedirect(request.getContextPath());
//		}
//		
//		
//		
//	}

}
