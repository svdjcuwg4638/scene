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

const ph_num = document.querySelector('input[id="phnum"]')

function hiddenPhNumberHandler(event){
	const phone_number = document.querySelector('input[id="phoneNumber"]')
	phone_number.value = event.target.value
}

ph_num.onkeyup = hiddenPhNumberHandler

const sendForm = document.forms[0]
function sendEmailHandler(event){
	event.preventDefault()
	const email = document.querySelector('input[name="email"]').value
	const url = cpath + '/sendAuthNumber'
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

const checkForm = document.forms[1]
checkForm.onsubmit = function(event){
	event.preventDefault()


	const ob ={

	 	email : document.querySelector('input[id="email"]').value,
	 	
 		authNumber : document.querySelector('input[name="authNumber"]').value,
 		
	}
		
	const url = cpath + '/sendAuthNumber'
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