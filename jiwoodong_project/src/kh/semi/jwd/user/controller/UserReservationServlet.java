package kh.semi.jwd.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.vo.CompanyVo;
import kh.semi.jwd.user.model.service.UserReservationService;

/**
 * Servlet implementation class UserReservationServlet
 */
@WebServlet("/UserReservation")
public class UserReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cpNoStr = request.getParameter("cpNo");
		int cpNo = Integer.parseInt(cpNoStr);
		request.setAttribute("cpNo", cpNo);
		// System.out.println("===========cpNo값 확인========== : " + cpNo);
		
		ArrayList<CompanyVo> result = new UserReservationService().cpInfo(cpNo);
		ArrayList<Map<String, Object>> menu = new UserReservationService().cpmenu(cpNo);
		request.setAttribute("CpInfo", result);
		request.setAttribute("menu", menu);
		System.out.println(result);
		if(result.get(0).getCpCategory().equals("카페")) {
		request.getRequestDispatcher("WEB-INF/user/userReservationCafe.jsp").forward(request, response);
		} else if(result.get(0).getCpCategory().equals("미용실")) {
			request.getRequestDispatcher("WEB-INF/user/userReservationSalon.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("WEB-INF/user/userReservationHotel.jsp").forward(request, response);
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
