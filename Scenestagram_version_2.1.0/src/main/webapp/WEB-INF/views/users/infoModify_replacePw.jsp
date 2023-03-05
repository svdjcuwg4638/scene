<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/users_infoModify_replacePw.css">

  <div class="all_wrap">

    <div class="main_wrap">

      <!-- 사이드 탭-->
      <div class="info_side">
        <div><a href="${cpath }/users/infoModify">프로필 편집</a></div>
        <div>비밀번호 변경</div>
      </div>
      <!-- 사이드 탭 end-->

      <div class="info_section">

        <!-- 상단 프로필 이미지 와 닉네임 사진변경 -->
        <div class="info_section_top">

          <div class="info_top_img">
            <img src="${cpath }/resources/img/${login.user_img }">
          </div>

          <div>
            <div class="ingo_top_right">
              <div class="info_nickName">${login.nick_name }</div>
            </div>
          </div>
        </div>
        <!-- 상단 프로필 이미지 와 닉네임 사진변경 end-->

        <!-- form문 html코드-->
        <div class="info_section_main">
          <form action="${cpath }/users/infoModify_replacePw" method="POST">

	            <div class="info_name">
	              <div>이전 비밀번호</div>
	              <div><input type="password" name="old_pw" required></div>
	            </div>
	            
	           	<div class="info_name">
	              <div>새 비밀번호</div>
	              	<div>
		               	<div><input type="password" name="newPw" required></div>
		               	<div class="pw_sub_err err"></div>
	            	</div>
	            </div>
	            
	           <div class="info_name">
	              <div>새 비밀번호 재확인</div>
	              <div>
	              	<div><input type="password" name="pw" required></div>
	              	<div class="pw_err err"></div>
	              </div>
	            </div>

              <div class="info_submit_">
              	<div></div>
                <div>
                	<div><input id="info_submit_btn" type="submit" value="비밀번호 변경" onclick="return allCheck()"></div>
		            <div><a href="${cpath }/users/findPw">비밀번호를 잊으셨나요?</a></div>
                </div>
              </div>
              
              
          </form>
        </div>
        <!-- form문 html코드 end-->
			
      </div>
    </div>
  </div>
  
<!-- jquery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${cpath }/resources/js/users_infoModify_replacePw.js"></script>

</body>
</html>