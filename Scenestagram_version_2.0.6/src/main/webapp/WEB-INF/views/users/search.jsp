<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<form method="GET" id="form">
	<input type="radio" name="option" value="usersOption">유저 <input
		type="radio" name="option" value="hashOption"># <input
		id="searchValue" type="text" name="searchValue" placeholder="검색">
	<input type="submit" value="검색">
</form>

<div id="root"></div>




<script>
	const root = document.getElementById('root')
	const form = document.getElementById('form')
	
	function searchHandler(event) {
		event.preventDefault()
		root.innerText = ''	  	// 다른 옵션 선택하면 기존에 보던 애들 날려주기
		
		const option = document.querySelector('input[name="option"]:checked').value // 옵션 = 옵션(라디오)에 체크된.값
		console.log(option)
		const searchValue = document.querySelector('input[name="searchValue"]').value
		console.log(searchValue)
		
		if(option == 'usersOption') {
			fetch('${cpath}/usersSearch/' + searchValue)
			.then(resp => resp.json())
			.then(json => {
				console.log(json)	// 여기에 지금 유저리스트 담겨있스빈다
				json.forEach(dto => {
					let tag = ''		// 여기에 유저 프사 넣는 것도 해야됨
					tag += '<a href="${cpath}/users/viewDetail/'+ dto.idx + '"><div><img src="${cpath}/C:\\userProfile">' + dto.nick_name + '</div></a>'
					root.innerHTML += tag
				})
			})
		}
		else if (option == 'hashOption') {
			fetch('${cpath}/hashSearch/' + searchValue)
			.then(resp => resp.json())
			.then(json => {
				console.log(json)	// 여기에 지금 해시리스트 담겨잇스빈다
				json.forEach(dto => {
					let tag = ''
					tag = '<a href="${cpath}/post/postList/'+ dto.hashtag.replace("#", "") + '/"><div class="name">' + dto.hashtag + '</div></a>'
					console.log(dto.hashtag)
					console.log(dto.hashtag.replace("#", ""))
					root.innerHTML += tag
				})
			})
		}
		else {
			console.log('아무것도 안넣으면 뭔가를 추천해주는 옵션')
			// 아무것도 안넣으면 추천해주는 옵션
		}
		
// 		const url = '${cpath}/search?option=' + ob.option + '&searchValue=' + ob.searchValue		
// 		fetch(url)
// 		.then(resp => resp.json())
// 		.then(json => {
// 			console.log(json)
			
// 			json.forEach(dto => {
// 				let tag = ''
// 				tag += '<div class="item" idx="' + dto.name +'">'
// 				tag += '</div>'
// 				root.innerText += tag
// 			})
// 		})
	}
	
	form.onsubmit = searchHandler
	

</script>

</body>
</html>