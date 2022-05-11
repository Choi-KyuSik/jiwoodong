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
@WebServlet("/bucompanydoupdate")
public class BusinessCompanyWriteDoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BusinessCompanyWriteDoUpdateServlet() {
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
			   
		int buNo = (int) request.getSession().getAttribute("buNo");
		
		
		System.out.println("buNo 담기는거 맞아?:" + buNo );
		
		String cpName = request.getParameter("cpName");
		String cpCategory = request.getParameter("cpCategory");
		String cpExplain = request.getParameter("cpExplain");
		String cpClassify = request.getParameter("cpClassify");
		if(cpClassify.equals("D")) {
			cpClassify = "A";
		}
		String cpOpenTime = request.getParameter("cpOpenTime");
		System.out.println("cpOpenTime 왜 안담기지?:"+ cpOpenTime);
		String cpCloseTime = request.getParameter("cpCloseTime");
		System.out.println("cpCloseTime 왜 안담기지?:"+ cpCloseTime);
		String cpPostcode = request.getParameter("cpPostcode");
		String cpAddress = request.getParameter("cpAddress");
		String cpDtaddress = request.getParameter("cpDtaddress");
		String flGno = request.getParameter("fileUrl1");
		String flGno2 = request.getParameter("fileUrl2");
		String flGno3 = request.getParameter("fileUrl3");		
		//업체등록여부 확인
		String cpSignYn = request.getParameter("cpSignYn");

		CompanyVo cvo = new CompanyVo();
		cvo.setBuNo(buNo);
		cvo.setCpName(cpName);
		cvo.setCpCategory(cpCategory);
		cvo.setCpExplain(cpExplain);
		cvo.setCpClassify(cpClassify);
		cvo.setCpOpenTime(cpOpenTime);
		cvo.setCpCloseTime(cpCloseTime);
		cvo.setCpPostcode(cpPostcode);
		cvo.setCpAddress(cpAddress);
		cvo.setCpDtaddress(cpDtaddress);
		cvo.setFlGno(flGno);
		cvo.setFlGno2(flGno2);
		cvo.setFlGno3(flGno3);
				
		System.out.println("cvo:" + cvo);
		//가져온 세션에서 속성명을 통해 데이터 값을 가져와서 String 변수에 저장
		 
		 

		result = new BumService().companyWriteUpdate(cvo, buNo);
		
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
			System.out.println("업체 수정 *성공*");
			PrintWriter out1 = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out1.println("<script language='javascript'>");
			out1.println("alert('업체등록 요청이 완료되었습니다. 승인까지 최대3일이 소요됩니다.'); location.href='BumMainPage'");
			out1.println("</script>");
			out1.flush();
		}
		
/*		result2 = new BumService().companyWriteCheck(buNo);
		
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
		} */
	}
}
