 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style type="text/css">
/* ------인포 모디파이 스타일--------*/
#info_submit_btn {
	border: none;
	background-color: rgb(0, 149, 246);
	width: 131px;
	color: rgb(255, 255, 255);
	margin-bottom: 26px;
}

#introduce>textarea {
	resize: vertical;
	width: 217px;
	height: 75px;
	max-height: 174px;
	border: 2px solid rgb(85, 85, 85);
	min-height: 75px;
}

.info_gender  select {
	background: transparent;
	border-radius: 3px;
	box-sizing: border-box;
	color: rgb(250, 250, 250);
	flex: 0 1 355px;
	font-size: 16px;
	height: 32px;
	padding: 0 10px;
	width: 217px;
	border: 1px solid rgb(85, 85, 85);
}

/* 모든 a태그 설정*/
a {
	text-decoration: none;
	color: white;
}

/* 사이드 바 */
.info_side {
	height: 887px;
	width: 236px;
	border: 1px solid rgb(85, 85, 85);
}

.info_side>div {
	width: 238px;
	height: 51px;
	display: block;
	text-align: center;
	line-height: 3;
	cursor: pointer;
}

/* 섹션 탑 flex화 */
.info_section_top {
	display: flex;
	margin: 40px 0 40px 0;
	align-items: center;
}

/* 섹션 이미지 div설정 */
.info_section_top>:nth-child(1) {
	width: 194px;
	padding-right: 36px;
	text-align: right;
	box-sizing: border-box;
}

.info_side>div:nth-child(2) {
	border-left: 3px solid rgb(219, 219, 219);
}

.info_side>div:nth-child(1):hover {
	border-left: 3px solid rgb(219, 219, 219);
}

.info_submit_ {
	display: flex;
	justify-content: space-between;
	width: 374px;
}

/* 개인정보 섹션*/
.info_section {
	border: 1px solid rgb(85, 85, 85);
	width: 599px;
	height: 887px;
}

/*폼안에 div들 flex화 */
.info_section_main>form>div {
	display: flex;
	margin: 60px 0 60px 0;
}

/* 섹션 테그*/
.info_section_main>form>div>:nth-child(1) {
	width: 194px;
	text-align: right;
	padding-right: 36px;
	box-sizing: border-box;
	font-weight: bold;
}

.info_section_main input, textarea {
	width: 355px;
	background: transparent;
	border-radius: 3px;
	box-sizing: border-box;
	color: rgb(250, 250, 250);
	flex: 0 1 355px;
	font-size: 16px;
	height: 32px;
	padding: 0 10px;
	width: 100%;
	border: 1px solid rgb(85, 85, 85);
}

.info_submit_ a {
	color: #0095f6;
	font-weight: bold;
}

.info_top_img>img {
	width: 40px;
	border-radius: 30px;
}

.info_name {
	margin-bottom: 10px
}

.err {
	color: red;
	font-size: 12px;
}

.hidden {
	display: none;
	visibility: hidden;
}
/* ------인포 모디파이 스타일 end--------*/
</style>
</head>
<body>

	<script type="text/javascript">
// 비밀번호 유효성 확인
function pwCheckHandler() {
    let pw_sub_err = document.querySelector('.pw_sub_err')
    let pw_check = newPw.value
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
  const pw_subVal = newPw.value
  if(pw.value != pw_subVal){
    pw_err.innerText = '비밀번호가 일치하지 않습니다'
    return false
  }
  else{
    pw_err.innerText = ''
    return true
  }
}

//모든 값 확인
function allCheck(){
	 if(pwCheckHandler() == false){
		alert('비밀번호를 확인해주세요')
		pw_sub.focus()
		return false
	}else if(pwEqulsCheck() == false){
		alert('비밀번호가 일치하지 않습니다')
		pw.focus()
		return false
	}else {
		return true
	}
	
}
</script>

	<div class="all_wrap">

		<div class="main_wrap">

			<!-- 사이드 탭-->
			<div class="info_side">
				<div>
					<a href="${cpath }/users/infoModify">프로필 편집</a>
				</div>
				<div>비밀번호 변경</div>
			</div>
			<!-- 사이드 탭 end-->

			<div class="info_section">

				<!-- 상단 프로필 이미지 와 닉네임 사진변경 -->
				<div class="info_section_top">

					<div class="info_top_img">
						<img src="${cpath }/resources/img/${login.user_img }">
					</div>

					<div>
						<div class="ingo_top_right">
							<div class="info_nickName">${login.nick_name }</div>
						</div>
					</div>
				</div>
				<!-- 상단 프로필 이미지 와 닉네임 사진변경 end-->

				<!-- form문 html코드-->
				<div class="info_section_main">
					<form action="${cpath }/users/infoModify_replacePw" method="POST">

						<div class="info_name">
							<div>이전 비밀번호</div>
							<div>
								<input type="password" name="old_pw" required>
							</div>
						</div>

						<div class="info_name">
							<div>새 비밀번호</div>
							<div>
								<div>
									<input type="password" name="newPw" required>
								</div>
								<div class="pw_sub_err err"></div>
							</div>
						</div>

						<div class="info_name">
							<div>새 비밀번호 재확인</div>
							<div>
								<div>
									<input type="password" name="pw" required>
								</div>
								<div class="pw_err err"></div>
							</div>
						</div>

						<div class="info_submit_">
							<div></div>
							<div>
								<div>
									<input id="info_submit_btn" type="submit" value="비밀번호 변경"
										onclick="return allCheck()">
								</div>
								<div>
									<a href="${cpath }/users/findPw">비밀번호를 잊으셨나요?</a>
								</div>
							</div>
						</div>


					</form>
				</div>
				<!-- form문 html코드 end-->

			</div>
		</div>
	</div>

	<!-- jquery 라이브러리 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script type="text/javascript">
		// 비밀번호 유효성 확인
		const newPw = document.querySelector('input[name="newPw"]') 
	  	newPw.onblur = pwCheckHandler
		  const pw = document.querySelector('input[name="pw"]')
		  const pw_err = document.querySelector('.pw_err')
  
	  	function newPwRemoveText() {
			$('.pw_sub_err').text('')
		}
	  	
	  	newPw.onkeyup = newPwRemoveText
	  	
	  	function PwRemoveText() {
			$('.pw_err').text('')
		}
	  	
	  	pw.onkeyup = PwRemoveText
	  	
	  // 비밀번호 일치확인
	  pw.onblur = pwEqulsCheck
	  
	  const old_pw_ment = '${infoModify_replacePw_msg}'
	  if(old_pw_ment != ''){
		  alert(old_pw_ment)
	  }
	  
	  
		  
  </script>

</body>
</html>