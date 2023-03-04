<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>채팅</title>
<link rel="stylesheet" href="${cpath }/resources/css/chat.css">
<link rel="stylesheet" href="${cpath }/resources/css/chatToTarget.css">
</head>
<%--JSP의 요소를 자바스크립트의 변수로 선언해서 다른 .js파일에서 사용할 수 있도록 만들기 --%>
<script>
	const username = '${login.nick_name}'
	const roomIdx = '${room_idx}'
	const writerIdx = '${login.idx}'
	const cpath = '${cpath}'
	const serverName = '${pageContext.request.serverName}'
</script>
<body>

	<h1>채팅</h1>
	<div>방번호 : ${room_idx }</div>
	<div>현재 사용자 : ${login.nick_name }</div>
	<hr>

	<div class="main">
		<div class="wrap">
			<div class="left">
				<div id="textarea" class="textarea">
					<div class="overlay hidden"></div>
					<c:forEach var="message" items="${list }">
						<c:if test="${message.WRITER_IDX == login.idx }">
							<div class="self">
								<div class="name">${message.NICK_NAME }</div>
								<div class="message">${message.CONTENT }</div>
							</div>
						</c:if>
						<c:if test="${message.WRITER_IDX != login.idx }">
							<div class="other">
								<div class="name">${message.NICK_NAME }</div>
								<div class="message">${message.CONTENT }</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="right">
				<div id="hamburger">≡</div>
				<div class="aside">
					<h4>사용자 목록</h4>
					<div class="userList"></div>
				</div>
			</div>
		</div>
		<div class="bottom">
			<input id="send" class="send" name="send" autofocus> <input
				id="btn" class="btn" type="button" value="전송"> <input
				id="quit" class="quit" type="button" value="나가기">
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
	<script src="${cpath }/resources/js/chat.js"></script>
	<script src="${cpath }/resources/js/chatToTarget.js"></script>

</body>
</html>