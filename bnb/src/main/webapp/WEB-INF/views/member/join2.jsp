<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="join2.css">
  <title>사업자 회원가입</title>
</head>
<body>
    <div class="header"></div>
  <div class="registration-form">
    <h2>사업자 회원가입</h2>
    <form id="registration-form">
      <input type="text" id="username" name="username" placeholder="아이디" required>
      <input type="password" id="password" name="password" placeholder="비밀번호" required>
      <input type="password" id="confirm-password" name="confirm-password" placeholder="비밀번호 확인" required>
      <input type="text" id="business-number" name="business-number" placeholder="사업자번호" required>
      <input type="text" id="store-name" name="store-name" placeholder="서점명" required>
      <input type="text" id="address" name="address" placeholder="주소" required>
      <input type="tel" id="contact" name="contact" placeholder="연락처" required>
      <input type="email" id="email" name="email" placeholder="이메일" required>
      <button type="submit">회원가입</button>
    </form>
  </div>
</body>
</html>