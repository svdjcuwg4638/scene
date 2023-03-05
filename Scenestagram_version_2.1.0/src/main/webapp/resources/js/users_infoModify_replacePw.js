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

//비밀번호 유효성 확인
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