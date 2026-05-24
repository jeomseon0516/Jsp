<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<% 
	// 전송 데이터 수신
	String userid 	= request.getParameter("userid");
	String name 	= request.getParameter("name");
	String birth 	= request.getParameter("birth").replace('-', '.');
	String hp 		= request.getParameter("hp");
	String addr 	= request.getParameter("addr");
	
	// ------------------------------
	// 데이터베이스 저장
	// ------------------------------
	try {
		Context	initCtx = new InitialContext();
		Context ctx = (Context)initCtx.lookup("java:comp/env"); // JNDI 기본 환경 이름
				
		DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");	
		Connection conn = ds.getConnection();
		// 3) SQL 실행 객체 생성
		String sql = "INSERT INTO `User3` VALUES(?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, userid);
		psmt.setString(2, name);
		psmt.setString(3, birth);
		psmt.setString(4, hp);
		psmt.setString(5, addr); // 21, '21'
		
		// 4) SQL 실행
		psmt.executeUpdate();
		
		// 5) 결과셋 처리(SELECT일 경우)
		// 6) 데이터베이스 종료
		psmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	// 목록 이동
	response.sendRedirect("/ch05/user3/list.jsp?register=success");
%>