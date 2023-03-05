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
	        url: cpath + '/phoneNumberCheck', //Controller에서 요청 받을 주소
	        type: "post", //POST 방식으로 전달
	        data: {phoneNumber : phoneNumber},
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
	}else {
		alert($('#nick_name').val() +'님 환영합니다 가입되셨습니다.')
		return true
	}
	
}

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