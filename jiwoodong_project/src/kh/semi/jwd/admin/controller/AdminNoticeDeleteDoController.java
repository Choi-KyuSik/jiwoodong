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
 * Servlet implementation class AdminNoticeDeleteDoController
 */
@WebServlet("/AdminNoticeDeleteDo")
public class AdminNoticeDeleteDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeDeleteDoController() {
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
		String ntNoStr = request.getParameter("ntNo");
		int ntNo = Integer.parseInt(ntNoStr);
		
		AdminNoticeVo adnvo = new AdminNoticeVo();
		adnvo.setNtNo(ntNo);
		
		int result = new AdminNoticeService().deleteNotice(adnvo);
		
		if(result < 1) {
			System.out.println("글삭제 실패!");
			request.getRequestDispatcher("AdminMainPage").forward(request, response);
		} else {
			System.out.println("글삭제 성공!");
			request.getSession().setAttribute("tabMenu", "1");
			response.sendRedirect("AdminMainPage");
		}
	}

}
