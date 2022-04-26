package kh.semi.jwd.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminNoticeService;
import kh.semi.jwd.admin.model.service.AdminService;
import kh.semi.jwd.admin.model.vo.AdminNoticeVo;

/**
 * Servlet implementation class AdminMyPage
 */
@WebServlet("/AdminMainPage")
public class AdminMainPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMainPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tabMenu = (String)request.getSession().getAttribute("tabMenu");
		request.getSession().removeAttribute("tabMenu");
		if(!(tabMenu != null && !tabMenu.equals(""))) {
			tabMenu = "0";
		}
		
		ArrayList<AdminNoticeVo> adnolist = new AdminNoticeService().noticeList();
		ArrayList<AdminNoticeVo> adnoDetailList = new AdminNoticeService().noticeListDetail();
		ArrayList<Map<String, Object>> cpaclist = new AdminService().companyAcceptList();
		ArrayList<Map<String, Object>> cpacDetailList = new AdminService().companyAcceptList();
		
		request.setAttribute("tabMenu", tabMenu);
		request.setAttribute("adnolist", adnolist);
		request.setAttribute("cpAccept", cpaclist);
		request.setAttribute("cpAcceptDetail", cpacDetailList);
		request.setAttribute("adnoDetailList", adnoDetailList);
//		System.out.println("controller다. 담겼니?" + adnolist);
		request.getRequestDispatcher("WEB-INF/admin/adminMainPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
