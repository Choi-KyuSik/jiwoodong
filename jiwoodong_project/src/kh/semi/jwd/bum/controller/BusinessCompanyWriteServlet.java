package kh.semi.jwd.bum.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.service.BumService;
import kh.semi.jwd.bum.model.vo.CompanyVo;

/**
 * Servlet implementation class BusinessCompanyWriteServlet
 */
@WebServlet("/bucompany")
public class BusinessCompanyWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BusinessCompanyWriteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/bum/businessCompanyWritePage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int result = 0;

		int buNo = 24;

		String cpName = request.getParameter("cpName");
		String cpCategory = request.getParameter("cpCategory");
		String cpExplain = request.getParameter("cpExplain");
		//	String flGno 
		String cpClassify = request.getParameter("cpClassify");
		System.out.println(cpClassify);
		String cpOpenDate = request.getParameter("cpOpenDate");
		System.out.println(cpOpenDate);
		String cpCloseDate = request.getParameter("cpCloseDate");
		System.out.println(cpCloseDate);
		String cpOpenTime = request.getParameter("cpOpenTime");
		System.out.println(cpOpenTime);
		String cpCloseTime = request.getParameter("cpCloseTime");
		String cpPostcode = request.getParameter("cpPostcode");
		System.out.println("cpPostcode:" + cpPostcode);
		String cpAddress = request.getParameter("cpAddress");		
		String cpDtaddress = request.getParameter("cpDtaddress");

		CompanyVo cvo = new CompanyVo();
		cvo.setBuNo(buNo);
		cvo.setCpName(cpName);
		cvo.setCpCategory(cpCategory);
		cvo.setCpExplain(cpExplain);
		cvo.setCpClassify(cpClassify);
		cvo.setCpOpenDate(cpOpenDate);
		cvo.setCpCloseDate(cpCloseDate);
		cvo.setCpOpenTime(cpOpenTime);
		cvo.setCpCloseTime(cpCloseTime);
		cvo.setCpPostcode(cpPostcode);
		cvo.setCpAddress(cpAddress);		
		cvo.setCpDtaddress(cpDtaddress);

		result = new BumService().companyWrite(cvo);

		System.out.println("Controller result" + result);

		if (result < 1) {
			System.out.println("업체 등록실패============");
			request.getRequestDispatcher("WEB-INF/bum/businessCompyWritePage.jsp").forward(request, response);
		} else {
			System.out.println("업체 등록 *성공*");
			request.getRequestDispatcher("WEB-INF/bum/bumMainPage.jsp").forward(request, response);
			// 얼럿창 띄워준 후 select문으로 업체등록 된 내역 보여주기
		}

	}

}
