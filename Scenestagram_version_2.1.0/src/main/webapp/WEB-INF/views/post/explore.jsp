<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/post_explore.css">

<div class="all_wrap" offset="0">
   <div class="main_wrap">
	     <div class="list">
	        <div class="items">
	        	
	        </div>
	     </div>
	<!-- foot -->
		<div class="foot">
			<div>
	            <a href=""><span>소개</span></a><span>•</span>
	            <a href=""><span>도움말</span></a><span>•</span>
	            <a href=""><span>홍보 센터</span></a><span>•</span>
	            <a href=""><span>API</span></a><span>•</span>
	            <a href=""><span>채용 정보</span></a><span>•</span>
	            <a href=""><span>개인정보처리방침</span></a><span>•</span>
	            <a href=""><span>약관</span></a><span>•</span>
	            <a href=""><span>위치</span></a><span>•</span>
	            <a href=""><span>언어</span></a>
	        </div>
	        <div>
	            © 2023 INSTAGRAM FROM META
	        </div>
    	</div>
    	<!-- foot end-->
   </div>
</div>

<div id="modal">
	<div class="prevBtn">
		<button class="prevBtn_btn">
			<div class="prevBtn_imt">
				<svg aria-label="돌아가기" class="_ab6-" color="rgb(0, 0, 0)" fill="rgb(0, 0, 0)" height="16" role="img" viewBox="0 0 24 24" width="16"><path d="M21 17.502a.997.997 0 0 1-.707-.293L12 8.913l-8.293 8.296a1 1 0 1 1-1.414-1.414l9-9.004a1.03 1.03 0 0 1 1.414 0l9 9.004A1 1 0 0 1 21 17.502Z"></path></svg>
			</div>
		</button>
	</div>
	<div class="modal_content">
		<div class="image_content">
			<div class="left prev imt"></div>
			<div class="images" index="0"></div>
			<div class="right next imt"></div>
		</div>
		<div class="post_content" index="0"></div>
	</div>
	<div class="nextBtn">
		<button class="nextBtn_btn">
			<div class="nextBtn_imt">
				<svg aria-label="다음" class="_ab6-" color="rgb(0, 0, 0)" fill="rgb(0, 0, 0)" height="16" role="img" viewBox="0 0 24 24" width="16"><path d="M21 17.502a.997.997 0 0 1-.707-.293L12 8.913l-8.293 8.296a1 1 0 1 1-1.414-1.414l9-9.004a1.03 1.03 0 0 1 1.414 0l9 9.004A1 1 0 0 1 21 17.502Z"></path></svg>
			</div>
		</button>
	</div>
	<div id="modal_overlay"></div>
	<div class="close">
		<svg aria-label="닫기" class="x1lliihq x1n2onr6" color="rgb(255, 255, 255)" fill="rgb(255, 255, 255)" height="18" role="img" viewBox="0 0 24 24" width="18"><title>닫기</title><polyline fill="none" points="20.643 3.357 12 12 3.353 20.647" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"></polyline><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="3" x1="20.649" x2="3.354" y1="20.649" y2="3.354"></line></svg>
	</div>	
</div>

<script type="text/javascript" src="${cpath }/resources/js/main.js"></script>
<!-- 스크롤, 모달창 -->
<script type="text/javascript" src="${cpath }/resources/js/post_explore.js"></script>

</body>
</html>