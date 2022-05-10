package kh.semi.jwd.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.user.model.service.UserService;
import kh.semi.jwd.user.model.service.UsercpSearchpageService;
import kh.semi.jwd.user.model.vo.UsercpSearchpageVo;

/**
 * Servlet implementation class UsercpSearchpageServlet
 */
@WebServlet("/uscplist")
public class UsercpSearchpageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsercpSearchpageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String umId = (String) request.getSession().getAttribute("um_id");
		
		ArrayList<UsercpSearchpageVo> uscplist = new UsercpSearchpageService().listCompany();
		ArrayList<Map<String, Object>> bklist_r = new UserService().usBkList_r(umId);
		request.setAttribute("uscplist", uscplist);
		request.setAttribute("bklist_r", bklist_r);
		request.getRequestDispatcher("WEB-INF/user/userCompanyList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
