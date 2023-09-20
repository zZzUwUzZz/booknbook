<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>BOOK N BOOK - 회원가입</title>
  <link rel="stylesheet" href="/css/member/join.css">
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


  
  <div class="header">  <%@include file="/WEB-INF/tiles/header.jsp" %></div>  
  


  <div class="signup-container">
    <h2>회원가입</h2>
    <form action="/member/join" method="post" id="signupForm">
      <input type="text" name="c_name" placeholder="이름" id="c_name"> 
      <input type="text" id="m_id" oninput="checkId()" name="m_id" required placeholder="아이디(6자 이상의 영문/숫자)">
      <span id="idCheckMessage"></span>

      <input type="password" name="m_pw" placeholder="비밀번호 (6자 이상, 영문+숫자+특수문자 조합)" id="m_pw">
      <input type="password" placeholder="비밀번호 확인" id="confirm-password">
      <!-- <input type="text" name="m_addr" placeholder="주소" id="m_addr"> -->    
      <input type="tel" name="m_phone" placeholder="연락처" id="m_phone">
      <input type="email" name="m_email" placeholder="이메일" id="m_email">
      <div class="form-group">                                               
            <div class="form-group address-group">                   
              <input class="form-control" placeholder="우편번호" name="m_addr2" id="m_addr" type="text" readonly="readonly">
              <button type="button" class="btn btn-default postcode-btn" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
          </div>
          <div class="form-group">
              <input class="form-control" placeholder="도로명 주소" name="m_addr" id="m_addr2" type="text" readonly="readonly">
          </div>
          <div class="form-group">
              <input class="form-control" placeholder="상세주소" name="m_addr3" id="m_addr3" type="text">
          </div>
      
      
      <button class="button signup-button" type="button" onclick="signup()">가입하기</button>
    </form>
    <p>이미 계정이 있으신가요? <a href="/member/login">로그인</a></p>
  </div>






  
  
 <%@include file="/WEB-INF/tiles/footer.jsp" %>

  <script>
    function signup() {
      
      let c_name = document.getElementById("c_name").value;
      let m_id = document.getElementById("m_id").value;
      let m_pw = document.getElementById("m_pw").value;
      let confirmPassword = document.getElementById("confirm-password").value;
      let m_phone = document.getElementById("m_phone").value;
      let m_email = document.getElementById("m_email").value;
      let m_addr = document.getElementById("m_addr").value;
      let m_addr2 = document.getElementById("m_addr2").value;
      let m_addr3 = document.getElementById("m_addr3").value

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
    
    function checkId() {
    let userId = document.getElementById("m_id").value;
    let idCheckMessageElement = document.getElementById("idCheckMessage");
    
    // 추가된 아이디 길이 검사 로직
    if (userId.length < 6) {
        idCheckMessageElement.innerText = "";
        idCheckMessageElement.style.color = "red";
        return;
    }

    fetch('/member/checkId?m_id=' + userId)
    .then(response => response.json())
    .then(data => {
        if (data.isDuplicated) {
            idCheckMessageElement.innerText = "이 아이디는 이미 사용 중입니다.";
            idCheckMessageElement.style.color = "red";
        } else {
            idCheckMessageElement.innerText = "사용 가능한 아이디입니다.";
            idCheckMessageElement.style.color = "green";
        }
    });
}
//주소
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