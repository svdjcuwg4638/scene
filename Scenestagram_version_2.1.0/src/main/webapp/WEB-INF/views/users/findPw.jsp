<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${cpath }/resources/css/users_findPw.css">
</head>
    <div class="container">
        <main class="loginMain">
        <!--로그인섹션-->
            <section class="login">
               <!--로그인박스-->
                <article class="login__form__container">
                   <!--로그인 폼-->
                   <div class="login__form">
                        <h1><img src="${cpath }/resources/img/loginlog.jpg" alt=""></h1>
                      
                        <!--이메일 인풋-->
                        <form class="login__input" method="GET" id="emailInput">
                        	<h3>비밀번호를 찾으실 건가요?</h3>
	                        <div id="findPw_tip">
	                        	<br>
	                        	이메일주소를 입력 하시면 이메일주소로
	                        	인증 코드를 보내드립니다.
	                        </div>
	                        <input type="text" id="phnum" name="phone_number" placeholder="전화번호입력 (-없이)" required>
                            <input type="text" id="email" name="email" placeholder="이메일을 입력하세요" required/>
                            <input class="btn_findPw_style" type="submit" value="인증 번호 발송">
                        </form>
                        <!--이메일 인풋 end-->
                        
                        <!-- 이메일 인증 코드 인풋 -->
                       <form class="login__input hidden" id="check">
                       		<h3>이메일 인증</h3>
                       		<br>
							<div id="email_tip">
								발송받은 이메일에 
								인증코드를 입력해주세요.
							</div>
							<br>
                            <input type="text" name="authNumber" placeholder="인증번호를 입력하세요" required/>
                            <input class="btn_findPw_style" type="submit" value="인증">
                        </form>     
                        <!-- 이메일 인증 코드 인풋 end -->                  
                        
                        <!--  인증후 변경할 비번 입력 -->
						<form class="login__input hidden" id="replacePw" action="${cpath }/users/replacePw">
							<div id="pw_tip_main"><h3>보안 수준이 높은 비밀번호 만들기</h3></div>
							<div id="pw_tip_sub">
								비밀번호는 6자 이상이어야 하고 숫자,영문,특수기호( ! $ @ % )의 조합을 포함해야 합니다.
							</div>
							<input type="hidden" id="phoneNumber" name="phone_number" value="">
							<input type="password" name="pw_sub" placeholder="새 비밀번호 입력" required>
							<div class="pw_sub_err"></div>
							<input type="password" name="pw" placeholder="새 비밀번호  다시 입력" required>
							<div class="pw_err"></div>
							<input class="btn_findPw_style" type="submit" value="비밀번호 재설정" onclick="return allCheck()">
						</form>
						<!--  인증후 변경할 비번 입력 -->
                        
                    </div>
                    
                    <!--계정이 없으신가요?-->
                    <div class="login__register">
                        <span>계정이 없으신가요?</span>
                        <a href="${cpath }/users/join">가입하기</a>
                    </div>
                    <!--계정이 없으신가요?end-->
                </article>
            </section>
        </main>
        
    </div>
    
<!-- 비밀번호 재설정 형식,일치 확인 / 비밀번호 입력시 히든에 추가 코드 / 이메일 보내기 / 이메일 인증 -->
<script type="text/javascript" src="${cpath }/resources/js/users_findPw.js"></script>

</body>
</html>