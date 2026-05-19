<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>file</title>
	</head>
	
	<body>
		<h3>파일 페이지</h3>
		<%
			// contentType을 application/octet-stream으로 설정시 파일을 다운로드
			response.setHeader("Content-Type", "application/octet-stream");
		%>
	</body>
</html>