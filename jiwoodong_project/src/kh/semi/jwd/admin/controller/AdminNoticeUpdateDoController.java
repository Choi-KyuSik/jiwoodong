package kh.semi.jwd.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminNoticeService;
import kh.semi.jwd.admin.model.vo.AdminNoticeVo;

/**
 * Servlet implementation class AdminNoticeUpdateDoController
 */
@WebServlet("/AdminNoticeUpdateDo")
public class AdminNoticeUpdateDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeUpdateDoController() {
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
		String ntTitle = request.getParameter("ntTitle");
		String ntContent = request.getParameter("ntContent");
		String ntNoStr = request.getParameter("ntNo");
		int ntNo = Integer.parseInt(ntNoStr);
		
		System.out.println("제목 : " + ntTitle + ", 내용 : " + ntContent + ", 글번호 : " + ntNo);
		
		AdminNoticeVo adnvo = new AdminNoticeVo();
		adnvo.setNtTitle(ntTitle);
		adnvo.setNtContent(ntContent);
		adnvo.setNtNo(ntNo);
		int result = new AdminNoticeService().updateNotice(adnvo);
		if(result < 1) {
			System.out.println("글수정 실패!");
			request.getRequestDispatcher("AdminMainPage").forward(request, response);
//			response.sendRedirect("AdminMainPage");
		} else {
			System.out.println("글수정 성공!");
			request.getSession().setAttribute("tabMenu", "1");
			response.sendRedirect("AdminMainPage");
		}
	}

}
