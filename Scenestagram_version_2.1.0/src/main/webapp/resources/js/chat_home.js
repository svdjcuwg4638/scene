const itemList = document.querySelectorAll('.item')
// 	console.log(itemList)
itemList.forEach(item => item.onclick = clickHandler)
		
function clickHandler(event) {
	const ws = new SockJS(cpath + '/chat?id=' + username, null, {sessionId: generateSessionId}) // 스프링에서 지정한 주소에 대한 컴포넌트를 작성해야 한다
	
	function generateSessionId() {
		return username + '_' + new Date().getTime()
	}
	
	function onMessage(event) {
		console.log(JSON.parse(event.data))
		const wrap = document.createElement('div')
		const name = document.createElement('div')
		const message = document.createElement('div')
		const message_box = document.querySelector('.message_box')			
		
		name.innerText = JSON.parse(event.data).username
		if(name.innerText == 'alarm') return
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
		
		if(name.innerText == 'other') {
			wrap.appendChild(name)	
		}			
		wrap.appendChild(message)
		wrap.classList.add(name.innerText == username ? 'self' : 'other')
		
		message_box.appendChild(wrap)
		message_box.scroll({
			top : message_box.scrollHeight,
			behavior : 'smooth'
		})
		
	}
	
	ws.onmessage = onMessage
	ws.onopen = function(msg) {}
	ws.onclose = function(msg) {}
	ws.onerror = function(msg) {}
	
	let eventValue = event.target
	while(!(eventValue.className.includes('item'))) {
		eventValue = eventValue.parentNode
	}		
// 		console.log(eventValue)
	const roomIdx = eventValue.getAttribute('room')
	const userIdx = eventValue.getAttribute('user')
	const userNick = eventValue.querySelector('.user_nick').innerText
	const userImg = eventValue.querySelector('.user_img').getAttribute('img')
	const url = cpath + '/chat/main/' + roomIdx
	
	fetch(url)
	.then(resp => resp.json())
	.then(json => {
		console.log(json)
		const messageList = json
		const dm_box_right = document.querySelector('.dm-box-right')
		const dm_right_top = document.querySelector('.dm-right-top')
		const message_box = document.querySelector('.message_box')
		const bottom_box = document.querySelector('.bottom_box')
		const user_info = dm_right_top.querySelector('.user_info')
		
		message_box.innerHTML = ''			
		messageList.forEach(dto => {
			console.log(dto)
			let tag = ''
			if(dto.WRITER_IDX == loginIdx) {
				tag += '<div class="self">'					
				tag += '<div class="message">' + dto.CONTENT + '</div>'
				tag += '</div>'
			}
			else {
				tag += '<div class="other">'
				tag += '<div class="user_img">'
				tag += '<a href="' + cpath + '/users/viewDetail/' + userIdx + '">'
				tag += '<img src="' + cpath + '/resources/img/' + dto.USER_IMG + '">'
				tag += '</a>'
				tag += '</div>'
				tag += '<div class="message">' + dto.CONTENT + '</div>'
				tag += '</div>'
			}
			message_box.innerHTML += tag
			message_box.scrollTop = message_box.scrollHeight;
			bottom_box.style.display = 'block'
			dm_box_right.style.display = 'block'
			dm_right_top.style.display = 'block'
		})
		user_info.innerHTML = ''
		
		let tag = ''
		tag += '<div class="user_img">'
		tag += '<a href="' + cpath + '/users/viewDetail/' + userIdx + '">'
		tag += '<img src="' + cpath + '/resources/img/' + userImg + '" alt="">'
		tag += '</a>'
		tag += '</div>'
		tag += '<div class="nick">'
		tag += '<a href="' + cpath + '/users/viewDetail/' + userIdx + '">' + userNick + '</a>'
		tag += '</div>'
        		                            
		user_info.innerHTML += tag
		
		const btn = document.getElementById('btn')
		btn.onclick = sendHandler
		
		const send = document.getElementById('send')			
		send.onkeyup = keyHandler		
		
	})
	
	function sendHandler(event) {
		insertHandler(event)
		const message = event.target.parentNode.querySelector('input[id="send"]').value
		console.log(message)
		event.target.parentNode.querySelector('input[id="send"]').value = ''
		
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
		
		event.target.parentNode.querySelector('input[id="send"]').focus()
	}
	
	function keyHandler(event) {			
		if(event.key == 'Enter') {
			sendHandler(event)
		}			
		if(event.target.value != '') {
			document.querySelector('input[id="btn"]').style.visibility = 'visible'
		}
		if(event.key == 'Backspace' && event.target.value == '') {
			document.querySelector('input[id="btn"]').style.visibility = 'hidden'
		}
		
	}
	
	function insertHandler(event) {			
		const ob = {
			room_idx: roomIdx,
			writer_idx: loginIdx,
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
	
}	