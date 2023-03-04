'use strict'

//const webSocket = new WebSocket('ws://' + serverName + cpath + '/chat')
//const webSocket = new WebSocket('ws://221.164.9.200/ws06/chat')

const main = document.querySelector('.main')
const btn = document.getElementById('btn')
const send = document.getElementById('send')
const textarea = document.getElementById('textarea')
const quit = document.getElementById('quit')
const hamburger = document.getElementById('hamburger')
const right = document.querySelector('.right')
const userList = document.querySelector('.userList')
const overlay = document.querySelector('.overlay')
const aside = document.querySelector('.aside')
const ws = new SockJS(cpath + '/chat?id=' + username, null, {sessionId: generateSessionId}) // 스프링에서 지정한 주소에 대한 컴포넌트를 작성해야 한다

console.log(ws)

function generateSessionId() {
	return username + '_' + new Date().getTime()
}

ws.onmessage = onMessage
ws.onopen = onOpen
ws.onclose = onClose
ws.onerror = function(msg) {}

btn.onclick = sendHandler // 버튼을 클릭하면 보내는 함수를 호출한다
send.onkeydown = keyHandler // 엔터버튼 누르면 보내는 함수로 연결한다
quit.onclick = quitHandler 	// 나가기 버튼 누르면 종료 함수를 호출한다
hamburger.onclick = hamburgerHandler
overlay.onclick = overlayHandler
//window.onload = loadPeopleHandler

// 웹소켓 내부에서 사용할 함수를 정의하는 영역
function onMessage(event) { // 메시지를 받으면 수행하는 자바스크립트 함수
	const wrap = document.createElement('div')
	const name = document.createElement('div')
	const message = document.createElement('span')

	name.innerText = JSON.parse(event.data).username
	const flag = JSON.parse(event.data).message.includes('http://') || 
				 JSON.parse(event.data).message.includes('https://')|| 
				 JSON.parse(event.data).message.includes('www')

	// 채팅 내용이 웹 주소라면 링크형식으로 만드는 조건
	if (flag) {
		message.innerHTML = '<a class="link" href="'
				+ JSON.parse(event.data).message + '" target="_blank">'
				+ JSON.parse(event.data).message + '</a>'
	} 
	else {
		message.innerText = JSON.parse(event.data).message
	}
	name.classList.add('name')
	message.classList.add('message')

	wrap.appendChild(name)
	wrap.appendChild(message)
	
	// self, other, alarm 처리하기
	wrap.classList.add(name.innerText == 'alarm' ? 'alarm' : name.innerText == username ? 'self' : 'other')
	if(wrap.className == 'alarm') {
		loadPeopleHandler()
	}
	
	// 1:1 대화인 경우도 가정
	const recipient = JSON.parse(event.data).recipient
	if(recipient != undefined) {
		const existModals = document.querySelectorAll('.chatToTarget')
		let targetModal
		
		if(existModals.length == 0) {
			create1on1Modal(null, name.innerText)
			targetModal = document.getElementsByClassName('chatToTarget')[0]
		}
		else {
			for(let i = 0; i < existModals.length; i++) {
				const modalName = existModals[i].querySelector('span').innerText
				if(name.innerText == modalName) {							// 메시지 보낸사람이 모달의 이름과 일치하면
					targetModal = existModals[i]
					break
				}
				if(name.innerText == username && recipient == modalName) {	// 메시지 보낸사람이 내 이름과 일치하면
					targetModal = existModals[i]
					break
				}
			}
		}
//		console.log({targetModal: targetModal.querySelector('span').innerText})
		targetModal.style.display = 'block'
		targetModal.querySelector('.send').focus()
		targetModal.querySelector('.textarea').appendChild(wrap)
		targetModal.querySelector('.textarea').scroll({
			top : targetModal.querySelector('.textarea').scrollHeight,
			behavior : 'smooth'
		})
		console.log(textarea.scrollHeight)
//		console.log(targetModal.querySelector('.textarea').scrollHeight, targetModal.querySelector('.textarea').clientHeight )
	}
	else {
		textarea.appendChild(wrap)
		textarea.scroll({
			top : textarea.scrollHeight,
			behavior : 'smooth'
		})
		// 메시지를 받으면 높이만큼 계산해서 부드럽게 스크롤 이동시키기
	}
}

function loadPeopleHandler(event) {
	setTimeout(500)
	const url = cpath + '/chat/loadPeople'
	const opt = {
		method: 'GET'
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		userList.innerHTML = ''
		for(let i = 0; i < json.length; i++) {
			const div = document.createElement('div')
			div.innerText = json[i]
			div.classList.add('peopleName')
			userList.appendChild(div)
			div.addEventListener('click', create1on1Modal)
		}
	})
}

function onOpen(event) {
//	ws.send(JSON.stringify({
//		username : 'alarm',
//		message : username + ' 님이 입장하였습니다(JS).'
//	}))
}

function onClose(event) {
}

function quitHandler(event) {
//	ws.send(JSON.stringify({
//		username : 'alarm',
//		message : username + ' 님이 퇴장하였습니다.'
//	}))
	ws.close()
	location.replace(cpath + '/logout')
}

function keyHandler(event) {
	if (event.key == 'Enter') {
		sendHandler(event)
	}
}

function overlayHandler(event) {
	overlay.classList.add('hidden')
	right.style.right = '0px'
}

function hamburgerHandler(event) {
	loadPeopleHandler()
	const pos = right.style.right
	if(pos == '152px') {
		overlay.classList.add('hidden')
		right.style.right = '0px'
	}
	else {
		overlay.classList.remove('hidden')
		right.style.right = '152px'
	}
}

function insertHandler() {
	const ob = {
		room_idx: roomIdx,
		writer_idx: writerIdx,
		content: send.value
	}
	console.log(ob)
	const url = cpath + '/chat/addMessage'
	const opt = {
		method: 'POST',
		body: JSON.stringify(ob),
		headers: {
			'Content-Type': 'application/json; charset=utf-8'
		}
	}
	
	fetch(url, opt)
	.then(resp => resp.text())
	.then(text => {
		
	})
}

function sendHandler(event) { // 메시지를 보내는 자바스크립트 함수
	insertHandler()
	const message = send.value
	send.value = ''
		
	overlay.classList.add('hidden')
	right.style.right = '0px'
		
	const returnFlag1 = message.replace(/ /gi, '') == ''
	const returnFlag2 = message.includes('　')
	const returnFlag3 = message.includes('ㅤ')
		
	if(returnFlag1 || returnFlag2 || returnFlag3) {
		return
	}
	
	ws.send(JSON.stringify({
		type : 'message',
		username : username,
		message : message
	}))
	send.focus()
}

function dropHandler(event) {	// drop 이벤트
	event.preventDefault()
	
	const file = event.dataTransfer.files[0]	// 이벤트에 의해서 전달된 데이터 전송 내역에서 0번째 데이터를 가져온다
	console.log(file)
	console.log('drop')
	
	const fileReader = new FileReader()			// 파일 읽어내는 객체를 생성
	fileReader.onload = function(event) {		// 파일을 지정하면 아래 작동을 수행한다
		const arrayBuffer = event.target.result	
//		ws.send(arrayBuffer)
		console.log(arrayBuffer)
	}
	fileReader.readAsArrayBuffer(file)	// 파일 리더에게 파일을 전달하면 상단의 onload 함수가 호출된다
}

// 파일 드래그
textarea.addEventListener('drop', dropHandler)	// textarea.ondrop = dropHandler

// 드래그앤 드롭 파일 전송이 구현되기 위해 필요한 함수
textarea.addEventListener('dragenter', (event) => {
	event.stopPropagation()
	event.preventDefault()
	console.log('dragenter')
})

textarea.addEventListener('dragleave', (event) => {
	event.stopPropagation()
	event.preventDefault()
	console.log('dragleave')
})

textarea.addEventListener('dragover', (event) => {
	event.stopPropagation()
	event.preventDefault()
	console.log('dragover')
})


