<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>BOOK N BOOK - 회원가입</title>
  <link rel="stylesheet" href="join.css">
</head>
<body>
  <div class="header"></div>
  <div class="signup-container">
    <h2>회원가입</h2>
    <form>
      <input type="text" placeholder="아이디" id="username">
      <input type="password" placeholder="비밀번호" id="password">
      <input type="text" placeholder="주소" id="address">
      <input type="tel" placeholder="연락처" id="phone">
      <input type="email" placeholder="이메일" id="email">
      <input type="date" id="signup-date">
      
      <button class="button signup-button" onclick="signup()">가입하기</button>
    </form>
    <p>이미 계정이 있으신가요? <a href="login.html">로그인</a></p>
  </div>

  <script>
    function signup() {
      let username = document.getElementById("username").value;
      let password = document.getElementById("password").value;
      let confirmPassword = document.getElementById("confirm-password").value;
      let address = document.getElementById("address").value;

     
      if (username === "" || password === "" || confirmPassword === "" || address === "") {
        alert("모든 필드를 입력해주세요.");
        return;
      }

      if (password !== confirmPassword) {
        alert("비밀번호가 일치하지 않습니다.");
        return;
      }

      alert("회원가입이 완료되었습니다!");
  
    }
  </script>
</body>
</html>