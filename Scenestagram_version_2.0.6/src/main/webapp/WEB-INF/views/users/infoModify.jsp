<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style type="text/css">
/* ------인포 모디파이 스타일--------*/
#info_submit_btn {
	border: none;
	background-color: rgb(0, 149, 246);
	width: 66px;
	color: rgb(255, 255, 255);
	cursor: pointer;
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
}

/* 섹션 이미지 div설정 */
.info_section_top>:nth-child(1) {
	width: 194px;
	padding-right: 36px;
	text-align: right;
	box-sizing: border-box;
}

.info_side>div:nth-child(1) {
	border-left: 3px solid rgb(219, 219, 219);
}

.info_side>div:nth-child(2):hover {
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
	height:40px;
	border-radius: 30px;
}

.info_introduce_count {
	display: flex;
}

option {
	color: black;
}

.err {
	color: red;
	font-size: 12px;
}

/* ---infoModify 모달 ---*/
.modal_bg {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	background-color: rgba(0, 0, 0, 0.6);
	z-index: 999;
}

.modal_wrap {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 400px;
    height: 223px;
    z-index: 1000;
    border-radius: 20px;
   	background: rgb(38,38,38);
}

.modal_foot div {
	width: 100%;
}

button {
	border: none;
	background-color: white;
	width: 100%;
	height: 54px;
	font-size: 17px;
	border-top: 1px solid #dadada;
}


.modal_tip {
	font-size: 20px;
	height: 36px;
	color: #000;
	font-weight: 600;
}


.hidden {
	display: none;
}

.modal_img>img {
	width: 73px;
	margin-top: 10px;
}
/* ---infoModify 모달 end ---*/



.info_change_img{
	color: #0095f6;
	font-weight: bold;
	cursor: pointer;
}
.info_change_img:hover{
	color: #fff;
}
#profile_add_file{	
	display: none;
}

.profile_add_img_file_input > label {
	color: #0095f6;
	padding: 14px 158px;
    cursor: pointer;
}
.modal_img_delete > div{
	color: #ed4956;
	font-weight: bold;
}

.modal_wrap *{
	text-align: center;
}
.modal_wrap > div{
	height: 48px;
	line-height: 3;
	border-bottom: 0.5px solid #888;
	font-weight: bold;
	cursor: pointer;
}
.modal_wrap > div:nth-child(1) {
	height: 80px;
	line-height: 5;
	cursor: default;
}
.modal_wrap > div:last-child {
	border: none;
}
.modal_wrap > div:nth-child(3){
	color: #ed4956;
}
/* ------인포 모디파이 스타일 end--------*/
</style>
</head>
<body>


	<script type="text/javascript">
// 닉네임 중복 , 공백 , 길이 확인
let nick_name_flag = false
var nick_name_Check = function()	{
    let nick_name=$('input[name="nick_name"]').val();  //id값이 "id"인 입력란의 값을 저장
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
   }else if(nick_name == '${login.nick_name}'){
   	$('.nick_name_err').text('')
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
	}else if(nick_name_Check() == false){
		alert('닉네임을 확인해주세요')
		nick_name.focus()
		return false
	}else {
		alert('프로필이 수정되었습니다.')
		return true
	}
	
}
</script>



	<div class="all_wrap">

		<div class="main_wrap">

			<!-- 사이드 탭-->
			<div class="info_side">
				<div>프로필 편집</div>
				<div>
					<a href="${cpath }/users/infoModify_replacePw">비밀번호 변경</a>
				</div>
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
							<div class="info_change_img">프로필 사진 바꾸기</div>
						</div>
					</div>
				</div>
				<!-- 상단 프로필 이미지 와 닉네임 사진변경 end-->

				<!-- form문 html코드-->
				<div class="info_section_main">
					<form action="${cpath }/users/infoModify" method="POST">

						<input type="hidden" name="idx" value="${login.idx }">
						<div class="info_name">
							<div>이름</div>
							<div>
								<input type="text" name="name" value="${login.name }" readonly>
							</div>
						</div>

						<div class="info_ncikName">
							<div>닉네임</div>
							<div>
								<input type="text" name="nick_name" value="${login.nick_name }">
								<div class="nick_name_err err"></div>
							</div>

						</div>

						<div class="info_introduce">
							<div>소개</div>
							<div id="introduce">
								<textarea maxlength="150" spellcheck="false" name="introduce">${login.introduce }</textarea>
								<div class="info_introduce_count">
									<div class="length_count"></div>
									/150
								</div>
							</div>
						</div>

						<div class="info_email">
							<div>이메일</div>
							<div>
								<div>
									<input type="text" name="email" value="${login.email }">
								</div>
								<div class="email_err err"></div>

							</div>
						</div>

						<div class="info_phoneNumber">
							<div>전화번호</div>
							<div>
								<input type="text" name="phone_number"
									value="${login.phone_number}" readonly>
							</div>
						</div>

						<div class="info_gender">
							<div>성별</div>
							<div>
								<select name="gender">
									<option disabled value="">성별</option>
									<option value="남성" ${login.gender=='남성' ? 'selected' : '' }>남자</option>
									<option value="여성" ${login.gender=='여성' ? 'selected' : '' }>여자</option>
								</select>
							</div>
						</div>

						<div>
							<div></div>
							<div class="info_submit_">
								<div>
									<input id="info_submit_btn" type="submit"
										onclick="return allCheck()">
								</div>
								<div>
									<a href="" class="withdraw">계정 비활성화</a>
								</div>
							</div>

						</div>

					</form>
				</div>
				<!-- form문 html코드 end-->

			</div>
		</div>
	</div>
	<!--  모달  -->
	<div class="modal_bg hidden"></div>
	<div class="modal_wrap hidden">
		<div>프로필 사진 바꾸기</div>
		<div class="info_img_modify">
			<form action="" class="profile_img_form">
			  <div class="profile_add_img_file_input">
			    <label for="profile_add_file">사진 업로드</label>
			    <input id="profile_add_file" type="file" name="profileimageFile" onchange="profileAddFormHandler(event);">
			  </div>
			</form>
		</div>
		<div class="modal_img_delete">현재 사진 삭제</div>
		<div class="modal_foot_btn">취소</div>
	</div>


	<!--  회원 탈퇴   -->
	<script type="text/javascript">
		const withdraw = document.querySelector('.withdraw')	
		
		function withdrawHandler(event) {
			event.preventDefault()
			if (confirm("회원 탈퇴시 돌이킬수 없습니다. 정말 탈퇴하시겠습니까??")) {
				alert('회원 탈퇴하셨습니다.')
			    location.href="${cpath}/users/withdraw"
			} else {
			    return false;
			}
		}
		
		
		withdraw.onclick = withdrawHandler
	</script>


	<!--  프로필 사진 수정 스크립트 -->
	<script type="text/javascript">
	  function profileAddFormHandler(event) {
	    event.preventDefault();
	    let profile_img_form_data = document.querySelector('.profile_img_form');
	    let formData = new FormData(profile_img_form_data);
	    fetch('${cpath}/users/profileImgModify', {
	      method: "POST",
	      body: formData
	    }).then(resp => resp.text())
	      .then(text => {
	        console.log(text); // 업로드 된 파일 경로 확인
	        alert('사진이 변경되었습니다.');
	        location.reload(); // 페이지 새로고침
	      });
	  }
	  
	  // 사진 삭제시 기본이미지로 돌아감
		const  modal_img_delete = document.querySelector('.modal_img_delete')
		
		modal_img_delete.onclick = profileAddFormHandler
	  
	</script>
	<!--  모달  end -->

	<!-- jquery 라이브러리 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- 모달 스크립트 -->
	<script>
    	const modal_bg = document.querySelector('.modal_bg')
    	const modal_wrap = document.querySelector('.modal_wrap')
    	const info_change_img = document.querySelector('.info_change_img')
    	const modal_foot_btn = document.querySelector('.modal_foot_btn')
    	
    	function info_modalHandelr() {
			modal_bg.classList.remove('hidden')
			modal_wrap.classList.remove('hidden')
		}
    	
    	info_change_img.onclick = info_modalHandelr
    	
    	function info_closeModalHandler() {
			modal_bg.classList.add('hidden')
			modal_wrap.classList.add('hidden')
		}
    	
    	modal_foot_btn.onclick = info_closeModalHandler
    	modal_bg.onclick = info_closeModalHandler
    	

    </script>

	<!-- 모달 스크립트  end-->

	<!-- 이미지 변경 스크립트 -->
	<script>

	</script>
	<!-- 닉네임 중복체크 스크립트 -->
	<script>
	const nick_name = document.querySelector('input[name="nick_name"]')
	const nick_name_err = document.querySelector('.nick_name_err')
	$('input[name="nick_name"]').keyup(nick_name_Check)
    </script>

	<!-- 자기소개 글 갯수 카운트 -->
	<script>
    	const introduce = document.querySelector('textarea[name="introduce"]')
    	const lengthCount = document.querySelector('.length_count')
    	
    	function lengthCountHandler() {
			let count = introduce.value.length
			lengthCount.innerText = count
		}
    	
    	introduce.onkeyup = lengthCountHandler
    	lengthCountHandler()
    </script>

	<!-- 이메일 형식 확인 -->
	<script type="text/javascript">
	    const email = document.querySelector('input[name="email"]')
	    const email_err_ment = document.querySelector('.email_err')
	    email.onblur = emailCheck
	</script>
</body>
</html>