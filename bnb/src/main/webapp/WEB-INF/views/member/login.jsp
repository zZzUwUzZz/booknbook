<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BOOK N BOOK - LOGIN</title>
    <link rel="stylesheet" href="/css/member/login.css">
  
    <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;800&display=swap" rel="stylesheet">
<link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/books.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="/js/main.js"></script>
<script src="/js/mapSearch.js"></script>

  
  <style>
    .ft {
    margin-top: 0px;
    padding: 15px 43px;
    height: 40px; 
    color: #203b23;
    display: flex;
    align-items: center;
    position: relative;
    bottom: 0;
    justify-content: space-between;
    border-top: 1px solid #203b23;
}
  </style>
  
  </head>


  <body>

    <%@include file="/WEB-INF/tiles/header.jsp" %>


    <div class="loginBox">

 <div class="loginimg">
<img src="/images/main_002.jpg" alt="">
 </div>

  <div class="loginformbox">
<div class="logintt">WELCOME!</div>
<div class="loginfail"></div>

<div class="formcontain">

  <form id="login-form" onsubmit="return validateLoginForm()" action="/member/login" method="post">
    <input type="text" id="m_id" name="m_id" required placeholder="USERNAME">
    <input type="password" id="m_pw" name="m_pw" required placeholder="PASSWORD">
    <button class="login-button" type="submit">LOGIN</button>
  
    <div class="find_signupcontain">
    <div class="findidpwtt"> <a href="/member/findId">아이디, 비밀번호를 잊으셨나요?</a> </div> 
     <div class="signuptt"><span>북앤북은 처음이신가요?</span><a href="/member/choice">가입하기</a></div>
    </div>
  </form>

  
</div>


 </div>


    </div>

    

 <%@include file="/WEB-INF/tiles/footer.jsp" %>

 <script src="/js/member/login.js"></script>

 <script>
window.onload = function() {
    var msg = "${msg}"; // EL을 사용하여 Model 객체에서 "msg" 데이터를 가져옴

    if (msg === '로그인 실패') {
        console.log(msg);
        // 클래스 이름으로 div 선택
        var errorMessagesDivs = document.getElementsByClassName("loginfail");

        // 모든 선택된 div에 텍스트 추가
        for (var i = 0; i < errorMessagesDivs.length; i++) {
            errorMessagesDivs[i].textContent = "아이디와 비밀번호를 다시 확인해주세요.";
            errorMessagesDivs[i].style.display = "block"; // div를 보이게 만듭니다.
        }

        // 페이드인 효과 적용 (1초 후에 opacity를 1로 설정)
        setTimeout(function() {
            for (var i = 0; i < errorMessagesDivs.length; i++) {
                errorMessagesDivs[i].style.opacity = "1";
            }
        }, 30);
    } else if (msg === '이미 로그인 된 상태입니다.') {
        alert(msg);
    }
};

  </script>

  </body>

  </html>