<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/users_infoModify.css">
  <div class="all_wrap">

    <div class="main_wrap">

      <!-- 사이드 탭-->
      <div class="info_side">
        <div>프로필 편집</div>
        <div><a href="${cpath }/users/infoModify_replacePw">비밀번호 변경</a></div>
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
              <div class="info_change_img">프로필 사진 바꾸기</div>
            </div>
          </div>
        </div>
        <!-- 상단 프로필 이미지 와 닉네임 사진변경 end-->

        <!-- form문 html코드-->
        <div class="info_section_main">
          <form action="${cpath }/users/infoModify" method="POST">

			<input type="hidden" name="idx" value="${login.idx }">
            <div class="info_name">
              <div>이름</div>
              <div><input type="text" name="name" value="${login.name }" readonly></div>
            </div>

            <div class="info_ncikName">
              <div>닉네임</div>
              <div>
              	<input type="text" name="nick_name" value="${login.nick_name }">
              	<div class="nick_name_err err"></div>
              </div>
              
            </div>

            <div class="info_introduce">
              <div>소개</div>
              <div id="introduce">
              	<textarea maxlength="150" spellcheck="false" name="introduce">${login.introduce }</textarea>
              	<div class="info_introduce_count"><div class="length_count"></div>/150</div>
              </div>
            </div>

            <div class="info_email">
              <div>이메일</div>
              <div>
              	<div><input type="text" name="email" value="${login.email }"></div>
              	<div class="email_err err"></div>
              	
              </div>
            </div>
			
            <div class="info_phoneNumber">
              <div>전화번호</div>
              <div><input type="text" name="phone_number" value="${login.phone_number}" readonly></div>
            </div>
			
            <div class="info_gender">
              <div>성별</div>
              <div>
                <select name="gender">
                  <option disabled value="">성별</option>
                  <option value="남성" ${login.gender=='남성' ? 'selected' : '' }>남자</option>
                  <option value="여성" ${login.gender=='여성' ? 'selected' : '' }>여자</option>
                </select>
              </div>
            </div>

            <div>
              <div></div>
              <div class="info_submit_">
                <div><input id="info_submit_btn" type="submit" onclick="return allCheck()"></div>
                <div><a href="">일시적으로 계정 비활성화</a></div>
              </div>

            </div>

          </form>
        </div>
        <!-- form문 html코드 end-->

      </div>
    </div>
  </div>
  <!-- 모달 start -->
  <div class="modal_bg hidden"></div>
	<div class="modal_wrap hidden">
		<div>프로필 사진 바꾸기</div>
		<div class="info_img_modify">
			<form action="" class="profile_img_form">
			  <div class="profile_add_img_file_input">
			    <label for="profile_add_file">사진 업로드</label>
			    <input id="profile_add_file" type="file" name="profileimageFile" onchange="profileAddFormHandler(event);">
			  </div>
			</form>
		</div>
		<div class="modal_img_delete">현재 사진 삭제</div>
		<div class="modal_foot_btn">취소</div>
	</div>
	<!-- 모달 end -->
      
<!-- jquery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${cpath }/resources/js/users_infoModify.js"></script>
    
</body>
</html>