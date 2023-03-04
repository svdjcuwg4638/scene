<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<style>
.items {
	display: flex;
	flex-wrap: wrap;
	margin: 0 -10px;
}

.item {
	margin-bottom: 20px;
	margin-left: 10px;
	margin-right: 10px;
}

.list>.items>.item img {
	width: 300px;
	height: 300px;
	object-fit: cover;
}

.item p {
	margin-top: 10px;
	text-align: center;
}

.list>.items {
	width: 1000px;
	display: flex;
	flex-wrap: wrap;
	margin: auto;
}

.main_wrap {
	overflow-y: scroll;
	height: 1000px;
}

.main_wrap::-webkit-scrollbar {
	display: none;
}
</style>

<div class="all_wrap">
	<div class="main_wrap" offset="0">
		<div class="list">
			<div class="items">
				<!-- 게시물 들어옴 -->
			</div>
		</div>
	</div>
</div>

<!-- 스크롤 -->
<script>
	const items = document.querySelector('.items')
	const main_wrap = document.querySelector('.main_wrap')

	function scrollHandler() {	
		const offset = +main_wrap.getAttribute('offset')
		const cur = main_wrap.scrollTop + main_wrap.clientHeight
		console.log(main_wrap.scrollTop, main_wrap.clientHeight)
		const flag = (main_wrap.scrollHeight * 0.95 <= cur && cur <= main_wrap.scrollHeight * 1.05) || offset == 0
		console.log(cur, flag)
		if(flag) {
			fetch('${cpath}/explore/' + offset)
			.then(resp => resp.json())
			.then(json => {
				json.forEach(dto => {
					let tag = ''
					tag += '<div class="item">'
					tag += '<a href="${cpath }/post/detail/' + dto.post_idx + '">'
					tag += '<img src="${cpath}/upload/' + dto.file_name + '">'
					tag += '</a>'
					tag += '</div>'
					items.innerHTML += tag
					main_wrap.setAttribute('offset', offset + 12)
				})
			})
		}
	}

	
window.onload = scrollHandler
main_wrap.onscroll = scrollHandler


</script>

</body>
</html>