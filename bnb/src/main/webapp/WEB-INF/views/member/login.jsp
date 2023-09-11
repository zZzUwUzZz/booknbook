<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BOOK N BOOK - LOGIN</title>
    <link rel="stylesheet" href="/css/member/login.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/books.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;800&display=swap">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                        <div class="findidpwtt">
                            <a href="/member/findId">아이디, 비밀번호를 잊으셨나요?</a>
                        </div>
                        <div class="signuptt"><span>북앤북인 처음이신가요?</span><a href="/member/choice">가입하기</a></div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="book">
        <div class="content">
            <h2>BooK N BooK</h2>
            <p>I want to go home</p>
        </div>
    </div>

    <%@include file="/WEB-INF/tiles/footer.jsp" %>

    <script src="/js/member/login.js"></script>

    <script>
        window.onload = function() {
            var msg = "${msg}";

            if (msg === '로그인 실패') {
                var errorMessagesDivs = document.getElementsByClassName("loginfail");
                for (var i = 0; i < errorMessagesDivs.length; i++) {
                    errorMessagesDivs[i].textContent = "아이디와 비밀번호를 다시 확인해주세요.";
                    errorMessagesDivs[i].style.display = "block";
                }
                setTimeout(function() {
                    for (var i = 0; i < errorMessagesDivs.length; i++) {
                        errorMessagesDivs[i].style.opacity = "1";
                    }
                }, 30);
            } else if (msg === '이미 로그인 된 상태입니다.') {
                alert(msg);
            }
        };

        function validateLoginForm() {
            let username = document.getElementById("m_id").value;
            let password = document.getElementById("m_pw").value;

            if (username === "" || password === "") {
                alert("아이디와 비밀번호를 모두 입력해주세요.");
                return false;
            }

            return true;
        }
    </script>
</body>

</html>