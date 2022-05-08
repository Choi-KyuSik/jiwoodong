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
 * Servlet implementation class BumBookingList
 */
@WebServlet("/burscheck")
public class BusinessReservationCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessReservationCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cpNo = (int) request.getSession().getAttribute("cpNo");
		String category = new BusinessReservationService().cpCatecoryCheck(cpNo);
		ArrayList<Map<String, Object>> menulist = new  BusinessReservationService().menuList(cpNo);
		String cpSignYn = new BusinessReservationService().getSighyn(cpNo);
		PrintWriter out2 = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		
		request.setAttribute("menulist", menulist);
		
		//업체등록 여부 확인
				if(cpSignYn.equals("Y")) {
					if(category.equals("카페")) {
						ArrayList<BumReservationVo> reservation  = new BusinessReservationService().BusinessReservationCheckCafe(cpNo);
						request.setAttribute("reservation", reservation);
						request.getRequestDispatcher("WEB-INF/bum/bumBookingListCafe.jsp").forward(request, response);
					} else if(category.equals("미용실")) {
						ArrayList<BumReservationVo> reservation  = new BusinessReservationService().BusinessReservationCheck(cpNo);
						request.setAttribute("reservation", reservation);
						request.getRequestDispatcher("WEB-INF/bum/bumBookingListSalon.jsp").forward(request, response);
					} else {
						ArrayList<BumReservationVo> reservation  = new BusinessReservationService().BusinessReservationCheck(cpNo);
						request.setAttribute("reservation", reservation);
						request.getRequestDispatcher("WEB-INF/bum/bumBookingList.jsp").forward(request, response);
					}
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
