<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	계정확인용 임시 페이지 입니다..

	<!-- 02-08 뷰디테일 페이지 이동시 쿼리 전달-->

	<a href="${cpath }/users/login">로그인 하러 가기</a>

	<p>현재 로그인 한 계정은 ${login.idx }</p>

	<table>
		<tr>
			<th>idx</th>
			<th>이름</th>
			<th>이메일</th>
			<th>비번</th>
			<th>팔로우 버튼 여기서 되나?</th>
			<th>언팔로우 테스트 버튼</th>
		</tr>
		<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.idx }</td>
				<td><a
					href="${cpath }/users/viewDetail/${dto.idx }/${login.idx}">${dto.name }</a></td>
				<td>${dto.email }</td>
				<td>${dto.pw }</td>
				<td><a href="${cpath }/users/follow/${dto.idx}/${login.idx}"><button>팔로우?</button></a></td>
				<td><a href="${cpath }/users/unfollow/${dto.idx}/${login.idx}"><button>언팔로우?</button></a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>