<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>BOOK N BOOK - 회원가입</title>
  <link rel="stylesheet" href="/css/member/join.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
  <div class="header"></div>
  <div class="signup-container">
    <h2>회원가입</h2>
    <form action="/member/join" method="post" id="signupForm">
      <input type="text" name="c_name" placeholder="이름" id="c_name">
      <input type="text" name="m_id" placeholder="아이디 (6자 이상의 영문/숫자)" id="m_id">
      <input type="password" name="m_pw" placeholder="비밀번호 (6자 이상, 영문+숫자+특수문자 조합)" id="m_pw">
      <input type="password" placeholder="비밀번호 확인" id="confirm-password">
      <input type="text" name="m_addr" placeholder="주소" id="m_addr">
      <input type="tel" name="m_phone" placeholder="연락처" id="m_phone">
      <input type="email" name="m_email" placeholder="이메일" id="m_email">
      
      <button class="button signup-button" type="button" onclick="signup()">가입하기</button>
    </form>
    <p>이미 계정이 있으신가요? <a href="/css/member/login.html">로그인</a></p>
  </div>

  <script>
    function signup() {
      let c_name = document.getElementById("c_name").value;
      let m_id = document.getElementById("m_id").value;
      let m_pw = document.getElementById("m_pw").value;
      let confirmPassword = document.getElementById("confirm-password").value;
      let m_addr = document.getElementById("m_addr").value;
      let m_phone = document.getElementById("m_phone").value;
      let m_email = document.getElementById("m_email").value;

      // 아이디 유효성 검사
      if (!/^[a-zA-Z0-9]{6,}$/.test(m_id)) {
        alert("아이디는 6자 이상의 영문/숫자로 입력해주세요.");
        return;
      }

      // 비밀번호 유효성 검사
      if (!/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$/.test(m_pw)) {
        alert("비밀번호는 영문, 숫자, 특수문자 중 2가지 이상 조합으로 6자 이상 입력해주세요.");
        return;
      }

      if (m_pw !== confirmPassword) {
        alert("비밀번호가 일치하지 않습니다.");
        return;
      }

      // 다른 필드들에 대한 유효성 검사는 비슷한 방식으로 추가할 수 있습니다.

      alert("회원가입이 완료되었습니다!");
      document.querySelector('form').submit();
      
    }
  </script>
</body>
</html>