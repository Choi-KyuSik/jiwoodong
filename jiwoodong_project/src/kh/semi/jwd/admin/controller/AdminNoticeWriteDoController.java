package kh.semi.jwd.admin.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminNoticeService;
import kh.semi.jwd.admin.model.vo.AdminNoticeVo;
import kh.semi.jwd.admin.model.vo.AdminVo;

/**
 * Servlet implementation class AdminNoticeWriteDoController
 */
@WebServlet("/AdminNoticeWriteDo")
public class AdminNoticeWriteDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeWriteDoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String ntTitle = request.getParameter("ntTitle");
		String ntContent = request.getParameter("ntContent");
		Timestamp ntWriteDate = new Timestamp(System.currentTimeMillis());
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		
		System.out.println("제목 : " + ntTitle + ", 내용 : " + ntContent);
		
//		AdminVo advo = (AdminVo) request.getSession().getAttribute("AdminNoticeVo");
//		id = advo.getAdId();
//		
//		System.out.println("관리자아이디 : " + id);
		
		AdminNoticeVo adnvo = new AdminNoticeVo();
//		adnvo.setNtNo(10);
		adnvo.setNtTitle(ntTitle);
		adnvo.setNtContent(ntContent);
//		adnvo.setNtWriteDate(ntWriteDate);
//		adnvo.setNtCount(0);
//		adnvo.setFlGno(null);
		int result = new AdminNoticeService().insertNotice(adnvo);
		if(result < 1) {
			System.out.println("글등록 실패!");
			request.getRequestDispatcher(request.getContextPath() + "/AdminMainPage.jsp").forward(request, response);
			response.sendRedirect("AdminMainPage");
		} else {
			System.out.println("글등록 성공!");
			response.sendRedirect("AdminMainPage");
		}
		
	}

}
