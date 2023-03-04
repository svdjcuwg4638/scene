﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*모든요소의 기본 마진 패딩, 사이징 초기화*/
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	text-decoration: none;
	list-style: none;
	outline: none;
}

/*페이지의 중앙을 잡아줄 컨테이너*/
.container {
	width: 100%;
	min-height: 100%;
}

/*메인태그 기본정의*/
.loginMain {
	height: 100vh;
	display: flex;
	justify-content: center;
	background-color: rgba(var(- -b3f, 250, 250, 250), 1);
}

/*모든 버튼은 포인터*/
button {
	cursor: pointer;
}

/*로그인 섹션*/
.login {
	width: 100%;
	max-width: 935px;
	display: flex;
	justify-content: center;
	align-items: center;
}

/*로그인폼과 가입하기를 감싸는 컨테이너*/
.login__form__container {
	width: 350px;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

/*로그인폼, 가입하기 박스 디자인*/
.login__form, .login__register {
	padding: 10px 0 20px;
	text-align: center;
	border: 1px solid rgba(var(- -b6a, 219, 219, 219), 1);
	background-color: #fff;
}

/*로고이미지를 담을 블록요소*/
.login__form h1 {
	height: 86px;
	display: flex;
	align-items: center;
	justify-content: center;
}

/*로고 이미지*/
.login__form h1 img {
	height: 80px;
	width: 250px;
}

/*로그인 인풋박스*/
.login__input {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 24px;
	padding: 0 40px;
}

/*로그인 인풋태그*/
.login__input input {
	width: 100%;
	height: 38px;
	padding: 9px 0 7px 8px;
	border: 1px solid rgba(var(- -ca6, 219, 219, 219), 1);
	border-radius: 3px;
	margin-bottom: 6px;
}

/*로그인 버튼*/
.login__input button {
	border: 0;
	outline: 0;
	width: 100%;
	height: 30px;
	background-color: #bfdffd;
	color: #fff;
	margin-top: 15px;
	font-weight: 700;
	border-radius: 3px;
	transition: background 0.5s;
}

/* login__horizon 붙은건 그냥 hr을 디자인한거. */
.login__horizon {
	display: flex;
	margin-top: 20px;
	padding: 0 40px;
	align-items: center;
}

.login__horizon .br {
	width: 40%;
	height: 1px;
	border-top: 1px solid rgba(var(- -b6a, 219, 219, 219), 1);
}

.login__horizon .or {
	width: 20%;
	text-align: center;
	color: #aaa;
	font-size: 14px;
}

/* 페이스북로그인 영역 */
.login__facebook {
	padding: 0 40px;
	margin-top: 15px;
}
/*페이스북 로그인 버튼*/
.login__facebook button {
	background-color: #0095F6;
	width: 100%;
	height: 30px;
	border: 0;
	font-weight: 600;
	font-size: 15px;
}
/*페이스북 로그인 색깔*/
.login__facebook button i, span {
	color: #fff;
}

.id_ok {
	color: #008000;
	display: none;
}

.id_already {
	color: #6A82FB;
	display: none;
}
/*가입페이지로 이동*/
.login__register {
	margin-top: 10px;
	line-height: 60px;
	padding: 0;
}

/*계정이 없으신가요?*/
.login__register span {
	color: black;
	font-size: 14px;
	font-weight: 200;
}

/*가입페이지 이동버튼*/
.login__register a {
	color: #0095f6;
}

/* 버튼디자인 */
.cta {
	margin-right: 10px;
	padding: 5px 9px;
	border: 1px solid rgba(var(- -ca6, 219, 219, 219), 1);
	border-radius: 4px;
	color: #262626;
	font-weight: bold;
	background: transparent;
}

/*버튼 블루*/
.cta.blue {
	background: #0095f6 !important;
	color: #fff !important;
}

/* 회원가입페이지 로고맨트 */
.logo_ment {
	color: #8e8e8e;
}

/* 아이디 체크 문구 */
.id_ok {
	color: #008000;
	display: none;
}

.id_already {
	color: #6A82FB;
	display: none;
}

/* 숨기기 */
.hidden {
	display: none;
}
/* 회원가입 이메일 */
.show {
	display: inline-block;
}
/* 회원가입 성별 div */
#gender {
	display: flex;
	justify-content: space-evenly;
	width: 100%;
	height: 38px;
	border: 1px solid rgba(var(- -ca6, 219, 219, 219), 1);
	border-radius: 3px;
	margin-bottom: 6px;
}

/* 성별 선택 */
select[name="gender"] {
	width: 100%;
	height: 38px;
	padding: 9px 0 7px 8px;
	border: 1px solid rgba(var(- -ca6, 219, 219, 219), 1);
	border-radius: 3px;
	margin-bottom: 6px;
}

/* err문구 div */
.login__input>div {
	color: red;
	font-size: 12px;
	margin-right: auto
}

/*회원가입 버튼*/
#join_btn {
	background-color: #1c7ed6;
}

/*로그인 에러*/
#login_err {
	text-align: left;
}

/*비밀번호 찾기 tip*/
#findPw_tip {
	text-align: left;
	color: black;
	margin-bottom: 10px;
	font-size: 14px;
	padding-left: 18px;
}

/*이메일 팁*/
#email_tip {
	color: black;
	font-size: 17px;
}

/* 비밀번호 찾기 버튼스타일*/
.btn_findPw_style {
	background-color: rgb(28, 126, 214);
	color: white;
	cursor: pointer;
}

#pw_tip_sub {
	color: black;
	margin: 10px 0 10px 0;
}

#pw_tip_main {
	color: black;
	margin-right: 0;
}
</style>
</head>
<body>
	<div class="container">
		<main class="loginMain"> <!--로그인섹션-->
		<section class="login">
			<!--로그인박스-->
			<article class="login__form__container">
				<!--로그인 폼-->
				<div class="login__form">
					<h1>
						<img src="${cpath }/resources/img/loginlog.jpg" alt="">
					</h1>

					<!--로그인 인풋-->
					<form class="login__input" action="${cpath }/users/login"
						method="POST">
						<input type="text" id="id"
							value="${empty inputPhoneNumber ? '' : inputPhoneNumber }"
							name="phone_number" placeholder="전화번호 입력 (-제외)"
							required="required" /> <input type="password" id="pw" name="pw"
							placeholder="password" required="required" />
						<div id="login_err">${msg == false ? '전화번호 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.' : '' }</div>
						<button class="btn">로그인</button>

					</form>
					<!--로그인 인풋end-->
					<div>
						<a href="${cpath }/users/findPw">비밀번호를 잊으셨나요?</a>
					</div>
					<!-- 또는 -->
					<div class="login__horizon">
						<div class="br"></div>
						<div class="or">또는</div>
						<div class="br"></div>
					</div>
					<!-- 또는end -->

					<!-- Oauth 소셜로그인 -->
					<div class="login__facebook">
						<button onclick="javascript:location.href=''">
							<i class="fab fa-facebook-square"></i> <span>Facebook으로
								로그인</span>
						</button>
					</div>
					<!-- Oauth 소셜로그인end -->
				</div>

				<!--계정이 없으신가요?-->
				<div class="login__register">
					<span>계정이 없으신가요?</span> <a href="${cpath }/users/join">가입하기</a>
				</div>
				<!--계정이 없으신가요?end-->
			</article>
		</section>
		</main>

	</div>

	<!-- 아이디와 비번입력시에만 로그인버튼 색갈표시 -->
	<script>
	const inputPhoneNumber = document.querySelector("#id");
	const inputPassword = document.querySelector("#pw");
	const button = document.querySelector(".btn");

	function loginBtn() {
		let idValue = inputPhoneNumber.value;
		let passwordValue = inputPassword.value;

		if (idValue.length > 0 && passwordValue.length > 0) {
			button.disabled = false;
			button.style.cursor = "pointer";
			button.style.backgroundColor = "#1c7ed6";
		} else {
			button.disabled = true;
			button.style.cursor = "default";
			button.style.backgroundColor = "#bfdffd";
		}
	};

	inputPhoneNumber.addEventListener('keyup', loginBtn);
	inputPassword.addEventListener('keyup', loginBtn);
</script>

</body>
</html>