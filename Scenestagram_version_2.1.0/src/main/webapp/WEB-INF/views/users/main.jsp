<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/users_main.css">
</head>
<body onload="loadHandler(); scrollHandler();">
<div class="screen" offset="0">


        <!-- 가운데 메인 -->
   <div class="all_wrap">
    	<div class="main_wrap">    
        <div class="home_main">
            <div class="main">
                <div style="display: block;">
                    <div class="home-feed" id="home-feed">
                        <div class="home-feed-left">
                            <!-- 스토리-->
                            <div class="stoty">
                            </div>
                            <!-- 게시물 (POST) -->
                            <div class="post" id="post">
                            </div>
                            <!-- 게시물 (POST) end -->
                        </div>
						<!-- 메인피드의 오른쪽 마이프로필 및 추천 -->
                        <div class="home-feed-right">
                            <div class="home-feed-right-myprofile">
                                <div>
                                    <div class="img-box">
                                    	<a href="${cpath }/users/viewDetail/${login.idx }">${login.nick_name }
                                        	<img src="${cpath }/resources/img/${login.user_img }" alt="">
                                        </a>
                                    </div>
                                    <div class="id-box">
                                        <div>
                                            <a style="color: white;" href="${cpath }/users/viewDetail/${login.idx }">${login.nick_name }</a>
                                        </div>
                                        <span class="id">${login.name }</span>

                                    </div>
                                </div>
                            </div>
                            <div class="recommend">
                                <div class="flex">
                                   <div style=" display:flex; justify-content: space-between; width:100%;">
                                       <div style="color: #A8A8A8; font-weight: bold;">회원님을 위한 추천</div>
                                       <div><a style="color: white; font-weight: bold; font-size: 15px;" href="${cpath }/users/recommendAll">모두보기</a></div>
                                    </div>
                                </div>
                                <div id="recommend-friend"></div>
                            </div>
                        </div>
                        <!-- 메인피드의 오른쪽 마이프로필 및 추천 end-->
                    </div>
                </div>
            </div>
        </div>
        <!-- 가운데 메인 end-->
        </div>
	</div>
</div>

<div id="modal">	
	<div class="modal_content">
		<div class="image_content">
			<div class="left prev imt"></div>
			<div class="images" index="0"></div>
			<div class="right next imt"></div>
		</div>
		<div class="post_content"></div>
	</div>	
	<div id="modal_overlay"></div>
	<div class="close">
		<svg aria-label="닫기" class="x1lliihq x1n2onr6" color="rgb(255, 255, 255)" fill="rgb(255, 255, 255)" height="18" role="img" viewBox="0 0 24 24" width="18"><title>닫기</title><polyline fill="none" points="20.643 3.357 12 12 3.353 20.647" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"></polyline><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="3" x1="20.649" x2="3.354" y1="20.649" y2="3.354"></line></svg>
	</div>
</div>
<script type="text/javascript" src="${cpath }/resources/js/main.js"></script>
<script type="text/javascript" src="${cpath }/resources/js/users_main.js"></script>

</body>
</html>