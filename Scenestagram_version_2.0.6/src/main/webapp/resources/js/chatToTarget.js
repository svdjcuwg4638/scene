//'use strict'
let diffX, diffY

// 부모 요소중 모달을 찾는 재귀함수
function findSelfModal(node) {
	return node.classList.contains('chatToTarget') ? node : findSelfModal(node.parentNode)
}

// 버튼을 클릭하거나 엔터키를 입력하면
function chatTosendHandler(event){
	
	const modal = findSelfModal(event.target)
	const message = modal.querySelector('.send').value
	modal.querySelector('.send').value = ''
		
	const recipient = modal.querySelector('span').innerText
	
	const returnFlag1 = message.replace(/ /gi, '') == ''
	const returnFlag2 = message.includes('　')
	const returnFlag3 = message.includes('ㅤ')
		
	if(returnFlag1 || returnFlag2 || returnFlag3) {
		return
	}
	
	ws.send(JSON.stringify({
		type : 'message',
		username : username,
		message : message,
		recipient : recipient
	}))
	
	modal.querySelector('.send').focus()
}

let posTop = 100, posLeft = 100, plus = 40

// 1:1 대화 모달을 생성하는 코드
function create1on1Modal(event, sender) {
	
	const targetId = event == null ? sender : event.target.innerText
	
	console.log(event)
			
	if(event != null && targetId == username) {	// 내 아이디를 클릭한 경우는 함수 종료
		return
	}
	
	const alreadyExistModal = Array.from(document.querySelectorAll('.chatToTarget')).filter(v => {
		return v.querySelector('span').innerText == targetId
	})[0]
	if(alreadyExistModal != null) {
		alreadyExistModal.style.display = 'block'
		alreadyExistModal.style.zIndex = 4
		main.style.zIndex = 0
		return
	}
	
	const modal = document.createElement('div')
	modal.classList.add('chatToTarget')
	modal.style.top = posTop + 'px'
	modal.style.left = posLeft + 'px'
	posTop += plus
	posLeft += plus
	if(posTop > window.clientHeight * 60 / 100) {
		posTop = 100
	}
	if(posLeft > window.clientWidth * 60 / 100) {
		posLeft = 100
	}
	
	
	const title = document.createElement('div')
	title.classList.add('title')
	title.addEventListener('click', clickOnTop)
	modal.appendChild(title)
	
	const textarea = document.createElement('div')
	textarea.classList.add('textarea')
	textarea.classList.add('chatTo')
	textarea.style.height = '420px'
	textarea.style.border = '0'
	textarea.addEventListener('click', clickOnTop)
	modal.appendChild(textarea)
	
	const bottom = document.createElement('div')
	bottom.classList.add('bottom')
	bottom.classList.add('chatTo')
	modal.appendChild(bottom)
	
	const send = document.createElement('input')
	send.classList.add('send')
	send.addEventListener('click', clickOnTop)
	send.style.width = '248px'
		
	const btn = document.createElement('input')
	btn.classList.add('btn')
	btn.type = 'button'
	btn.value = '전송'
	btn.onclick = (event) => {
		clickOnTop(event)
		chatTosendHandler(event)
	}
	
	send.id = 'sendTo' + targetId
	send.onkeydown = (event) => {
		if (event.key == 'Enter') {
			chatTosendHandler(event)
		}
	}
	btn.id = 'btnTo' + targetId
	bottom.appendChild(send)
	bottom.appendChild(btn)
	
	const titleText = document.createElement('div')
	const quitBtn = document.createElement('div')
	
	titleText.innerHTML = '<span>' + targetId + '</span> 님과의 1:1 대화'
	quitBtn.innerText = '❌'
	quitBtn.onclick = function(event) {
//		document.body.removeChild(modal)
		findSelfModal(event.target).style.display = 'none'
	}
	
	title.appendChild(titleText)
	title.appendChild(quitBtn)
	document.body.appendChild(modal)
	send.focus()
	
	// 드래그 관련 코드
	title.draggable = 'true'

	title.addEventListener('dragstart', function(event) {
		
		const absTop = event.target.parentNode.getBoundingClientRect().top;
		const absLeft = event.target.parentNode.getBoundingClientRect().left;
		event.target.opacity = '0.5'
		diffX = event.clientX - absLeft
		diffY = event.clientY - absTop
//		console.log('dragstart : ', {x: event.clientX, y: event.clientY}, diffX, diffY)
	}, false)
	
	modal.addEventListener('drag', function(event) {
		const absTop = event.target.parentNode.getBoundingClientRect().top;
		const absLeft = event.target.parentNode.getBoundingClientRect().left;
	}, false)
	
	modal.addEventListener('dragover', function(event) {
//		event.preventDefault()
//		console.log('dragover')
	}, false)
	
	modal.addEventListener("dragend", function(event) {
		// 투명도를 리셋
		event.target.style.opacity = "";
		const absTop = event.target.parentNode.getBoundingClientRect().top;
		const absLeft = event.target.parentNode.getBoundingClientRect().left;
		clickOnTop(event)
//		console.log('dragend : ', {x: event.clientX, y: event.clientY}, diffX, diffY)
		modal.style.left = (event.clientX - diffX) + 'px'
		modal.style.top = (event.clientY - diffY) + 'px'
		
	}, false);
	
	main.style.zIndex = 0
	modal.style.zIndex = 4
}

main.onclick = (event) => {
	event.stopPropagation()
	if(event.target.classList.contains('peopleName')) {
		return
	}
	document.querySelectorAll('.chatToTarget').forEach(e => e.style.zIndex = 0)
	main.style.zIndex = 4
}

function clickOnTop(event){
	document.querySelectorAll('.chatToTarget .textarea').forEach(e => findSelfModal(e).style.zIndex = 0)
	main.style.zIndex = 0
	findSelfModal(event.target).style.zIndex = 4
}
