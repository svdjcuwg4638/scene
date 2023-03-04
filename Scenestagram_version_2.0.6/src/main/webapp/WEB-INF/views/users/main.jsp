<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>

<style>

/* 댓글박스 */
textarea {
	background-color: #262626;
	color: #fff;
}

html {
	overflow-y: hidden;
}

{
background-color
:
 
#0f0f0f
;


}
div {
	background-color: #000;
	min-height: auto;
	min-width: auto;
	display: block;
}

/* div클래스 명이 flex이면 display flex속성 적용 */
/* 클래스명은 여러가지가 되기때문에 일일히 style적용하기 번거로워서 */
div.flex {
	display: flex;
}

/* 위와 같음 */
.i-col-0>* {
	display: inline-block;
	font-size: 16px;
	vertical-align: middle;
	width: auto;
}

/* 메뉴에 마우스호버 했을 때 */
li:hover {
	background-color: rgb(18, 18, 18);
	border-radius: 24px;
}

/* img 기본틀 */
div.img-box .img {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 100%;
}

/* 전체 화면 */
div.screen {
	display: flex;
	height: 100vh;
	overflow-y: scroll;
	flex-flow: column;
}
/*푸터*/
.footer {
	margin-left: 300px;
	text-align: center;
	width: 600px;
}

/*사이드 메뉴 로고박스  */
div.menu-top {
	padding: 25px 12px 35px;
}

.left-gnb-ul li a {
	display: block;
	font-size: 16px;
	color: #fff;
	padding: 16px 12px;
}

.left-gnb-ul li a span.icon {
	display: inline-block;
	vertical-align: middle;
}

.left-gnb-ul li a span:last-child {
	padding-left: 16px;
	vertical-align: middle;
	display: inline-block;
}

.left-bottom {
	padding: 16px 12px;
	font-size: 16px;
	color: #fff;
	position: absolute;
	left: 12px;
	bottom: 20px;
	width: 93%;
}

/* 메뉴 밑에 더보기를 메뉴들과 열을 맞추기 위함 */
.left-bottom span:last-child {
	padding-left: 16px;
}

/*회원님을 위한 추천 프로필 ui*/
#recommend-friend img {
	width: 32px;
	height: 32px;
	border-radius: 30px;
}

#recommend-friend>div a {
	font-size: 14px;
	font-weight: 500;
}

#recommend-friend>div>div:nth-child(2) {
	margin-left: 17px;
	margin-right: 15px;
	font-size: 12px;
	color: #a8a8a8 !important;
	width: 67%;
}

.followBtn {
	align-self: center;
	font-size: 14px;
	color: #0095F6;
}

.followBtn:hover {
	font-weight: bold;
	color: white;
	cursor: pointer;
}

div.home_main {
	width: 100vh;
	height: 500px;
	display: flex;
	height: 100vh;
	/* 나중에 수정 */
	background-color: #000;
}

div.main {
	display: block;
	min-height: auto;
	min-width: auto;

	/* max-width: 853px; */
}

div.home-feed {
	display: flex;
	width: 80%;
}

/* 스토리, 게시글 */
div.home-feed-left {
	display: block;
	min-width: 470px;
	margin-right: 64px;
}

div.home-feed-right {
	display: block;
	position: sticky;
	/* width: 319px; */
}

div.story {
	display: flex;
}

div.insta-main-top {
	padding: 32px 0 16px;
	overflow: hidden;
	position: relative;
	width: 2000px;
}

div.insta-main-top-ul {
	display: flex;
}

div.insta-post-item {
	border-bottom: 1px solid rgb(38, 38, 38);
	padding-bottom: 20px;
	margin-bottom: 12px;
}

div.insta-post-item-top {
	display: flex;
	position: relative;
	padding: 12px 0;
}

div.insta-post-item-top .img-box {
	position: relative;
	width: 32px;
	height: 32px;
	border-radius: 50%;
	overflow: hidden;
}

div.insta-post-item-top .img-box img {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 100%;
	height: 100%;
}

div.insta-post-item-top .id-box {
	font-size: 14px;
	color: #a8a8a8;
	padding-left: 10px;
}

div.insta-post-item-top .id-box .id {
	color: #fff;
}

div.insta-post-item-top .id-box .day {
	color: #a8a8a8;
}

div.insta-post-item-top .option-box {
	position: absolute;
	top: 50%;
	right: 0;
	transform: translateY(-50%);
}

/* 게시글 사진 */
div.insta-post-item-middle .img-box {
	display: flex;
	position: relative;
	width: 470px;
	height: 460px;
	padding-bottom: 74.7%;
	overflow: hidden;
	border-radius: 4px;
}

div.insta-post-item-middle .img-box .images-box {
	position: absolute;
	display: flex;
	height: 460px;
	left: 0px;
	transition-duration: 0.5s;
}

div.insta-post-item-middle .img-box .images-box .image-box {
	position: relative;
	top: 0;
	width: 470px;
	height: 460px;
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	background-size: auto 100%;
	background-position: center center;
	background-repeat: no-repeat;
}

/* 이미지를 가운데에 배치하는 작업 */
div.insta-post-item-middle .img-box .images-box .image-box img {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-49.9%, -50%);
	width: 470px;
	height: 460px;
}

/* 좋아요, 댓글, DM버튼 ...  */
div.insta-post-item-btn-box {
	padding: 15px 0 5px;
}

div.insta-post-item-btn-ul {
	margin: -8px;
	position: relative;
}

div.insta-post-item-btn-ul li {
	padding: 8px;
}

/* 북마크(저장) */
div.insta-post-item-btn-ul li.bookmark {
	position: absolute;
	top: 50%;
	right: 0;
	transform: translateY(-50%);
}

div.insta-post-item-comment {
	
}

/* 좋아요 */
div.insta-post-item-comment .good {
	font-weight: 600;
	font-size: 14px;
	color: #fff;
}

/* 홈피드 top에 패딩 주어서 위치설정 */
div.home-feed {
	padding-top: 40px;
}

/* 오른쪽 포스트 */
div.home-feed-right {
	min-width: 347px;
}

/* 피드 오른쪽 top 마이프로필 */
div.home-feed-right-myprofile {
	display: flex;
	justify-content: space-between;
}

div.home-feed-right-myprofile .img-box {
	width: 56px;
	height: 56px;
	border-radius: 50%;
	overflow: hidden;
	position: relative;
	display: inline-block;
}

div.home-feed-right-myprofile .img-box img {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 100%;
}

div.home-feed-right-myprofile>div {
	display: flex;
}

div.home-feed-right-myprofile .id-box {
	margin: 7px 0 0 18px;
}

div.home-feed-right-myprofile .id-box div {
	font-weight: 500;
}

.recommend_ment {
	font-size: 12px;
	color: #a8a8a8
}

/* 추천회원 프로필 img */
div.flex>.img-box {
	width: 66px;
	height: 66px;
	border-radius: 50%;
	overflow: hidden;
	border: 2px solid #1cd14f;
	position: relative;
}

div.flex>.img-box>img {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 100%;
}

div.account-change {
	
}

div.hidden {
	display: none;
}

div.left-bottom-menu {
	display: none;
	flex-direction: column;
	justify-content: space-around;
	width: 100%;
	position: absolute;
	bottom: 63px;
	border: 1px dashed;
	height: 400px;
	font-size: 16px;
	z-index: 1;
}

div.left-bottom.i-col-0:hover div.left-bottom-menu {
	display: flex;
}

div.left-bottom-menu>div>* {
	display: flex;
	justify-content: space-between;
	vertical-align: middle;
}

div.mypage {
	max-width: 935px;
	width: 935px;
}

div.insta-post-item-middle>* {
	width: 300px;
	height: 300px;
}

.recommend>div {
	margin: 20px 0px;
}

#recommend-friend>div {
	height: 48px;
}

div.insta-post-item textarea {
	margin-top: 10px;
	width: 100%;
	background-color: #000;
	border: none;
	resize: none;
}

li.insta-post-item-like-li {
	margin-right: 10px;
	cursor: pointer;
}

.insta-post-item-reply:hover {
	cursor: pointer;
}

p.insta-post-item-reply {
	color: #A8A8A8;
	font-size: 14px;
}

.id-box span {
	color: #A8A8A8;
	font-size: 15px;
}

@media ( width < 1200px) {
	div.home-feed-right {
		display: none;
	}
}

.modal {
	display: none;
}

.modal_content {
	position: absolute;
	justify-content: center;
	align-items: center;
	top: 50%;
	left: 50%;
	width: 1200px;
	height: 900px;
	display: none;
	background-color: #000;
	text-align: center;
	box-shadow: 0 2px 3px 0 black;
	transform: translateX(-50%) translateY(-50%);
	z-index: 5;
}

.image_content {
	display: flex;
	align-items: center;
	position: relative;
	width: 700px;
	height: 700px;
	overflow: hidden;
}

.post_content {
	width: 400px;
	height: 750px;
	text-align: center;
	background-color: inherit;
	border-left: 1px solid rgb(54, 54, 54);
}

.post_content>div {
	background-color: inherit;
}

.post_content pre {
	white-space: pre-wrap;
}

.left, .left_btn {
	position: absolute;
	top: 50%;
	left: 0px;
	display: none;
	text-align: center;
	border-radius: 10px;
	z-index: 5;
}

.right, .right_btn {
	position: absolute;
	top: 50%;
	right: 0px;
	text-align: center;
	border-radius: 10px;
	z-index: 5;
}

.item:hover {
	cursor: pointer;
}

.images {
	position: absolute;
	display: flex;
	height: 500px;
	left: 0px;
	transition-duration: 0.5s;
}

.image {
	position: relative;
	top: 0;
	width: 700px;
	height: 500px;
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	background-size: auto 100%;
	background-position: center center;
	background-repeat: no-repeat;
}

.image>img {
	width: 700px;
	height: 700px;
}

#modal_overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	display: none;
	background-color: rgba(0, 0, 0, 0.6);
	z-index: 4;
}

.hidden {
	display: none;
}

.next {
	background-color: unset;
	background-repeat: no-repeat;
	background-position: -162px -98px;
	height: 30px;
	width: 30px;
	cursor: pointer;
}

.prev {
	background-color: unset;
	background-repeat: no-repeat;
	background-position: -130px -98px;
	height: 30px;
	width: 30px;
	cursor: pointer;
}

.close {
	display: none;
	position: absolute;
	right: 50px;
	top: 30px;
	cursor: pointer;
	z-index: 5;
}

.post-comment {
	white-space: pre-wrap;
}

.post-comment a {
	color: rgb(224, 241, 255);
}

.userSearch:hover {
	cursor: pointer;
}

.dot {
	color: rgb(168, 168, 168);
	margin: 0px 5px;
}

.post_content .pro_info {
	display: flex;
	border-bottom: 1px solid rgb(54, 54, 54);
	padding: 15px;
}

.post_content .pro_info a {
	color: white;
}

.pro_box .pro_nic {
	font-weight: bold;
	text-align: left;
}

.pro_box .pro_loc {
	font-size: 12px;
}

.post_content .pro_img, .post_items .post_pro_img, .comment_box .comment_img
	{
	width: 32px;
	height: 32px;
	margin-right: 10px;
}

.post_content .pro_img img, .post_items .post_pro_img img, .comment_box .comment_img img
	{
	width: 100%;
	height: 100%;
	border-radius: 50%;
}

.post_items {
	padding: 15px;
	height: 500px;
	border-bottom: 1px solid rgb(54, 54, 54);
	overflow-y: scroll;
}

.post_items::-webkit-scrollbar {
	display: none;
}

.post_items .post_pro_box {
	display: flex;
	justify-content: space-between;
}

.post_item {
	width: 322px;
}

.post_item .post_pro_nic {
	text-align: left;
	font-weight: bold;
}

.post_item .post_pro_nic a {
	color: white;
}

.post_item .post_data_content {
	text-align: left;
	font-size: 14px;
}

.post_item .post_data_content a {
	color: rgb(224, 241, 255);
}

.post_item .post_add_date {
	text-align: left;
	font-size: 12px;
	color: #8E8E8E;
	margin-top: 3px;
}

.comment_box {
	display: flex;
	justify-content: space-between;
	margin-top: 15px;
}

.comment_item {
	width: 322px;
}

.comment_item .comment_item_top {
	display: flex;
	justify-content: space-between;
}

.comment_item .comment_item_top .comment_nic {
	font-weight: bold;
}

.comment_item .comment_item_top .comment_nic a {
	color: white;
}

.comment_item .comment_item_top .comment_like {
	cursor: pointer;
}

.comment_item .comment_content {
	text-align: left;
	font-size: 14px;
}

.comment_item .comment_content a {
	color: rgb(224, 241, 255);
}

.comment_item .comment_item_bottom {
	display: flex;
	margin-top: 3px;
}

.comment_item .comment_item_bottom div {
	margin-right: 10px;
	font-size: 12px;
	color: #8E8E8E;
}

.comment_item .comment_item_bottom .recomment {
	cursor: pointer;
}

.comment_item .comment_item_bottom .remove {
	cursor: pointer;
}

.comment_item .comment_count {
	text-align: left;
	color: #8E8E8E;
	font-size: 12px;
	cursor: pointer;
	margin-top: 10px;
	font-weight: 600;
}

.bottom_item {
	padding: 15px;
	border-bottom: 1px solid rgb(54, 54, 54);
}

.bottom_item .bottom_item_top {
	display: flex;
}

.bottom_item .bottom_item_top div {
	margin-right: 10px;
	cursor: pointer;
}

.bottom_item .bottom_like_count {
	text-align: left;
	font-size: 14px;
	margin-top: 8px;
}

.bottom_item .bottom_date {
	text-align: left;
	font-size: 12px;
	color: #8E8E8E;
	margin-top: 3px;
}

.bottom_input {
	display: flex;
	padding: 10px;
	height: 70px;
}

.bottom_input textarea {
	border: none;
	background-color: #000;
	resize: none;
	width: 85%;
	padding: 13px 0px;
}

.bottom_input textarea:focus {
	outline: none;
}

.bottom_input .bottom_send {
	color: #AAC9FF;
	width: 15%;
	cursor: pointer;
	font-weight: bold;
	align-self: center;
}
</style>
<script>
	const cpath = '${cpath}'
	const users_idx = '${login.idx}'
</script>
</head>
<body onload="loadHandler(); scrollHandler();">
	<div class="screen" offset="0">


		<!-- 가운데 메인 -->
		<div class="all_wrap">
			<div class="main_wrap">
				<div class="home_main">
					<div class="main">
						<div style="display: block;">
							<div class="home-feed" id="home-feed">
								<div class="home-feed-left">
									<!-- 스토리-->
									<div class="stoty"></div>
									<!-- 게시물 (POST) -->
									<div class="post" id="post"></div>
									<!-- 게시물 (POST) end -->
								</div>
								<!-- 메인피드의 오른쪽 마이프로필 및 추천 -->
								<div class="home-feed-right">
									<div class="home-feed-right-myprofile">
										<div>
											<div class="img-box">
												<a href="${cpath }/users/viewDetail/${login.idx }">${login.nick_name }
													<img src="${cpath }/resources/img/${login.user_img }"
													alt="">
												</a>
											</div>
											<div class="id-box">
												<div>
													<a style="color: white;"
														href="${cpath }/users/viewDetail/${login.idx }">${login.nick_name }</a>
												</div>
												<span class="id">${login.name }</span>

											</div>
										</div>
									</div>
									<div class="recommend">
										<div class="flex">
											<div
												style="display: flex; justify-content: space-between; width: 100%;">
												<div style="color: #A8A8A8; font-weight: bold;">회원님을
													위한 추천</div>
												<div>
													<a
														style="color: white; font-weight: bold; font-size: 15px;"
														href="${cpath }/users/recommendAll">모두보기</a>
												</div>
											</div>
										</div>
										<div id="recommend-friend"></div>
									</div>
								</div>
								<!-- 메인피드의 오른쪽 마이프로필 및 추천 end-->
							</div>
						</div>
					</div>
				</div>
				<!-- 가운데 메인 end-->
			</div>
		</div>
	</div>

	<div id="modal">
		<div class="modal_content">
			<div class="image_content">
				<div class="left prev imt"></div>
				<div class="images" index="0"></div>
				<div class="right next imt"></div>
			</div>
			<div class="post_content"></div>
		</div>
		<div id="modal_overlay"></div>
		<div class="close">
			<svg aria-label="닫기" class="x1lliihq x1n2onr6"
				color="rgb(255, 255, 255)" fill="rgb(255, 255, 255)" height="18"
				role="img" viewBox="0 0 24 24" width="18">
				<title>닫기</title><polyline fill="none"
					points="20.643 3.357 12 12 3.353 20.647" stroke="currentColor"
					stroke-linecap="round" stroke-linejoin="round" stroke-width="3"></polyline>
				<line fill="none" stroke="currentColor" stroke-linecap="round"
					stroke-linejoin="round" stroke-width="3" x1="20.649" x2="3.354"
					y1="20.649" y2="3.354"></line></svg>
		</div>
	</div>
	<script type="text/javascript" src="${cpath }/resources/js/main.js"></script>
	<!--  추천인 스크립트 -->
	<script>
   const recofri = document.getElementById('recommend-friend')
   
   function loadHandler() {
      const url = '${cpath}/countFollowing/${login.idx}'
      fetch(url)
      .then(resp => resp.text())
      .then(text => {
      
	      if(text == 0) {
	         location.href = '${cpath}/users/recommendAll'
	      }
	         else {
	         recommendHandler()
	      }
         
      })
      
   }
   
   function recommendHandler() {
     let friend5Cut = 0;      // 5명만 보여주게 할 것
      const url = '${cpath}/recommend/${login.idx}'
      fetch(url)
      .then(resp => resp.json())
      .then(json => {
         json.forEach(dto => {
//             console.log(dto.nick_name)
//             console.log(dto.idx)
            if(friend5Cut != 5) {      // 리스트 다 불러온 다음 강제로 5명컷 낸거라 나쁜 코드입니다.
               let tag = ''
               tag += '<div class="flex">'
               tag += '    	<div>'
               tag += '			<a href="${cpath}/users/viewDetail/' + dto.idx + '">'
           	   tag += '				<img class="" src="${cpath}/resources/img/' + dto.user_img + '"></img>'
           	   tag += '			</a>'
       		   tag += '     </div>'
           	   tag += '    	<div>'
               tag += '			<a style="color: white;" href="${cpath}/users/viewDetail/' + dto.idx + '">' + dto.nick_name + '</a>'
               tag += '         <div class="recommend_ment">회원님을 위한 추천</div>         '
           	   tag += '		</div>'
           	   tag += '<div class="followBtn" idx=' + dto.idx + '>팔로우</div>'
               tag += '</div>'
               recofri.innerHTML += tag
               
               friend5Cut += 1
            }           
         })
        const followBtnList = document.querySelectorAll('div.followBtn')
// 	   	console.log(followBtnList)
	   	followBtnList.forEach(btn => btn.onclick = followHandler)
      })
      
   }
   
   function followHandler(event) {
	    const idx = event.target.getAttribute('idx')

	    if(event.target.innerHTML == '팔로우') {
	       fetch('${cpath}/follow/' + idx + '/${login.idx}')
	       .then(resp => resp.text())
	       .then(text => {
	          
	          if(text != 0) {
	             event.target.innerText = '팔로잉'
	             event.target.classList.add('unfollow')
	             
	          }
	       })
	    }
	    else if(event.target.innerHTML == '팔로잉') {
	       fetch('${cpath}/unfollow/' + idx + '/${login.idx}')
	       .then(resp => resp.text())
	       .then(text => {
	          
	          if(text != 0) {
	             event.target.innerText = '팔로우'
	             event.target.classList.remove('unfollow')
	             
	          }
	       })
	    }
	    else {
	       // 이거 안해주면 프로필 편집 버튼 눌렀을 때 위에 else if 애들 손봐줘야 됨
	    }
	 }	
</script>


	<!-- 타임라인 게시글 스크롤 이벤트 -->
	<script type="text/javascript">
	const post = document.querySelector('#post')
  	const screen = document.querySelector('.screen')        		
  	async function scrollHandler() {		
// 		console.log('스크롤 핸들러')
  		const offset = +screen.getAttribute('offset')
        const cur = screen.scrollTop + screen.clientHeight
        const flag = (screen.scrollHeight * 0.9 <= cur && cur <= screen.scrollHeight * 1.1) || offset == 0
//         console.log(cur,flag)
        if(flag) {
            await fetch('${cpath }/getPostListScroll/' + offset + '/${login.idx }')
            .then(resp => resp.json())
            .then(async json => {
//        	  		console.log(json)
       	  		for(dto of json) {
  		  			const tag = await makeTag(dto)
       		  		post.innerHTML += tag
               		screen.setAttribute('offset', offset + 3)
       	  		}              
            })
            
            const replyList = document.querySelectorAll('.insta-post-item-reply')
// 		    console.log(replyList)
		    replyList.forEach(e => e.onclick = itemClickHandler)
		    
		    const commentsList = document.querySelectorAll('.comment_count')
// 		    console.log(commentsList)
		    commentsList.forEach(e => e.onclick = itemClickHandler)
		  
		    const left_btn = document.querySelectorAll('.left_btn')
// 		    console.log(left_btn)
		    const right_btn = document.querySelectorAll('.right_btn')
// 		    console.log(right_btn)
		    left_btn.forEach(e => e.onclick = leftBtnHandler)
		    right_btn.forEach(e => e.onclick = rightBtnHandler)
		    
		    const likeList = document.querySelectorAll('.insta-post-item-like-li')
// 		    console.log(likeList)
		    likeList.forEach(e => e.onclick = likeClickHandler)
		    
		    const post_comment = document.querySelectorAll('.post-comment')
// 		    console.log(post_comment)
		    for(content of post_comment) {
		    	const hashTagArr = content.innerText.split(' ').map(e => {
					let ob = {
						original: e,
						front: '',
						middle: '',				
						back: '',
						front_other: '',
						middle_other: '',
						back_other: '',
						front_type: '',
						middle_type: '',
						back_type: ''
					}
					
					firstHandler(ob)
					secondHandler(ob)
					thirdHandler(ob)
					
					ob.link = tagHandler(ob)
					
					return ob
				})			
				
				content.innerHTML = ''
				for(let i = 0; i < hashTagArr.length; i++) {
					content.innerHTML += hashTagArr[i].link
					if(i != hashTagArr.length - 1) {
						content.innerHTML += ' '
					}
				}
		    }
            const userList = document.querySelectorAll('.userSearch')
        	console.log(userList)
        	userList.forEach(e => e.onclick = userSearchHandler)
        }
	}
	
	async function postLikeStatus(post_idx) {
// 		console.log(post_idx)
		const url = cpath + '/post/like/status/' + post_idx + '/' + users_idx		
		
		const response = await fetch(url)
		const data = await response.text()
// 		console.log(data)
		
		return data
	}
	
	function likeClickHandler(event) {		
		let post_like = event.target
		while(post_like.className != 'insta-post-item-like-li') {
			post_like = post_like.parentNode
		}
// 		console.log(post_like)
		const post_idx = post_like.getAttribute('idx')	
		const url = cpath + '/post/like/' + post_idx + '/' + users_idx
// 		console.log(url)
		fetch(url)
		.then(resp => resp.text())
		.then(text => {
// 			console.log(text)
			post_like.innerHTML = ''
			if(text == 0) {					
				post_like.innerHTML = '<svg aria-label="좋아요" class="_ab6-" color="rgb(245, 245, 245)" fill="rgb(245, 245, 245)" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M16.792 3.904A4.989 4.989 0 0 1 21.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 0 1 4.708-5.218 4.21 4.21 0 0 1 3.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 0 1 3.679-1.938m0-2a6.04 6.04 0 0 0-4.797 2.127 6.052 6.052 0 0 0-4.787-2.127A6.985 6.985 0 0 0 .5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 0 0 3.518 3.018 2 2 0 0 0 2.174 0 45.263 45.263 0 0 0 3.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 0 0-6.708-7.218Z"></path></svg>'
				location.reload()			
			}
			else {
				post_like.innerHTML = '<svg aria-label="좋아요 취소" class="_ab6-" color="rgb(255, 48, 64)" fill="rgb(255, 48, 64)" height="24" role="img" viewBox="0 0 48 48" width="24"><path d="M34.6 3.1c-4.5 0-7.9 1.8-10.6 5.6-2.7-3.7-6.1-5.5-10.6-5.5C6 3.1 0 9.6 0 17.6c0 7.3 5.4 12 10.6 16.5.6.5 1.3 1.1 1.9 1.7l2.3 2c4.4 3.9 6.6 5.9 7.6 6.5.5.3 1.1.5 1.6.5s1.1-.2 1.6-.5c1-.6 2.8-2.2 7.8-6.8l2-1.8c.7-.6 1.3-1.2 2-1.7C42.7 29.6 48 25 48 17.6c0-8-6-14.5-13.4-14.5z"></path></svg>'				
				location.reload()				
			}
		})
	}
	
	async function makeTag(dto) {
		let tag = ''
	        tag+= '<div class="insta-post-item">'
	        tag+= '<div class="i-col-0 insta-post-item-top">'
	        tag+= '<div class="img-box">'
	        tag+= '<a href="${cpath}/users/viewDetail/' + dto.USERS_IDX + '">'
	        tag+= '<img src="${cpath}/resources/img/' + dto.USER_IMG + '" alt="">' // dto 이미지 추가해야함
	        tag+= '</a>'
	        tag+= '</div>'
	        tag+= '<div class="id-box">'
	        tag+= '<a href="${cpath}/users/viewDetail/' + dto.USERS_IDX + '">'
	        tag+= '<span class="id">'+ dto.NICK_NAME +'</span>'
	        tag+= '</a>'
	        tag+= '<span class="dot">•</span>'
	        tag+= '<span class="day">' + makeDate(dto.REGIST_DATE) + '</span>'  // 추가해야함 (게시물 올린 후 경과일수)
	        tag+= '</div>'
	        tag+= '</div>'
	        tag+= '<div class="insta-post-item-middle">'
	        tag+= '<div class="img-box">'
	        tag+= '<div class="left_btn prev imt"></div>'
	        tag+= '<div class="images-box" index="0">'
	        const file_name_list = dto.FILE_NAME.split(',')
	        file_name_list.forEach(fileName => {
	      	  tag+= '<div class="image-box">'
	      	  tag+= '<img src="${cpath}/upload/'+ fileName +'" alt="">'
	      	  tag+= '</div>'
	        })                      
	        tag+= '</div>'
	        if(file_name_list.length == 1) {
	      	  tag+= '<div class="right_btn next imt hidden"></div>'
	        }
	        else {
	      	  tag+= '<div class="right_btn next imt"></div>'
	        }                      
	        tag+= '</div>'
	        tag+= '</div>'
	        tag+= '<div class="insta-post-item-btn-box">'
	        tag+= '<ul class="i-col-0 insta-post-item-btn-ul">'
	        tag+= '<li class="insta-post-item-like-li" idx="' + dto.IDX + '">'
	        const onoff = await postLikeStatus(dto.IDX)
// 	        console.log(onoff)
	        if(onoff == 0) {          	                        
	            tag+= '<svg aria-label="좋아요" class="_ab6-" color="#fafafa" fill="#fafafa"'
	            tag+= ' height="24" role="img" viewBox="0 0 24 24" width="24">'
	            tag+= '<path'
	            tag+= ' d="M16.792 3.904A4.989 4.989 0 0 1 21.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 0 1 4.708-5.218 4.21 4.21 0 0 1 3.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 0 1 3.679-1.938m0-2a6.04 6.04 0 0 0-4.797 2.127 6.052 6.052 0 0 0-4.787-2.127A6.985 6.985 0 0 0 .5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 0 0 3.518 3.018 2 2 0 0 0 2.174 0 45.263 45.263 0 0 0 3.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 0 0-6.708-7.218Z">'
	            tag+= '</path>'
	            tag+= '</svg>'	            
	        }
	        else {          	                        
	          	tag+= '<svg aria-label="좋아요 취소" class="_ab6-" color="rgb(255, 48, 64)" fill="rgb(255, 48, 64)" height="24" role="img" viewBox="0 0 48 48" width="24">'
	         	tag+= '<path d="M34.6 3.1c-4.5 0-7.9 1.8-10.6 5.6-2.7-3.7-6.1-5.5-10.6-5.5C6 3.1 0 9.6 0 17.6c0 7.3 5.4 12 10.6 16.5.6.5 1.3 1.1 1.9 1.7l2.3 2c4.4 3.9 6.6 5.9 7.6 6.5.5.3 1.1.5 1.6.5s1.1-.2 1.6-.5c1-.6 2.8-2.2 7.8-6.8l2-1.8c.7-.6 1.3-1.2 2-1.7C42.7 29.6 48 25 48 17.6c0-8-6-14.5-13.4-14.5z">'
	         	tag+= '</path>'
	          	tag+= '</svg>'                
	        }
	        tag+= '</li>'
	        tag+= '<li class="insta-post-item-reply" idx="' + dto.IDX + '">'                      
	        tag+= '<svg aria-label="댓글 달기" class="_ab6-" color="#fafafa" fill="#fafafa"'
	        tag+= ' height="24" role="img" viewBox="0 0 24 24" width="24">'
	        tag+= '<path d="M20.656 17.008a9.993 9.993 0 1 0-3.59 3.615L22 22Z"'
	        tag+= ' fill="none" stroke="currentColor" stroke-linejoin="round"'
	        tag+= ' stroke-width="2"></path>'
	        tag+= '</svg>'                      
	        tag+= '</li>'                	  	        
	        tag+='</ul>'
	        tag+='</div>'
	        tag+='<div class="insta-post-item-comment">'
	        tag+='<p class="good">좋아요 ' + dto.LIKE_COUNT +' 개</p>'
	        tag+='<pre class="post-comment">'+ dto.CONTENT +'</pre>'
	        if(dto.COMMENTS_COUNT != 0) {
	        	tag+='<p class="insta-post-item-reply" idx="' + dto.IDX + '">댓글 ' + dto.COMMENTS_COUNT + '개 모두보기</p>'	
	        }
	        else {
	        	tag+='<p class="insta-post-item-reply" idx="' + dto.IDX + '">댓글 달기 ...</p>'
	        }
	        tag+='</div>'
	        tag+='</div>'
	           
	        return tag
	}
	
	function makeDate(addDate) {
		const newDate = new Date(addDate)
		const yyyy = newDate.getFullYear()
		let mm = newDate.getMonth() + 1
		let dd = newDate.getDate()
		const hour = newDate.getHours()
		const minutes = newDate.getMinutes()
		
		mm = mm < 10 ? '0' + mm : mm
		dd = dd < 10 ? '0' + dd : dd	
				
		const today = new Date()
		const t_yyyy = today.getFullYear()
		let t_mm = today.getMonth() + 1
		let t_dd = today.getDate()
		const t_hour = today.getHours()
		const t_minutes = today.getMinutes()
		
		let str = ''
		
		if(t_yyyy - yyyy == 0) {
			if(t_mm - mm >= 0) {
				if(t_dd - dd == 0) {
					if(t_hour - hour <= 0) {
						if(t_minutes - minutes == 0) {
							str = '1분'
						}
						else if(t_minutes - minutes > 0) {
							str = t_minutes - minutes + '분'
						}
						else {
							str = 60 + t_minutes - minutes + '분'
						}
					}
					else {
						str = (t_hour - hour > 0 ? t_hour - hour : 24 - Math.abs(t_hour - hour)) + '시간'
					}
				}
				else {
					str = (t_dd - dd > 0 ? t_dd - dd : 30 - Math.abs(t_dd - dd)) + '일'
				}
			}
			else {
				str = yyyy + '-' + mm + '-' + dd
			}
		}
		else {
			str = yyyy + '-' + mm + '-' + dd
		}
		
// 		console.log(today.getFullYear() - yyyy)
// 		console.log(today.getMonth() + 1 - mm)
// 		console.log(today.getDate() - dd)
// 		console.log(today.getHours() - hour)
// 		console.log(today.getMinutes() - minutes)

		return str
	}
	
	function firstHandler(ob) {
		const o = ob.original
				
		if(o[0] == '#') {
			ob.front = o.split('#')[1]
			ob.front_type = 'hash'
		}
		else if(o[0] == '@') {
			ob.front = o.split('@')[1]
			ob.front_type = 'user'
		}
		else {
			ob.front = o
			ob.front_type = 'none'
		}
		
		const otherFilter = '!$%^&*()-=+,?'
		const tagFilter = '@#'		
		const size = ob.front.length
		const tmp = ob.front
		
		if(o.length != ob.front.length || ob.front.includes('#') || ob.front.includes('@')) {
			ob.front = ''			
		}
		
		for(let i = 0; i < size; i++) {
// 			console.log(tmp[i].charCodeAt())
			if(o.length != ob.front.length) {
				if(tagFilter.includes(tmp[i])) {
					break
				}
				else if(tmp[i].charCodeAt() == 10) {
					ob.front_other += tmp[i]
					break
				}
				else if(otherFilter.includes(tmp[i]) == false) {					
					ob.front += tmp[i]
				}
				else {
					ob.front_other += tmp[i]
				}
			}
		}
		
		if(ob.front_type == 'hash' || ob.front_type == 'user') {
			ob.middle = o.substr(ob.front.length + ob.front_other.length + 1)
		}
		else {
			ob.middle = o.substr(ob.front.length + ob.front_other.length)
		}		
		
		return ob		
	}
	
	function secondHandler(ob) {
		const flag = ob.front_type == 'hash' || ob.front_type == 'user'		
		const o = flag ? ob.original.substr(ob.front.length + ob.front_other.length + 1) : ob.original.substr(ob.front.length + ob.front_other.length)		
		
		if(o[0] == '#') {
			ob.middle = o.split('#')[1]
			ob.middle_type = 'hash'
		}
		else if(o[0] == '@') {
			ob.middle = o.split('@')[1]
			ob.middle_type = 'user'
		}
		else {
			ob.middle = o
			ob.middle_type = 'none'
		}
		
		const otherFilter = '!$%^&*()-=+,?'
		const tagFilter = '@#'		
		const size = ob.middle.length
		const tmp = ob.middle
		
		if(o.length != ob.middle.length || ob.middle.includes('#') || ob.middle.includes('@')) {
			ob.middle = ''			
		}
		
		for(let i = 0; i < size; i++) {
			if(o.length != ob.middle.length) {
				if(tagFilter.includes(tmp[i])) {
					break
				}
				else if(tmp[i].charCodeAt() == 10) {
					ob.middle_other += tmp[i]
					break
				}
				else if(otherFilter.includes(tmp[i]) == false) {					
					ob.middle += tmp[i]
				}
				else {
					ob.middle_other += tmp[i]
				}
			}
		}
		
		if(ob.middle_type == 'hash' || ob.middle_type == 'user') {
			ob.back = o.substr(ob.middle.length + ob.middle_other.length + 1)
		}
		else {
			ob.back = o.substr(ob.middle.length + ob.middle_other.length)
		}			
		
		return ob
	}
	
	function thirdHandler(ob) {
		const flag1 = ob.front_type == 'hash' || ob.front_type == 'user'
		const flag2 = ob.middle_type == 'hash' || ob.middle_type == 'user'
		const ttmp = flag1 ? ob.original.substr(ob.front.length + ob.front_other.length + 1) : ob.original.substr(ob.front.length + ob.front_other.length)
		const o = flag2 ? ttmp.substr(ob.middle.length + ob.middle_other.length + 1) : ttmp.substr(ob.middle.length + ob.middle_other.length)
		
		if(o[0] == '#') {
			ob.back = o.split('#')[1]
			ob.back_type = 'hash'
		}
		else if(o[0] == '@') {
			ob.back = o.split('@')[1]
			ob.back_type = 'user'
		}
		else {
			ob.back = o
			ob.back_type = 'none'
		}
		
		const otherFilter = '!$%^&*()-=+,?'
		const tagFilter = '@#'		
		const size = ob.back.length
		const tmp = ob.back
		
		if(o.length != ob.back.length || ob.back.includes('#') || ob.back.includes('@')) {
			ob.back = ''			
		}
		
		for(let i = 0; i < size; i++) {
			if(o.length != ob.back.length) {
				if(tagFilter.includes(tmp[i])) {
					break
				}
				else if(tmp[i].charCodeAt() == 10) {
					ob.back_other += tmp[i]
					break
				}
				else if(otherFilter.includes(tmp[i]) == false) {					
					ob.back += tmp[i]
				}
				else {
					ob.back_other += tmp[i]
				}
			}
		}
		
		return ob
	}
	
	function tagHandler(ob) {
		let tag = ''
		if(ob.front_type != '') {
			if(ob.front_type == 'hash') {
				tag += '<a href=' + cpath + '/post/postList/' + ob.front + '>#' + ob.front + '</a>' + ob.front_other
			}
			else if(ob.front_type == 'user') {
				tag += '<a class="userSearch">@' + ob.front + '</a>' + ob.front_other
			}
			else {
				tag += ob.front + ob.front_other
			}
		}
		if(ob.middle_type != '') {
			if(ob.middle_type == 'hash') {
				tag += '<a href=' + cpath + '/post/postList/' + ob.middle + '>#' + ob.middle + '</a>' + ob.middle_other
			}
			else if(ob.middle_type == 'user') {
				tag += '<a class="userSearch">@' + ob.middle + '</a>' + ob.middle_other
			}
			else {
				tag += ob.middle + ob.middle_other
			}
		}
		if(ob.back_type != '') {
			if(ob.back_type == 'hash') {
				tag += '<a href=' + cpath + '/post/postList/' + ob.back + '>#' + ob.back + '</a>' + ob.back_other
			}
			else if(ob.back_type == 'user') {
				tag += '<a class="userSearch">@' + ob.back + '</a>' + ob.back_other
			}
			else {
				tag += ob.back + ob.back_other
			}
		}
		return tag		
	}
	
	function userSearchHandler(event) {
		const nickName = event.target.innerText.replace('@', '')
// 		console.log(nickName)
		const url = cpath + '/users/getUserIDXByNickName/' + nickName
		
		fetch(url)
		.then(resp => resp.text())
		.then(text => {
// 			console.log(text)
			const idx = text
			location.href = cpath + '/users/viewDetail/' + idx
		})
	}
	
screen.onscroll = scrollHandler
			                       	
</script>

	<!-- 모달창 이벤트 -->
	<script>
	const modal = document.getElementById('modal')
	const modal_content = document.querySelector('.modal_content')
	const post_content = document.querySelector('.post_content')
	const modal_overlay = document.getElementById('modal_overlay')	
	const left = document.querySelector('.left')
	const right = document.querySelector('.right')
	const close = document.querySelector('.close')
	
	function itemClickHandler(event) {
		document.querySelector('.image_content .images').setAttribute('index', 0)
		document.querySelector('.image_content .images').style.left = '0px'
		let eventValue = event.target
		while(eventValue.className != 'insta-post-item-reply') {
			eventValue = eventValue.parentNode
		}
// 		console.log(eventValue.parentNode)
		const post_idx = eventValue.getAttribute('idx')
// 		console.log(post_idx)
		const url = cpath + '/post/modalTest/' + post_idx
// 		console.log(size)
		fetch(url)
		.then(resp => resp.json())
		.then(json => {
// 			console.log(json)
			const dto = json
			const imgList = dto.FILE_NAME.split(',')			
			const img_size = imgList.length
// 			console.log(img_size)
			const images = document.querySelector('.images')
			images.innerHTML = ''
			post_content.innerHTML = ''
			imgList.forEach(img => {				
				let imageTag = 	'<div class="image">'
				imageTag += 		'<img src=' + cpath + '/upload/' + img + '>'
				imageTag += 	'</div>'
				
				images.innerHTML += imageTag
			})
			
			let tag = ''
			tag += '<div class="pro_info">'
			tag += '<div class="pro_img">'
			tag += '<a href="' + cpath + '/users/viewDetail/' + dto.USERS_IDX + '">'
			tag += '<img src="' + cpath + '/resources/img/' + dto.USER_IMG +'">'
			tag += '</a>'
			tag += '</div>'
			tag += '<div class="pro_box">'
			tag += '<div class="pro_nic">'
			tag += '<a href="' + cpath + '/users/viewDetail/' + dto.USERS_IDX + '">'+ dto.NICK_NAME + '</a>'
			tag += '</div>'
			if(dto.LOCATION != null && dto.LOCATION != '') {
				tag += '<div class="pro_loc">' + dto.LOCATION + '</div>'				
			}
			tag += '</div>'
			tag += '</div>'
			tag += '<div class="post_items">'
			tag += '<div class="post_pro_box">'
			tag += '<div class="post_pro_img">'
			tag += '<a href="' + cpath + '/users/viewDetail/' + dto.USERS_IDX + '"><img src="' + cpath + '/resources/img/' + dto.USER_IMG +'"></a>'
			tag += '</div>'
			tag += '<div class="post_item">'
			tag += '<div class="post_pro_nic">'
			tag += '<a href="' + cpath + '/users/viewDetail/' + dto.USERS_IDX + '">' + dto.NICK_NAME + '</a>'
			tag += '</div>'
			tag += '<div><pre class="post_data_content">' + dto.CONTENT + '</pre></div>'
			tag += '<div class="post_add_date">' + makeDate(dto.REGIST_DATE) + '</div>'
			tag += '</div>'
			tag += '</div>'
			tag += '<div id="comments" idx="' + dto.IDX + '" user="' + dto.USERS_IDX +'"></div>'
			tag += '</div>'
			
			
			post_content.innerHTML += tag
			modal.style.display = 'block'
			modal_content.style.display = 'flex'			
			modal_overlay.style.display = 'block'
			close.style.display = 'block'

			if(img_size == 1) {
				left.style.display = 'none'
				right.style.display = 'none'
			}
			else {
				left.style.display = 'none'
				right.style.display = 'block'
			}
			
			const post_data_content = document.querySelector('.post_data_content')
// 		    console.log(post_data_content)
		    
		    const hashTagArr = post_data_content.innerText.split(' ').map(e => {
				let ob = {
					original: e,
					front: '',
					middle: '',				
					back: '',
					front_other: '',
					middle_other: '',
					back_other: '',
					front_type: '',
					middle_type: '',
					back_type: ''
				}
				
				firstHandler(ob)
				secondHandler(ob)
				thirdHandler(ob)
				
				ob.link = tagHandler(ob)
				
				return ob
			})			
			
			post_data_content.innerHTML = ''
			for(let i = 0; i < hashTagArr.length; i++) {
				post_data_content.innerHTML += hashTagArr[i].link
				if(i != hashTagArr.length - 1) {
					post_data_content.innerHTML += ' '
				}
			}
			
			commentsHandler()
		})
		
	}	
	
	left.onclick = leftHandler
	right.onclick = rightHandler
	modal_overlay.onclick = closeHandler
	close.onclick = closeHandler	
	
	function leftHandler() {
		const images = document.querySelector('.images')
		const length = +images.querySelectorAll('div.image').length
		const index = +images.getAttribute('index')
// 		console.log(index, length)
		images.style.transitionDuration = '0.5s'
		
		if(index > 0) {
			images.setAttribute('index', index - 1)
			images.style.left = (+images.style.left.replace('px', '') + 700) + 'px' 
		}
		
		if(index >= 0 && index <= length - 1) {
			right.style.display = 'block'
		}
		
		if(index <= 1) {
			left.style.display = 'none'
		}				
	}
	
	function rightHandler() {
		const images = document.querySelector('.images')
		const length = +images.querySelectorAll('div.image').length
		const index = +images.getAttribute('index')
// 		console.log(index, length)
		images.style.transitionDuration = '0.5s'
		
		if(index >= 0 && index <= length - 1) {
			left.style.display = 'block'
		}
	
		if(index < length - 1) {
			images.setAttribute('index', index + 1)
			images.style.left = (+images.style.left.replace('px', '') - 700) + 'px' 
		}
		
		if(index + 1 >= length - 1) {
			right.style.display = 'none'
		}
				
	}
	
	function leftBtnHandler(event) {
// 		console.log(event.target.parentNode.parentNode)
		const eventValue = event.target.parentNode.parentNode
		const left_btn = eventValue.querySelector('.left_btn')
		const right_btn = eventValue.querySelector('.right_btn')
		const imagesBox = eventValue.querySelector('.images-box')
		const length = +imagesBox.querySelectorAll('div.image-box').length
		const index = +imagesBox.getAttribute('index')
// 		console.log(index, length)
		imagesBox.style.transitionDuration = '0.5s'
		
		if(index > 0) {
			imagesBox.setAttribute('index', index - 1)
			imagesBox.style.left = (+imagesBox.style.left.replace('px', '') + 470) + 'px' 
		}
		
		if(index >= 0 && index <= length - 1) {
			right_btn.style.display = 'block'
		}
		
		if(index <= 1) {
			left_btn.style.display = 'none'
		}				
	}
	
	function rightBtnHandler(event) {
// 		console.log(event.target.parentNode.parentNode)
		const eventValue = event.target.parentNode.parentNode
		const left_btn = eventValue.querySelector('.left_btn')
		const right_btn = eventValue.querySelector('.right_btn')
		const imagesBox = eventValue.querySelector('.images-box')
		const length = +imagesBox.querySelectorAll('div.image-box').length
		const index = +imagesBox.getAttribute('index')
// 		console.log(index, length)
		imagesBox.style.transitionDuration = '0.5s'
		
		if(index >= 0 && index <= length - 1) {
			left_btn.style.display = 'block'
		}
	
		if(index < length - 1) {
			imagesBox.setAttribute('index', index + 1)
			imagesBox.style.left = (+imagesBox.style.left.replace('px', '') - 470) + 'px' 
		}
		
		if(index + 1 >= length - 1) {
			right_btn.style.display = 'none'
		}
				
	}
	
	function closeHandler() {
		document.getElementById('modal').style.display = 'none'		
	}
	
	async function commentsHandler() {
		const comments = document.getElementById('comments')
		const post_idx = comments.getAttribute('idx')		
// 		console.log(comments)
		comments.innerHTML = ''
		const url = cpath + '/getComments/' + post_idx + '/' + users_idx
			
		await fetch(url)
		.then(resp => resp.json())
		.then(json => {
// 			console.log(json)
			
			const arr = json
			arr.forEach(dto => {
// 				console.log(dto)
				const html = htmlFromjson(dto)
				comments.innerHTML += html
				
				
			})
			
			
			const comment_content = document.querySelectorAll('.comment_content')
			console.log(comment_content)
			
			for(content of comment_content) {
		    	const hashTagArr = content.innerText.split(' ').map(e => {
					let ob = {
						original: e,
						front: '',
						middle: '',				
						back: '',
						front_other: '',
						middle_other: '',
						back_other: '',
						front_type: '',
						middle_type: '',
						back_type: ''
					}
					
					firstHandler(ob)
					secondHandler(ob)
					thirdHandler(ob)
					
					ob.link = tagHandler(ob)
					
					return ob
				})			
				
				content.innerHTML = ''
				for(let i = 0; i < hashTagArr.length; i++) {
					content.innerHTML += hashTagArr[i].link
					if(i != hashTagArr.length - 1) {
						content.innerHTML += ' '
					}
				}
		    }
			
			if(document.querySelector('.bottom_item') == null) {
				makeBottom()
			}
			else {
				const comment_like = document.querySelectorAll('.comment_like')
//	 			console.log(comment_like)
				comment_like.forEach(e => e.onclick = commentLikeHandler)
				
				const bottom_like = document.querySelector('.bottom_like')
//	 			console.log(bottom_like)
				bottom_like.onclick = bottomLikeHandler
				
				const bottom_reply = document.querySelector('.bottom_reply')
				bottom_reply.onclick = bottomReplyHandler
				
				const txt = document.querySelector('.bottom_input > textarea')
				txt.onkeyup = txtKeyUpHandler
				
				const recomment = document.querySelectorAll('.recomment')
				console.log(recomment)			
				recomment.forEach(e => e.onclick = recommentHandler)
				
				const send = document.querySelector('.bottom_send')
				send.onclick = sendClickHandler		
				
				const remove = document.querySelectorAll('.remove')
				console.log(remove)
				remove.forEach(e => e.onclick = removeHandler)
				
				const comment_count = document.querySelectorAll('.comment_count')
				console.log(comment_count)
				comment_count.forEach(e => e.onclick = commentCountHandler)
			}
			
			
		})	// end of fetch
		
		
		
	}
	
	function makeBottom() {		
		const post_content = document.querySelector('.post_content')
// 		console.log(post_content)
		const post_idx = document.getElementById('comments').getAttribute('idx')
		
		const url = cpath + '/post/modalTest/' + post_idx
		
		fetch(url)
		.then(resp => resp.json())
		.then(json => {
			const dto = json
			let tag = ''
			tag += '<div class="bottom_item" idx="' + dto.IDX + '">'
			tag += '<div class="bottom_item_top">'		 
			tag += '<div class="bottom_like">'
			if(dto.LIKE_COUNT != 0) {
				tag += '<svg aria-label="좋아요 취소" class="_ab6-" color="rgb(255, 48, 64)" fill="rgb(255, 48, 64)" height="24" role="img" viewBox="0 0 48 48" width="24"><path d="M34.6 3.1c-4.5 0-7.9 1.8-10.6 5.6-2.7-3.7-6.1-5.5-10.6-5.5C6 3.1 0 9.6 0 17.6c0 7.3 5.4 12 10.6 16.5.6.5 1.3 1.1 1.9 1.7l2.3 2c4.4 3.9 6.6 5.9 7.6 6.5.5.3 1.1.5 1.6.5s1.1-.2 1.6-.5c1-.6 2.8-2.2 7.8-6.8l2-1.8c.7-.6 1.3-1.2 2-1.7C42.7 29.6 48 25 48 17.6c0-8-6-14.5-13.4-14.5z"></path></svg>'
			}
			else {
				tag += '<svg aria-label="좋아요" class="_ab6-" color="rgb(245, 245, 245)" fill="rgb(245, 245, 245)" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M16.792 3.904A4.989 4.989 0 0 1 21.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 0 1 4.708-5.218 4.21 4.21 0 0 1 3.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 0 1 3.679-1.938m0-2a6.04 6.04 0 0 0-4.797 2.127 6.052 6.052 0 0 0-4.787-2.127A6.985 6.985 0 0 0 .5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 0 0 3.518 3.018 2 2 0 0 0 2.174 0 45.263 45.263 0 0 0 3.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 0 0-6.708-7.218Z"></path></svg>'	
			}		
			tag += '</div>'
			tag += '<div class="bottom_reply">'
			tag += '<svg aria-label="댓글 달기" class="_ab6-" color="rgb(245, 245, 245)" fill="rgb(245, 245, 245)" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M20.656 17.008a9.993 9.993 0 1 0-3.59 3.615L22 22Z" fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="2"></path></svg>'
			tag += '</div>'
			tag += '</div>'
			if(dto.LIKE_COUNT != 0) {
				tag += '<div class="bottom_like_count">좋아요 ' + dto.LIKE_COUNT +'개</div>'	
			}
			else {
				tag += '<div class="bottom_like_count">가장 먼저 <strong>좋아요</strong>를 눌러보세요</div>'
			}
			tag += '<div class="bottom_date">' + makeDate(dto.REGIST_DATE) + '</div>'
			tag += '</div>'
			tag += '<div class="bottom_input" idx="' + dto.IDX + '">'
			tag += '<textarea placeholder="댓글 달기 ..."></textarea>'
			tag += '<div class="bottom_send">게시</div>'
			tag += '</div>'

			post_content.innerHTML += tag
			
			const comment_like = document.querySelectorAll('.comment_like')
// 			console.log(comment_like)
			comment_like.forEach(e => e.onclick = commentLikeHandler)
			
			const bottom_like = document.querySelector('.bottom_like')
// 			console.log(bottom_like)
			bottom_like.onclick = bottomLikeHandler
			
			const bottom_reply = document.querySelector('.bottom_reply')
			bottom_reply.onclick = bottomReplyHandler
			
			const txt = document.querySelector('.bottom_input > textarea')
			txt.onkeyup = txtKeyUpHandler
			
			const recomment = document.querySelectorAll('.recomment')
			console.log(recomment)			
			recomment.forEach(e => e.onclick = recommentHandler)
			
			const send = document.querySelector('.bottom_send')
			send.onclick = sendClickHandler		
			
			const remove = document.querySelectorAll('.remove')
			console.log(remove)
			remove.forEach(e => e.onclick = removeHandler)
			
			const comment_count = document.querySelectorAll('.comment_count')
			console.log(comment_count)
			comment_count.forEach(e => e.onclick = commentCountHandler)
			
		})		
		
	}
	
	function bottomLikeHandler(event) {
		let eventValue = event.target
		while(eventValue.className != 'bottom_item') {
			eventValue = eventValue.parentNode
		}
		const bottom_like = document.querySelector('.bottom_like')
		const post_idx = eventValue.getAttribute('idx')
// 		console.log(post_idx)
		const url = cpath + '/post/like/' + post_idx + '/' + users_idx
// 		console.log(url)
		fetch(url)
		.then(resp => resp.text())
		.then(text => {
// 			console.log(text)
			bottom_like.innerHTML = ''
			if(text == 0) {					
				bottom_like.innerHTML = '<svg aria-label="좋아요" class="_ab6-" color="rgb(245, 245, 245)" fill="rgb(245, 245, 245)" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M16.792 3.904A4.989 4.989 0 0 1 21.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 0 1 4.708-5.218 4.21 4.21 0 0 1 3.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 0 1 3.679-1.938m0-2a6.04 6.04 0 0 0-4.797 2.127 6.052 6.052 0 0 0-4.787-2.127A6.985 6.985 0 0 0 .5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 0 0 3.518 3.018 2 2 0 0 0 2.174 0 45.263 45.263 0 0 0 3.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 0 0-6.708-7.218Z"></path></svg>'				
			}
			else {
				bottom_like.innerHTML = '<svg aria-label="좋아요 취소" class="_ab6-" color="rgb(255, 48, 64)" fill="rgb(255, 48, 64)" height="24" role="img" viewBox="0 0 48 48" width="24"><path d="M34.6 3.1c-4.5 0-7.9 1.8-10.6 5.6-2.7-3.7-6.1-5.5-10.6-5.5C6 3.1 0 9.6 0 17.6c0 7.3 5.4 12 10.6 16.5.6.5 1.3 1.1 1.9 1.7l2.3 2c4.4 3.9 6.6 5.9 7.6 6.5.5.3 1.1.5 1.6.5s1.1-.2 1.6-.5c1-.6 2.8-2.2 7.8-6.8l2-1.8c.7-.6 1.3-1.2 2-1.7C42.7 29.6 48 25 48 17.6c0-8-6-14.5-13.4-14.5z"></path></svg>'							
			}
		})
	}
	
	function bottomReplyHandler() {
// 		console.log(document.querySelector('.bottom_input > textarea'))
		document.querySelector('.bottom_input > textarea').focus()
	}
	
	function txtKeyUpHandler(event) {
		const bottom_input = document.querySelector('.bottom_input')
		const txt = document.querySelector('.bottom_input > textarea')
		const bottom_send = document.querySelector('.bottom_send')
		if(txt.value != '') {
			bottom_send.style.color = '#0095F6'
		}
		else {
			bottom_send.style.color = ''
			bottom_input.removeAttribute('parent_idx')
			bottom_input.removeAttribute('depth')
			bottom_input.removeAttribute('nick_name')
		}
	}
	
	function commentLikeHandler(event) {
		let eventValue = event.target		
		while(eventValue.className != 'comment') {
			eventValue = eventValue.parentNode
		}		
		const post_idx = eventValue.parentNode.getAttribute('idx')
		const comment_idx = eventValue.getAttribute('idx')
// 		console.log(post_idx, comment_idx)
		
		const url = cpath + '/comment/like/' + post_idx + '/' + comment_idx + '/' + users_idx
		fetch(url)
		.then(resp => resp.text())
		.then(text => {
// 			console.log(text)
			const comment_like = eventValue.querySelector('.comment_item').querySelector('.comment_item_top').querySelector('.comment_like')
			comment_like.innerHTML = ''
			if(text == 1) {
				comment_like.innerHTML = '<svg aria-label="좋아요 취소" class="_ab6-" color="rgb(255, 48, 64)" fill="rgb(255, 48, 64)" height="12" role="img" viewBox="0 0 48 48" width="12"><path d="M34.6 3.1c-4.5 0-7.9 1.8-10.6 5.6-2.7-3.7-6.1-5.5-10.6-5.5C6 3.1 0 9.6 0 17.6c0 7.3 5.4 12 10.6 16.5.6.5 1.3 1.1 1.9 1.7l2.3 2c4.4 3.9 6.6 5.9 7.6 6.5.5.3 1.1.5 1.6.5s1.1-.2 1.6-.5c1-.6 2.8-2.2 7.8-6.8l2-1.8c.7-.6 1.3-1.2 2-1.7C42.7 29.6 48 25 48 17.6c0-8-6-14.5-13.4-14.5z"></path></svg>'
			}
			else {
				comment_like.innerHTML = '<svg aria-label="좋아요" class="_ab6-" color="rgb(245, 245, 245)" fill="rgb(245, 245, 245)" height="12" role="img" viewBox="0 0 24 24" width="12"><path d="M16.792 3.904A4.989 4.989 0 0 1 21.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 0 1 4.708-5.218 4.21 4.21 0 0 1 3.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 0 1 3.679-1.938m0-2a6.04 6.04 0 0 0-4.797 2.127 6.052 6.052 0 0 0-4.787-2.127A6.985 6.985 0 0 0 .5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 0 0 3.518 3.018 2 2 0 0 0 2.174 0 45.263 45.263 0 0 0 3.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 0 0-6.708-7.218Z"></path></svg>'
			}
		})
	}
	
	function sendClickHandler(event) {
		const bottom_input = document.querySelector('.bottom_input')
		const eventValue = event.target.parentNode
		const post_idx = eventValue.getAttribute('idx')
		const parent_idx = eventValue.getAttribute('parent_idx')
		const depth = +eventValue.getAttribute('depth')
		const nick_name = eventValue.getAttribute('nick_name')
		let content = event.target.parentNode.querySelector('textarea')
		console.log(post_idx, parent_idx, depth, nick_name, content.value)
		
		if(nick_name != null) {
			const flag = content.value.split('@' + nick_name)[1][0] == ' '
			if(flag) {
				content.value = content.value.split('@' + nick_name)[1].slice(1)
			}
			else {
				content.value = content.value.split('@' + nick_name)[1]
			}
		}
// 		console.log(content.value)
		
		let ob = {}
		if(parent_idx != null && depth != null) {
			ob = {
				post_idx: post_idx,
				users_idx: users_idx,
				parent_idx: parent_idx,
				depth: depth + 1,
				content: content.value
			}
		}
		else {
			ob = {
				post_idx: post_idx,
				users_idx: users_idx,
				content: content.value
			}
		}
		
		const url = cpath + '/addComments'
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		}
		
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
// 			console.log(text)
			if(text == 1) {
				const bottom_input = document.querySelector('.bottom_input')
				bottom_input.removeAttribute('parent_idx')
				bottom_input.removeAttribute('depth')
				bottom_input.removeAttribute('nick_name')
				content.value = ''
				commentsHandler()
			}
		})
	}
	
	function recommentHandler(event) {
		const bottom_input = document.querySelector('.bottom_input')
		const textarea = document.querySelector('.bottom_input > textarea')
		let eventValue = event.target
		while(eventValue.className != 'comment_item') {
			eventValue = eventValue.parentNode
		}
		const parent_idx = eventValue.parentNode.parentNode.getAttribute('idx')
		const depth = eventValue.parentNode.parentNode.getAttribute('comment_depth')
		console.log(parent_idx, +depth + 1)
		const nick_name = eventValue.querySelector('.comment_item_top > .comment_nic > a').innerText
		console.log(nick_name)
		textarea.value = '@' + nick_name + ' '
		
		bottom_input.setAttribute('parent_idx', parent_idx)
		bottom_input.setAttribute('depth', depth)
		bottom_input.setAttribute('nick_name', nick_name)
	}
	
	function removeHandler(event) {		
		let eventValue = event.target
		while(eventValue.className != 'comment') {
			eventValue = eventValue.parentNode
		}
		const comments_idx = eventValue.getAttribute('idx')
// 		console.log(comments_idx)
		if(confirm('정말 댓글을 삭제하시겠습니까?')) {
			const url = cpath + '/removeComments/' + comments_idx
			
			fetch(url)
			.then(resp => resp.text())
			.then(text => {
				if(text == 1) {
					commentsHandler()
				}
			})
		}
	}
	
	function commentCountHandler(event) {
		let eventValue = event.target
		const count = event.target.getAttribute('count')
		while(eventValue.className != 'comment') {
			eventValue = eventValue.parentNode
		}
		console.log(eventValue)
		const comment_idx = eventValue.getAttribute('idx')
		
		const commentList = document.querySelectorAll('.comment')
		console.log(commentList)
		
		if(event.target.getAttribute('onoff') == 0) {
			event.target.innerText = '─── \u00A0\u00A0\u00A0\u00A0\u00A0\u00A0답글 숨기기'
			commentList.forEach(comment => {
				const parent_idx = comment.getAttribute('parent_idx')
				if(parent_idx == comment_idx) {
					comment.classList.remove('hidden')
				}
			})
			event.target.setAttribute('onoff', 1)
		}
		else {
			event.target.innerText = '─── \u00A0\u00A0\u00A0\u00A0\u00A0\u00A0답글 보기(' + count + '개)'
			commentList.forEach(comment => {
				const parent_idx = comment.getAttribute('parent_idx')
				if(parent_idx == comment_idx) {
					comment.classList.add('hidden')
				}
			})
			event.target.setAttribute('onoff', 0)
		}
		
		
	}
</script>



</body>
</html>