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

<script type="text/javascript">
	const gender = document.querySelector('select[name="gender"]')
	// 닉네임 중복 , 공백 , 길이 확인
	let nick_name_flag = false
	var nick_name_Check = function()	{
	    let nick_name=$('#nick_name').val();  //id값이 "id"인 입력란의 값을 저장
	    // ajax에서 return으로 값을 반환시 ajax안에서만 반환하게된다 그러니 
	    // ajax밖에서 함수를 선언하고 안에서 값조정을하여 밖에서 값을 return해주자.
	    
	    if(nick_name.match(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/)){
	    	$('.nick_name_err').text('한글을 입력할수 없습니다.')
	    	return false
	    }
	    else if(nick_name.match(/\s/g) != null) {
       		$('.nick_name_err').text('공백을 포함할 수 없습니다.')
              return false
     	}	    
       	else if (nick_name.length < 6 || nick_name.length > 21) {
       		$('.nick_name_err').text('닉네임은 7자이상 20자이하여야 합니다.')
           return false
       } 
       else{

		    $.ajax({
		        url:'${cpath}/nickNameCheck', //Controller에서 요청 받을 주소
		        type:"post", //POST 방식으로 전달
		        data:{nick_name : nick_name},
		        dataType : 'json',
		        async : false,
		        
		        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
		            if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
		            	$('.nick_name_err').text('');
		            	nick_name_flag = true
		            } 
		            else { // cnt가 1일 경우 -> 이미 존재하는 아이디
		               $('.nick_name_err').text('이미 존재하는 닉네임입니다.');
		            	nick_name_flag = false
		            }
		        },
		        error:function(){
		            alert("서버요청오류");
		        }
			})
			return nick_name_flag
       }
	    
	}
	
	// 전화번호 중복 길이 숫자만 확인
	let phone_number_flag = false
	var phone_number_Check = function()	{
	    let phoneNumber=$('#phone_number').val(); 

       	if (!phoneNumber.match(/^[0-9]+$/)) {
          	$('.phone_number_err').text('숫자만 입력하셔야합니다.')
              return false
     	} 
       	else if (phone_number.value.length < 10 || phone_number.value.length > 11) {
       		$('.phone_number_err').text('전화번호 길이가 옳지않습니다.')
           return false
       } 
       else{

		    $.ajax({
		        url:'${cpath}/phoneNumberCheck', //Controller에서 요청 받을 주소
		        type:"post", //POST 방식으로 전달
		        data:{phoneNumber : phoneNumber},
		        dataType : 'json',
		        async : false,
		        
		        
		        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
		            if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
		            	$('.phone_number_err').text('');
		            	phone_number_flag = true
		            } 
		            else { // cnt가 1일 경우 -> 이미 존재하는 아이디
		               $('.phone_number_err').text('이미 사용중인 전화번호입니다.');
		            	phone_number_flag = false
		            }
		        },
		        error:function(){
		            alert("서버요청오류");
		        }
			})
			return phone_number_flag
       }
	    
	}
	
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
	
	//email형식 확인
	function emailCheck(){
      const reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/
      if(email.value.match(reg_email)==null){
        email_err_ment.innerText = '이메일형식이 올바르지 않습니다.'
        email.style.border ='3px solid red'
        return false
      }
      else{
        email_err_ment.innerText=''
        email.style.border ='1px solid rgba(var(--ca6, 219, 219, 219), 1)'
        return true
      }
    }
	

	
	//모든 값 확인
	function allCheck(){
		if(emailCheck() == false){
			alert('이메일을 확인해주세요')
			email.focus()
			return false
		}else if(pwCheckHandler() == false){
			alert('비밀번호를 확인해주세요')
			pw_sub.focus()
			return false
		}else if(pwEqulsCheck() == false){
			alert('비밀번호가 일치하지 않습니다')
			pw.focus()
			return false
		}else if(nick_name_Check() == false){
			alert('닉네임을 확인해주세요')
			nick_name.focus()
			return false
		}else if(phone_number_Check() == false){
			alert('전화번호를 확인해주세요')			
			phone_number.focus()
			return false
		}
		else if(gender !== null){
			if(gender.selectedIndex === 0){
				alert('성별을 선택해주세요')
				gender.focus()		
			return false
			}
		}else {
			alert($('#nick_name').val() +'님 환영합니다 가입되셨습니다.')
			return true
		}
		
	}
	
	
</script>
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

				<div class="logo_ment">
					<h3>
						친구들의 사진과 동영상을 보려면<br> 가입하세요.
					</h3>
				</div>

				<!-- Oauth 소셜로그인 -->
				<div class="login__facebook">
					<button onclick="javascript:location.href=''">
						<i class="fab fa-facebook-square"></i> <span>Facebook으로 로그인</span>
					</button>
				</div>
				<!-- Oauth 소셜로그인end -->

				<!-- 또는 -->
				<div class="login__horizon">
					<div class="br"></div>
					<div class="or">또는</div>
					<div class="br"></div>
				</div>
				<!-- 또는end -->

				<!--로그인 인풋-->
				<form id="join_form" class="login__input"
					action="${cpath }/users/join" method="POST">
					<input type="text" id="id" name="email" placeholder="이메일 주소"
						required>
					<div class="email_err"></div>
					<input type="password" name="pw_sub" placeholder="비밀번호 입력" required>
					<div class="pw_sub_err"></div>
					<input type="password" name="pw" placeholder="비밀번호  다시 입력" required>
					<div class="pw_err"></div>
					<input type="text" id="name" name="name" placeholder="성명"
						required="required" /> <input type="date" id="birth" name="birth"
						required="required" /> <select name="gender" required>
						<option selected disabled value="">성별</option>
						<option value="남성">남자</option>
						<option value="여성">여자</option>
					</select> <input type="text" id="nick_name" name="nick_name"
						placeholder="사용할 닉네임" required="required">
					<div class="nick_name_err"></div>
					<input type="text" id="phone_number" name="phone_number"
						placeholder="휴대전화 (-없이)" required>
					<div class="phone_number_err"></div>
					<button id="join_btn" class="join_btn" onclick="return allCheck()">가입</button>
				</form>
				<!--로그인 인풋end-->
			</div>

			<!--계정이 있으신가요?-->
			<div class="login__register">
				<span>계정이 있으신가요?</span> <a href="${cpath }/users/login">로그인</a>
			</div>
			<!--계정이 없으신가요?end-->
		</article>
	</section>
	</main>
</div>


<!-- jquery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



<!-- script기능 -->
<script type="text/javascript">
	//닉네임 중복확인
	const nick_name = document.querySelector('#nick_name')
	const nick_name_err = document.querySelector('.nick_name_err')
	$('#nick_name').keyup(nick_name_Check)
	
	
	
	// 비밀번호 유효성 확인
	const pw_sub = document.querySelector('input[name="pw_sub"]') 
    pw_sub.onblur = pwCheckHandler
    
    // 비밀번호 일치확인
    const pw = document.querySelector('input[name="pw"]')
    const pw_err = document.querySelector('.pw_err')
    pw.onblur = pwEqulsCheck
    
    // email형식 확인
    const email = document.querySelector('input[name="email"]')
    const email_err_ment = document.querySelector('.email_err')
    email.onblur = emailCheck
    
    // 전화번호 중복, 숫자만 길이확인
	$('#phone_number').keyup(phone_number_Check)
    

	
</script>
<!-- script기능 end -->

</body>
</html>