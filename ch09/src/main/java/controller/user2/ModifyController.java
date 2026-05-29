package controller.user2;

import java.io.IOException;

import dto.User2DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User2Service;

@WebServlet("/user2/modify.do")
public class ModifyController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private User2Service service = User2Service.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 전송 데이터 수신, 항상 수신데이터 출력해서 확인하는 습관!!!
		String userid = req.getParameter("userid");
		System.out.println(userid); 
		
		// 수정 데이터 조회
		User2DTO dto = service.findbyId(userid);
		
		req.setAttribute("user2DTO", dto);
		
		// View forward
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user2/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 전송 데이터 수신
		String userid = req.getParameter("userid");
		String name = req.getParameter("name");
		String birth = req.getParameter("birth").replace('-', '.');
		String addr = req.getParameter("addr");
		
		// 서비스 전송 객체 생성
		User2DTO dto = new User2DTO();
		dto.setUserid(userid);
		dto.setName(name);
		dto.setBirth(birth);
		dto.setAddr(addr);
		System.out.println(dto);
		
		service.modify(dto);
		
		// 목록 리다이렉트
		resp.sendRedirect("/ch09/user2/list.do?modify=success");
	}
}
