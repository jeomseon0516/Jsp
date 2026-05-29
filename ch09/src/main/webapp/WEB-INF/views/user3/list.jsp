<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user3::목록</title>
	</head>
	<body>
		<h3>User3 목록</h3>
		<a href="/ch09">메인</a>
		<a href="/ch09/user3/register.do">등록</a>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>생일</td>
				<td>휴대폰</td>
				<td>주소</td>
				<td>관리</td>
			</tr>
			
			<!-- ListController에서 req 객체로 setAttribute 한 dtoList를 표현언어에서 requestScoe로 참조 -->
			<c:forEach var="dto" items="${dtoList}">
				<tr>
					<!-- 표현언어에서는 객체 속성을 직접 참조가능 -->
					<td>${dto.getUserid()}</td>
					<td>${dto.name}</td>
					<td>${dto.birth}</td>
					<td>${dto.hp}</td>
					<td>${dto.addr}</td>
					<td>
						<a href="/ch09/user3/modify.do?userid=${dto.userid}">수정</a>
						<a href="/ch09/user3/delete.do?userid=${dto.userid}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>