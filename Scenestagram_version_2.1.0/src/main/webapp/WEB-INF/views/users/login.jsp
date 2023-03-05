<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${cpath }/resources/css/users_login.css">
</head>
<body>
    <div class="container">
        <main class="loginMain">
        <!--로그인섹션-->
            <section class="login">
               <!--로그인박스-->
                <article class="login__form__container">
                   <!--로그인 폼-->
                   <div class="login__form">
                        <h1><img src="${cpath }/resources/img/loginlog.jpg" alt=""></h1>
                        
                        <!--로그인 인풋-->
                        <form class="login__input"  action="${cpath }/users/login" method="POST">
                            <input type="text" id="id" value="${empty inputPhoneNumber ? '' : inputPhoneNumber }" name="phone_number" placeholder="전화번호 입력 (-제외)" required="required" />
                            <input type="password" id="pw" name="pw" placeholder="password" required="required" />
                            <div id="login_err">${msg == false ? '전화번호 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.' : '' }</div>
                            <button class="btn">로그인</button>
                            
                        </form>
                        <!--로그인 인풋end-->
                        <div>
                        	<a href="${cpath }/users/findPw">비밀번호를 잊으셨나요?</a>
                        </div>                        
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
    
<!-- 탈퇴한 계정으로 로그인할시 오류문구 스크립트 -->
<c:if test="${not empty withdrowuser}">
	<script type="text/javascript">
		alert('${withdrowuser}');
	</script>
</c:if>
<!-- 아이디와 비번입력시에만 로그인버튼 색표시 -->
<script type="text/javascript" src="${cpath }/resources/js/users_login.js"></script>

</body>
</html>