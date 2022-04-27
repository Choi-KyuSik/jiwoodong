package kh.semi.jwd.bum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
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
@WebServlet("/priceSelectAjax")
public class BusinessReservationPriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessReservationPriceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * 
	 * }
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		PrintWriter out = response.getWriter();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bkMenuNo", request.getParameter("bkMenuNo"));
		
		Map<String, Object> price = new HashMap<String, Object>();
		price = new BusinessReservationService().priceSelect(map);
		System.out.println(price.get("menuPrice"));
		out.println(price.get("menuPrice"));
		

		
}

}
