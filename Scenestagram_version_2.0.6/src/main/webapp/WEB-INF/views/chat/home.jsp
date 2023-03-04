<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${cpath }/resources/css/chat.css">
<style>
/* * {border: 1px dashed red;} */
body {
	background-color: #000;
	color: white;
}

ul, li {
	list-style: none;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

.flex {
	display: flex;
}

.column {
	flex-direction: column;
}

#dm {
	width: 1000px;
	margin: auto;
	position: relative;
	top: 30px;
}

.dm-box {
	display: flex;
	height: 800px;
	flex-direction: row;
	/* align-items: center; */
	justify-content: flex-end;
}

.dm-left-top {
	text-align: center;
}

.dm-right-top {
	display: none;
}

.login_nick {
	height: 80%;
	border-bottom: 1px solid rgb(54, 54, 54);
	padding: 20px 0px;
}

.dm-middle {
	display: flex;
}

.dm-box-right {
	display: flex;
	justify-content: center;
	flex: 0.5;
	height: 700px;
	margin: auto 0px;
	position: relative;
}

.dm-box-left {
	display: flex;
	justify-content: center;
	flex: 0.3;
	height: 700px;
	margin: auto 0px;
}

.dm-box>* {
	border: 1px solid rgb(54, 54, 54);
}

.dm-content {
	width: 100%;
}

.item {
	padding: 10px 20px;
	align-items: center;
}

.item>div img {
	border-radius: 50%;
	width: 100%;
	height: 100%;
}

.item:hover {
	background-color: #0f0f0f;
}

.item .user_img {
	width: 56px;
	height: 56px;
}

.item .user_nick {
	margin: 5px 5px 0px 10px;
}

.bottom_box {
	display: none;
	height: 10%;
	margin: auto;
}

.bottom_menu {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 90%;
	height: 65%;
	border: 1px solid rgb(54, 54, 54);
	border-radius: 22px;
	box-sizing: border-box;
	background-color: #000;
	color: white;
}

.message_box {
	width: 100%;
	height: 80%;
	overflow-wrap: anywhere;
	overflow-y: scroll;
}

.message_box::-webkit-scrollbar {
	display: none;
}

.user_info {
	display: flex;
	align-items: center;
	height: 65px;
	border-bottom: 1px solid rgb(54, 54, 54);
	padding: 20px 50px;
}

.user_info div img {
	border-radius: 50%;
	width: 100%;
	height: 100%;
}

.user_info .user_img {
	width: 24px;
	height: 24px;
}

.user_info .nick {
	margin: 5px 5px 0px 10px;
}

.other div img {
	border-radius: 50%;
	width: 100%;
	height: 100%;
}

.other .user_img {
	margin-bottom: 8px;
	margin-right: 4px;
	width: 24px;
	height: 24px;
}

.nick:hover {
	font-size: 15px;
	font-weight: bold;
}

div.hidden {
	display: none;
}
</style>
<script>
	const username = '${login.nick_name}'	
	const loginIdx = '${login.idx}'
	const cpath = '${cpath}'
	const serverName = '${pageContext.request.serverName}'
</script>

<div class="main_wrap">
	<div id="dm">
		<div class="dm-box">
			<div class="dm-box-left">
				<div
					style="text-align: center; margin: 0; overflow: hidden; width: 100%;">
					<div class="dm-left-top">
						<div class="login_nick">${login.nick_name }</div>
					</div>

					<div class="dm-content">
						<!-- dm 아이템 loop -->
						<div id="room">
							<c:forEach var="room" items="${list }">
								<div class="item flex" room="${room.IDX }"
									user="${room.USERS_IDX }">
									<div class="user_img" img="${room.USER_IMG }">
										<img src="${cpath }/resources/img/${room.USER_IMG }" alt="">
									</div>
									<div class="user_nick">${room.NICK_NAME }</div>
								</div>
							</c:forEach>
						</div>
						<!-- dm 아이템 loop end -->
					</div>
				</div>
			</div>
			<div class="dm-box-right">
				<div class="dm-right-top">
					<div class="user_info"></div>
				</div>
				<div class="message_box">
					<div style="text-align: center; margin: 50% 0;">
						<svg aria-label="Direct" class="_ab6-" color="rgb(245, 245, 245)"
							fill="rgb(245, 245, 245)" height="96" role="img"
							viewBox="0 0 96 96" width="96">
							<circle cx="48" cy="48" fill="none" r="47" stroke="currentColor"
								stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></circle>
							<line fill="none" stroke="currentColor" stroke-linejoin="round"
								stroke-width="2" x1="69.286" x2="41.447" y1="33.21" y2="48.804"></line>
							<polygon fill="none"
								points="47.254 73.123 71.376 31.998 24.546 32.002 41.448 48.805 47.254 73.123"
								stroke="currentColor" stroke-linejoin="round" stroke-width="2"></polygon></svg>
						<div style="font-size: 20px; margin: 5px;">내 메세지</div>
						<div style="color: #A8A8A8; margin-bottom: 10px; font-size: 14px;">친구에게
							사진과 메시지를 보내보세요</div>
					</div>
				</div>
				<div class="bottom_box">
					<div class="bottom">
						<div class="bottom_menu">
							<input id="send" class="send" name="send" autofocus> <input
								id="btn" class="btn" type="button" value="보내기">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
<script>
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
	
			
	
</script>

</body>
</html>