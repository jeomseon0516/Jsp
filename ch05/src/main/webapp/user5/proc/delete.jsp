<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	String seq = request.getParameter("seq");

	// ----------------------------
	// 데이터베이스 작업 - 수정 데이터 조회
	// ----------------------------
	try {
		Context	initCtx = new InitialContext();
		Context ctx = (Context)initCtx.lookup("java:comp/env"); // JNDI 기본 환경 이름
				
		DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");	
		Connection conn = ds.getConnection();
		// 3) SQL 실행 객체 생성
		String sql = "DELETE FROM `User5` WHERE seq = ?";

		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, seq);
		
		// 4) SQL 실행
		psmt.executeUpdate();
		
		// 6) 데이터베이스 종료
		psmt.close();
		conn.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	response.sendRedirect("/ch05/user5/list.jsp?delete=succees");
%>