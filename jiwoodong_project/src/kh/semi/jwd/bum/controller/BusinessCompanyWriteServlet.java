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

//	System.out.println("테스트요!");

		// Write이므로 Dao에 값을 넣어주는 insert!!

		int result = 0;

		//	cp_name
		//	cp_category
		//	cp_explain
		//	Fl_Gno
		//	Cp_classify
		//	cp_address
		//	cp_postcode
		//	찾아오는 길
		//	cp_dtaddress

		int buNo = 13;

		String cpName = request.getParameter("cpName");
		String cpCategory = request.getParameter("cpCategory");
		String cpExplain = request.getParameter("cpExplain");
		//	String flGno
		// 운영구분(?)
		String cpClassify = request.getParameter("cpClassify");
		String cpAddress = request.getParameter("cpAddress");
		String cpPostcode = request.getParameter("cpPostcode");
		String cpDtaddress = request.getParameter("cpDtaddress");

		CompanyVo cvo = new CompanyVo();
		cvo.setBuNo(buNo);
		cvo.setCpName(cpName);
		cvo.setCpCategory(cpCategory);
		cvo.setCpExplain(cpExplain);
		cvo.setCpClassify(cpClassify);
		cvo.setCpAddress(cpAddress);
		cvo.setCpPostcode(cpPostcode);
		cvo.setCpDtaddress(cpDtaddress);

		result = new BumService().companyWrite(cvo);

		System.out.println("Controller result" + result);

		if (result < 0) {
			System.out.println("업체 등록실패============");
			request.getRequestDispatcher("WEB-INF/bum/businessCompanyWritePage.jsp").forward(request, response);
		} else {
			System.out.println("업체 등록 *성공*");
			// 얼럿창 띄워준 후 select문으로 업체등록 된 내역 보여주기
		}

	}

}
