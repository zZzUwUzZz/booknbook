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
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

  <%@include file="/WEB-INF/tiles/header.jsp" %></div>  

  <div class="registration-form">
    <h2>사업자 회원가입</h2>
  

<form action="/member/join2" method="post" id="registration-form" onsubmit="validateRegistrationForm(event);">
  <input type="text" id="m_id" name="m_id" placeholder="아이디(6자 이상의 영문/숫자)" required oninput="checkIdDuplication()">
      <span id="idCheckMessage"></span> <!-- 중복 확인 메시지를 표시할 요소 -->
      <input type="password" id="m_pw" name="m_pw" placeholder="비밀번호" required>
      <input type="password" id="confirm-password" name="m_password" placeholder="비밀번호 확인" required>
      
      <input type="text" id="business-number" name="s_crn" placeholder="사업자번호" required>
      <input type="text" id="s_storename" name="s_storename" placeholder="서점명" required>
      <!-- <input type="text" id="m_addr" name="m_addr" placeholder="주소" required> -->
      <input type="tel" id="m_phone" name="m_phone" placeholder="연락처" required>
      <input type="email" id="m_email" name="m_email" placeholder="이메일" required>
      <div class="form-group">                                               
        <div class="form-group address-group">                   
          <input class="form-control" placeholder="우편번호" name="m_addr" id="m_addr" type="text" readonly="readonly">
          <button type="button" class="btn btn-default postcode-btn" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
      </div>
      <div class="form-group">
          <input class="form-control" placeholder="도로명 주소" name="m_addr2" id="m_addr2" type="text" readonly="readonly">
      </div>
      <div class="form-group">
          <input class="form-control" placeholder="상세주소" name="m_addr3" id="m_addr3" type="text">
      </div>
      <button type="submit">회원가입</button>
    </form>
    <p>이미 계정이 있으신가요? <a href="/css/member/login">로그인</a></p>



    <%@include file="/WEB-INF/tiles/footer.jsp" %>


    <script>
  function validateRegistrationForm(event) {
    let username = document.getElementById("m_id").value;
    let password = document.getElementById("m_pw").value;
    let confirmPassword = document.getElementById("confirm-password").value;
    let businessNumber = document.getElementById("business-number").value;
    let storeName = document.getElementById("s_storename").value;
    // let address = document.getElementById("m_addr").value;
    let contact = document.getElementById("m_phone").value;
    let email = document.getElementById("m_email").value;
   
    let m_addr = document.getElementById("m_addr").value;
      let m_addr2 = document.getElementById("m_addr2").value;
      let m_addr3 = document.getElementById("m_addr3").value


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
    if (!/^\d{11}$/.test(contact)) {
    alert("올바른 연락처 형식을 입력해주세요. 전화번호는 11자의 숫자로 입력해주세요.");
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




function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
               
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
              
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                $("[name=m_addr2]").val(data.zonecode);
                $("[name=m_addr]").val(fullRoadAddr);
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }

</script>
</body>
</html>
 