<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>3.반복문</h3>		
		
		<h4>for</h4>
		<%
			for(int i = 1; i <= 5; i++) {
				out.println("<p> : " + i + "</p>");
			}
		%>
		
		<% for(int j = 1; j <= 5; j++) { %>
			<p> : <%= j %></p>
		<% } %>
		<h4>구구단</h4>
		<table border="1">
			<tr>
				<th>2단</th>
				<th>3단</th>
				<th>4단</th>
				<th>5단</th>
				<th>6단</th>
				<th>7단</th>
				<th>8단</th>
				<th>9단</th>
			</tr>
			<% for(int x = 1; x <= 9; x++) { %>
			<tr>
				<% for(int y = 2; y <= 9; y++) { %>
				<td><%= y %> x <%= x %> = <%= x * y %></td>
				<% } %>
			</tr>
			<% } %>
			<tr>
				<th>2 x 1 = 2</th>
				<th>2 x 2 = 4</th>
				<th>2 x 3 = 6</th>
				<th>2 x 4 = 8</th>
				<th>2 x 5 = 10</th>
				<th>2 x 6 = 12</th>
				<th>2 x 7 = 14</th>
				<th>2 x 8 = 16</th>
				<th>2 x 9 = 18</th>
			</tr>
		</table>
	</body>
</html>