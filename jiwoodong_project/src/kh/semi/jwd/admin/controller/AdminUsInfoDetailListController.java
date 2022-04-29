package kh.semi.jwd.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminService;
import kh.semi.jwd.bum.model.vo.BumVo;
import kh.semi.jwd.user.model.vo.AdminUserVo;

/**
 * Servlet implementation class AdminBuInfoDetailListController
 */
@WebServlet("/AdminUsInfoDetailList")
public class AdminUsInfoDetailListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUsInfoDetailListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String umId = request.getParameter("umId");
		
		// System.out.println("유저아이디 내놔 : " + umId);
		
		AdminUserVo uvo = new AdminUserVo();
		uvo.setUmId(umId);
		
		AdminUserVo usMemberDetail = new AdminService().usMemberDetailInfo(uvo);
		
		
		// ArrayList<BumVo> buMemberDeleteList = new AdminService().buMemberDeleteList();
		
		request.setAttribute("usMemberDetail", usMemberDetail);
		// request.setAttribute("buMemberDetail", buMemberDetail);
		// request.setAttribute("buMemberDeleteList", buMemberDeleteList);
		
		request.getRequestDispatcher("WEB-INF/admin/adminUsInfoDetailList.jsp").forward(request, response);
	}

//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
