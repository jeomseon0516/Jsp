<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	String seq = request.getParameter("seq");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");
	// ----------------------------
	// 데이터베이스 작업 - 수정 데이터 조회
	// ----------------------------
	try {
		Context	initCtx = new InitialContext();
		Context ctx = (Context)initCtx.lookup("java:comp/env"); // JNDI 기본 환경 이름
				
		DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");	
		Connection conn = ds.getConnection();
		// 3) SQL 실행 객체 생성
		String sql = "UPDATE `User5` SET ";
		sql += "name = ?, ";
		sql += "gender = ?, ";
		sql += "age = ?, ";
		sql += "addr = ? ";
		sql += "WHERE seq = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, gender);
		psmt.setString(3, age);
		psmt.setString(4, addr);
		psmt.setString(5, seq);
		
		// 4) SQL 실행
		psmt.executeUpdate();
		
		// 5) 결과셋 처리
		// 6) 데이터베이스 종료
	
		psmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	response.sendRedirect("/ch05/user5/list.jsp?modify=succees");
%>