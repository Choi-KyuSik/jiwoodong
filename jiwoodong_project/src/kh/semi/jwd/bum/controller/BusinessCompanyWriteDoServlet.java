package kh.semi.jwd.bum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.semi.jwd.bum.model.service.BumService;
import kh.semi.jwd.bum.model.vo.CompanyVo;

/**
 * Servlet implementation class BusinessCompanyWriteDoServlet
 */
@WebServlet("/bucompanydo")
public class BusinessCompanyWriteDoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BusinessCompanyWriteDoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
//		
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		int result = 0;
		int result2 = 0;
		
		 HttpSession session = request.getSession();
		   
		   //가져온 세션에서 속성명을 통해 데이터 값을 가져와서 String 변수에 저장
		 int buNo = (int)session.getAttribute("buNo");
		   
		
		String cpName = request.getParameter("cpName");
		String cpCategory = request.getParameter("cpCategory");
		String cpExplain = request.getParameter("cpExplain");
		String cpClassify = request.getParameter("cpClassify");
		String cpOpenDate = request.getParameter("cpOpenDate");
		String cpCloseDate = request.getParameter("cpCloseDate");
		String cpOpenTime = request.getParameter("cpOpenTime");
		String cpCloseTime = request.getParameter("cpCloseTime");
		String cpPostcode = request.getParameter("cpPostcode");
		String cpAddress = request.getParameter("cpAddress");
		String cpDtaddress = request.getParameter("cpDtaddress");
		String flGno = request.getParameter("fileUrl1");
		String flGno2 = request.getParameter("fileUrl2");
		String flGno3 = request.getParameter("fileUrl3");
		
		
//		//업체등록 가능여부 확인
//		String cpSignYn = request.getParameter("cpSignYn");

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
		cvo.setFlGno(flGno);
		cvo.setFlGno2(flGno2);
		cvo.setFlGno3(flGno3);
				
		System.out.println("cvo:" + cvo);

		result = new BumService().companyWrite(cvo);
		
		System.out.println("Controller result" + result);

		if(result < 1) {
			System.out.println("업체 등록실패============");
			PrintWriter out1 = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out1.println("<script language='javascript'>");
			out1.println("alert('업체등록에 실패하였습니다.'); location.href='BumMainPage'");
			out1.println("</script>");
			out1.flush();
		} else {
			System.out.println("업체 등록 *성공*");
			PrintWriter out1 = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out1.println("<script language='javascript'>");
			out1.println("alert('업체등록 요청이 완료되었습니다. 관리자에게 문의해주시기 바랍니다.'); location.href='BumMainPage'");
			out1.println("</script>");
			out1.flush();
		}
		/*
		result2 = new BumService().companyWriteCheck(buNo);
		
		//업체등록 중복여부 확인
		if(cpSignYn == "Y") {
			PrintWriter out2 = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out2.println("<script language='javascript'>");
			out2.println("alert('계정당 업체는 하나씩만 등록 가능합니다.'); location.href='BumMainPage'");
			out2.println("</script>");
			out2.flush();			
		}else {
			if(cpSignYn =="R") {
				PrintWriter out2 = response.getWriter();
				response.setContentType("text/html; charset=utf-8");
				out2.println("<script language='javascript'>");
				out2.println("alert('이미 업체등록을 신청하셨습니다.'); location.href='BumMainPage'");
				out2.println("</script>");
				out2.flush();
			}else {
				
			}
		}
		*/
	}
}
