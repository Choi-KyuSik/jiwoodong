package kh.semi.jwd.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.user.model.service.UserReservationService;

/**
 * Servlet implementation class UserReservationInsertServlet
 */
@WebServlet("/UserReservationInsertSalon")
public class UserReservationInsertSalonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReservationInsertSalonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { // TODO Auto-generated
	 * method stub
	 * response.getWriter().append("Served at: ").append(request.getContextPath());
	 * }
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String umid = (String) request.getSession().getAttribute("um_id");
		int cpno = Integer.parseInt(request.getParameter("cpNo"));
		System.out.println(request.getParameter("rsdate"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("totalprice", request.getParameter("totalprice"));
		map.put("umid", umid);
		map.put("cpno", cpno);
		map.put("rsdate",request.getParameter("rsdate"));
		map.put("rstime",request.getParameter("rstime"));
		map.put("rsname",request.getParameter("rsname"));
		map.put("rsphone",request.getParameter("rsphone"));
		map.put("rsrequire",request.getParameter("rsrequire"));
		map.put("menuNo", request.getParameter("rsmenu"));
		
		int result = new UserReservationService().reservationInsertCafe(map);
		
		int result2 = new UserReservationService().reservationInsertSalonmenu(map);
		System.out.println(result2);
		response.sendRedirect(request.getContextPath()+"/UserMypage");
	}
}
