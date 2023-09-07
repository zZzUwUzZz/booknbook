<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href="/css/member/login.css">


</head>
<body>+

<div class="header"></div>
<div class="body">
  <div class="login-container">
    <h2 class="h2">login</h2>
    <form id="login-form" onsubmit="return validateLoginForm()" action="/member/login" method="post">
      <input type="text" id="m_id" name="m_id" required placeholder="아이디">
      <input type="password" id="m_pw" name="m_pw" required placeholder="비밀번호">
      <button class="login-button" type="submit">로그인</button>
  </form>
    <div id="kr">
    <a href="/member/choice">회원가입|</a>
    <a href="/member/findId">아이디 찾기|</a>
    <a href="/member/resetPw">비밀번호 재설정</a>

  </div>
  </div>
</div>

<div class="book">
    <div class="page">
      <!-- Content for the page -->
    </div>
    <div class="page">
      <!-- Content for the page -->
    </div>
 
  <div class="book">
        <div class="content">
          <h2>BooK N BooK</h2>
          <p>I want to go home</p>
      </div>
      </div>

<script>
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