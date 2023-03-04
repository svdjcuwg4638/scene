<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v4.0.2/css/line.css" />
<style type="text/css">
/*사이드바 start*/
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	word-break: keep-all;
	color: #fff;
}

html, body {
	max-width: 100%;
	min-height: 100%;
}

html {
	overflow-x: hidden;
	-webkit-text-size-adjust: none;
	background-color: #000;
}

body {
	-webkit-print-color-adjust: exact;
	background: #000;
	font-family: 'Jost', 'Noto Sans KR', sans-serif;
	font-style: normal;
	font-size: 16px;
	font-weight: 300;
	color: #333;
	line-height: 1.5;
	letter-spacing: -0.5px;
}

ul, li, dl, dt, dd {
	margin: 0;
	padding: 0;
	list-style: none
}

a {
	color: #333;
	text-decoration: none;
}

img {
	border: 0;
	font-size: 0;
	max-width: 100%;
}

h1, h2, h3, h4, h5, h6 {
	font-size: 1em;
	font-family: 'Jost', 'Noto Sans KR', sans-serif;
}

textarea, select {
	font-family: 'Jost', 'Noto Sans KR', sans-serif;
	font-size: 1em
}

input, button {
	margin: 0;
	padding: 0;
	font-family: 'Jost', 'Noto Sans KR', sans-serif;
	font-size: 1em
}

input[type="submit"], button {
	cursor: pointer
}

table, tr, td {
	border-collapse: collapse;
}

p {
	word-break: keep-all;
}

input {
	border-radius: 0;
}

button {
	color: black;
}

body {
	margin: 0;
	font-family: BlinkMacSystemFont;
	position: relative;
}

textarea::-webkit-scrollbar {
	display: none;
}

.all_wrap {
	display: flex;
	justify-content: center;
	background-color: #000;
	margin-left: 100px;
	margin-bottom: 110px;
}

.main_wrap {
	width: 100%;
	display: flex;
	justify-content: center;
	color: white;
	padding: 30px 0 30px 0;
}

.sidebar {
	position: fixed;
	top: 0;
	left: 0;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	width: 250px;
	height: 100%;
	padding: 40px 10px 30px 10px;
	background: #000;
	border-right: 1px solid rgb(38, 38, 38);
	transition: 0.3s;
	z-index: 3;
}

.sidebar-header {
	width: 100%;
	margin-bottom: 6px;
}

.logo-icon {
	display: none;
	font-size: 28px;
	height: 35px;
	width: 51px;
	text-align: center;
	margin-bottom: 30px;
}

.logo-img {
	margin-bottom: 20px;
	margin-left: 14px;
	height: 47px;
}

.sidebar button {
	height: 60px;
	background: transparent;
	border: 0;
	padding: 0;
	font-family: inherit;
	cursor: pointer;
}

.sidebar button>span {
	display: flex;
	align-items: center;
	gap: 12px;
	height: 48px;
	padding: 0 12px;
	border-radius: 24px;
	line-height: 1;
}

.sidebar button:hover>span {
	background: #0f0f0f;
}

.sidebar button:hover>span :is (i, img ) {
	scale: 1.05;
}

.sidebar button>span>span {
	transition: 0.3s;
}

@media ( width <760px) {
	.sidebar {
		display: none;
	}
}

@media ( width < 1280px) {
	.logo-img {
		display: none;
	}
	div.main {
		margin-left: 70px;
	}
	.logo-icon {
		display: block;
	}
	.sidebar {
		width: 72px;
	}
	.sidebar button>span {
		width: 50px;
	}
	.sidebar button>span>span {
		opacity: 0;
		visibility: hidden;
	}
}

.sidebar button i {
	position: relative;
	font-size: 28px;
	transition: 0.2s;
}

.sidebar button img {
	width: 28px;
	height: 28px;
	transition: 0.2s;
	border-radius: 30px;
}

.sidebar button i>span {
	display: grid;
	place-items: center;
	height: 20px;
	padding: 0 4px;
	border-radius: 10px;
	position: absolute;
	top: -5px;
	right: -10px;
	border: 1px solid #ffffff;
	background: #ff2f40;
	color: #f9f9f9;
	font-size: 12px;
	font-family: BlinkMacSystemFont;
	font-style: normal;
}

.sidebar button i>em {
	display: block;
	height: 10px;
	width: 10px;
	border-radius: 10px;
	position: absolute;
	top: 2px;
	right: -1px;
	border: 1px solid #ffffff;
	background: #ff2f40;
	color: #f9f9f9;
	font-size: 12px;
	font-family: BlinkMacSystemFont;
	font-style: normal;
}

.sidebar button span {
	font-size: 17px;
}

.sidebar>nav {
	flex: 1 1 auto;
	display: flex;
	flex-direction: column;
	width: 100%;
}

.sidebar>nav button:last-child {
	margin-top: auto;
}

/*사이드바 end*/

/*서치박스 스타일 */
.searchBar>#option>option {
	color: #fff;
}

.search-box {
	width: 333px;
	position: fixed;
	transition-duration: 1.0s;
	z-index: 2;
	left: -333px;
	background-color: #000;
	height: 100vh;
}

.search-button {
	background-color: #0f0f0f;
	color: #0095f6;
	font-weight: bold;
}

input {
	outline: none;
}

.flex {
	display: flex;
}

.f-between {
	justify-content: space-between;
}

.absolute {
	position: absolute;
}

.hidden {
	display: none;
	visibility: hidden;
}

form select {
	color: black;
}

.search-box-top {
	font-size: 24px;
	margin: 19px;
}

.searchBar {
	background-color: #262626;
	margin: 19px;
	border-radius: 10px;
	display: flex;
}

.search-box>div:nth-child(2) {
	border-bottom: 1px solid #888;
	height: 62px;
}

#searchValue {
	width: 80%;
	height: 40px;
	background-color: rgb(38, 38, 38);
	outline: none;
	color: white;
	border: 0;
	border-radius: 10px;
}

#option {
	background-color: rgb(38, 38, 38);
	border: 0;
	height: 40px;
	width: 18%;
	border-radius: 10px;
}

#root>a>div {
	padding: 6px 0px 6px 16px;
	align-items: center;
}

.search_nick_name {
	margin-left: 12px;
	display: flex;
	flex-flow: column;
}

.search_nick_name>div:first-child {
	font-size: 14px;
	font-weight: bold;
	height: 18px;
}

.search_nick_name>div:last-child {
	font-size: 14px;
	color: #888;
	height: 18px;
}

#root>a>div:hover {
	background-color: #222;
}

#root>a>div:hover div>div {
	background-color: #222;
}

.hashTagDiv {
	display: flex;
}

.hashTagDiv>div {
	margin-left: 17px;
}

.hashTagDiv>div>div:nth-child(1) {
	font-size: 14px;
	font-weight: bold;
}

.hashTagDiv>div>div:nth-child(2) {
	font-weight: 500;
}

.hashTagDiv>div:nth-child(1) {
	display: flex;
	justify-content: center;
	align-items: center;
	border: 1px solid #aaa;
	border-radius: 80px;
	margin-left: 0;
}

/* 서치박스 스타일 end */

/* 서치탭에 a태그 날리고 이거 넣엇습니다 */
.search-btn {
	display: block;
	font-size: 16px;
	color: #fff;
	padding: 16px 12px;
}

/* 더 보기 클릭시 메뉴 스타일*/
.more_menu_btn {
	position: relative;
}

.more_menu {
	opacity: 0;
	transition-duration: 1.2s;
	position: absolute;
	z-index: -1;
	bottom: 50px;
	left: 4px;
	width: 238px;
	margin: 0;
}

.more_menu_wrap {
	width: 238px;
	margin: 0;
}

.more_menu_wrap div {
	background-color: #262626;
	margin: 0;
}

.more_menu_wrap>div {
	display: flex;
	height: 44px;
	justify-content: space-between;
	align-items: center;
	padding: 0 20px;
	cursor: pointer;
}

.more_menu_wrap>div:nth-child(1) {
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
}

.more_menu_wrap>div:nth-child(2) {
	border-bottom-right-radius: 15px;
	border-bottom-left-radius: 15px;
}

.more_menu_wrap>div:hover {
	background: #121212
}

.more_menu_wrap>div:hover * {
	background: #121212
}

.sidebar a>span {
	margin: 5px;
}
/* 더 보기 클릭시 메뉴 스타일 end*/
.left250px {
	left: 250px;
}

.left72px {
	left: 72px;
}

/* searchValue 스타일 */
#searchValue {
	width: 80%;
	height: 40px;
	background-color: rgb(38, 38, 38);
	outline: none;
	color: white;
	font-weight: bold;
	border: 0;
}
/* searchValue 스타일 end */

/* 유저,해시 셀렉트 스타일 */
#option {
	background-color: rgb(38, 38, 38);
	border: 0;
	height: 40px;
	width: 18%;
}

select option {
	color: white;
}
/* 유저,해시 셀렉트 스타일 end */

/* 이모티콘 url */
.imt {
	background-image: url(${cpath }/resources/img/인스타임티.png);
	background-repeat: no-repeat;
	background-position: -318px -334px;
	height: 20px;
	width: 20px;
}

.esc {
	position: absolute;
	z-index: 3;
	top: 5.5%;
	right: 4%;
	background-color: rgb(38, 38, 38);
	cursor: pointer;
}

/*--------------사이드바 포스트 추가 스타일-----------------*/
.post_add_modal_back {
	background-color: #000;
	z-index: 110;
	opacity: 0.5;
	width: 100%;
	height: 100vh;
	position: absolute;
}

.post_add_modal_delete {
	background-color: #000;
	z-index: 111;
	opacity: 0.5;
	width: 100%;
	height: 100vh;
	position: absolute;
}

.post_add_modal_wrap {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	min-width: 392px;
	min-height: 370px;
	z-index: 112;
	background-color: #262626;
	border-radius: 30px;
	width: 50%;
	height: 80%;
}

.post_add_modal_wrap * {
	background-color: #262626;
	border-radius: 30px;
}

.post_add_modal_wrap>form {
	height: 90%;
}

.post_upload_img {
	height: 105%;
	display: flex;
	justify-content: center;
	flex-flow: column;
	align-items: center;
	text-align: center;
	width: 100%;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.post_add_modal_title {
	border-bottom: 1px solid #303030;
	height: 42px;
	align-items: center;
	display: flex;
	justify-content: center;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}

.post_add_modal_wrap * {
	margin: 0 0 0 0;
	box-sizing: border-box;
}

.post_add_preview {
	width: 60%;
	height: 94.4%;
	border-radius: 0;
	border-bottom-left-radius: 30px;
	top: 5;
	position: absolute;
}

.post_add_action>div {
	display: flex;
	height: 100%;
}

.post_add_action>div>div:nth-child(1) {
	width: 60%;
}

.post_add_action_profile_img {
	width: 28px;
	border-radius: 30px;
}

.post_add_action {
	height: 100%;
	margin: 0 0 0 0;
}

.post_add_action_right {
	width: 40%;
}

.post_add_action_right>div:nth-child(1) {
	display: flex;
	margin: 20px;
}

.post_add_action_right>div:nth-child(2) {
	display: flex;
	flex-flow: column;
	width: 100%;
}

.post_add_action_profile_img>img {
	border-radius: 30px;
	width: 28px;
}

.post_add_action_name {
	margin: 0 13px;
}

.post_add_action  textarea {
	margin-left: 18px;
	border: none;
	height: 236px;
	width: 88%;
	resize: none;
	font-size: 16px;
	outline: none;
	border-radius: 0;
}

.post_add_action_location {
	height: 38px;
	width: 88%;
	margin-left: 18px;
	border: none;
	font-size: 16px;
}

.post_add_action_btn>input {
	position: absolute;
	top: 10px;
	right: 20px;
	color: #0095f6;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	border: none;
}

.post_add_finish_modal_content>div {
	display: flex;
	flex-flow: column;
	text-align: center;
	font-size: 20px;
	margin-top: 260px;
}

.post_add_finish_modal_content>div>div:first-child {
	width: 96px;
	margin: auto;
}

.post_add_finish_modal_content>div>div:nth-child(2) {
	font-weight: 400;
}

.post_add_back_btn, .post_add_next_btn {
	height: 0;
}

.post_add_back_btn>button>div>svg {
	position: absolute;
	bottom: 44%;
	width: 30px;
	height: 30px;
	opacity: 0.5;
}

.post_add_next_btn>button>div>svg {
	position: absolute;
	bottom: 44%;
	width: 30px;
	height: 30px;
	opacity: 0.5;
	right: 40%;
}

.post_add_back_btn>button>div>svg:hover {
	opacity: 1;
}

.post_add_next_btn>button>div>svg:hover {
	opacity: 1;
}

.post_add_img>svg {
	border-radius: 0;
}

.post_add_modal_back>div {
	position: absolute;
	right: 42px;
	top: 20px;
	cursor: pointer;
}

.post_add_modal_delete>div {
	position: absolute;
	right: 42px;
	top: 20px;
	cursor: pointer;
}

.post_add_img_file_input>input {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

.post_add_img_file_input>label {
	display: inline-block;
	padding: 5px 14px;
	color: #fff;
	vertical-align: middle;
	background-color: #0095f6;
	cursor: pointer;
	height: 34px;
	border-radius: 8px;
	font-weight: 600;
	margin-top: 30px;
}

.post_upload_img>div>div:nth-child(2) {
	font-size: 20px;
}

.post_upload_img>div>div:nth-child(1) {
	margin-top: 4px;
}

.post_add_modal_delete_modal_wrap * {
	background-color: #262626;
	text-align: center;
}

.post_add_modal_delete_modal {
	height: 100vh;
	width: 100%;
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.post_add_modal_delete_modal_background {
	height: 100%;
	width: 100%;
	z-index: 200;
	position: absolute;
	background-color: #000;
	opacity: 0.5;
}

.post_add_modal_delete_modal_wrap {
	min-width: 245px;
	min-height: 235px;
	z-index: 202;
	background-color: #262626;
	border-radius: 20px;
	box-sizing: border-box;
	width: 50%;
	max-width: 400px;
}

.post_add_modal_delete_modal_wrap>div {
	min-width: 245px;
	min-height: 188px;
	border-radius: 30px;
	height: 100%;
	border-radius: 30px;
	height: 100%;
	margin: 0;
}

.post_add_moda_delete_btn>div:first-child {
	color: #ed4956;
	font-weight: bold;
}

.post_add_moda_delete_ment>div:first-child {
	font-size: 20px;
	margin-top: 33px;
}

.post_add_moda_delete_ment>div:last-child {
	color: #888;
	font-size: 14px;
	margin: 20px;
}

.post_add_moda_delete_btn div {
	cursor: pointer;
	height: 48px;
	line-height: 17px;
	border-top: 1px solid #888;
	line-height: 3;
	margin: 0;
}

.post_add_moda_delete_btn>div:nth-child(2) {
	border-bottom-right-radius: 30px;
	border-bottom-left-radius: 30px;
}

.post_add_moda_delete_btn {
	margin-top: 35px;
	border-radius: 30px;
}

.post_add_modal_delete_modal_background>div {
	position: absolute;
	right: 42px;
	top: 31px;
	cursor: pointer;
}

.foot {
	text-align: center;
	padding-bottom: 50px;
}
/*--------------사이드바 포스트 추가 스타일 end-----------------*/
</style>
<script type="text/javascript">
	const cpath = '${cpath}'
	const users_idx = '${login.idx}'
</script>
</head>
<body>
	<!-- 사이드바 포스트 추가 모달 -->
	<div class="post_add_modal_back hidden">
		<div class="x10l6tqk x160vmok x1eu8d0j x1vjfegm">
			<div
				class="x1i10hfl x6umtig x1b1mbwd xaqea5y xav7gou x9f619 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz x6s0dn4 x78zum5 xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x1ypdohk xl56j7k x1y1aw1k x1sxyh0 xwib8y2 xurb0ha"
				role="button" tabindex="0">
				<div class="x78zum5 x6s0dn4 xl56j7k xdt5ytf">
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
		</div>
	</div>
	<div class="post_add_modal_delete hidden">
		<div class="x10l6tqk x160vmok x1eu8d0j x1vjfegm">
			<div
				class="x1i10hfl x6umtig x1b1mbwd xaqea5y xav7gou x9f619 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz x6s0dn4 x78zum5 xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x1ypdohk xl56j7k x1y1aw1k x1sxyh0 xwib8y2 xurb0ha"
				role="button" tabindex="0">
				<div class="x78zum5 x6s0dn4 xl56j7k xdt5ytf">
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
		</div>
	</div>

	<!-- 게시물작성 취소 모달 -->
	<div class="post_add_modal_delete_modal hidden">
		<div class="post_add_modal_delete_modal_background">
			<div class="x10l6tqk x160vmok x1eu8d0j x1vjfegm">
				<div
					class="x1i10hfl x6umtig x1b1mbwd xaqea5y xav7gou x9f619 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz x6s0dn4 x78zum5 xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x1ypdohk xl56j7k x1y1aw1k x1sxyh0 xwib8y2 xurb0ha"
					role="button" tabindex="0">
					<div class="x78zum5 x6s0dn4 xl56j7k xdt5ytf">
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
			</div>
		</div>
		<div class="post_add_modal_delete_modal_wrap">
			<div>
				<div class="post_add_moda_delete_ment">
					<div>게시물 작성을 취소 하시겠어요?</div>
					<div>지금 나가면 수정 내용이 저장 되지 않습니다.</div>
				</div>
				<div class="post_add_moda_delete_btn">
					<div>삭제</div>
					<div>취소</div>
				</div>
			</div>
		</div>
	</div>

	<!-- delete 모달 버튼 상호작용 스크립트 -->
	<script type="text/javascript">
				// 버튼
				const post_add_moda_delete_btn = document.querySelector('.post_add_moda_delete_btn > div:nth-child(1)')
				const post_add_moda_delete_back = document.querySelector('.post_add_moda_delete_btn > div:nth-child(2)')
				
				// 뒷배경과 모달창
				const post_add_modal_delete_modal = document.querySelector('.post_add_modal_delete_modal')
				
				function post_add_moda_delete_btn_handler() {
					post_add_modal_delete_modal.classList.add('hidden')
					post_add_modal_delete.classList.add('hidden')
					post_upload_img.classList.remove('hidden')
					post_add_action.classList.add('hidden')
					post_add_modal_wrap.classList.add('hidden')
					post_add_modal_back.classList.add('hidden')
					post_add_modal_wrap.style.width = '50%'
					
					$('.sidebar_post_add_form')[0].reset();
				}
				post_add_moda_delete_btn.onclick = post_add_moda_delete_btn_handler
				
				function post_add_moda_delete_back_handler() {
					post_add_modal_delete_modal.classList.add('hidden')
				}
				post_add_moda_delete_back.onclick =post_add_moda_delete_back_handler
			</script>

	<div class="post_add_modal_wrap hidden">
		<div class="post_add_modal_title">
			<h1 class="post_add_modal_title_content">새 게시물 만들기</h1>
		</div>
		<form action="" class="sidebar_post_add_form">

			<!-- 이미지 업로드 div -->
			<div class="post_upload_img">
				<div>
					<div class="post_add_img">
						<svg aria-label="이미지나 동영상과 같은 미디어를 나타내는 아이콘" class="_ab6-"
							color="rgb(245, 245, 245)" fill="rgb(245, 245, 245)" height="77"
							role="img" viewBox="0 0 97.6 77.3" width="96">
							<path
								d="M16.3 24h.3c2.8-.2 4.9-2.6 4.8-5.4-.2-2.8-2.6-4.9-5.4-4.8s-4.9 2.6-4.8 5.4c.1 2.7 2.4 4.8 5.1 4.8zm-2.4-7.2c.5-.6 1.3-1 2.1-1h.2c1.7 0 3.1 1.4 3.1 3.1 0 1.7-1.4 3.1-3.1 3.1-1.7 0-3.1-1.4-3.1-3.1 0-.8.3-1.5.8-2.1z"
								fill="currentColor"></path>
							<path
								d="M84.7 18.4 58 16.9l-.2-3c-.3-5.7-5.2-10.1-11-9.8L12.9 6c-5.7.3-10.1 5.3-9.8 11L5 51v.8c.7 5.2 5.1 9.1 10.3 9.1h.6l21.7-1.2v.6c-.3 5.7 4 10.7 9.8 11l34 2h.6c5.5 0 10.1-4.3 10.4-9.8l2-34c.4-5.8-4-10.7-9.7-11.1zM7.2 10.8C8.7 9.1 10.8 8.1 13 8l34-1.9c4.6-.3 8.6 3.3 8.9 7.9l.2 2.8-5.3-.3c-5.7-.3-10.7 4-11 9.8l-.6 9.5-9.5 10.7c-.2.3-.6.4-1 .5-.4 0-.7-.1-1-.4l-7.8-7c-1.4-1.3-3.5-1.1-4.8.3L7 49 5.2 17c-.2-2.3.6-4.5 2-6.2zm8.7 48c-4.3.2-8.1-2.8-8.8-7.1l9.4-10.5c.2-.3.6-.4 1-.5.4 0 .7.1 1 .4l7.8 7c.7.6 1.6.9 2.5.9.9 0 1.7-.5 2.3-1.1l7.8-8.8-1.1 18.6-21.9 1.1zm76.5-29.5-2 34c-.3 4.6-4.3 8.2-8.9 7.9l-34-2c-4.6-.3-8.2-4.3-7.9-8.9l2-34c.3-4.4 3.9-7.9 8.4-7.9h.5l34 2c4.7.3 8.2 4.3 7.9 8.9z"
								fill="currentColor"></path>
							<path
								d="M78.2 41.6 61.3 30.5c-2.1-1.4-4.9-.8-6.2 1.3-.4.7-.7 1.4-.7 2.2l-1.2 20.1c-.1 2.5 1.7 4.6 4.2 4.8h.3c.7 0 1.4-.2 2-.5l18-9c2.2-1.1 3.1-3.8 2-6-.4-.7-.9-1.3-1.5-1.8zm-1.4 6-18 9c-.4.2-.8.3-1.3.3-.4 0-.9-.2-1.2-.4-.7-.5-1.2-1.3-1.1-2.2l1.2-20.1c.1-.9.6-1.7 1.4-2.1.8-.4 1.7-.3 2.5.1L77 43.3c1.2.8 1.5 2.3.7 3.4-.2.4-.5.7-.9.9z"
								fill="currentColor"></path></svg>
					</div>
					<div>사진과 동영상을 여기에 끌어다놓으세요</div>
					<div class="post_add_img_file_input">
						<label for="post_add_file">컴퓨터에서 선택</label> <input
							id="post_add_file" type="file" name="image_file"
							onchange="postAddFormHandler(this);" multiple placeholder="">
					</div>
				</div>
			</div>
			<!-- 이미지 업로드 div end->					
					
					<!-- 게시물 작성 div -->
			<div class="post_add_action hidden">
				<input type="hidden" name="users_idx" value="${login.idx }">
				<div>
					<div>
						<div class="post_add_back_btn hidden">
							<button class="_acan _acao _acas _aj1-" type="button">
								<div
									class="_ab8w  _ab94 _ab97 _ab9h _ab9k _ab9p  _ab9y _aba8 _abcm">
									<svg aria-label="왼쪽 방향 아이콘" class="_ab6-"
										color="rgb(255, 255, 255)" fill="rgb(255, 255, 255)"
										height="16" role="img" viewBox="0 0 24 24" width="16">
										<polyline fill="none" points="16.502 3 7.498 12 16.502 21"
											stroke="currentColor" stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"></polyline></svg>
								</div>
							</button>
						</div>
						<img class="post_add_preview">
						<div class="post_add_next_btn hidden">
							<button class="_acan _acao _acas _aj1-" type="button">
								<div
									class="_ab8w  _ab94 _ab97 _ab9h _ab9k _ab9p  _ab9y _aba8 _abcm">
									<svg aria-label="오른쪽 방향 아이콘" class="_ab6-"
										color="rgb(255, 255, 255)" fill="rgb(255, 255, 255)"
										height="16" role="img" viewBox="0 0 24 24" width="16">
										<polyline fill="none" points="8 3 17.004 12 8 21"
											stroke="currentColor" stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"></polyline></svg>
								</div>
							</button>
						</div>
					</div>
					<div class="post_add_action_right">
						<div>
							<div class="post_add_action_btn">
								<input type="submit" value="공유하기">
							</div>
							<div class="post_add_action_profile_img">
								<img src="${cpath }/resources/img/userImg.jpg">
							</div>
							<div class="post_add_action_name">${login.nick_name}</div>
						</div>

						<div>
							<textarea class="post_add_action_content" name="content"
								placeholder="문구 입력..."></textarea>
							<input class="post_add_action_location" type="text"
								name="location" placeholder="위치 추가" autocomplete="off">
						</div>
					</div>
				</div>
			</div>
			<!-- 게시물 작성 div end-->
		</form>

		<div class="post_add_finish_modal hidden">
			<div class="post_add_finish_modal_title"></div>
			<div class="post_add_finish_modal_content">
				<div>
					<div>
						<img draggable="false" height="100%" width="100%"
							alt="애니메이션 효과 확인란" class="xl1xv1r"
							referrerpolicy="origin-when-cross-origin"
							src="https://static.cdninstagram.com/rsrc.php/v3/y5/r/4GCxSJTmyjy.gif">
					</div>
					<div>게시물이 공유되었습니다.</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 포스트 모달 다음사진 이전사진 스크립트 -->
	<script type="text/javascript">
	const post_add_back_btn = document.querySelector('.post_add_back_btn')
	const post_add_next_btn = document.querySelector('.post_add_next_btn')
	
	// 이전 버튼 눌렀을때
	function post_add_back_handler() {
		const img_list = post_add_preview.getAttribute('img_list')
		if(post_add_file.files && post_add_file.files[+img_list - 2]){
			const reader = new FileReader()
			reader.onload =function(e){
				post_add_preview.src =  e.target.result
			}
			reader.readAsDataURL(post_add_file.files[+img_list -2])
			post_add_preview.setAttribute('img_list',+img_list - 1)
			if(img_list == 2){
				post_add_back_btn.classList.add('hidden')
			}
			post_add_next_btn.classList.remove('hidden')
		}
		else{post_add_preview.src=''}
	}
	
	post_add_back_btn.onclick = post_add_back_handler
	
	
	// 다음 버튼 눌렀을때
	function post_add_next_handler() {
		const img_list = post_add_preview.getAttribute('img_list')
		post_add_back_btn.classList.remove('hidden')
		if(post_add_file.files && post_add_file.files[+img_list + 0]){
			const reader = new FileReader()
			reader.onload =function(e){
				post_add_preview.src =  e.target.result
			}
			reader.readAsDataURL(post_add_file.files[+img_list])
			post_add_preview.setAttribute('img_list',+img_list + 1)
			if(!post_add_file.files[+img_list + 1]){
				post_add_next_btn.classList.add('hidden')
			}
		}
		else{post_add_preview.src=''}
	}
	
	post_add_next_btn.onclick = post_add_next_handler
	
</script>

	<!-- 사이드바 포스트 추가 버튼 작동 스크립트 -->
	<script type="text/javascript">
	// 공유하기 버튼
	const post_add_action_btn = document.querySelector('.post_add_action_btn')
	// form
	const post_add_form = document.querySelector('.sidebar_post_add_form')
	// 완료 문구
	const post_add_finish_modal = document.querySelector('.post_add_finish_modal')
	// 상단 타이틀
	const post_add_modal_title_content = document.querySelector('.post_add_modal_title_content')
	
	// 버튼 클릭시 추가하고 완료창 뛰워준다
	function post_add_controllHandler(event) {
		event.preventDefault()
		post_add_modal_delete.classList.add('hidden')
		post_add_action.classList.add('hidden')
		let post_add_form_data = document.querySelector('.sidebar_post_add_form')
		let formData = new FormData(post_add_form_data)
		fetch('${cpath}/post/add',{
			method: "POST",
			body : formData
		}).then(resp => resp.text())
		.then(text =>{
			if(text == 1){
				post_add_form.classList.add('hidden')
				post_add_finish_modal.classList.remove('hidden')
				post_add_modal_title_content.innerText ='게시물이 공유되었습니다'
				post_add_modal_wrap.style.width = '50%'
				$('.sidebar_post_add_form')[0].reset();
			}
		})
	}
	
	post_add_action_btn.onclick = post_add_controllHandler
</script>

	<!-- 사이드바 포스트 추가 스크립트 -->
	<script type="text/javascript">
	const post_add_file = document.querySelector('input[name="image_file"]')
	const post_add_preview = document.querySelector('.post_add_preview')
	const post_add_action = document.querySelector('.post_add_action')
	const post_add_modal_wrap = document.querySelector('.post_add_modal_wrap')
	const post_upload_img = document.querySelector('.post_upload_img')
	
function handleDragOver(e) {
  e.preventDefault();
}

function handleDrop(e) {
  e.preventDefault();

  const files = e.dataTransfer.files;
  const input = document.getElementById('post_add_file');
  
  if (files.length > 0) {
    input.files = files;
    input.dispatchEvent(new Event('change'));
  }
}

const dropZone = document.querySelector('.post_upload_img');

dropZone.addEventListener('dragover', handleDragOver);
dropZone.addEventListener('drop', handleDrop);
	
	function postAddFormHandler(event){
		post_upload_img.classList.add('hidden')
		post_add_action.classList.remove('hidden')
		post_add_modal_wrap.style.width = '60%'
		post_add_modal_delete.classList.remove('hidden')
		if(event.target.files && event.target.files[0]){
			if(event.target.files[1]){
				post_add_preview.setAttribute('img_list',1)
				post_add_next_btn.classList.remove('hidden')
			}
			const reader = new FileReader()
			reader.onload =function(e){
				post_add_preview.src =  e.target.result
			}
			reader.readAsDataURL(event.target.files[0]) 
		}
		else{
			post_add_preview.src=''
		}
	}
	post_add_file.onchange = postAddFormHandler
	
	
	// 사진 드래그 오버시 배경색 svg색 변경코드
	const postAddModalWrap = document.querySelector('.post_add_modal_wrap');
	const postAddImg = document.querySelector('.post_add_img > svg');
	const postAddImgAll = document.querySelectorAll('.post_upload_img *:not(label)')

	postAddModalWrap.addEventListener('dragover', function(e) {
	  e.preventDefault();
	  post_upload_img.style.backgroundColor = '#141414'
	  postAddImgAll.forEach(e=>e.style.backgroundColor = '#141414')
	});

	postAddModalWrap.addEventListener('dragleave', function() {
		 post_upload_img.style.backgroundColor = '#222'
		 postAddImgAll.forEach(e=>e.style.backgroundColor = '#222')
	});

	postAddModalWrap.addEventListener('drop', function() {
		post_upload_img.style.backgroundColor = '#222'
		postAddImgAll.forEach(e=>e.style.backgroundColor = '#222')
	});
	
</script>

	<!-- 사진이 입력되고 바같 누를시 모달창 뛰우기  -->
	<script type="text/javascript">
	const post_add_modal_delete = document.querySelector('.post_add_modal_delete')
	
	function post_add_modal_delete_handler(){
		post_add_modal_delete_modal.classList.remove('hidden')
	}
	
	post_add_modal_delete.onclick = post_add_modal_delete_handler
</script>

	<!-- 검색창 -->
	<div class="search-box" index="0">
		<div class="search-box-top">
			<h2>검색</h2>
		</div>
		<div class="">
			<div class="searchBar">
				<select id="option">
					<option value="usersOption" selected="selected">유저</option>
					<option value="hashOption">해시</option>
				</select> <input id="searchValue" type="text" name="searchValue"
					placeholder="검색">
			</div>
			<br>
			<div class="">
				<div id="root"></div>

			</div>
		</div>
	</div>
	<!-- 검색창 end -->

	<!-- 왼쪽 사이드 메뉴 -->
	<aside class="sidebar">
		<header class="sidebar-header">
			<a href="${cpath }/users/main"> <img class="logo-img"
				src="${cpath }/resources/img/logo_dark.jpg" /> <i
				class="logo-icon uil uil-instagram"></i>
			</a>
		</header>
		<nav>

			<button class="sidevar_go_main">
				<span> <i class="uil uil-estate"></i> <span>홈</span>
				</span>
			</button>

			<button class="search-btn">
				<span> <i class="uil uil-search"></i> <span>검색</span>
				</span>
			</button>

			<button class="sidevar_go_explore">
				<span> <i class="uil uil-compass"></i> <span>탐색 탭</span>
				</span>
			</button>

			<button class="sidevar_go_chat">
				<span> <i class="uil uil-location-arrow"></i> <span>메시지</span>
				</span>
			</button>

			<button class="post_add_start_btn">
				<span> <i class="uil uil-plus-circle"> </i> <span>만들기</span>
				</span>
			</button>

			<button class="sidevar_go_profile">
				<span> <img src="${cpath }/resources/img/${login.user_img }" />
					<span>프로필</span>
				</span>
			</button>

			<button class="more_menu_btn">
				<span> <i class="uil uil-bars"> </i> <span>더 보기</span>
				</span>
			</button>
		</nav>
	</aside>
	<!-- 사이드메뉴 end -->

	<!-- 더 보기 목록 -->
	<div class="more_menu">
		<div class="more_menu_wrap">
			<div class="more_menu_option_btn">
				<div>설정</div>
				<div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abb1 _abcm">
					<svg aria-label="설정" class="_ab6-" color="rgb(245, 245, 245)"
						fill="rgb(245, 245, 245)" height="24" role="img"
						viewBox="0 0 24 24" width="24">
						<circle cx="12" cy="12" fill="none" r="8.635"
							stroke="currentColor" stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2"></circle>
						<path
							d="M14.232 3.656a1.269 1.269 0 0 1-.796-.66L12.93 2h-1.86l-.505.996a1.269 1.269 0 0 1-.796.66m-.001 16.688a1.269 1.269 0 0 1 .796.66l.505.996h1.862l.505-.996a1.269 1.269 0 0 1 .796-.66M3.656 9.768a1.269 1.269 0 0 1-.66.796L2 11.07v1.862l.996.505a1.269 1.269 0 0 1 .66.796m16.688-.001a1.269 1.269 0 0 1 .66-.796L22 12.93v-1.86l-.996-.505a1.269 1.269 0 0 1-.66-.796M7.678 4.522a1.269 1.269 0 0 1-1.03.096l-1.06-.348L4.27 5.587l.348 1.062a1.269 1.269 0 0 1-.096 1.03m11.8 11.799a1.269 1.269 0 0 1 1.03-.096l1.06.348 1.318-1.317-.348-1.062a1.269 1.269 0 0 1 .096-1.03m-14.956.001a1.269 1.269 0 0 1 .096 1.03l-.348 1.06 1.317 1.318 1.062-.348a1.269 1.269 0 0 1 1.03.096m11.799-11.8a1.269 1.269 0 0 1-.096-1.03l.348-1.06-1.317-1.318-1.062.348a1.269 1.269 0 0 1-1.03-.096"
							fill="none" stroke="currentColor" stroke-linejoin="round"
							stroke-width="2"></path></svg>
				</div>
			</div>
			<div class="more_menu_logout_btn">
				<div>로그아웃</div>
			</div>
		</div>
	</div>
	<!-- 더 보기 목록end -->

	<!-- jquery 라이브러리 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- 사이드바 게시물 작성 버튼 스크립트 -->
	<script type="text/javascript">
 	const post_add_start_btn =document.querySelector('.post_add_start_btn')
 	
 	function post_add_start_btn_handler(){
		post_add_modal_back.classList.remove('hidden')
		post_add_modal_wrap.classList.remove('hidden')
 	}
 	
 	post_add_start_btn.onclick = post_add_start_btn_handler
 </script>

	<!-- 배경과 x눌렀을때 돌아가기 스크립트-->
	<script type="text/javascript">
	const post_add_modal_back = document.querySelector('.post_add_modal_back')
	
	function post_add_modal_back_handler(){
		post_add_modal_back.classList.add('hidden')
		post_add_modal_wrap.classList.add('hidden')
		post_add_finish_modal.classList.add('hidden')
		post_upload_img.classList.remove('hidden')
		post_add_modal_title_content.innerText ='새 게시물 만들기'
		post_add_form.classList.remove('hidden')
	}
	
	post_add_modal_back.onclick = post_add_modal_back_handler
</script>

	<!-- 사이드바 이동 스크립트 -->
	<script type="text/javascript">
	//프로필 누를시 viewdetail이동
  	const sidevar_go_profile  = document.querySelector('.sidevar_go_profile')
  	go_profile_url = '${cpath}/users/viewDetail/${login.idx}'
	function go_profile_handler() {location.href = go_profile_url}
  	sidevar_go_profile.onclick = go_profile_handler
  	
  	// 홈 누를시 홈화면 이동
  	const sidevar_go_main  = document.querySelector('.sidevar_go_main')
  	go_home_url = '${cpath}/users/main'
	function go_home_handler() {location.href = go_home_url}
  	sidevar_go_main.onclick = go_home_handler
  	
 	// 탐색 탭 누를시 탐색 탭 이동
  	const sidevar_go_explore  = document.querySelector('.sidevar_go_explore')
  	go_explore_url = '${cpath}/post/explore'
	function go_explore_handler() {location.href = go_explore_url}
  	sidevar_go_explore.onclick = go_explore_handler
  	
 	// 메시지 누를시 메시지 탭 이동
  	const sidevar_go_chat  = document.querySelector('.sidevar_go_chat')
  	go_chat_url = '${cpath}/chat/home'
	function go_chat_handler() {location.href = go_chat_url}
  	sidevar_go_chat.onclick = go_chat_handler  	
</script>

	<!-- 사이드바 검색 표시 숨기기 -->
	<script>
    const searchBtn = document.querySelector('.search-btn')
    const searchBar = document.querySelector('.search-box')
    const sideBar = document.querySelector('.sidebar')
      
  	let searchASC = 0
    function searchHandler(){
       if(searchASC == 0) {
    	   $('.logo-img').css('display','none')
    	   $('div.main').css('margin-left','70px')
    	   $('.logo-icon').css('display','block')
    	   $('.sidebar').css('width','72px')
    	   $('.sidebar button > span').css('width','50px')
    	   $('.sidebar button > span > span').css('opacity','0')
    	   $('.sidebar button > span > span').css('visibility','hidden')
	       searchBar.style.left="72px"    		   

    	   searchASC = 1
       }
       else if (searchASC == 1) {
          searchBar.style.left="-350px"
       	   $('.logo-img').css('display','block')
    	   $('div.main').css('margin-left','0')
    	   $('.logo-icon').css('display','none')
    	   $('.sidebar').css('width','220px')
    	   $('.sidebar button > span').css('width','125')
    	   $('.sidebar button > span > span').css('opacity','1')
    	   $('.sidebar button > span > span').css('visibility','visible')
        	searchASC = 0
       }
    }
    searchBtn.onclick = searchHandler
</script>

	<!-- 더보기 클릭시 요청 처리 -->
	<script type="text/javascript">
	// 설정 누를시infoModify이동
	const more_menu_option_btn  = document.querySelector('.more_menu_option_btn')
  	go_infoModify_url = '${cpath}/users/infoModify'
	function go_infoModify_handler() {location.href = go_infoModify_url}
  	more_menu_option_btn.onclick = go_infoModify_handler
  	
  	// 로그아웃 누를시 로그아웃 요청
  	const more_menu_logout_btn  = document.querySelector('.more_menu_logout_btn')
  	go_logout_url = '${cpath}/users/logout'
	function go_logout_handler() {
		alert('로그아웃 되셨습니다.')  		
		location.replace(go_logout_url);
  		}
  	more_menu_logout_btn.onclick = go_logout_handler
  	
</script>

	<!-- 더보기 표시 숨기기 -->
	<script>
    const more_menu = document.querySelector('.more_menu')
    const more_menu_btn = document.querySelector('.more_menu_btn')
  	let menuShowVal = 0
    function moreMenuShowHandler(){
       if(menuShowVal == 0) {
    	   more_menu.style.opacity = "1"
    		   more_menu.style.zIndex="4"
    		   menuShowVal = 1
       }
       else if (menuShowVal == 1) {
    	   more_menu.style.opacity = "0"
    		   more_menu.style.zIndex="-1"
    		   menuShowVal = 0
       }
    }
    more_menu_btn.onclick = moreMenuShowHandler
</script>
	<!-- 사이드바 검색 효과 -->
	<script>
const root = document.getElementById('root')
const form = document.getElementById('form')

function searchHandler(event) {  
  root.innerHTML = ''        // 다른 옵션 선택하면 기존에 보던 애들 날려주기
  
//   const option = document.querySelector('input[name="option"]:checked').value // 옵션 = 옵션(라디오)에 체크된.값
  const selectOption = document.getElementById('option')
  const option = selectOption.options[selectOption.selectedIndex].value
  console.log(option)
  const searchValue = document.querySelector('input[name="searchValue"]').value
  console.log(searchValue)
  
  if(option == 'usersOption') {
     fetch('${cpath}/usersSearch/' + searchValue)
     .then(resp => resp.json())
     .then(json => {
        console.log(json)   // 여기에 지금 유저리스트 담겨있스빈다
        root.innerHTML = ''
        json.forEach(dto => {
			let tag = ''      // 여기에 유저 프사 넣는 것도 해야됨
			tag += '<a href="${cpath}/users/viewDetail/'+ dto.idx + '">'
			tag += '		<div style="display: flex;">'
			tag += '			<img style="width: 44px;height:44px; border-radius: 30px;" src="${cpath}/resources/img/'+ dto.user_img + '">'
			tag += '         <div class="search_nick_name"> '
			tag += '				<div>' + dto.nick_name + '</div>'
			tag += '				<div>' + dto.name + '</div>'
			tag += '         </div>'
			tag += '		</div>'
			tag += '</a>'
           root.innerHTML += tag
        })
     })
  }
  else if (option == 'hashOption') {
	     fetch('${cpath}/hashSearch/' + searchValue)
	     .then(resp => resp.json())
	     .then(json => {
	    	 console.log(json)
	        root.innerHTML = ''
	        json.forEach(dto => {
	           let tag = ''
	           tag += '<a href="${cpath}/post/postList/'+ dto.HASHTAG.replace("#", "") + '/">'
	           tag += '		<div class="hashTagDiv">'
	           tag += '  		<div class="x6s0dn4 x1619dve x14yjl9h xudhj91 x18nykt9 xww2gxu x13fuv20 xu3j5b3 x1q0q8m5 x26u7qi x9f619 x3nfvp2 xl56j7k x1n2onr6 xtuw4uo xeud2gj x18oi6gw x13ehr01" style="width: 44px; height: 44px;"><svg aria-label="해시태그" class="_ab6-" color="rgb(245, 245, 245)" fill="rgb(245, 245, 245)" height="16" role="img" viewBox="0 0 24 24" width="16"><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="4.728" x2="20.635" y1="7.915" y2="7.915"></line><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="3.364" x2="19.272" y1="15.186" y2="15.186"></line><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="17.009" x2="13.368" y1="2" y2="22"></line><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="10.64" x2="7" y1="2" y2="22"></line></svg></div>'
	           tag += '  		<div>'
	           tag += '				<div class="name">' + dto.HASHTAG + '</div>'
	           tag += '      		<div>게시물'+ ' ' + dto.COUNT_HASHTAG + '</div>'
	           tag += '  		</div>'
	           tag += '		</div>'
	           tag += '</a>'
	           root.innerHTML += tag
	        })
	     })
	  }
}

searchBar.onkeyup = searchHandler

</script>