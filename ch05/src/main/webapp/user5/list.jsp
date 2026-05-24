<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.Context"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="sub1.User5" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 목록 출력 리스트
	List<User5> user5List = new ArrayList<>();

	// ------------------------------
	// 데이터베이스 저장
	// ------------------------------
	
/* 	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "astarteam0516";
	String pass = "1234"; */
	
	try {
		// 1) 드라이버 로드
/* 		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2) 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);
		 */
		 
		// ----------------------------------
		// DBCP 방식
		// ----------------------------------
		 
		// 1) JNDI 서비스 객체 생성
		Context	initCtx = new InitialContext();
		Context ctx = (Context)initCtx.lookup("java:comp/env"); // JNDI 기본 환경 이름
		
		// 2) 커넥션풀 데이터베이스 커넥션 가져오기
		DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");	
		Connection conn = ds.getConnection();
		
		// 3) SQL 실행 객체 생성
		Statement stmt = conn.createStatement();
		
		// 4) SQL 실행
		String sql = "SELECT * FROM `User5`";
		ResultSet rs = stmt.executeQuery(sql);
		
		// 5) 결과셋(ResultSet) 처리
		while(rs.next()) {			
			User5 user5 = new User5();
			user5.setSeq(rs.getInt(1));
			user5.setName(rs.getString(2));
			user5.setGender(rs.getString(3));
			user5.setAge(rs.getInt(4));
			user5.setAddr(rs.getString(5));
			
			user5List.add(user5);
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
		<title>user5::목록</title>
	</head>
	<body>
		<h3>User5 목록</h3>
		<a href="/ch05/1_jdbc.jsp">메인</a>
		<a href="/ch05/user5/register.jsp">등록</a>
		<table border="1">
			<tr>
				<td>seq</td>
				<td>이름</td>
				<td>성별</td>
				<td>나이</td>
				<td>주소</td>
				<td>관리</td>
			</tr>
			<%
				for(User5 user5 : user5List) {
			%>
				<tr>
					<td><%= user5.getSeq() %></td>
					<td><%= user5.getName() %></td>
					<td><%= user5.getGender() %></td>
					<td><%= user5.getAge() %></td>
					<td><%= user5.getAddr() %></td>
					<td>
						<a href="/ch05/user5/modify.jsp?seq=<%= user5.getSeq() %>">수정</a>
						<a href="/ch05/user5/proc/delete.jsp?seq=<%= user5.getSeq() %>">삭제</a>
					</td>
				</tr>
			<%
				}
			%>
		</table>
	</body>
</html>