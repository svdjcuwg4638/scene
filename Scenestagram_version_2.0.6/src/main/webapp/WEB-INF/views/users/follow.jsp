<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<style>
.unfollow {
	background-color: #dadada;
	font-weight: bold;
}

.followBtn {
	background-color: #1084de;
	font-weight: bold;
	font-size: 20px;
	color: white;
	width: 100px;
	height: 50px;
	margin: 10px 50px;
}
</style>
</head>
<body>

	${dto.nick_name }

	<!-- dto.idx 같이 보내주기 -->
	<button class="followBtn"></button>
	<%-- <a href="${cpath }/users/unfollow/${dto.idx}/${login.idx}"><button>언팔로우</button></a> --%>

	<a href="#"><button>메시지 보내기</button></a>

	<br>
	<br>

	<span>게시물</span>
	<span>팔로워</span>
	<span>팔로우</span>

	<div>${dto.name }</div>
	<div>${dto.introduce }</div>

	<script>
    const followBtn = document.querySelector('.followBtn')
    
    function checkFollowHandler() {
      
       fetch('${cpath}/findFollow/${dto.idx}/${login.idx}')
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
    
    function followHandler(event) {
       console.log(event.target.value)
       if(event.target.innerHTML == '팔로우') {
          fetch('${cpath}/follow/${dto.idx}/${login.idx}')
          .then(resp => resp.text())
          .then(text => {
             
             if(text != 0) {
                event.target.innerText = '팔로잉'
                event.target.classList.add('unfollow')
             }
          })
       }
       else {
          fetch('${cpath}/unfollow/${dto.idx}/${login.idx}')
          .then(resp => resp.text())
          .then(text => {
             
             if(text != 0) {
                event.target.innerText = '팔로우'
                event.target.classList.remove('unfollow')
             }
          })
       }
    }
   
    document.body.onload = checkFollowHandler
     followBtn.onclick = followHandler
</script>

</body>
</html>