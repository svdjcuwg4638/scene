<%@ page language="java" contentType="text/html; charset=UTF-8"
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

				<!--이메일 인풋-->
				<form class="login__input" method="GET" id="emailInput">
					<h3>비밀번호를 찾으실 건가요?</h3>
					<div id="findPw_tip">
						<br> 이메일주소를 입력 하시면 이메일주소로 인증 코드를 보내드립니다.
					</div>
					<input type="text" id="phnum" name="phone_number"
						placeholder="전화번호입력 (-없이)" required> <input type="text"
						id="email" name="email" placeholder="이메일을 입력하세요" required /> <input
						class="btn_findPw_style" type="submit" value="인증 번호 발송">
				</form>
				<!--이메일 인풋 end-->

				<!-- 이메일 인증 코드 인풋 -->
				<form class="login__input hidden" id="check">
					<h3>이메일 인증</h3>
					<br>
					<div id="email_tip">발송받은 이메일에 인증코드를 입력해주세요.</div>
					<br> <input type="text" name="authNumber"
						placeholder="인증번호를 입력하세요" required /> <input
						class="btn_findPw_style" type="submit" value="인증">
				</form>
				<!-- 이메일 인증 코드 인풋 end -->

				<!--  인증후 변경할 비번 입력 -->
				<form class="login__input hidden" id="replacePw"
					action="${cpath }/users/replacePw">
					<div id="pw_tip_main">
						<h3>보안 수준이 높은 비밀번호 만들기</h3>
					</div>
					<div id="pw_tip_sub">비밀번호는 6자 이상이어야 하고 숫자,영문,특수기호( ! $ @ % )의
						조합을 포함해야 합니다.</div>
					<input type="hidden" id="phoneNumber" name="phone_number" value="">
					<input type="password" name="pw_sub" placeholder="새 비밀번호 입력"
						required>
					<div class="pw_sub_err"></div>
					<input type="password" name="pw" placeholder="새 비밀번호  다시 입력"
						required>
					<div class="pw_err"></div>
					<input class="btn_findPw_style" type="submit" value="비밀번호 재설정"
						onclick="return allCheck()">
				</form>
				<!--  인증후 변경할 비번 입력 -->

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

<!-- 비밀번호 재설정 형식,일치 확인 -->
<script type="text/javascript">
	
	const pw_sub = document.querySelector('input[name="pw_sub"]') 
	pw_sub.onblur = pwCheckHandler
	
	// 비밀번호 일치확인
	const pw = document.querySelector('input[name="pw"]')
	const pw_err = document.querySelector('.pw_err')
	pw.onblur = pwEqulsCheck
	
	// 비밀번호 유효성 확인
	function pwCheckHandler() {
	    let pw_sub_err = document.querySelector('.pw_sub_err')
	    let pw_check = pw_sub.value
	    if (pw_check.length < 8 || pw_check.length > 20) {
	        pw_sub_err.innerText = '8자리 ~ 20자리 이내로 입력해주세요.'
	        return false
	    } 
	    else if (pw_check.match(/\s/g)) {
	        pw_sub_err.innerText ='비밀번호는 공백 없이 입력해주세요.'
	        return false
	    } 
	    else if (pw_check.match(/^(?=.*?[0-9])(?=.*?[!@#$])(?=.*?[a-z]).{1,20}$/) == null) {
	        pw_sub_err.innerText ='영문,숫자,특수문자(!@#$)를 혼합하여 입력해주세요.'
	        return false
	    } 
	    else{
	      pw_sub_err.innerText=''
	    	  return true
	    }
	}
	
	//비밀번호 일치 확인
	function pwEqulsCheck(){
	  const pw_subVal = pw_sub.value
	  if(pw.value != pw_subVal){
	    pw_err.innerText = '비밀번호가 일치하지 않습니다'
	    return false
	  }
	  else{
	    pw_err.innerText = ''
	    return true
	  }
	}
	
	function allCheck(){
		if(pwCheckHandler() == false){
			alert('비밀번호를 확인해주세요')
			pw_sub.focus()
			return false
		}else if(pwEqulsCheck() == false){
			alert('비밀번호가 일치하지 않습니다')
			pw.focus()
			return false
		}else{
	      alert('비밀번호가 수정되었습니다 로그인 해주세요.')
			return true
		}
	}
	
</script>

<!-- 비밀번호 입력시 히든에 추가 코드 -->
<script>

	const ph_num = document.querySelector('input[id="phnum"]')
	
	function hiddenPhNumberHandler(event){
		const phone_number = document.querySelector('input[id="phoneNumber"]')
		phone_number.value = event.target.value
	}
	
	ph_num.onkeyup = hiddenPhNumberHandler
	
</script>
<!-- 비밀번호 입력시 히든에 추가 코드 end-->

<!-- 이메일 보내기 -->
<script>

	const sendForm = document.forms[0]
	function sendEmailHandler(event){
		event.preventDefault()
		const email = document.querySelector('input[name="email"]').value
		const url = '${cpath}/sendAuthNumber'
		const phone_number = document.querySelector('input[id="phnum"]').value
		
		fetch(url + '?email=' +email + '&phone_number=' + phone_number)
		.then(resp => resp.text())
		.then(text=>{
			if(text != 0){
				document.getElementById('emailInput').classList.add('hidden')
				document.getElementById('check').classList.remove('hidden')
				alert('인증번호가 발송되었습니다. 메일을 확인해주세요')
				
			}else{
				alert('찾을수 없는 사용자입니다.')
			}	
		})
		.catch(ex => {	
			console.log(ex)
		})
	}
	
	sendForm.onsubmit = sendEmailHandler
	
</script>

<!-- 이메일 인증 -->
<script type="text/javascript">
	const checkForm = document.forms[1]
	checkForm.onsubmit = function(event){
		event.preventDefault()


		const ob ={
	
		 	email : document.querySelector('input[id="email"]').value,
		 	
	 		authNumber : document.querySelector('input[name="authNumber"]').value,
	 		
		}
			
		const url ='${cpath}/sendAuthNumber'
		const opt = {
				method : 'POST',
				body: JSON.stringify(ob), // JSON형식의 문자열로 변환하여 전달
				headers : {
					'Content-Type':'application/json; charset=utf-8'
				}
		}
		fetch(url,opt)
		.then(resp => resp.text())
		.then(text=>{
			console.log(text)
			if(text == 1){
				alert('인증이 완료되었습니다')
				document.getElementById('check').classList.add('hidden')
				document.getElementById('replacePw').classList.remove('hidden')
			}
			else{
				alert('인증번호가 일치하지 않습니다. 다시 확인해주세요')
			}
		})
	}
</script>

</body>
</html>