package kh.semi.jwd.bum.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.service.BusinessReservationService;

/**
 * Servlet implementation class BusinessReservationSelectMenuServlet
 */
@WebServlet("/bursSelectMenuAjax")
public class BusinessReservationSelectMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessReservationSelectMenuServlet() {
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
		String menuNo[] = request.getParameterValues("menuNo");
		String menuCount[] = request.getParameterValues("menuCount");
		
		int total = 0;
		
		for(int i = 0; i < menuNo.length; i++) {
			// result 메뉴 가격
			int result = new BusinessReservationService().reservationMenuPrice(menuNo[i]);
			total = total + (result*Integer.parseInt(menuCount[i]));
		}
		
		PrintWriter out = response.getWriter();
		out.println(total);
		out.flush();
		out.close();
	}

}
