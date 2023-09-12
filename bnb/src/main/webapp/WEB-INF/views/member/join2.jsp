<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/member/join2.css">
  <title>사업자 회원가입</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
    <div class="header"></div>
  <div class="registration-form">
    <h2>사업자 회원가입</h2>
  

<form action="/member/join2" method="post" id="registration-form" onsubmit="validateRegistrationForm(event);">
  <input type="text" id="m_id" name="m_id" placeholder="아이디(6자 이상의 영문/숫자)" required oninput="checkIdDuplication()">
      <!-- <button type="button" onclick="checkIdDuplication()">중복 확인</button> -->
      <span id="idCheckMessage"></span> <!-- 중복 확인 메시지를 표시할 요소 -->
      <input type="password" id="m_pw" name="m_pw" placeholder="비밀번호" required>
      <!-- <input type="password" id="confirm-password" name="m_password" placeholder="비밀번호 확인" required> -->
      <input type="text" id="business-number" name="s_crn" placeholder="사업자번호" required>
      <input type="text" id="s_storename" name="s_storename" placeholder="서점명" required>
      <input type="text" id="m_addr" name="m_addr" placeholder="주소" required>
      <input type="tel" id="m_phone" name="m_phone" placeholder="연락처" required>
      <input type="email" id="m_email" name="m_email" placeholder="이메일" required>
      <button type="submit">회원가입</button>
    </form>
    <p>이미 계정이 있으신가요? <a href="/css/member/login.html">로그인</a></p>

    <script>
  function validateRegistrationForm(event) {
    let username = document.getElementById("m_id").value;
    let password = document.getElementById("m_pw").value;
    // let confirmPassword = document.getElementById("confirm-password").value;
    let businessNumber = document.getElementById("business-number").value;
    let storeName = document.getElementById("s_storename").value;
    let address = document.getElementById("m_addr").value;
    let contact = document.getElementById("m_phone").value;
    let email = document.getElementById("m_email").value;

    // Username validation (6자 이상의 영문/숫자)
    if (!/^[a-zA-Z0-9]{6,}$/.test(username)) {
      alert("아이디는 6자 이상의 영문/숫자로 입력해주세요.");
      event.preventDefault();
      return;
    }

    // Password validation (6자 이상, 영문+숫자+특수문자 조합)
    if (!/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$/.test(password)) {
      alert("비밀번호는 영문, 숫자, 특수문자 중 2가지 이상 조합으로 6자 이상 입력해주세요.");
      event.preventDefault();
      return;
    }

    // if (password !== confirmPassword) {
    //   alert("비밀번호가 일치하지 않습니다.");
    //   event.preventDefault();
    //   return;
    // }

    // Business number validation (10자의 숫자)
    if (!/^\d{10}$/.test(businessNumber)) {
      alert("사업자번호는 10자의 숫자로 입력해주세요.");
      event.preventDefault();
      return;
    }

    // Contact validation (연락처 형식)
    if (!/^\d{3}-\d{3,4}-\d{4}$/.test(contact)) {
      alert("올바른 연락처 형식을 입력해주세요 (XXX-XXX-XXXX 또는 XXX-XXXX-XXXX).");
      event.preventDefault();
      return;
    }
    alert("회원가입이 완료되었습니다!");
    document.querySelector('form').submit();
      

    // Other field validations can be added similarly
  }


  function checkIdDuplication() {
    let username = document.getElementById("m_id").value;
    let idCheckMessageElement = document.getElementById("idCheckMessage");

    // 아이디 길이 검사 추가
    if (username.length < 6) {
        idCheckMessageElement.innerText = "";
        idCheckMessageElement.style.color = "red";
        return; // 여기서 함수를 종료
    }

    $.ajax({
        url: "/member/checkId2",
        type: "GET",
        data: {
            m_id: username
        },
        success: function (response) {
            if (response.isDuplicated) {
                idCheckMessageElement.innerText = "이 아이디는 이미 사용 중입니다.";
                idCheckMessageElement.style.color = "red"; // 빨간색 스타일 적용
            } else {
                idCheckMessageElement.innerText = "사용 가능한 아이디입니다.";
                idCheckMessageElement.style.color = "green"; 
            }
        },
        error: function () {
            alert("서버 에러. 다시 시도해주세요.");
        }
    });
}
</script>
</body>
</html>
 