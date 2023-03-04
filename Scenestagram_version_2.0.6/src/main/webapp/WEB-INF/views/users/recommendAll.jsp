<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<head>
<style>
/* 가운데 정렬 */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	position: relative;
}
/* 나머지 스타일 */
.flex {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 10px;
}

.img-box {
	width: 44px;
	height: 44px;
	overflow: hidden;
	border-radius: 50%;
	margin-right: 15px;
}

.img-box img {
	width: 100%;
	height: 100%;
	object-fit: fill;
}

.followBtn button {
	background-color: #3897f0;
	color: #fff;
	border: none;
	border-radius: 3px;
	padding: 7px 16px;
	font-weight: bold;
	font-size: 12px;
}

.followBtn.unfollow button {
	background-color: #efefef;
	color: #333;
}

.followBtn button:hover {
	cursor: pointer;
	background-color: #1877F2
}

#recommend-friend {
	margin-top: 20px;
}

#center {
	align-items: center;
	position: absolute;
	top: 80px;
}

#center>div:nth-child(2) {
	width: 500px;
}

#fflex {
	display: flex;
}

.nick {
	font-weight: bold;
}

.nick a {
	color: white;
}

.name {
	font-size: 14px;
	color: #A8A8A8
}

.hidden {
	display: none;
	visibility: hidden;
}
</style>
</head>
<body>
	<div class="container">
		<div id="center">
			<div style="font-weight: bold">추천</div>
			<div id="recommend-friend"></div>
		</div>
	</div>


	<script>
   const recofri = document.getElementById('recommend-friend')
   const page = 1	// 현재 페이지 번호
   const limit = 10	// 한 번에 로드할 데이터 개수 
   let isLoading = false // 데이터 로드 중인지 여부  

   function loadHandler() {
	   
      const url = '${cpath}/countFollowing/${login.idx}'
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
      const url = '${cpath}/recommendFamous/${login.idx}'
      fetch(url)
      .then(resp => resp.json())
      .then(json => {
         json.forEach(dto => {
            let tag = ''
            tag += '<div class="flex">'
            tag += '<div id="fflex">'
            tag += '<div class="img-box">'
            tag += '<a href="${cpath}/users/viewDetail/' + dto.idx + '">'
            tag += '<img class="" src="${cpath}/resources/img/' + dto.user_img + '">'
            tag += '</a>'
            tag += '</div>'
            tag += '<div class="center">'
            tag += '<div class="nick">'
            tag += '<a href="${cpath}/users/viewDetail/' + dto.idx + '">'+ dto.nick_name + '</a>'
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
      const url = '${cpath}/recommendAll/${login.idx}'
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
                    tag += '<a href="${cpath}/users/viewDetail/' + dto.idx + '">'
                    tag += '<img class="" src="${cpath}/resources/img/' + dto.user_img + '">'
                    tag += '</a>'
                    tag += '</div>'
                    tag += '<div class="center">'
                    tag += '<div class="nick">'
                    tag += '<a href="${cpath}/users/viewDetail/' + dto.idx + '">'+ dto.nick_name + '</a>'
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
          fetch('${cpath}/follow/' + idx + '/${login.idx}')
          .then(resp => resp.text())
          .then(text => {
             
             if(text != 0) {
                event.target.innerText = '팔로잉'
                event.target.classList.add('unfollow')
                
             }
          })
       }
       else if(event.target.innerHTML == '팔로잉') {
          fetch('${cpath}/unfollow/' + idx + '/${login.idx}')
          .then(resp => resp.text())
          .then(text => {
             
             if(text != 0) {
                event.target.innerText = '팔로우'
                event.target.classList.remove('unfollow')
                
             }
          })
       }
       else {
          // 이거 안해주면 프로필 편집 버튼 눌렀을 때 위에 else if 애들 손봐줘야 됨
       }
    }   
   
   function scrollHandler() {
	   const scrollHeight = document.Element.scrollHeight
	   const scrollTop = document.document
   }
   
   // 스크롤 이벤트 감지
   document.body.onscroll = scrollHandler
   
   document.body.onload = loadHandler

</script>

</body>
</html>