<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user4::목록</title>
	</head>
	<body>
		<h3>User4 목록</h3>
		<a href="/ch09">메인</a>
		<a href="/ch09/user4/register.do">등록</a>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>성별</td>
				<td>나이</td>
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
					<td>${dto.gender}</td>
					<td>${dto.age}</td>
					<td>${dto.addr}</td>
					<td>${dto.hp}</td>
					<td>
						<a href="/ch09/user4/modify.do?userid=${dto.userid}">수정</a>
						<a href="/ch09/user4/delete.do?userid=${dto.userid}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>