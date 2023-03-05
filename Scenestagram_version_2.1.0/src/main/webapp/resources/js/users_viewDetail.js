// 스크롤
const items = document.querySelector('.items')
const main_wrap = document.querySelector('.main_wrap')
const all_wrap =document.querySelector('.all_wrap')
let index = 0
   
function scrollHandler() {   
	const offset = +all_wrap.getAttribute('offset')
	const cur = all_wrap.scrollTop + all_wrap.clientHeight
	console.log(all_wrap.scrollTop, all_wrap.clientHeight)
	const flag = (all_wrap.scrollHeight * 0.9 <= cur && cur <= all_wrap.scrollHeight * 1.1) || offset == 0
	console.log(cur, flag)
	if(flag) {
		fetch(cpath + '/bringPost/' + dto_idx + '/' + offset)
		.then(resp => resp.json())
		.then(json => {
			json.forEach(dto => {
				let tag = ''
					tag += '<div class="item" idx="' + dto.POST_IDX + '" index="' + index++ + '">'
					tag += '	<img src="' + cpath + '/upload/' + dto.FILE_NAME + '">'           
					tag += '    <div class="post_like_commend post_like_commend_hidden">'
					tag += '        <div class="post_like_commend_background"></div>'
					tag += '        <div class="post_like_commend_wrap">'
					tag += '            <div class="post_like_commend_like">'
					tag += '				<span class="like imt"></span>'       	        				
					tag += '                <span>'+ dto.POSTLIKECOUNT +'</span>'
					tag += '            </div>'
					tag += '            <div class="post_like_commend_commend">'
					tag += '				<span class="commend imt"></span>'
					tag += '                <span>'+ dto.POSTCOMMENTCOUNT +'</span>'
					tag += '            </div>'
					tag += '        </div>'
					tag += '    </div>'
					tag += '</div>'		              
   
					items.innerHTML += tag
					all_wrap.setAttribute('offset', offset + 12)
			})
			const itemList = document.querySelectorAll('.item')
			console.log(itemList)
			itemList.forEach(e => e.onclick = itemClickHandler)			
		})
	}
}
   
   
all_wrap.onscroll = scrollHandler

// 모달창 이벤트
const modal = document.getElementById('modal')
const modal_content = document.querySelector('.modal_content')
const post_content = document.querySelector('.post_content')
const modal_overlay = document.getElementById('modal_overlay')
const prevBtn = document.querySelector('.prevBtn')
const nextBtn = document.querySelector('.nextBtn')
const left = document.querySelector('.left')
const right = document.querySelector('.right')
const close = document.querySelector('.close')	

function itemClickHandler(event) {
	document.querySelector('.image_content .images').setAttribute('index', 0)
	document.querySelector('.image_content .images').style.left = '0px'
	let eventValue = event.target
	while(eventValue.className != 'item') {
		eventValue = eventValue.parentNode
	}
//		console.log(eventValue)
	const size = document.querySelectorAll('.item').length
	console.log(size)
	const post_idx = eventValue.getAttribute('idx')
//		console.log(post_idx)
	const index = eventValue.getAttribute('index')
	post_content.setAttribute('index', index)
	const url = cpath + '/post/modalTest/' + post_idx
//		console.log(size)
	fetch(url)
	.then(resp => resp.json())
	.then(json => {
//			console.log(json)
		const dto = json
		const imgList = dto.FILE_NAME.split(',')			
		const img_size = imgList.length
		console.log(img_size)
		const images = document.querySelector('.images')
		images.innerHTML = ''
		post_content.innerHTML = ''
		imgList.forEach(img => {				
			let imageTag = 	'<div class="image">'
			imageTag += 		'<img src=' + cpath + '/upload/' + img + '>'
			imageTag += 	'</div>'
			
			images.innerHTML += imageTag
		})
		
		let tag = ''
		tag += '<div class="pro_info">'
		tag += '<div class="pro_img">'
		tag += '<a href="' + cpath + '/users/viewDetail/' + dto.USERS_IDX + '">'
		tag += '<img src="' + cpath + '/resources/img/' + dto.USER_IMG +'">'
		tag += '</a>'
		tag += '</div>'
		tag += '<div class="pro_box">'
		tag += '<div class="pro_nic">'
		tag += '<a href="' + cpath + '/users/viewDetail/' + dto.USERS_IDX + '">'+ dto.NICK_NAME + '</a>'
		tag += '</div>'
		if(dto.LOCATION != null && dto.LOCATION != '') {
			tag += '<div class="pro_loc">' + dto.LOCATION + '</div>'				
		}
		tag += '</div>'
		tag += '</div>'
		tag += '<div class="post_items">'
		tag += '<div class="post_pro_box">'
		tag += '<div class="post_pro_img">'
		tag += '<a href="' + cpath + '/users/viewDetail/' + dto.USERS_IDX + '"><img src="' + cpath + '/resources/img/' + dto.USER_IMG +'"></a>'
		tag += '</div>'
		tag += '<div class="post_item">'
		tag += '<div class="post_pro_nic">'
		tag += '<a href="' + cpath + '/users/viewDetail/' + dto.USERS_IDX + '">' + dto.NICK_NAME + '</a>'
		tag += '</div>'
		tag += '<div><pre class="post_data_content">' + dto.CONTENT + '</pre></div>'
		tag += '<div class="post_add_date">' + makeDate(dto.REGIST_DATE) + '</div>'
		tag += '</div>'
		tag += '</div>'
		tag += '<div id="comments" idx="' + dto.IDX + '" user="' + dto.USERS_IDX +'"></div>'
		tag += '</div>'
		
		
		post_content.innerHTML += tag
		post_content.setAttribute('user', dto.USERS_IDX)
		modal.style.display = 'block'
		modal_content.style.display = 'flex'			
		modal_overlay.style.display = 'block'
		close.style.display = 'block'
			
		if(index != 0) prevBtn.style.display = 'block'
		if(index != size - 1) nextBtn.style.display = 'block'
		if(img_size == 1) {
			left.style.display = 'none'
			right.style.display = 'none'
		}
		else {
			left.style.display = 'none'
			right.style.display = 'block'
		}
		
		const post_data_content = document.querySelector('.post_data_content')
//		    console.log(post_data_content)
	    
	    const hashTagArr = post_data_content.innerText.split(' ').map(e => {
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
		
		post_data_content.innerHTML = ''
		for(let i = 0; i < hashTagArr.length; i++) {
			post_data_content.innerHTML += hashTagArr[i].link
			if(i != hashTagArr.length - 1) {
				post_data_content.innerHTML += ' '
			}
		}
		
		commentsHandler()
		
	})		
}

nextBtn.onclick = nextClickHandler
prevBtn.onclick = prevClickHandler
left.onclick = leftHandler
right.onclick = rightHandler
modal_overlay.onclick = closeHandler
close.onclick = closeHandler

async function commentsHandler() {
	const comments = document.getElementById('comments')
	const post_idx = comments.getAttribute('idx')		
//		console.log(comments)
	comments.innerHTML = ''
	const url = cpath + '/getComments/' + post_idx + '/' + users_idx
		
	await fetch(url)
	.then(resp => resp.json())
	.then(json => {
//			console.log(json)
		
		const arr = json
		arr.forEach(dto => {
//				console.log(dto)
			const html = htmlFromjson(dto)
			comments.innerHTML += html				
			
		})			
		
		const comment_content = document.querySelectorAll('.comment_content')
		console.log(comment_content)
		
		for(content of comment_content) {
	    	const hashTagArr = content.innerText.split(' ').map(e => {
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
			for(let i = 0; i < hashTagArr.length; i++) {
				content.innerHTML += hashTagArr[i].link
				if(i != hashTagArr.length - 1) {
					content.innerHTML += ' '
				}
			}
	    }
		
		if(document.querySelector('.bottom_item') == null) {
			makeBottom()
		}
		else {
			const comment_like = document.querySelectorAll('.comment_like')
// 			console.log(comment_like)
			comment_like.forEach(e => e.onclick = commentLikeHandler)
			
			const bottom_like = document.querySelector('.bottom_like')
// 			console.log(bottom_like)
			bottom_like.onclick = bottomLikeHandler
			
			const bottom_reply = document.querySelector('.bottom_reply')
			bottom_reply.onclick = bottomReplyHandler
			
			const txt = document.querySelector('.bottom_input > textarea')
			txt.onkeyup = txtKeyUpHandler
			
			const recomment = document.querySelectorAll('.recomment')
			console.log(recomment)			
			recomment.forEach(e => e.onclick = recommentHandler)
			
			const send = document.querySelector('.bottom_send')
			send.onclick = sendClickHandler		
			
			const remove = document.querySelectorAll('.remove')
			console.log(remove)
			remove.forEach(e => e.onclick = removeHandler)
			
			const comment_count = document.querySelectorAll('.comment_count')
			console.log(comment_count)
			comment_count.forEach(e => e.onclick = commentCountHandler)
			
			const userList = document.querySelectorAll('.userSearch')
    		console.log(userList)
    		userList.forEach(e => e.onclick = userSearchHandler)
		}			
		
	})	// end of fetch	
	
}

function nextClickHandler(event) {	
	const users_idx = document.querySelector('.post_content').getAttribute('user')
	const offset = +post_content.getAttribute('index') + 1
//		console.log(offset)
	const size = document.querySelectorAll('.item').length
	const url = cpath + '/post/modalTest/' + users_idx + '/' + offset
//		console.log(url)
	
	fetch(url)
	.then(resp => resp.json())
	.then(json => {
//			console.log(json)
		const dto = json
		const imgList = dto.FILE_NAME.split(',')			
		const img_size = imgList.length
		console.log(img_size)			
		post_content.innerHTML = ''			
		const images = document.querySelector('.images')
		images.setAttribute('index', 0)
		images.style.left = '0px'
		images.style.transitionDuration = '0s'
		images.innerHTML = ''
		
		imgList.forEach(img => {				
			let imageTag = 	'<div class="image">'
			imageTag += 		'<img src=' + cpath + '/upload/' + img + '>'
			imageTag += 	'</div>'
			
			images.innerHTML += imageTag
		})
		
		let tag = ''
		tag += '<div class="pro_info">'
		tag += '<div class="pro_img">'
		tag += '<a href="' + cpath + '/users/viewDetail/' + dto.USERS_IDX + '">'
		tag += '<img src="' + cpath + '/resources/img/' + dto.USER_IMG +'">'
		tag += '</a>'
		tag += '</div>'
		tag += '<div class="pro_box">'
		tag += '<div class="pro_nic">'
		tag += '<a href="' + cpath + '/users/viewDetail/' + dto.USERS_IDX + '">'+ dto.NICK_NAME + '</a>'
		tag += '</div>'
		if(dto.LOCATION != null && dto.LOCATION != '') {
			tag += '<div class="pro_loc">' + dto.LOCATION + '</div>'				
		}
		tag += '</div>'
		tag += '</div>'
		tag += '<div class="post_items">'
		tag += '<div class="post_pro_box">'
		tag += '<div class="post_pro_img">'
		tag += '<a href="' + cpath + '/users/viewDetail/' + dto.USERS_IDX + '"><img src="' + cpath + '/resources/img/' + dto.USER_IMG +'"></a>'
		tag += '</div>'
		tag += '<div class="post_item">'
		tag += '<div class="post_pro_nic">'
		tag += '<a href="' + cpath + '/users/viewDetail/' + dto.USERS_IDX + '">' + dto.NICK_NAME + '</a>'
		tag += '</div>'
		tag += '<div><pre class="post_data_content">' + dto.CONTENT + '</pre></div>'
		tag += '<div class="post_add_date">' + makeDate(dto.REGIST_DATE) + '</div>'
		tag += '</div>'
		tag += '</div>'
		tag += '<div id="comments" idx="' + dto.IDX + '" user="' + dto.USERS_IDX +'"></div>'
		tag += '</div>'			
		
		post_content.innerHTML += tag
		post_content.setAttribute('index', offset)			
		
		if(offset > 0) {
			prevBtn.style.display = 'block'
		}
		else {
			prevBtn.style.display = 'none'
		}
		if(offset >= 0 && offset < size - 1) {
			nextBtn.style.display = 'block'
		}
		else {
			nextBtn.style.display = 'none'
		}
			
		if(img_size <= 1) {
			left.style.display = 'none'
			right.style.display = 'none'
		}
		else {
			left.style.display = 'none'
			right.style.display = 'block'
		}
		
		const post_data_content = document.querySelector('.post_data_content')
//		    console.log(post_data_content)
	    
	    const hashTagArr = post_data_content.innerText.split(' ').map(e => {
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
		
		post_data_content.innerHTML = ''
		for(let i = 0; i < hashTagArr.length; i++) {
			post_data_content.innerHTML += hashTagArr[i].link
			if(i != hashTagArr.length - 1) {
				post_data_content.innerHTML += ' '
			}
		}
		
		commentsHandler()
		
	})
}

function prevClickHandler(event) {
	const users_idx = document.querySelector('.post_content').getAttribute('user')
	const offset = +post_content.getAttribute('index') - 1
//		console.log(offset)
	const size = document.querySelectorAll('.item').length
	const url = cpath + '/post/modalTest/' + users_idx + '/' + offset
//		console.log(url)
	
	fetch(url)
	.then(resp => resp.json())
	.then(json => {
//			console.log(json)
		const dto = json
		const imgList = dto.FILE_NAME.split(',')			
		const img_size = imgList.length
		console.log(img_size)			
		post_content.innerHTML = ''			
		const images = document.querySelector('.images')
		images.setAttribute('index', 0)
		images.style.left = '0px'
		images.style.transitionDuration = '0s'
		images.innerHTML = ''
		
		imgList.forEach(img => {				
			let imageTag = 	'<div class="image">'
			imageTag += 		'<img src=' + cpath + '/upload/' + img + '>'
			imageTag += 	'</div>'
			
			images.innerHTML += imageTag
		})
		
		let tag = ''
		tag += '<div class="pro_info">'
		tag += '<div class="pro_img">'
		tag += '<a href="' + cpath + '/users/viewDetail/' + dto.USERS_IDX + '">'
		tag += '<img src="' + cpath + '/resources/img/' + dto.USER_IMG +'">'
		tag += '</a>'
		tag += '</div>'
		tag += '<div class="pro_box">'
		tag += '<div class="pro_nic">'
		tag += '<a href="' + cpath + '/users/viewDetail/' + dto.USERS_IDX + '">'+ dto.NICK_NAME + '</a>'
		tag += '</div>'
		if(dto.LOCATION != null && dto.LOCATION != '') {
			tag += '<div class="pro_loc">' + dto.LOCATION + '</div>'				
		}
		tag += '</div>'
		tag += '</div>'
		tag += '<div class="post_items">'
		tag += '<div class="post_pro_box">'
		tag += '<div class="post_pro_img">'
		tag += '<a href="' + cpath + '/users/viewDetail/' + dto.USERS_IDX + '"><img src="' + cpath + '/resources/img/' + dto.USER_IMG +'"></a>'
		tag += '</div>'
		tag += '<div class="post_item">'
		tag += '<div class="post_pro_nic">'
		tag += '<a href="' + cpath + '/users/viewDetail/' + dto.USERS_IDX + '">' + dto.NICK_NAME + '</a>'
		tag += '</div>'
		tag += '<div><pre class="post_data_content">' + dto.CONTENT + '</pre></div>'
		tag += '<div class="post_add_date">' + makeDate(dto.REGIST_DATE) + '</div>'
		tag += '</div>'
		tag += '</div>'
		tag += '<div id="comments" idx="' + dto.IDX + '" user="' + dto.USERS_IDX +'"></div>'
		tag += '</div>'			
		
		post_content.innerHTML += tag
		post_content.setAttribute('index', offset)
		
		if(offset > 0) {
			prevBtn.style.display = 'block'
		}
		else {
			prevBtn.style.display = 'none'
		}
		if(offset >= 0 && offset < size - 1) {
			nextBtn.style.display = 'block'
		}
		else {
			nextBtn.style.display = 'none'
		}
		if(img_size == 1) {
			left.style.display = 'none'
			right.style.display = 'none'
		}
		else {
			left.style.display = 'none'
			right.style.display = 'block'
		}
		
		const post_data_content = document.querySelector('.post_data_content')
//		    console.log(post_data_content)
	    
	    const hashTagArr = post_data_content.innerText.split(' ').map(e => {
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
		
		post_data_content.innerHTML = ''
		for(let i = 0; i < hashTagArr.length; i++) {
			post_data_content.innerHTML += hashTagArr[i].link
			if(i != hashTagArr.length - 1) {
				post_data_content.innerHTML += ' '
			}
		}
		
		commentsHandler()
		
	})
}

function leftHandler() {
	const images = document.querySelector('.images')
	const length = +images.querySelectorAll('div.image').length
	const index = +images.getAttribute('index')
//		console.log(index, length)
	images.style.transitionDuration = '0.5s'
	
	if(index > 0) {
		images.setAttribute('index', index - 1)
		images.style.left = (+images.style.left.replace('px', '') + 700) + 'px' 
	}
	
	if(index >= 0 && index <= length - 1) {
		right.style.display = 'block'
	}
	
	if(index <= 1) {
		left.style.display = 'none'
	}				
}

function rightHandler() {
	const images = document.querySelector('.images')
	const length = +images.querySelectorAll('div.image').length
	const index = +images.getAttribute('index')
//		console.log(index, length)
	images.style.transitionDuration = '0.5s'
	
	if(index >= 0 && index <= length - 1) {
		left.style.display = 'block'
	}

	if(index < length - 1) {
		images.setAttribute('index', index + 1)
		images.style.left = (+images.style.left.replace('px', '') - 700) + 'px' 
	}
	
	if(index + 1 >= length - 1) {
		right.style.display = 'none'
	}
			
}

function firstHandler(ob) {
	const o = ob.original
			
	if(o[0] == '#') {
		ob.front = o.split('#')[1]
		ob.front_type = 'hash'
	}
	else if(o[0] == '@') {
		ob.front = o.split('@')[1]
		ob.front_type = 'user'
	}
	else {
		ob.front = o
		ob.front_type = 'none'
	}
	
	const otherFilter = '!$%^&*()-=+,?'
	const tagFilter = '@#'		
	const size = ob.front.length
	const tmp = ob.front
	
	if(o.length != ob.front.length || ob.front.includes('#') || ob.front.includes('@')) {
		ob.front = ''			
	}
	
	for(let i = 0; i < size; i++) {
//			console.log(tmp[i].charCodeAt())
		if(o.length != ob.front.length) {
			if(tagFilter.includes(tmp[i])) {
				break
			}
			else if(tmp[i].charCodeAt() == 10) {
				ob.front_other += tmp[i]
				break
			}
			else if(otherFilter.includes(tmp[i]) == false) {					
				ob.front += tmp[i]
			}
			else {
				ob.front_other += tmp[i]
			}
		}
	}
	
	if(ob.front_type == 'hash' || ob.front_type == 'user') {
		ob.middle = o.substr(ob.front.length + ob.front_other.length + 1)
	}
	else {
		ob.middle = o.substr(ob.front.length + ob.front_other.length)
	}		
	
	return ob		
}

function secondHandler(ob) {
	const flag = ob.front_type == 'hash' || ob.front_type == 'user'		
	const o = flag ? ob.original.substr(ob.front.length + ob.front_other.length + 1) : ob.original.substr(ob.front.length + ob.front_other.length)		
	
	if(o[0] == '#') {
		ob.middle = o.split('#')[1]
		ob.middle_type = 'hash'
	}
	else if(o[0] == '@') {
		ob.middle = o.split('@')[1]
		ob.middle_type = 'user'
	}
	else {
		ob.middle = o
		ob.middle_type = 'none'
	}
	
	const otherFilter = '!$%^&*()-=+,?'
	const tagFilter = '@#'		
	const size = ob.middle.length
	const tmp = ob.middle
	
	if(o.length != ob.middle.length || ob.middle.includes('#') || ob.middle.includes('@')) {
		ob.middle = ''			
	}
	
	for(let i = 0; i < size; i++) {
		if(o.length != ob.middle.length) {
			if(tagFilter.includes(tmp[i])) {
				break
			}
			else if(tmp[i].charCodeAt() == 10) {
				ob.middle_other += tmp[i]
				break
			}
			else if(otherFilter.includes(tmp[i]) == false) {					
				ob.middle += tmp[i]
			}
			else {
				ob.middle_other += tmp[i]
			}
		}
	}
	
	if(ob.middle_type == 'hash' || ob.middle_type == 'user') {
		ob.back = o.substr(ob.middle.length + ob.middle_other.length + 1)
	}
	else {
		ob.back = o.substr(ob.middle.length + ob.middle_other.length)
	}			
	
	return ob
}

function thirdHandler(ob) {
	const flag1 = ob.front_type == 'hash' || ob.front_type == 'user'
	const flag2 = ob.middle_type == 'hash' || ob.middle_type == 'user'
	const ttmp = flag1 ? ob.original.substr(ob.front.length + ob.front_other.length + 1) : ob.original.substr(ob.front.length + ob.front_other.length)
	const o = flag2 ? ttmp.substr(ob.middle.length + ob.middle_other.length + 1) : ttmp.substr(ob.middle.length + ob.middle_other.length)
	
	if(o[0] == '#') {
		ob.back = o.split('#')[1]
		ob.back_type = 'hash'
	}
	else if(o[0] == '@') {
		ob.back = o.split('@')[1]
		ob.back_type = 'user'
	}
	else {
		ob.back = o
		ob.back_type = 'none'
	}
	
	const otherFilter = '!$%^&*()-=+,?'
	const tagFilter = '@#'		
	const size = ob.back.length
	const tmp = ob.back
	
	if(o.length != ob.back.length || ob.back.includes('#') || ob.back.includes('@')) {
		ob.back = ''			
	}
	
	for(let i = 0; i < size; i++) {
		if(o.length != ob.back.length) {
			if(tagFilter.includes(tmp[i])) {
				break
			}
			else if(tmp[i].charCodeAt() == 10) {
				ob.back_other += tmp[i]
				break
			}
			else if(otherFilter.includes(tmp[i]) == false) {					
				ob.back += tmp[i]
			}
			else {
				ob.back_other += tmp[i]
			}
		}
	}
	
	return ob
}	

function tagHandler(ob) {
	let tag = ''
	if(ob.front_type != '') {
		if(ob.front_type == 'hash') {
			tag += '<a href=' + cpath + '/post/postList/' + ob.front + '>#' + ob.front + '</a>' + ob.front_other
		}
		else if(ob.front_type == 'user') {
			tag += '<a class="userSearch">@' + ob.front + '</a>' + ob.front_other
		}
		else {
			tag += ob.front + ob.front_other
		}
	}
	if(ob.middle_type != '') {
		if(ob.middle_type == 'hash') {
			tag += '<a href=' + cpath + '/post/postList/' + ob.middle + '>#' + ob.middle + '</a>' + ob.middle_other
		}
		else if(ob.middle_type == 'user') {
			tag += '<a class="userSearch">@' + ob.middle + '</a>' + ob.middle_other
		}
		else {
			tag += ob.middle + ob.middle_other
		}
	}
	if(ob.back_type != '') {
		if(ob.back_type == 'hash') {
			tag += '<a href=' + cpath + '/post/postList/' + ob.back + '>#' + ob.back + '</a>' + ob.back_other
		}
		else if(ob.back_type == 'user') {
			tag += '<a class="userSearch">@' + ob.back + '</a>' + ob.back_other
		}
		else {
			tag += ob.back + ob.back_other
		}
	}
	return tag		
}

function closeHandler() {
	document.getElementById('modal').style.display = 'none'		
}

function makeDate(addDate) {
	const newDate = new Date(addDate)
	const yyyy = newDate.getFullYear()
	let mm = newDate.getMonth() + 1
	let dd = newDate.getDate()
	const hour = newDate.getHours()
	const minutes = newDate.getMinutes()
	
	mm = mm < 10 ? '0' + mm : mm
	dd = dd < 10 ? '0' + dd : dd	
			
	const today = new Date()
	const t_yyyy = today.getFullYear()
	let t_mm = today.getMonth() + 1
	let t_dd = today.getDate()
	const t_hour = today.getHours()
	const t_minutes = today.getMinutes()
	
	let str = ''
	
	if(t_yyyy - yyyy == 0) {
		if(t_mm - mm >= 0) {
			if(t_dd - dd == 0) {
				if(t_hour - hour <= 0) {
					if(t_minutes - minutes == 0) {
						str = '1분'
					}
					else if(t_minutes - minutes > 0) {
						str = t_minutes - minutes + '분'
					}
					else {
						str = 60 + t_minutes - minutes + '분'
					}
				}
				else {
					str = (t_hour - hour > 0 ? t_hour - hour : 24 - Math.abs(t_hour - hour)) + '시간'
				}
			}
			else {
				str = (t_dd - dd > 0 ? t_dd - dd : 30 - Math.abs(t_dd - dd)) + '일'
			}
		}
		else {
			str = yyyy + '-' + mm + '-' + dd
		}
	}
	else {
		str = yyyy + '-' + mm + '-' + dd
	}
	
//		console.log(today.getFullYear() - yyyy)
//		console.log(today.getMonth() + 1 - mm)
//		console.log(today.getDate() - dd)
//		console.log(today.getHours() - hour)
//		console.log(today.getMinutes() - minutes)

	return str
}

function makeBottom() {		
	const post_content = document.querySelector('.post_content')
//		console.log(post_content)
	const post_idx = document.getElementById('comments').getAttribute('idx')
	
	const url = cpath + '/post/modalTest/' + post_idx
	
	fetch(url)
	.then(resp => resp.json())
	.then(json => {
		const dto = json
		let tag = ''
		tag += '<div class="bottom_item" idx="' + dto.IDX + '">'
		tag += '<div class="bottom_item_top">'		 
		tag += '<div class="bottom_like">'
		if(dto.LIKE_COUNT != 0) {
			tag += '<svg aria-label="좋아요 취소" class="_ab6-" color="rgb(255, 48, 64)" fill="rgb(255, 48, 64)" height="24" role="img" viewBox="0 0 48 48" width="24"><path d="M34.6 3.1c-4.5 0-7.9 1.8-10.6 5.6-2.7-3.7-6.1-5.5-10.6-5.5C6 3.1 0 9.6 0 17.6c0 7.3 5.4 12 10.6 16.5.6.5 1.3 1.1 1.9 1.7l2.3 2c4.4 3.9 6.6 5.9 7.6 6.5.5.3 1.1.5 1.6.5s1.1-.2 1.6-.5c1-.6 2.8-2.2 7.8-6.8l2-1.8c.7-.6 1.3-1.2 2-1.7C42.7 29.6 48 25 48 17.6c0-8-6-14.5-13.4-14.5z"></path></svg>'
		}
		else {
			tag += '<svg aria-label="좋아요" class="_ab6-" color="rgb(245, 245, 245)" fill="rgb(245, 245, 245)" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M16.792 3.904A4.989 4.989 0 0 1 21.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 0 1 4.708-5.218 4.21 4.21 0 0 1 3.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 0 1 3.679-1.938m0-2a6.04 6.04 0 0 0-4.797 2.127 6.052 6.052 0 0 0-4.787-2.127A6.985 6.985 0 0 0 .5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 0 0 3.518 3.018 2 2 0 0 0 2.174 0 45.263 45.263 0 0 0 3.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 0 0-6.708-7.218Z"></path></svg>'	
		}		
		tag += '</div>'
		tag += '<div class="bottom_reply">'
		tag += '<svg aria-label="댓글 달기" class="_ab6-" color="rgb(245, 245, 245)" fill="rgb(245, 245, 245)" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M20.656 17.008a9.993 9.993 0 1 0-3.59 3.615L22 22Z" fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="2"></path></svg>'
		tag += '</div>'
		tag += '</div>'
		if(dto.LIKE_COUNT != 0) {
			tag += '<div class="bottom_like_count">좋아요 ' + dto.LIKE_COUNT +'개</div>'	
		}
		else {
			tag += '<div class="bottom_like_count">가장 먼저 <strong>좋아요</strong>를 눌러보세요</div>'
		}
		tag += '<div class="bottom_date">' + makeDate(dto.REGIST_DATE) + '</div>'
		tag += '</div>'
		tag += '<div class="bottom_input" idx="' + dto.IDX + '">'
		tag += '<textarea placeholder="댓글 달기 ..."></textarea>'
		tag += '<div class="bottom_send">게시</div>'
		tag += '</div>'

		post_content.innerHTML += tag

		
		const comment_like = document.querySelectorAll('.comment_like')
//			console.log(comment_like)
		comment_like.forEach(e => e.onclick = commentLikeHandler)
		
		const bottom_like = document.querySelector('.bottom_like')
//			console.log(bottom_like)
		bottom_like.onclick = bottomLikeHandler
		
		const bottom_reply = document.querySelector('.bottom_reply')
		bottom_reply.onclick = bottomReplyHandler
		
		const txt = document.querySelector('.bottom_input > textarea')
		txt.onkeyup = txtKeyUpHandler
		
		const recomment = document.querySelectorAll('.recomment')
		console.log(recomment)			
		recomment.forEach(e => e.onclick = recommentHandler)
		
		const send = document.querySelector('.bottom_send')
		send.onclick = sendClickHandler		
		
		const remove = document.querySelectorAll('.remove')
		console.log(remove)
		remove.forEach(e => e.onclick = removeHandler)
		
		const comment_count = document.querySelectorAll('.comment_count')
		console.log(comment_count)
		comment_count.forEach(e => e.onclick = commentCountHandler)
		
		const userList = document.querySelectorAll('.userSearch')
    	console.log(userList)
    	userList.forEach(e => e.onclick = userSearchHandler)
		
	})		
	
}

function bottomLikeHandler(event) {
	let eventValue = event.target
	while(eventValue.className != 'bottom_item') {
		eventValue = eventValue.parentNode
	}
	const bottom_like = document.querySelector('.bottom_like')
	const post_idx = eventValue.getAttribute('idx')
//		console.log(post_idx)
	const url = cpath + '/post/like/' + post_idx + '/' + users_idx
//		console.log(url)
	fetch(url)
	.then(resp => resp.text())
	.then(text => {
//			console.log(text)
		bottom_like.innerHTML = ''
		if(text == 0) {					
			bottom_like.innerHTML = '<svg aria-label="좋아요" class="_ab6-" color="rgb(245, 245, 245)" fill="rgb(245, 245, 245)" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M16.792 3.904A4.989 4.989 0 0 1 21.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 0 1 4.708-5.218 4.21 4.21 0 0 1 3.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 0 1 3.679-1.938m0-2a6.04 6.04 0 0 0-4.797 2.127 6.052 6.052 0 0 0-4.787-2.127A6.985 6.985 0 0 0 .5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 0 0 3.518 3.018 2 2 0 0 0 2.174 0 45.263 45.263 0 0 0 3.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 0 0-6.708-7.218Z"></path></svg>'				
		}
		else {
			bottom_like.innerHTML = '<svg aria-label="좋아요 취소" class="_ab6-" color="rgb(255, 48, 64)" fill="rgb(255, 48, 64)" height="24" role="img" viewBox="0 0 48 48" width="24"><path d="M34.6 3.1c-4.5 0-7.9 1.8-10.6 5.6-2.7-3.7-6.1-5.5-10.6-5.5C6 3.1 0 9.6 0 17.6c0 7.3 5.4 12 10.6 16.5.6.5 1.3 1.1 1.9 1.7l2.3 2c4.4 3.9 6.6 5.9 7.6 6.5.5.3 1.1.5 1.6.5s1.1-.2 1.6-.5c1-.6 2.8-2.2 7.8-6.8l2-1.8c.7-.6 1.3-1.2 2-1.7C42.7 29.6 48 25 48 17.6c0-8-6-14.5-13.4-14.5z"></path></svg>'							
		}
	})
}

function bottomReplyHandler() {
//		console.log(document.querySelector('.bottom_input > textarea'))
	document.querySelector('.bottom_input > textarea').focus()
}

function txtKeyUpHandler(event) {
	const bottom_input = document.querySelector('.bottom_input')
	const txt = document.querySelector('.bottom_input > textarea')
	const bottom_send = document.querySelector('.bottom_send')
	if(txt.value != '') {
		bottom_send.style.color = '#0095F6'
	}
	else {
		bottom_send.style.color = ''
		bottom_input.removeAttribute('parent_idx')
		bottom_input.removeAttribute('depth')
		bottom_input.removeAttribute('nick_name')
	}
}

function commentLikeHandler(event) {
	let eventValue = event.target		
	while(eventValue.className != 'comment') {
		eventValue = eventValue.parentNode
	}		
	const post_idx = eventValue.parentNode.getAttribute('idx')
	const comment_idx = eventValue.getAttribute('idx')
//		console.log(post_idx, comment_idx)
	
	const url = cpath + '/comment/like/' + post_idx + '/' + comment_idx + '/' + users_idx
	fetch(url)
	.then(resp => resp.text())
	.then(text => {
//			console.log(text)
		const comment_like = eventValue.querySelector('.comment_item').querySelector('.comment_item_top').querySelector('.comment_like')
		comment_like.innerHTML = ''
		if(text == 1) {
			comment_like.innerHTML = '<svg aria-label="좋아요 취소" class="_ab6-" color="rgb(255, 48, 64)" fill="rgb(255, 48, 64)" height="12" role="img" viewBox="0 0 48 48" width="12"><path d="M34.6 3.1c-4.5 0-7.9 1.8-10.6 5.6-2.7-3.7-6.1-5.5-10.6-5.5C6 3.1 0 9.6 0 17.6c0 7.3 5.4 12 10.6 16.5.6.5 1.3 1.1 1.9 1.7l2.3 2c4.4 3.9 6.6 5.9 7.6 6.5.5.3 1.1.5 1.6.5s1.1-.2 1.6-.5c1-.6 2.8-2.2 7.8-6.8l2-1.8c.7-.6 1.3-1.2 2-1.7C42.7 29.6 48 25 48 17.6c0-8-6-14.5-13.4-14.5z"></path></svg>'
		}
		else {
			comment_like.innerHTML = '<svg aria-label="좋아요" class="_ab6-" color="rgb(245, 245, 245)" fill="rgb(245, 245, 245)" height="12" role="img" viewBox="0 0 24 24" width="12"><path d="M16.792 3.904A4.989 4.989 0 0 1 21.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 0 1 4.708-5.218 4.21 4.21 0 0 1 3.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 0 1 3.679-1.938m0-2a6.04 6.04 0 0 0-4.797 2.127 6.052 6.052 0 0 0-4.787-2.127A6.985 6.985 0 0 0 .5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 0 0 3.518 3.018 2 2 0 0 0 2.174 0 45.263 45.263 0 0 0 3.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 0 0-6.708-7.218Z"></path></svg>'
		}
	})
}

function sendClickHandler(event) {
	const bottom_input = document.querySelector('.bottom_input')
	const eventValue = event.target.parentNode
	const post_idx = eventValue.getAttribute('idx')
	const parent_idx = eventValue.getAttribute('parent_idx')
	const depth = +eventValue.getAttribute('depth')
	const nick_name = eventValue.getAttribute('nick_name')
	let content = event.target.parentNode.querySelector('textarea')
	console.log(post_idx, parent_idx, depth, nick_name, content.value)
	
	if(nick_name != null) {
		const flag = content.value.split('@' + nick_name)[1][0] == ' '
		if(flag) {
			content.value = content.value.split('@' + nick_name)[1].slice(1)
		}
		else {
			content.value = content.value.split('@' + nick_name)[1]
		}
	}
//		console.log(content.value)
	
	let ob = {}
	if(parent_idx != null && depth != null) {
		ob = {
			post_idx: post_idx,
			users_idx: users_idx,
			parent_idx: parent_idx,
			depth: depth + 1,
			content: content.value
		}
	}
	else {
		ob = {
			post_idx: post_idx,
			users_idx: users_idx,
			content: content.value
		}
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
//			console.log(text)
		if(text == 1) {
			const bottom_input = document.querySelector('.bottom_input')
			bottom_input.removeAttribute('parent_idx')
			bottom_input.removeAttribute('depth')
			bottom_input.removeAttribute('nick_name')
			content.value = ''
			commentsHandler()
		}
	})
}

function recommentHandler(event) {
	const bottom_input = document.querySelector('.bottom_input')
	const textarea = document.querySelector('.bottom_input > textarea')
	let eventValue = event.target
	while(eventValue.className != 'comment_item') {
		eventValue = eventValue.parentNode
	}
	const parent_idx = eventValue.parentNode.parentNode.getAttribute('idx')
	const depth = eventValue.parentNode.parentNode.getAttribute('comment_depth')
	console.log(parent_idx, +depth + 1)
	const nick_name = eventValue.querySelector('.comment_item_top > .comment_nic > a').innerText
	console.log(nick_name)
	textarea.value = '@' + nick_name + ' '
	
	bottom_input.setAttribute('parent_idx', parent_idx)
	bottom_input.setAttribute('depth', depth)
	bottom_input.setAttribute('nick_name', nick_name)
}

function removeHandler(event) {		
	let eventValue = event.target
	while(eventValue.className != 'comment') {
		eventValue = eventValue.parentNode
	}
	const comments_idx = eventValue.getAttribute('idx')
//		console.log(comments_idx)
	if(confirm('정말 댓글을 삭제하시겠습니까?')) {
		const url = cpath + '/removeComments/' + comments_idx
		
		fetch(url)
		.then(resp => resp.text())
		.then(text => {
			if(text == 1) {
				commentsHandler()
			}
		})
	}
}

function commentCountHandler(event) {
	let eventValue = event.target
	const count = event.target.getAttribute('count')
	while(eventValue.className != 'comment') {
		eventValue = eventValue.parentNode
	}
	console.log(eventValue)
	const comment_idx = eventValue.getAttribute('idx')
	
	const commentList = document.querySelectorAll('.comment')
	console.log(commentList)
	
	if(event.target.getAttribute('onoff') == 0) {
		event.target.innerText = '─── \u00A0\u00A0\u00A0\u00A0\u00A0\u00A0답글 숨기기'
		commentList.forEach(comment => {
			const parent_idx = comment.getAttribute('parent_idx')
			if(parent_idx == comment_idx) {
				comment.classList.remove('hidden')
			}
		})
		event.target.setAttribute('onoff', 1)
	}
	else {
		event.target.innerText = '─── \u00A0\u00A0\u00A0\u00A0\u00A0\u00A0답글 보기(' + count + '개)'
		commentList.forEach(comment => {
			const parent_idx = comment.getAttribute('parent_idx')
			if(parent_idx == comment_idx) {
				comment.classList.add('hidden')
			}
		})
		event.target.setAttribute('onoff', 0)
	}		
}

function userSearchHandler(event) {
	const nickName = event.target.innerText.replace('@', '')
//		console.log(nickName)
	const url = cpath + '/users/getUserIDXByNickName/' + nickName
	
	fetch(url)
	.then(resp => resp.text())
	.then(text => {
//			console.log(text)
		const idx = text
		location.href = cpath + '/users/viewDetail/' + idx
	})
}

const imgLine = document.getElementById('imgLine') // 게시물의 1번째 이미지가 보여질 게시글 장소
const followBtn = document.getElementById('followBtn') // 팔로우 팔로잉 프로필 편집 버튼 (3개 돌려쓰기)
const postCnt = document.getElementById('postCnt') // 게시물 카운트
const followerCnt = document.getElementById('followerCnt') // 팔로워 카운트
const followingCnt = document.getElementById('followingCnt') // 팔로잉 카운트
const option = document.querySelector('.option')   // 옵션(톱니바퀴)

// 본인이라면 톱니바퀴 표시
function optionCheckHandler() {
   if(dto_idx == users_idx) {
       option.classList.remove('hidden')
    }
}

// 본인이라면 프로필 편집 아니라면 팔로우버튼 
function checkFollowHandler() {
   if(dto_idx == users_idx) {
         followBtn.innerHTML = '<a href="' + cpath + '/users/infoModify">프로필 편집</a>'
         followBtn.classList.add('modiPro')   // 나중에 프로필 편집 버튼에 속성 추가가 필요할까?
      }
   else {
      fetch(cpath + '/findFollow/' + dto_idx + '/' + users_idx)
          .then(resp => resp.text())
          .then(text => {
             console.log(text)
             if(text == 1) {
                followBtn.innerText = '팔로잉'
                followBtn.classList.add('unfollow')
             } 
             else {
                followBtn.innerText = '팔로우'
                followBtn.classList.remove('unfollow')
             }
          })
   }
}

// 팔로우 수 카운트
function followCntHandler(event) {
    fetch(cpath + '/countFollowing/' + dto_idx)
    .then(resp => resp.text())
    .then(text => {
       followingCnt.innerText = text
    })
    
    fetch(cpath + '/countFollower/' + dto_idx)
    .then(resp => resp.text())
    .then(text => {
       followerCnt.innerText = text
    })
    // 게시물 수 체크
    fetch(cpath + '/countPost/' + dto_idx)
    .then(resp => resp.text())
    .then(text => {
     postCnt.innerText = text  
    })
 }

// 팔로우 여부확인후 팔로우 팔로잉 표시
function followHandler(event) {
   console.log(event.target.value)
   if(event.target.innerHTML == '팔로우') {
      fetch(cpath + '/follow/' + dto_idx + '/' + users_idx)
      .then(resp => resp.text())
      .then(text => {
         
         if(text != 0) {
            event.target.innerText = '팔로잉'
            event.target.classList.add('unfollow')
            location.reload()
         }
      })
   }
   else if(event.target.innerHTML == '팔로잉') {
      fetch(cpath + '/unfollow/' + dto_idx + '/' + users_idx)
      .then(resp => resp.text())
      .then(text => {
         
         if(text != 0) {
            event.target.innerText = '팔로우'
            event.target.classList.remove('unfollow')
            location.reload()
         }
      })
   }
   else {
      // 이거 안해주면 프로필 편집 버튼 눌렀을 때 위에 else if 애들 손봐줘야 됨
   }
}

// 옵션 모달
const open = () => {
    document.querySelector(".option_modal").classList.remove("hidden")
}
const closeoption = () => {
    document.querySelector(".option_modal").classList.add("hidden")
}

document.querySelector(".option").addEventListener("click", open);
document.querySelector(".closeBtn").addEventListener("click", closeoption);
document.querySelector(".option_modal_bg").addEventListener("click", closeoption);   

followBtn.onclick = followHandler