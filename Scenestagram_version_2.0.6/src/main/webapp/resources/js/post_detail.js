async function loadHandler() {
	
	function postLikeStatus() {
		const url = cpath + '/post/like/status/' + post_idx + '/' + users_idx		
		fetch(url)
		.then(resp => resp.text())
		.then(text => {
			if(text == 0) post_like.innerText = '좋아요'
			else post_like.innerText = '좋아요 중'
		})
	}
	
	function htmlFromjson(dto) {
		const margin = dto.DEPTH * 30
//		console.log(margin)
		
		let tag = `<div class="comment" idx="${dto.IDX}" comment_depth="${dto.DEPTH}" style="margin-left: ${margin}px">`
		tag += `		<div class="commentTop">`
		tag += `			<div class="left">`
		tag += `				<div class="writer">${dto.NICK_NAME}</div>`
		tag += `				<div class="writeDate">${getYYYYMMDD(dto.REGIST_DATE)}</div>`
		tag += `			</div>`
		tag += `			<div class="right">`
		tag += `				<button class="comment_like" ${users_idx == '' ? 'hidden' : ''}></button>`
		tag += `				<button class="recomment" ${users_idx == '' ? 'hidden' : ''}>답변</button>`		
		tag += `				<button class="remove" ${users_idx != dto.USERS_IDX && users_idx != post_users_idx ? 'hidden' : ''}>삭제</button>`
		tag += `			</div>`
		tag += `		<pre class="comment_content">${dto.CONTENT}</pre>`
		tag += `	</div>`

		return tag
	}
	
	async function commentsHandler() {
		const comments = document.getElementById('comments')
		const url = cpath + '/getComments/' + post_idx
			
		await fetch(url)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
			
			const arr = json
			arr.forEach(dto => {
				const html = htmlFromjson(dto)
				comments.innerHTML += html
			})
		})
		
	}
	
	async function commentsLikeStatus() {		
		const url = cpath + '/comment/like/status/' + post_idx + '/' + users_idx
		
		await fetch(url)
		.then(resp => resp.json())
		.then(json => {
//			console.log(json)
//			console.log(commentLikeList)
			const arr = json
//			console.log(arr)
						
			commentLikeList.forEach(e => {
				const comment_idx = e.getAttribute('idx')
//				console.log(comment_idx)				
				if(arr.includes(+comment_idx)) {
					e.querySelector('button.comment_like').innerText = '좋아요 중'
				}
				else {
					e.querySelector('button.comment_like').innerText = '좋아요'
				}
			})
		})
	}
	
	await postLikeStatus()
	await commentsHandler()	
	
	const commentLikeList = Array.from(document.querySelectorAll('.comment'))
//	console.log(commentLikeList)
	
	const recommentBtnList = document.querySelectorAll('button.recomment')
//	console.log(recommentBtnList)
	await recommentBtnList.forEach(btn => btn.onclick = recommentHandler)
	
	await commentsLikeStatus()
	
	const commentLikeBtnList = document.querySelectorAll('button.comment_like')
//	console.log(commentLikeBtnList)
	await commentLikeBtnList.forEach(btn => btn.onclick = commentLikeHandler)
	
	const comment_content = document.querySelectorAll('.comment_content')
	console.log(comment_content)
	
	const contentArr = comment_content.forEach(content => {
		console.log(content.innerText)
		const contentHashTagArr = content.innerText.split(' ').map(e => {
			let ob = {
					original: e,
					front: '',
					middle: '',				
					back: '',
					front_other: '',
					middle_other: '',
					back_other: '',
					front_type: '',
					middle_type: '',
					back_type: ''
				}
			
			firstHandler(ob)
			secondHandler(ob)
			thirdHandler(ob)
			
			ob.link = tagHandler(ob)
			
			return ob
		})
		
		content.innerHTML = ''
		for(let i = 0; i < contentHashTagArr.length; i++) {
			content.innerHTML += contentHashTagArr[i].link
			if(i != contentHashTagArr.length - 1) {
				content.innerHTML += ' '
			}
		}
	})
	
	const removeBtnList = document.querySelectorAll('.remove')
//	console.log(removeBtnList)
	removeBtnList.forEach(e => e.onclick = removeCommentsHandler)
	
	const userList = document.querySelectorAll('.userSearch')
	console.log(userList)
	userList.forEach(e => e.onclick = userSearchHandler)
}

function getYYYYMMDD(date) {
	const newDate = new Date(date)
	const yyyy = newDate.getFullYear()
	let mm = newDate.getMonth() + 1
	let dd = newDate.getDate()		
	
	mm = mm < 10 ? '0' + mm : mm
	dd = dd < 10 ? '0' + dd : dd	
	
	return `${yyyy}-${mm}-${dd}`
}

function commentsWriteHandler(event) {
	event.preventDefault()
	const content = document.querySelector('#commentsWriteForm textarea')
	
	const ob = {
		post_idx: post_idx,
		users_idx: users_idx,
		content: content.value,
		parent_idx: event.target.querySelector('input[name="parent_idx"]').value,
		depth: event.target.querySelector('input[name="depth"]').value
	}
	
	const url = cpath + '/addComments'
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
		console.log(text)
		if(text == 1) {
			alert('작성 성공 !!')
			location.reload();
			content.value = ''
		}
	})
}

function recommentHandler(event) {
	event.preventDefault()
	
	const form = document.getElementById('commentsWriteForm')
	const comment = event.target.parentNode.parentNode.parentNode
//	console.log(form)
//	console.log(comment)
	
	form.querySelector('input[name="parent_idx"]').value = comment.getAttribute('idx')
	form.querySelector('input[name="depth"]').value = +comment.getAttribute('comment_depth') + 1
	
	document.querySelectorAll('.comment').forEach(comment => comment.classList.remove('selected'))
	comment.classList.add('selected')
	comment.appendChild(form)
	form.querySelector('textarea').focus()
	
}

function commentLikeHandler(event) {
	const comment_idx = event.target.parentNode.parentNode.parentNode.getAttribute('idx')
//	console.log(comment_idx)
	const url = cpath + '/comment/like/' + post_idx + '/' + comment_idx + '/' + users_idx
	console.log(event.target.innerText)
	fetch(url)
	.then(resp => resp.text())
	.then(text => {
//		console.log(text)		
		if(text == 1) event.target.innerText = '좋아요 중'
		else event.target.innerText = '좋아요'		
	})
	
}

function removeCommentsHandler(event) {
	if(confirm('정말 삭제 하시겠습니까?')) {
		const comment_idx = event.target.parentNode.parentNode.parentNode.getAttribute('idx')
		console.log(comment_idx)
		const url = cpath + '/removeComments/' + comment_idx
		
		fetch(url)
		.then(resp => resp.text())
		.then(text => {
//			console.log(text)
			if(text == 1) location.reload()
			else alert('댓글 삭제 실패 하였습니다')
		})
	}	
}

function userSearchHandler(event) {
	const nickName = event.target.innerText.replace('@', '')
	console.log(nickName)
	const url = cpath + '/users/getUserIDXByNickName/' + nickName
	
	fetch(url)
	.then(resp => resp.text())
	.then(text => {
		console.log(text)
		const idx = text
		location.href = cpath + '/users/viewDetail/' + idx
	})
}