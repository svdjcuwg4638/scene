<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<style>
.items {
	display: flex;
	flex-wrap: wrap;
	margin: 0 -10px;
}

.item {
	width: 350px;
	height: 350px;
	margin: 14px;
	position: relative;
}

.list>.items>.item img {
	width: 350px;
	height: 350px;
	object-fit: fill;
}

.list>.items {
	display: flex;
	flex-wrap: wrap;
	margin: auto;
}

.list {
	width: 1200px;
}

.main_wrap {
	position: absolute;
	justify-content: end;
	width: 80%;
	display: flex;
	flex-flow: column;
	right: -100px;
}

.all_wrap {
	margin: 0;
	display: flex;
	justify-content: end;
	background-color: #000;
	position: relative;
	top: 0;
	width: 100%;
	height: 100vh;
	overflow-y: scroll;
	overflow-x: hidden;
}

html {
	overflow: hidden;
}

.hidden {
	display: none;
	visibility: hidden;
}

/* 포스트 호버시 나오는 창 start */
.post_like_commend_background {
	background-color: #000;
	width: 100%;
	height: 100%;
	position: absolute;
}

.post_like_commend {
	position: absolute;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	top: 0;
}

.post_like_commend * {
	color: #fff;
}

.post_like_commend img {
	width: 19px;
	height: 19px;
	border-radius: 13px;
}

.post_like_commend_like {
	display: flex;
	margin-right: 10px;
}

.like {
	background-repeat: no-repeat;
	background-position: -340px -333px;
	height: 19px;
	width: 19px;
	margin: 0px 5px;
}

.post_like_commend_commend {
	display: flex;
}

.commend {
	background-repeat: no-repeat;
	background-position: -382px -333px;
	height: 19px;
	width: 19px;
	margin: 0px 5px;
}

.post_like_commend_wrap {
	position: absolute;
	display: flex;
}

.post_like_commend_wrap div {
	margin: 0px 30px;
}

.post_like_commend_background {
	width: 100%;
	height: 100%;
	background-color: #000;
	opacity: 0.5;
}

.post_like_commend_hidden {
	display: none;
}

.item:hover>div:nth-child(2) {
	display: flex;
	cursor: pointer;
}
/* 포스트 호버시 나오는 창 end */

/* 모달 페이지 css start */
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

.prevBtn {
	width: 32px;
	height: 32px;
	position: absolute;
	top: 450px;
	left: 20px;
	display: none;
	background: white;
	border-radius: 50%;
	box-shadow: 0 4px 12px rgb(0 0 0/ 15%);
	cursor: pointer;
	opacity: 1;
	transition-duration: .2s;
	transition-property: opacity;
	z-index: 5;
}

.prevBtn .prevBtn_btn {
	align-items: center;
	background: transparent;
	border: none;
	cursor: pointer;
	display: flex;
	justify-content: center;
	padding: 8px;
}

.prevBtn .prevBtn_btn .prevBtn_imt {
	align-items: center;
	display: flex;
	justify-content: center;
	transform: rotate(270deg);
}

.nextBtn {
	width: 32px;
	height: 32px;
	position: absolute;
	top: 450px;
	right: 50px;
	display: none;
	background: white;
	border-radius: 50%;
	box-shadow: 0 4px 12px rgb(0 0 0/ 15%);
	cursor: pointer;
	opacity: 1;
	transition-duration: .2s;
	transition-property: opacity;
	z-index: 5;
}

.nextBtn .nextBtn_btn {
	align-items: center;
	background: transparent;
	border: none;
	cursor: pointer;
	display: flex;
	justify-content: center;
	padding: 8px;
}

.nextBtn .nextBtn_btn .nextBtn_imt {
	align-items: center;
	display: flex;
	justify-content: center;
	transform: rotate(90deg);
}

.left {
	position: absolute;
	top: 50%;
	left: 0px;
	display: none;
	text-align: center;
	border-radius: 10px;
	z-index: 3;
}

.right {
	position: absolute;
	top: 50%;
	right: 0px;
	text-align: center;
	border-radius: 10px;
	z-index: 3;
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

.close {
	display: none;
	position: absolute;
	right: 50px;
	top: 30px;
	cursor: pointer;
	z-index: 5;
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
/* 모달 페이지 css end */
</style>
<script>
	const cpath = '${cpath}'
	const users_idx = '${login.idx}'
</script>
<div class="all_wrap" offset="0">
	<div class="main_wrap">
		<div class="list">
			<div class="items"></div>
		</div>
		<!-- foot -->
		<!-- 		<div class="foot"> -->
		<!-- 			<div> -->
		<!-- 	            <a href=""><span>소개</span></a><span>•</span> -->
		<!-- 	            <a href=""><span>도움말</span></a><span>•</span> -->
		<!-- 	            <a href=""><span>홍보 센터</span></a><span>•</span> -->
		<!-- 	            <a href=""><span>API</span></a><span>•</span> -->
		<!-- 	            <a href=""><span>채용 정보</span></a><span>•</span> -->
		<!-- 	            <a href=""><span>개인정보처리방침</span></a><span>•</span> -->
		<!-- 	            <a href=""><span>약관</span></a><span>•</span> -->
		<!-- 	            <a href=""><span>위치</span></a><span>•</span> -->
		<!-- 	            <a href=""><span>언어</span></a> -->
		<!-- 	        </div> -->
		<!-- 	        <div> -->
		<!-- 	            © 2023 INSTAGRAM FROM META -->
		<!-- 	        </div> -->
		<!--     	</div> -->
		<!-- foot end-->
	</div>
</div>

<div id="modal">
	<div class="prevBtn">
		<button class="prevBtn_btn">
			<div class="prevBtn_imt">
				<svg aria-label="돌아가기" class="_ab6-" color="rgb(0, 0, 0)"
					fill="rgb(0, 0, 0)" height="16" role="img" viewBox="0 0 24 24"
					width="16">
					<path
						d="M21 17.502a.997.997 0 0 1-.707-.293L12 8.913l-8.293 8.296a1 1 0 1 1-1.414-1.414l9-9.004a1.03 1.03 0 0 1 1.414 0l9 9.004A1 1 0 0 1 21 17.502Z"></path></svg>
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
				<svg aria-label="다음" class="_ab6-" color="rgb(0, 0, 0)"
					fill="rgb(0, 0, 0)" height="16" role="img" viewBox="0 0 24 24"
					width="16">
					<path
						d="M21 17.502a.997.997 0 0 1-.707-.293L12 8.913l-8.293 8.296a1 1 0 1 1-1.414-1.414l9-9.004a1.03 1.03 0 0 1 1.414 0l9 9.004A1 1 0 0 1 21 17.502Z"></path></svg>
			</div>
		</button>
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
<!-- 스크롤 -->
<script>
	const items = document.querySelector('.items')
	const all_wrap = document.querySelector('.all_wrap')
	let index = 0
	function scrollHandler() {		
		const offset = +all_wrap.getAttribute('offset')
		const cur = all_wrap.scrollTop + all_wrap.clientHeight
		console.log(all_wrap.scrollTop, all_wrap.clientHeight)
		const flag = (all_wrap.scrollHeight * 0.97 <= cur && cur <= all_wrap.scrollHeight * 1.03) || offset == 0
		console.log(cur, flag)
		if(flag) {
			fetch('${cpath}/explore/' + offset)
			.then(resp => resp.json())
			.then(json => {
				json.forEach(dto => {
					let tag = ''
	            	tag += '<div class="item" idx="' + dto.POST_IDX + '" index="' + index++ + '">'
	                tag += '	<img src="${cpath}/upload/' + dto.FILE_NAME + '">'           
	           	    tag += '    <div class="post_like_commend post_like_commend_hidden">'
	      	        tag += '        <div class="post_like_commend_background"></div>'
	      	        tag += '        <div class="post_like_commend_wrap">'
	      	        tag += '            <div class="post_like_commend_like">'
	          	    tag += '				<span class="like imt"></span>'
//	       	        tag += '                <img src="https://creazilla-store.fra1.digitaloceanspaces.com/emojis/54157/white-heart-emoji-clipart-xl.png" style="width: 19; height: 19px;">'				
	      	        tag += '                <span>'+ dto.POSTLIKECOUNT +'</span>'

	      	        tag += '            </div>'
	      	        tag += '            <div class="post_like_commend_commend">'
	      	        tag += '				<span class="commend imt"></span>'
//	       	        tag += '                <img src="https://e7.pngegg.com/pngimages/588/555/png-clipart-speech-balloon-speechbubble-comics-angle-thumbnail.png">'
	      	        tag += '                <span>'+ dto.POSTCOMMENTCOUNT +'</span>'
	      	        tag += '            </div>'
	      	        tag += '        </div>'
	      	        tag += '    </div>'
	      	        tag += '</div>'
					items.innerHTML += tag
					all_wrap.setAttribute('offset', offset + 12)
				})
				
				const itemList = document.querySelectorAll('.item')
				console.log(itemList)
				itemList.forEach(e => e.onclick = itemClickHandler)
			})
		}
	}	
	
	window.onload = scrollHandler
	all_wrap.onscroll = scrollHandler
	
</script>

<!-- 모달창 -->
<script>
	const modal = document.getElementById('modal')
	const modal_content = document.querySelector('.modal_content')
	const post_content = document.querySelector('.post_content')
	const modal_overlay = document.getElementById('modal_overlay')
	const prevBtn = document.querySelector('.prevBtn')
	const nextBtn = document.querySelector('.nextBtn')
	const left = document.querySelector('.left')
	const right = document.querySelector('.right')
	const close = document.querySelector('.close')	
	
	function itemClickHandler(event) {
		document.querySelector('.image_content .images').setAttribute('index', 0)
		document.querySelector('.image_content .images').style.left = '0px'
		let eventValue = event.target
		while(eventValue.className != 'item') {
			eventValue = eventValue.parentNode
		}
	//		console.log(eventValue)
		const size = document.querySelectorAll('.item').length
		console.log(size)
		const post_idx = eventValue.getAttribute('idx')
	//		console.log(post_idx)
		const index = eventValue.getAttribute('index')
		post_content.setAttribute('index', index)
		const url = cpath + '/post/modalTest/' + post_idx
	//		console.log(size)
		fetch(url)
		.then(resp => resp.json())
		.then(json => {
	//			console.log(json)
			const dto = json
			const imgList = dto.FILE_NAME.split(',')			
			const img_size = imgList.length
			console.log(img_size)
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
				
			if(index != 0) prevBtn.style.display = 'block'
			if(index != size - 1) nextBtn.style.display = 'block'
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
	
	nextBtn.onclick = nextClickHandler
	prevBtn.onclick = prevClickHandler
	left.onclick = leftHandler
	right.onclick = rightHandler
	modal_overlay.onclick = closeHandler
	close.onclick = closeHandler
	
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
				
				const userList = document.querySelectorAll('.userSearch')
        		console.log(userList)
        		userList.forEach(e => e.onclick = userSearchHandler)
			}			
			
		})	// end of fetch	
		
	}
	
	function nextClickHandler(event) {		
		const offset = +post_content.getAttribute('index') + 1
// 		console.log(offset)
		const size = document.querySelectorAll('.item').length
		const url = cpath + '/getPostDetailOne/' + offset
// 		console.log(url)
		
		fetch(url)
		.then(resp => resp.json())
		.then(json => {
// 			console.log(json)
			const dto = json
			const imgList = dto.FILE_NAME.split(',')			
			const img_size = imgList.length
			console.log(img_size)			
			post_content.innerHTML = ''			
			const images = document.querySelector('.images')
			images.setAttribute('index', 0)
			images.style.left = '0px'
			images.style.transitionDuration = '0s'
			images.innerHTML = ''
			
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
			post_content.setAttribute('index', offset)
			
			if(offset > 0) {
				prevBtn.style.display = 'block'
			}
			else {
				prevBtn.style.display = 'none'
			}
			if(offset >= 0 && offset < size - 1) {
				nextBtn.style.display = 'block'
			}
			else {
				nextBtn.style.display = 'none'
			}
				
			if(img_size <= 1) {
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
	
	function prevClickHandler(event) {		
		const offset = +post_content.getAttribute('index') - 1
// 		console.log(offset)
		const size = document.querySelectorAll('.item').length
		const url = cpath + '/getPostDetailOne/' + offset
// 		console.log(url)
		
		fetch(url)
		.then(resp => resp.json())
		.then(json => {
// 			console.log(json)
			const dto = json
			const imgList = dto.FILE_NAME.split(',')			
			const img_size = imgList.length
			console.log(img_size)			
			post_content.innerHTML = ''			
			const images = document.querySelector('.images')
			images.setAttribute('index', 0)
			images.style.left = '0px'
			images.style.transitionDuration = '0s'
			images.innerHTML = ''
			
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
			post_content.setAttribute('index', offset)
			
			if(offset > 0) {
				prevBtn.style.display = 'block'
			}
			else {
				prevBtn.style.display = 'none'
			}
			if(offset >= 0 && offset < size - 1) {
				nextBtn.style.display = 'block'
			}
			else {
				nextBtn.style.display = 'none'
			}
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
	
	function closeHandler() {
		document.getElementById('modal').style.display = 'none'		
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
			
			const userList = document.querySelectorAll('.userSearch')
        	console.log(userList)
        	userList.forEach(e => e.onclick = userSearchHandler)
			
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
</script>

</body>
</html>