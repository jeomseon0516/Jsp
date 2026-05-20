<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	//전송 데이터 수신
	String userid = request.getParameter("userid");
	String pass = request.getParameter("pass");
	
	// 데이터베이스 비교 처리 생략
	// abc1234, 1234 라고 가정
	if(pass.equals("1234")) {
		// 회원 맞으면 세션(Session Table)에 사용자 이이디를 'sessUser' 이름으로 저장
		
		session.setAttribute("sessUser", userid);
		
		// 리다이렉트
		response.sendRedirect("./loginSuccess.jsp");
	} else {
		// 회원 아닐 경우 다시 로그인폼 화면으로 이동(로그인 실패 파라미터 들고...)
		response.sendRedirect("./loginForm.jsp?login=fail");
	}
%>