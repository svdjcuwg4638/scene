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
	        url: cpath + '/nickNameCheck', //Controller에서 요청 받을 주소
	        type: "post", //POST 방식으로 전달
	        data: {nick_name : nick_name},
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

// 모달 스크립트
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

// 닉네임 중복체크 스크립트
const nick_name = document.querySelector('input[name="nick_name"]')
const nick_name_err = document.querySelector('.nick_name_err')
$('input[name="nick_name"]').keyup(nick_name_Check)

// 자기소개 글 갯수 카운트
const introduce = document.querySelector('textarea[name="introduce"]')
const lengthCount = document.querySelector('.length_count')

function lengthCountHandler() {
	let count = introduce.value.length
	lengthCount.innerText = count
}

introduce.onkeyup = lengthCountHandler
lengthCountHandler()

// 이메일 형식 확인
const email = document.querySelector('input[name="email"]')
const email_err_ment = document.querySelector('.email_err')
email.onblur = emailCheck

// 회원 탈퇴
const withdraw = document.querySelector('.withdraw')	

function withdrawHandler(event) {
	event.preventDefault()
	if (confirm("회원 탈퇴시 돌이킬수 없습니다. 정말 탈퇴하시겠습니까??")) {
		alert('회원 탈퇴하셨습니다.')
	    location.href= cpath + "/users/withdraw"
	} else {
	    return false;
	}
}		

withdraw.onclick = withdrawHandler

// 프로필 사진 수정 스크립트
function profileAddFormHandler(event) {
    event.preventDefault();
    let profile_img_form_data = document.querySelector('.profile_img_form');
    let formData = new FormData(profile_img_form_data);
    fetch(cpath + '/users/profileImgModify', {
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


