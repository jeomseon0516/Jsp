<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="sub1.User2" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 목록 출력 리스트
	List<User2> user2List = new ArrayList<>();

	// ------------------------------
	// 데이터베이스 저장
	// ------------------------------
	
	try {
		Context	initCtx = new InitialContext();
		Context ctx = (Context)initCtx.lookup("java:comp/env"); // JNDI 기본 환경 이름
				
		DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");	
		Connection conn = ds.getConnection();
		
		// 3) SQL 실행 객체 생성
		Statement stmt = conn.createStatement();
		
		// 4) SQL 실행
		String sql = "SELECT * FROM `User2`";
		ResultSet rs = stmt.executeQuery(sql);
		
		// 5) 결과셋(ResultSet) 처리
		while(rs.next()) {			
			User2 user2 = new User2();
			user2.setUserid(rs.getString(1));
			user2.setName(rs.getString(2));
			user2.setBirth(rs.getString(3));
			user2.setAddr(rs.getString(4));
			
			user2List.add(user2);
		}

		// 5) 데이터베이스 종료
		rs.close();
		stmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user2::목록</title>
	</head>
	<body>
		<h3>User2 목록</h3>
		<a href="/ch05/1_jdbc.jsp">메인</a>
		<a href="/ch05/user2/register.jsp">등록</a>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>생일</td>
				<td>주소</td>
				<td>관리</td>
			</tr>
			<%
				for(User2 user2 : user2List) {
			%>
				<tr>
					<td><%= user2.getUserid() %></td>
					<td><%= user2.getName() %></td>
					<td><%= user2.getBirth() %></td>
					<td><%= user2.getAddr() %></td>
					<td>
						<a href="/ch05/user2/modify.jsp?userid=<%= user2.getUserid() %>">수정</a>
						<a href="/ch05/user2/proc/delete.jsp?userid=<%= user2.getUserid() %>">삭제</a>
					</td>
				</tr>
			<%
				}
			%>
		</table>
	</body>
</html>