<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User5::수정</title>
	</head>
	<body>
		<h3>User5 수정</h3>
		<a href="/ch09">메인</a>
		<a href="/ch09/user5/list.do">목록</a>
		
		<form action="/ch09/user5/modify.do" method="post">
			<table border="1">
				<tr>
					<td>seq</td>
					<td><input type="number" name="seq" value="${user5DTO.seq}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="${user5DTO.name}"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<label><input type="radio" name="gender" value="M" ${"M".equals(user5DTO.gender) ? "checked" : ""}>남</label>
						<label><input type="radio" name="gender" value="F" ${"F".equals(user5DTO.gender) ? "checked" : ""}>여</label>
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" value="${user5DTO.age}"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" value="${user5DTO.addr}"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정하기">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>