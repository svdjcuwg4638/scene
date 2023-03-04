<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
.modal {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 1000px;
	height: 800px;
	display: none;
	background-color: #dadada;
	padding: 50px;
	text-align: center;
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 black;
	transform: translateX(-50%) translateY(-50%);
}
</style>

<h1>게시글 작성 페이지</h1>
<hr>

<button class="btn">모달창</button>

<div class="modal">
	<form method="POST" enctype="multipart/form-data">
		<p>
			<input type="hidden" name="users_idx" value="${login.idx }">
		</p>
		<p>
			<textarea name="content"></textarea>
		</p>
		<p>
			<input type="text" name="location" placeholder="지역 추가">
		</p>
		<p>
			<input type="file" name="image_file" multiple required>
		</p>
		<p>
			<input type="submit" value="글작성">
		</p>
	</form>
</div>
<script>
	const modal = document.querySelector('.modal')
	const btn = document.querySelector('.btn')
	
	function clickHandler(event) {
		modal.style.display = 'block'
	}	
	
	btn.onclick = clickHandler	
</script>
</body>
</html>