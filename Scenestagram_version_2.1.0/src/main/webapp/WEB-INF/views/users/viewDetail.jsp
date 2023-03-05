<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../header.jsp" %>   
<link rel="stylesheet" href="${cpath }/resources/css/users_viewDetail.css">
</head>
<body onload="followCntHandler(); checkFollowHandler(); optionCheckHandler(); scrollHandler();">
<script type="text/javascript">
	const dto_idx = '${dto.idx}'
</script>
<div class="all_wrap" offset="0">
	<div class="main_wrap">
		<div class="screen">
	        <!-- 가운데 메인 -->			
			<div class="main">				          
              		<!-- mypage 프로필 -->
				<div class="flex view_detail_top">
      					<!--mypage 프로필사진-->
					<div class="top_profile_img">
       					<img src="${cpath }/resources/img/${dto.user_img }">
					</div>
						<div class="view_detail_top_right_box">
							<div class="right_top">
        						<div class="text-box">${dto.nick_name }</div>
							<button id="followBtn"></button>
							<c:if test="${login.idx != dto.idx }">
								<div class="go_chat">메시지 보내기</div>
							</c:if>
        					<div class="right_top_opt">
       							<span class="option hidden">
          							<svg aria-label="옵션" class="_ab6-" color="rgb(245, 245, 245)" fill="rgb(245, 245, 245)" height="24" role="img" viewBox="0 0 24 24" width="24"><circle cx="12" cy="12" fill="none" r="8.635" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></circle><path d="M14.232 3.656a1.269 1.269 0 0 1-.796-.66L12.93 2h-1.86l-.505.996a1.269 1.269 0 0 1-.796.66m-.001 16.688a1.269 1.269 0 0 1 .796.66l.505.996h1.862l.505-.996a1.269 1.269 0 0 1 .796-.66M3.656 9.768a1.269 1.269 0 0 1-.66.796L2 11.07v1.862l.996.505a1.269 1.269 0 0 1 .66.796m16.688-.001a1.269 1.269 0 0 1 .66-.796L22 12.93v-1.86l-.996-.505a1.269 1.269 0 0 1-.66-.796M7.678 4.522a1.269 1.269 0 0 1-1.03.096l-1.06-.348L4.27 5.587l.348 1.062a1.269 1.269 0 0 1-.096 1.03m11.8 11.799a1.269 1.269 0 0 1 1.03-.096l1.06.348 1.318-1.317-.348-1.062a1.269 1.269 0 0 1 .096-1.03m-14.956.001a1.269 1.269 0 0 1 .096 1.03l-.348 1.06 1.317 1.318 1.062-.348a1.269 1.269 0 0 1 1.03.096m11.799-11.8a1.269 1.269 0 0 1-.096-1.03l.348-1.06-1.317-1.318-1.062.348a1.269 1.269 0 0 1-1.03-.096" fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="2"></path></svg>
      							</span>
	 						</div>
						</div>
   						<div class="right_top_middle">
					        <div><span>게시물</span><span id="postCnt"></span></div>
					        <div><span>팔로워</span><span id="followerCnt"></span></div>
					        <div><span>팔로잉</span><span id="followingCnt"></span></div>
   						</div>
   						<div class="right_top_name">${dto.name }</div>
						<div class="right_top_content">${dto.introduce }</div>
           			</div>
				</div>
				<!-- mypage 프로필 end-->
            	<div class="wrap_middle">
                	게시물
            	</div>
            	<div class="list">
	             	<div class="items">	             		 
	                </div>
                </div>           
       		</div>
<!-- 가운데 메인 end-->
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
</div>

	<!-- 게시물 모달 -->
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
	         
	<!-- 톱니바퀴 모달 -->
	<div class="option_modal hidden">
		<div class="option_modal_bg"></div>
		<div class="modalBox">
			<div><a href="${cpath }/users/infoModify_replacePw">비밀번호 변경</a></div>
			<div><a href="${cpath }/users/logout">로그아웃</a></div>
			<div class="closeBtn">취소</div>
		</div>
	</div>
<script type="text/javascript" src="${cpath }/resources/js/main.js"></script>    
<!-- 스크롤, 모달창 -->
<script type="text/javascript" src="${cpath }/resources/js/users_viewDetail.js"></script>

  

</body>
</html>