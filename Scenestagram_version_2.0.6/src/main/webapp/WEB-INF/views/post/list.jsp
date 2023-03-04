<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="list">
	<div class="items">
		<c:forEach var="dto" items="${list }">
			<div class="item">
				<a href="${cpath }/post/detail/${dto.post_idx }"><img
					src="${cpath}/upload/${dto.file_name }"></a>
				<p>${dto.post_idx }</p>
			</div>
		</c:forEach>
	</div>
</div>
<div>
	<a href="${cpath }/post/add"><button>글작성</button></a>
</div>

</body>
</html>