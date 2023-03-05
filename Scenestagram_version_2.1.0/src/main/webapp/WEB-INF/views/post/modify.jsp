<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<form method="POST">
	<p>IDX : <input type="text" name="idx" value="${dto.idx }" readonly></p>
	<p>USER_IDX : <input type="text" name="users_idx" value="${dto.users_idx }" readonly></p>
	<p><textarea name="content">${dto.content }</textarea></p>
	<p>LOACTION : <input type="text" name="location" value="${dto.location }"></p>	
	<p>REGIST_DATE : <input type="date" name="regist_date" value="${dto.regist_date }" readonly></p>
	<p>STATUS : <input type="text" name="status" value="${dto.status }" readonly></p>			
	<p>VIEWS : <input type="text" name="views" value="${dto.views }" readonly></p>
	<p><input type="submit" value="글수정"></p>
</form>

</body>
</html>