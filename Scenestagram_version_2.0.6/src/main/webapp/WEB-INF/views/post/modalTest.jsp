<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
.modal {
	display: none;
}

.modal_content {
	position: absolute;
	top: 450px;
	left: 50%;
	width: 1000px;
	height: 800px;
	display: none;
	background-color: #dadada;
	padding: 50px;
	text-align: center;
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 black;
	transform: translateX(-50%) translateY(-50%);
	z-index: 2;
}

.image_content {
	display: flex;
	align-items: center;
	position: relative;
	width: 700px;
	height: 700px;
	overflow: hidden;
}

.post_content {
	width: 200px;
	text-align: center;
}

.prevBtn {
	position: absolute;
	top: 450px;
	left: 0px;
	display: none;
	text-align: center;
	border-radius: 10px;
	z-index: 3;
}

.nextBtn {
	position: absolute;
	top: 450px;
	right: 0px;
	display: none;
	text-align: center;
	border-radius: 10px;
	z-index: 3;
}

.left {
	position: absolute;
	top: 50%;
	left: 0px;
	text-align: center;
	border-radius: 10px;
	z-index: 3;
}

.right {
	position: absolute;
	top: 50%;
	right: 0px;
	text-align: center;
	border-radius: 10px;
	z-index: 3;
}

.item:hover {
	cursor: pointer;
}

.images {
	position: absolute;
	display: flex;
	height: 500px;
	left: 0px;
	transition-duration: 0.5s;
}

.image {
	position: relative;
	top: 0;
	width: 700px;
	height: 500px;
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	background-size: auto 100%;
	background-position: center center;
	background-repeat: no-repeat;
}

.image>img {
	width: 700px;
	height: 700px;
}

#modal_overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	display: none;
	background-color: rgba(0, 0, 0, 0.6);
	z-index: 1;
}
</style>
<script>
	const cpath = '${cpath}'
	const size = '${size}'
</script>
<div class="list">
	<div class="items">
		<c:forEach var="dto" items="${list }" varStatus="status">
			<div class="item" offset="${status.index }" idx="${dto.post_idx }">
				<div>
					<img src="${cpath}/upload/${dto.file_name }">
				</div>
				<p>${dto.post_idx }</p>
			</div>
		</c:forEach>
	</div>
</div>
<div>
	<a href="${cpath }/post/add"><button>글작성</button></a>
</div>

<div id="modal">
	<div class="prevBtn">
		<button>이전</button>
	</div>
	<div class="modal_content">
		<div class="image_content">
			<div class="left">
				<button>이전</button>
			</div>
			<div class="images" index="0"></div>
			<div class="right">
				<button>다음</button>
			</div>
		</div>
		<div class="post_content"></div>
	</div>
	<div class="nextBtn">
		<button>다음</button>
	</div>
	<div id="modal_overlay"></div>
</div>

<script>
	const modal = document.getElementById('modal')
	const modal_content = document.querySelector('.modal_content')
	const post_content = document.querySelector('.post_content')
	const modal_overlay = document.getElementById('modal_overlay')
	const prevBtn = document.querySelector('.prevBtn')
	const nextBtn = document.querySelector('.nextBtn')
	const left = document.querySelector('.left')
	const right = document.querySelector('.right')
	const itemList = document.querySelectorAll('.item')
	itemList.forEach(e => e.onclick = itemClickHandler)
	
	function itemClickHandler(event) {
		let eventValue = event.target
		while(eventValue.className != 'item') {
			eventValue = eventValue.parentNode
		}
// 		console.log(eventValue)
		const post_idx = eventValue.getAttribute('idx')
// 		console.log(post_idx)
		const offset = eventValue.getAttribute('offset')
// 		console.log(offset)
		const url = cpath + '/post/modalTest/' + post_idx
// 		console.log(size)
		fetch(url)
		.then(resp => resp.json())
		.then(json => {
// 			console.log(json)
			const dto = json
			const imgList = dto.FILE_NAME.split(',')			
			const img_size = imgList.length
			console.log(img_size)
			const images = document.querySelector('.images')			
			imgList.forEach(img => {				
				let imageTag = 	'<div class="image">'
				imageTag += 		'<img src=' + cpath + '/upload/' + img + '>'
				imageTag += 	'</div>'
				
				images.innerHTML += imageTag
			})
			
			let tag = '<div class="idx">' + dto.IDX + '</div>'			
			tag += '<div class="users_idx">' + dto.USERS_IDX + '</div>'			
			tag += '<pre>' + dto.CONTENT + '</pre>'
			tag += '<div>' + dto.LOCATION + '</div>'
			tag += '<div>' + dto.VIEWS + '</div>'
			tag += '<div class="offset">' + offset + '</div>'
			
			post_content.innerHTML += tag
			modal.style.display = 'block'
			modal_content.style.display = 'flex'			
			modal_overlay.style.display = 'block'
			if(offset != 0) prevBtn.style.display = 'block'
			if(offset != size - 1) nextBtn.style.display = 'block'
			if(img_size == 1) {
				left.style.display = 'none'
				right.style.display = 'none'
			}
			else {
				left.style.display = 'none'
				right.style.display = 'block'
			}
			
		})		
	}
	
	nextBtn.onclick = nextClickHandler
	prevBtn.onclick = prevClickHandler
	left.onclick = leftHandler
	right.onclick = rightHandler
	
	function nextClickHandler(event) {
		const eventValue = event.target.parentNode.parentNode
		const users_idx = eventValue.querySelector('.post_content').querySelector('.users_idx').innerText
		const offset = +eventValue.querySelector('.post_content').querySelector('.offset').innerText + 1
// 		console.log(users_idx)
// 		console.log(offset)
		const url = cpath + '/post/modalTest/' + users_idx + '/' + offset
// 		console.log(url)
		
		fetch(url)
		.then(resp => resp.json())
		.then(json => {
// 			console.log(json)
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
			
			let tag = '<div class="idx">' + dto.IDX + '</div>'			
			tag += '<div class="users_idx">' + dto.USERS_IDX + '</div>'			
			tag += '<pre>' + dto.CONTENT + '</pre>'
			tag += '<div>' + dto.LOCATION + '</div>'
			tag += '<div>' + dto.VIEWS + '</div>'
			tag += '<div class="offset">' + offset + '</div>'			
			
			post_content.innerHTML += tag
			
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
		})
	}
	
	function prevClickHandler(event) {
		const eventValue = event.target.parentNode.parentNode
		const users_idx = eventValue.querySelector('.post_content').querySelector('.users_idx').innerText
		const offset = +eventValue.querySelector('.post_content').querySelector('.offset').innerText - 1 
// 		console.log(users_idx)
// 		console.log(offset)
		const url = cpath + '/post/modalTest/' + users_idx + '/' + offset
// 		console.log(url)
		
		fetch(url)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
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
			
			let tag = '<div class="idx">' + dto.IDX + '</div>'			
			tag += '<div class="users_idx">' + dto.USERS_IDX + '</div>'			
			tag += '<pre>' + dto.CONTENT + '</pre>'
			tag += '<div>' + dto.LOCATION + '</div>'
			tag += '<div>' + dto.VIEWS + '</div>'
			tag += '<div class="offset">' + offset + '</div>'
			
			post_content.innerHTML += tag
			
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
		})
	}
	
	function leftHandler() {
		const images = document.querySelector('.images')
		const length = +images.querySelectorAll('div.image').length
		const index = +images.getAttribute('index')
		console.log(index, length)
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
		console.log(index, length)
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
</script>
</body>
</html>