<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.2/css/line.css" />
<link rel="stylesheet" href="${cpath }/resources/css/header.css" />
<script type="text/javascript">
	const cpath = '${cpath}'
	const users_idx = '${login.idx}'
</script>
</head>
<body>
		<!-- 사이드바 포스트 추가 모달 -->
			<div class="post_add_modal_back hidden"><div class="x10l6tqk x160vmok x1eu8d0j x1vjfegm"><div class="x1i10hfl x6umtig x1b1mbwd xaqea5y xav7gou x9f619 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz x6s0dn4 x78zum5 xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x1ypdohk xl56j7k x1y1aw1k x1sxyh0 xwib8y2 xurb0ha" role="button" tabindex="0"><div class="x78zum5 x6s0dn4 xl56j7k xdt5ytf"><svg aria-label="닫기" class="x1lliihq x1n2onr6" color="rgb(255, 255, 255)" fill="rgb(255, 255, 255)" height="18" role="img" viewBox="0 0 24 24" width="18"><title>닫기</title><polyline fill="none" points="20.643 3.357 12 12 3.353 20.647" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"></polyline><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="3" x1="20.649" x2="3.354" y1="20.649" y2="3.354"></line></svg></div></div></div></div>
			<div class="post_add_modal_delete hidden"><div class="x10l6tqk x160vmok x1eu8d0j x1vjfegm"><div class="x1i10hfl x6umtig x1b1mbwd xaqea5y xav7gou x9f619 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz x6s0dn4 x78zum5 xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x1ypdohk xl56j7k x1y1aw1k x1sxyh0 xwib8y2 xurb0ha" role="button" tabindex="0"><div class="x78zum5 x6s0dn4 xl56j7k xdt5ytf"><svg aria-label="닫기" class="x1lliihq x1n2onr6" color="rgb(255, 255, 255)" fill="rgb(255, 255, 255)" height="18" role="img" viewBox="0 0 24 24" width="18"><title>닫기</title><polyline fill="none" points="20.643 3.357 12 12 3.353 20.647" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"></polyline><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="3" x1="20.649" x2="3.354" y1="20.649" y2="3.354"></line></svg></div></div></div></div>
			
			<!-- 게시물작성 취소 모달 -->
			<div class="post_add_modal_delete_modal hidden">
				<div class="post_add_modal_delete_modal_background"><div class="x10l6tqk x160vmok x1eu8d0j x1vjfegm"><div class="x1i10hfl x6umtig x1b1mbwd xaqea5y xav7gou x9f619 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz x6s0dn4 x78zum5 xjbqb8w x1ejq31n xd10rxx x1sy0etr x17r0tee x1ypdohk xl56j7k x1y1aw1k x1sxyh0 xwib8y2 xurb0ha" role="button" tabindex="0"><div class="x78zum5 x6s0dn4 xl56j7k xdt5ytf"><svg aria-label="닫기" class="x1lliihq x1n2onr6" color="rgb(255, 255, 255)" fill="rgb(255, 255, 255)" height="18" role="img" viewBox="0 0 24 24" width="18"><title>닫기</title><polyline fill="none" points="20.643 3.357 12 12 3.353 20.647" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"></polyline><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="3" x1="20.649" x2="3.354" y1="20.649" y2="3.354"></line></svg></div></div></div></div>
				<div class="post_add_modal_delete_modal_wrap">
					<div>
						<div class="post_add_moda_delete_ment">
							<div>게시물 작성을 취소 하시겠어요?</div>
							<div>지금 나가면 수정 내용이 저장 되지 않습니다.</div>						
						</div>
						<div class="post_add_moda_delete_btn">
							<div>삭제</div>
							<div>취소</div>
						</div>
					</div>
				</div>
			</div>		
			
			<div class="post_add_modal_wrap hidden">
				<div class="post_add_modal_title"><h1 class="post_add_modal_title_content">새 게시물 만들기</h1></div>
				<form action="" class="sidebar_post_add_form">
				
					<!-- 이미지 업로드 div -->
					<div class="post_upload_img">
						<div>
							<div class="post_add_img"><svg aria-label="이미지나 동영상과 같은 미디어를 나타내는 아이콘" class="_ab6-" color="rgb(245, 245, 245)" fill="rgb(245, 245, 245)" height="77" role="img" viewBox="0 0 97.6 77.3" width="96"><path d="M16.3 24h.3c2.8-.2 4.9-2.6 4.8-5.4-.2-2.8-2.6-4.9-5.4-4.8s-4.9 2.6-4.8 5.4c.1 2.7 2.4 4.8 5.1 4.8zm-2.4-7.2c.5-.6 1.3-1 2.1-1h.2c1.7 0 3.1 1.4 3.1 3.1 0 1.7-1.4 3.1-3.1 3.1-1.7 0-3.1-1.4-3.1-3.1 0-.8.3-1.5.8-2.1z" fill="currentColor"></path><path d="M84.7 18.4 58 16.9l-.2-3c-.3-5.7-5.2-10.1-11-9.8L12.9 6c-5.7.3-10.1 5.3-9.8 11L5 51v.8c.7 5.2 5.1 9.1 10.3 9.1h.6l21.7-1.2v.6c-.3 5.7 4 10.7 9.8 11l34 2h.6c5.5 0 10.1-4.3 10.4-9.8l2-34c.4-5.8-4-10.7-9.7-11.1zM7.2 10.8C8.7 9.1 10.8 8.1 13 8l34-1.9c4.6-.3 8.6 3.3 8.9 7.9l.2 2.8-5.3-.3c-5.7-.3-10.7 4-11 9.8l-.6 9.5-9.5 10.7c-.2.3-.6.4-1 .5-.4 0-.7-.1-1-.4l-7.8-7c-1.4-1.3-3.5-1.1-4.8.3L7 49 5.2 17c-.2-2.3.6-4.5 2-6.2zm8.7 48c-4.3.2-8.1-2.8-8.8-7.1l9.4-10.5c.2-.3.6-.4 1-.5.4 0 .7.1 1 .4l7.8 7c.7.6 1.6.9 2.5.9.9 0 1.7-.5 2.3-1.1l7.8-8.8-1.1 18.6-21.9 1.1zm76.5-29.5-2 34c-.3 4.6-4.3 8.2-8.9 7.9l-34-2c-4.6-.3-8.2-4.3-7.9-8.9l2-34c.3-4.4 3.9-7.9 8.4-7.9h.5l34 2c4.7.3 8.2 4.3 7.9 8.9z" fill="currentColor"></path><path d="M78.2 41.6 61.3 30.5c-2.1-1.4-4.9-.8-6.2 1.3-.4.7-.7 1.4-.7 2.2l-1.2 20.1c-.1 2.5 1.7 4.6 4.2 4.8h.3c.7 0 1.4-.2 2-.5l18-9c2.2-1.1 3.1-3.8 2-6-.4-.7-.9-1.3-1.5-1.8zm-1.4 6-18 9c-.4.2-.8.3-1.3.3-.4 0-.9-.2-1.2-.4-.7-.5-1.2-1.3-1.1-2.2l1.2-20.1c.1-.9.6-1.7 1.4-2.1.8-.4 1.7-.3 2.5.1L77 43.3c1.2.8 1.5 2.3.7 3.4-.2.4-.5.7-.9.9z" fill="currentColor"></path></svg></div>
							<div>사진과 동영상을 여기에 끌어다놓으세요</div>
							<div class="post_add_img_file_input">
								<label for="post_add_file">컴퓨터에서 선택</label>
								<input id="post_add_file" type="file" name="image_file" onchange="postAddFormHandler(this);" multiple placeholder="">
							</div>
						</div>
					</div>
					<!-- 이미지 업로드 div end->					
					
					<!-- 게시물 작성 div -->
					<div class="post_add_action hidden">
						<input type="hidden" name="users_idx" value="${login.idx }">
						<div>
							<div>
								<div class="post_add_back_btn hidden"><button class="_acan _acao _acas _aj1-" type="button"><div class="_ab8w  _ab94 _ab97 _ab9h _ab9k _ab9p  _ab9y _aba8 _abcm"><svg aria-label="왼쪽 방향 아이콘" class="_ab6-" color="rgb(255, 255, 255)" fill="rgb(255, 255, 255)" height="16" role="img" viewBox="0 0 24 24" width="16"><polyline fill="none" points="16.502 3 7.498 12 16.502 21" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></polyline></svg></div></button></div>
								<img class="post_add_preview">
								<div class="post_add_next_btn hidden"><button class="_acan _acao _acas _aj1-" type="button"><div class="_ab8w  _ab94 _ab97 _ab9h _ab9k _ab9p  _ab9y _aba8 _abcm"><svg aria-label="오른쪽 방향 아이콘" class="_ab6-" color="rgb(255, 255, 255)" fill="rgb(255, 255, 255)" height="16" role="img" viewBox="0 0 24 24" width="16"><polyline fill="none" points="8 3 17.004 12 8 21" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></polyline></svg></div></button></div>								
							</div>
							<div class="post_add_action_right">
								<div>
									<div class="post_add_action_btn"><input type="submit" value="공유하기"></div>
									<div class="post_add_action_profile_img"><img src="${cpath }/resources/img/userImg.jpg"></div>
									<div class="post_add_action_name">${login.nick_name}</div>
								</div>
								
								<div>
									<textarea class="post_add_action_content" name="content" placeholder="문구 입력..."></textarea>
									<input class="post_add_action_location" type="text" name="location" placeholder="위치 추가" autocomplete="off">
								</div>
							</div>
						</div>					
					</div>
					<!-- 게시물 작성 div end-->
				</form>
				
				<div class="post_add_finish_modal hidden">
					<div class="post_add_finish_modal_title"></div>
					<div class="post_add_finish_modal_content">
						<div>
							<div><img draggable="false" height="100%" width="100%" alt="애니메이션 효과 확인란" class="xl1xv1r" referrerpolicy="origin-when-cross-origin" src="https://static.cdninstagram.com/rsrc.php/v3/y5/r/4GCxSJTmyjy.gif"></div>
							<div>게시물이 공유되었습니다.</div>
						</div>
					</div>
				</div>
			</div>
	
<!-- 검색창 -->
<div class="search-box" index="0">
    <div class="search-box-top">
        <h2>검색</h2>
    </div>
    <div class="">
        <div class="searchBar">
               <select id="option">
                  <option value="usersOption" selected="selected">유저</option>
                  <option value="hashOption">해시</option>
               </select>
          <input id="searchValue" type="text" name="searchValue" placeholder="검색">
        </div>
        <br>
        <div class="">
            <div id="root"></div>

        </div>
    </div>
</div>
<!-- 검색창 end -->

<!-- 왼쪽 사이드 메뉴 -->
  <aside class="sidebar">
    <header class="sidebar-header">
    <a href="${cpath }/users/main">
      <img class="logo-img" src="${cpath }/resources/img/logo_dark.jpg" />
      <i class="logo-icon uil uil-instagram"></i>
    </a>
    </header>
    <nav>

      <button class="sidevar_go_main">
        <span>
          <i class="uil uil-estate"></i>
          <span>홈</span>
        </span>
      </button>

      <button class="search-btn">
        <span>
          <i class="uil uil-search"></i>
          <span>검색</span>
        </span>
      </button>
      	  
      <button class="sidevar_go_explore">
        <span>
          <i class="uil uil-compass"></i>
          <span>탐색 탭</span>
        </span>
      </button>      
	  	  
      <button class="sidevar_go_chat">
        <span>
          <i class="uil uil-location-arrow"></i>
          <span>메시지</span>
        </span>
      </button>      

      <button class="post_add_start_btn">
        <span>
          <i class="uil uil-plus-circle"> </i>
          <span>만들기</span>
        </span>
      </button>

      <button class="sidevar_go_profile">
        <span>
          <img src="${cpath }/resources/img/${login.user_img }" />
          <span>프로필</span>
        </span>
      </button>

      <button class="more_menu_btn">
			<!-- 더 보기 목록 -->
			<div class="more_menu">
				<div class="more_menu_wrap">
					<div class="more_menu_option_btn">
						<div>설정</div>
						<div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abb1 _abcm">
							<svg aria-label="설정" class="_ab6-" color="rgb(245, 245, 245)" fill="rgb(245, 245, 245)" height="24" role="img" viewBox="0 0 24 24" width="24"><circle cx="12" cy="12" fill="none" r="8.635" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></circle><path d="M14.232 3.656a1.269 1.269 0 0 1-.796-.66L12.93 2h-1.86l-.505.996a1.269 1.269 0 0 1-.796.66m-.001 16.688a1.269 1.269 0 0 1 .796.66l.505.996h1.862l.505-.996a1.269 1.269 0 0 1 .796-.66M3.656 9.768a1.269 1.269 0 0 1-.66.796L2 11.07v1.862l.996.505a1.269 1.269 0 0 1 .66.796m16.688-.001a1.269 1.269 0 0 1 .66-.796L22 12.93v-1.86l-.996-.505a1.269 1.269 0 0 1-.66-.796M7.678 4.522a1.269 1.269 0 0 1-1.03.096l-1.06-.348L4.27 5.587l.348 1.062a1.269 1.269 0 0 1-.096 1.03m11.8 11.799a1.269 1.269 0 0 1 1.03-.096l1.06.348 1.318-1.317-.348-1.062a1.269 1.269 0 0 1 .096-1.03m-14.956.001a1.269 1.269 0 0 1 .096 1.03l-.348 1.06 1.317 1.318 1.062-.348a1.269 1.269 0 0 1 1.03.096m11.799-11.8a1.269 1.269 0 0 1-.096-1.03l.348-1.06-1.317-1.318-1.062.348a1.269 1.269 0 0 1-1.03-.096" fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="2"></path></svg>
						</div>
					</div>
					<div class="more_menu_logout_btn">
						<div>로그아웃</div>
					</div>
				</div>
			</div>
			<!-- 더 보기 목록end -->
			<span> <i class="uil uil-bars"> </i> <span>더 보기</span>
			</span>
		</button>
    </nav>
  </aside>
<!-- 사이드메뉴 end -->

		<!-- 더 보기 목록 -->
		<div class="more_menu">
			<div class="more_menu_wrap">
				<div class="more_menu_option_btn">
					<div>설정</div>
					<div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abb1 _abcm"><svg aria-label="설정" class="_ab6-" color="rgb(245, 245, 245)" fill="rgb(245, 245, 245)" height="24" role="img" viewBox="0 0 24 24" width="24"><circle cx="12" cy="12" fill="none" r="8.635" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></circle><path d="M14.232 3.656a1.269 1.269 0 0 1-.796-.66L12.93 2h-1.86l-.505.996a1.269 1.269 0 0 1-.796.66m-.001 16.688a1.269 1.269 0 0 1 .796.66l.505.996h1.862l.505-.996a1.269 1.269 0 0 1 .796-.66M3.656 9.768a1.269 1.269 0 0 1-.66.796L2 11.07v1.862l.996.505a1.269 1.269 0 0 1 .66.796m16.688-.001a1.269 1.269 0 0 1 .66-.796L22 12.93v-1.86l-.996-.505a1.269 1.269 0 0 1-.66-.796M7.678 4.522a1.269 1.269 0 0 1-1.03.096l-1.06-.348L4.27 5.587l.348 1.062a1.269 1.269 0 0 1-.096 1.03m11.8 11.799a1.269 1.269 0 0 1 1.03-.096l1.06.348 1.318-1.317-.348-1.062a1.269 1.269 0 0 1 .096-1.03m-14.956.001a1.269 1.269 0 0 1 .096 1.03l-.348 1.06 1.317 1.318 1.062-.348a1.269 1.269 0 0 1 1.03.096m11.799-11.8a1.269 1.269 0 0 1-.096-1.03l.348-1.06-1.317-1.318-1.062.348a1.269 1.269 0 0 1-1.03-.096" fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="2"></path></svg></div>
				</div>
				<div class="more_menu_logout_btn">
					<div>로그아웃</div>
				</div>
			</div>		
		</div>
		<!-- 더 보기 목록end -->
      	
<!-- jquery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${cpath }/resources/js/header.js"></script>

