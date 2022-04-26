package kh.semi.jwd.bum.controller;

import static kh.semi.jwd.common.jdbc.JdbcDBCP.close;
import static kh.semi.jwd.common.jdbc.JdbcDBCP.getConnection;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.dao.BusinessReservationDao;
import kh.semi.jwd.bum.model.service.BusinessReservationService;

/**
 * Servlet implementation class BusinessReservationAddServelt
 */
@WebServlet("/bursaddAjax")
public class BusinessReservationAddServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessReservationAddServelt() {
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
			System.out.println(request.getParameter("bkname"));
			request.getParameter("bkname");
			request.getParameter("bkphone");
			request.getParameter("bkdate");
			request.getParameter("bktime");
			request.getParameter("bkmenu");
			request.getParameter("bkprice");
			request.getParameter("bkrequire");
			
			Map<String, Object> map = new HashMap<String, Object>();

			int result = new BusinessReservationService().reservationAdd(map);

			
	}

}
