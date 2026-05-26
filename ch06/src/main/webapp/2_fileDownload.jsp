<%@page import="ch06.FileDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터베이스 파일 정보 가져오기
	List<FileDTO> fileList = new ArrayList<>();

	try {
		Context ctx = (Context)new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
		
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM FileTable";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			FileDTO file = new FileDTO();
			file.setNo(rs.getInt(1));
			file.setUserid(rs.getString(2));
			file.setName(rs.getString(3));
			file.setOfname(rs.getString(4));
			file.setSfname(rs.getString(5));
			file.setRdate(rs.getString(6));
			fileList.add(file);
		}
		
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
		<title>2_fileDownload</title>
	</head>
	<body>
		<h3>2.파일 다운로드 실습</h3>
		
		<table border="1">
			<tr>
				<td>번호</td>
				<td>아이디</td>
				<td>이름</td>
				<td>원본 파일명</td>
				<td>저장 파일명</td>
				<td>등록일</td>
				<td>관리</td>
			</tr>
			<% for(FileDTO file : fileList) { %>
			<tr>
				<td><%= file.getNo() %></td>
				<td><%= file.getUserid() %></td>
				<td><%= file.getName() %></td>
				<td><%= file.getOfname() %></td>
				<td><%= file.getSfname() %></td>
				<td><%= file.getRdate() %></td>
				<td>
					<a href="#">삭제</a>
					<a href="#">다운</a>
				</td>
			</tr>
			<% } %>
		</table>
	</body>
</html>