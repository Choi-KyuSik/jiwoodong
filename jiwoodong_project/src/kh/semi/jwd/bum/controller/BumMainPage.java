package kh.semi.jwd.bum.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.semi.jwd.bum.model.dao.BumDao;
import kh.semi.jwd.bum.model.service.BumService;
import kh.semi.jwd.bum.model.vo.BumVo;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/BumMainPage")
public class BumMainPage extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BumMainPage() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	   	   
	   HttpSession session = request.getSession();
	   
	   //������ ���ǿ��� �Ӽ����� ���� ������ ���� �����ͼ� String ������ ����
	   String bu_id = (String)session.getAttribute("bu_id");
	   String password = (String)session.getAttribute("password");
	   
	  // System.out.println("session��峪?:"+ bu_id+ "�� ��й�ȣ��"  + password);
	   
	   
	  //���ฮ��Ʈ
	  ArrayList<Map<String,Object>> list = new BumService().mainPageBookingList();
	  //���丮��Ʈ
	  ArrayList<Map<String, Object>> result = new BumService().mainPageReviewList();
	  ArrayList<Map<String,Object>> statiscicsVisit = new BumService().mainPageStatisticsVisit();
	  ArrayList<Map<String,Object>> statiscicsReview = new BumService().mainPageStatisticsReview();
	  BumVo bvo = new BumService().companyCheck(bu_id);
	  
	 
	  
	  request.setAttribute("list", list);
	  request.setAttribute("Rlist", result);
	  request.setAttribute("visit", statiscicsVisit);
	  request.setAttribute("review", statiscicsReview);	  
	  request.setAttribute("bvo", bvo);
	  System.out.println(statiscicsReview);
      request.getRequestDispatcher("WEB-INF/bum/bumMainPage.jsp").forward(request, response);
      
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
//   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//      // TODO Auto-generated method stub
//      doGet(request, response);
//   }

}