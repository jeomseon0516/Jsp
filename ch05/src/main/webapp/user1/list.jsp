<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="sub1.User1" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 목록 출력 리스트
	List<User1> user1List = new ArrayList<>();

	// ------------------------------
	// 데이터베이스 저장
	// ------------------------------
	
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "astarteam0516";
	String pass = "1234";
	
	try {
		// 1) 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 1) 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// 2) SQL 실행 객체 생성
		Statement stmt = conn.createStatement();
		
		// 3) SQL 실행
		String sql = "SELECT * FROM `User1`";
		ResultSet rs = stmt.executeQuery(sql);
		
		// 4) 결과셋(ResultSet) 처리
		while(rs.next()) {			
			User1 user1 = new User1();
			user1.setUserid(rs.getString(1));
			user1.setName(rs.getString(2));
			user1.setHp(rs.getString(3));
			user1.setAge(rs.getInt(4));
			
			user1List.add(user1);
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
		<title>user1::목록</title>
	</head>
	<body>
		<h3>User1 목록</h3>
		<a href="/ch05/1_jdbc.jsp">메인</a>
		<a href="/ch05/user1/register.jsp">등록</a>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>휴대폰</td>
				<td>나이</td>
				<td>관리</td>
			</tr>
			<%
				for(User1 user1 : user1List) {
			%>
				<tr>
					<td><%= user1.getUserid() %></td>
					<td><%= user1.getName() %></td>
					<td><%= user1.getHp() %></td>
					<td><%= user1.getAge() %></td>
					<td>
						<a href="#">수정</a>
						<a href="#">삭제</a>
					</td>
				</tr>
			<%
				}
			%>
		</table>
	</body>
</html>