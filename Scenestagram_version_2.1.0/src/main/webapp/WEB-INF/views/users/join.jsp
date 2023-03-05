<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${cpath }/resources/css/users_join.css">
</head>

<script type="text/javascript">
	
	
	
	
</script>
    <div class="container">
        <main class="loginMain">
        <!--로그인섹션-->
            <section class="login">
               <!--로그인박스-->
                <article class="login__form__container">
                   <!--로그인 폼-->
                   <div class="login__form">
                        <h1><img src="${cpath }/resources/img/loginlog.jpg" alt=""></h1>
                        
                        <div class="logo_ment">
                        	<h3>
                        	친구들의 사진과 동영상을 보려면<br>
                        	가입하세요.
                        	</h3>
                        </div>						
                        
                        <!--로그인 인풋-->
                        <form id="join_form" class="login__input"  action="${cpath }/users/join" method="POST">
                            <input type="text" id="id" name="email" placeholder="이메일 주소" required>
                            <div class="email_err"></div>
							<input type="password" name="pw_sub" placeholder="비밀번호 입력" required>
							<div class="pw_sub_err"></div>
							<input type="password" name="pw" placeholder="비밀번호  다시 입력" required>
							<div class="pw_err"></div>
                            <input type="text" id="name" name="name" placeholder="성명" required="required" />
                            <input type="date" id="birth" name="birth" required="required" />
                        	<select name="gender" required>
                        		<option selected disabled value="">성별</option>
                        		<option value="남성">남자</option>
                        		<option value="여성">여자</option>	                        		
                        	</select>
                            <input type="text" id="nick_name" name="nick_name" placeholder="사용할 닉네임" required="required" >
                            <div class="nick_name_err"></div>
                            <input type="text" id="phone_number" name="phone_number" placeholder="휴대전화 (-없이)" required>
                            <div class="phone_number_err"></div>
                            <button id="join_btn" class="join_btn" onclick="return allCheck()">가입</button>
                        </form>
                        <!--로그인 인풋end-->
                    </div>
                    
                    <!--계정이 있으신가요?-->
                    <div class="login__register">
                        <span>계정이 있으신가요?</span>
                        <a href="${cpath }/users/login">로그인</a>
                    </div>
                    <!--계정이 없으신가요?end-->
                </article>
            </section>
        </main>
    </div>


<!-- jquery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${cpath }/resources/js/users_join.js"></script>

</body>
</html>