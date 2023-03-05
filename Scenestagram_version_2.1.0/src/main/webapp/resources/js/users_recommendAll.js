const recofri = document.getElementById('recommend-friend')
const page = 1	// 현재 페이지 번호
const limit = 10	// 한 번에 로드할 데이터 개수 
let isLoading = false // 데이터 로드 중인지 여부  

function loadHandler() {	   
	const url = cpath + '/countFollowing/' + users_idx
	const check =
	fetch(url)
	.then(resp => resp.text())
	.then(text => {
		if(text == 0) {
			recommendFamous()
		}
	    else {
	       recommendHandler()
	    }    	
	})       
}

function recommendFamous() {
	const url = cpath + '/recommendFamous/' + users_idx
		fetch(url)
		.then(resp => resp.json())
		.then(json => {
			json.forEach(dto => {
				let tag = ''
					tag += '<div class="flex">'
					tag += '<div id="fflex">'
					tag += '<div class="img-box">'
					tag += '<a href="' + cpath + '/users/viewDetail/' + dto.idx + '">'
					tag += '<img src="' + cpath + '/resources/img/' + dto.user_img + '">'
					tag += '</a>'
					tag += '</div>'
					tag += '<div class="center">'
					tag += '<div class="nick">'
					tag += '<a href="' + cpath + '/users/viewDetail/' + dto.idx + '">'+ dto.nick_name + '</a>'
					tag += '</div>'
					tag += '<div class="name">' + dto.name + '</div>'
					tag += '</div>'
					tag += '</div>'
					tag += '<div class="followBtn" idx=' + dto.idx + '><button>팔로우</button></div>'
					tag += '</div>'
					recofri.innerHTML += tag
			})
			const followBtnList = document.querySelectorAll('div.followBtn')
			console.log(followBtnList)
			followBtnList.forEach(btn => btn.onclick = followHandler)
		})
}
   
function recommendHandler() {
	let friend20Cut = 0;      // 20명만 보여주게 할 것
	const url = cpath + '/recommendAll/' + users_idx
	fetch(url)
	.then(resp => resp.json())
	.then(json => {
		console.log(json)
	
		json.forEach(dto => {
		console.log(dto.nick_name)
		console.log(dto.idx)
			if(friend20Cut != 20) {
				let tag = ''
				tag += '<div class="flex">'
				tag += '<div id="fflex">'
				tag += '<div class="img-box">'
				tag += '<a href="' + cpath + '/users/viewDetail/' + dto.idx + '">'
				tag += '<img src="' + cpath + '/resources/img/' + dto.user_img + '">'
				tag += '</a>'
				tag += '</div>'
				tag += '<div class="center">'
				tag += '<div class="nick">'
				tag += '<a href="' + cpath + '/users/viewDetail/' + dto.idx + '">'+ dto.nick_name + '</a>'
				tag += '</div>'
				tag += '<div class="name">' + dto.name + '</div>'
				tag += '</div>'
				tag += '</div>'
				tag += '<div class="followBtn" idx=' + dto.idx + '><button>팔로우</button></div>'
				tag += '</div>'
				recofri.innerHTML += tag
				friend20Cut += 1
			}         
		})
		const followBtnList = document.querySelectorAll('div.followBtn')
		console.log(followBtnList)
		followBtnList.forEach(btn => btn.onclick = followHandler)
	})      
}
   
function followHandler(event) {
	console.log(event.target.parentNode.getAttribute('idx'))
	const idx = event.target.parentNode.getAttribute('idx')
	if(event.target.innerHTML == '팔로우') {
		fetch(cpath + '/follow/' + idx + '/' + users_idx)
		.then(resp => resp.text())
		.then(text => {
    
			if(text != 0) {
				event.target.innerText = '팔로잉'
				event.target.classList.add('unfollow')            
			}
		})
	}
	else if(event.target.innerHTML == '팔로잉') {
		fetch(cpath + '/unfollow/' + idx + '/' + users_idx)
		.then(resp => resp.text())
		.then(text => {
     
			if(text != 0) {
				event.target.innerText = '팔로우'
        		event.target.classList.remove('unfollow')
            
			}
		})
   }   
}   

document.body.onload = loadHandler