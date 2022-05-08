package kh.semi.jwd.bum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.service.BusinessReservationService;
import kh.semi.jwd.bum.model.vo.BumReservationVo;

/**
 * Servlet implementation class BusinessReservationMenuServlet
 */
@WebServlet("/burmenu")
public class BusinessReservationMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessReservationMenuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cpNo = (int) request.getSession().getAttribute("cpNo");
		ArrayList<Map<String, Object>> list = new BusinessReservationService().reservationMenuList(cpNo);
		request.setAttribute("MenuList", list);
		String cpSignYn = new BusinessReservationService().getSighyn(cpNo);
		PrintWriter out2 = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		if(cpSignYn.equals("Y")) {
			request.getRequestDispatcher("WEB-INF/bum/bumBookingMenuList.jsp").forward(request, response);
		}else {
				out2.println("<script language='javascript'>");
				out2.println("alert('업체등록을 먼저 해주세요.'); history.back();");
				out2.println("</script>");
				out2.flush();
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
