package kh.semi.jwd.bum.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.dao.BumDao;
import kh.semi.jwd.bum.model.vo.BumVo;


/**
 * Servlet implementation class BuMemberEnrollPage
 */
@WebServlet("/bumenroll.lo")
public class BuMemberEnrollDoPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuMemberEnrollDoPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("WEB-INF/enroll/bumEnrollPage.jsp").forward(request, response);
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		BU_NO          NOT NULL NUMBER         
//		BU_ID          NOT NULL VARCHAR2(20)   
//		BU_NUMBER      NOT NULL VARCHAR2(20)   
//		BU_PWD         NOT NULL VARCHAR2(40)   
//		BU_NAME        NOT NULL VARCHAR2(20)   
//		BU_BIRTH       NOT NULL VARCHAR2(20)   
//		BU_GENDER      NOT NULL VARCHAR2(1)    
//		BU_EMAIL       NOT NULL VARCHAR2(100)  
//		BU_TEL         NOT NULL VARCHAR2(20)   
//		BU_USEYN       NOT NULL VARCHAR2(1)    

		String buId = request.getParameter("buId");
		String buNumber = request.getParameter("buNumber");
		String buPwd = request.getParameter("buPwd");
		String buName = request.getParameter("buName");
		String buBirth = request.getParameter("buBirth");
		String buGender = request.getParameter("buGender");
		String buEmail = request.getParameter("buEmail");
		String buTel = request.getParameter("buTel");
		String buUseYn = request.getParameter("buUseYn");

		BumVo vo =new BumVo();
		vo.setBuId(buId);
		vo.setBuNumber(buNumber);
		vo.setBuPwd(buPwd);
		vo.setBuName(buName);
		vo.setBuBirth(buBirth);
		vo.setBuGender(buGender);
		vo.setBuEmail(buEmail);
		vo.setBuTel(buTel);
		vo.setBuUseYn(buUseYn);
		
		if(vo != null) {
			BumDao dao=new BumDao();
			dao.insertBuMember(vo);
			//DB저장후.. 메인페이지 호출..
		}else {
			//회원가입 페이지
		}
			
		
		//...넘 어렵다...다시 해보겟습니다..
		
		
	}

}
