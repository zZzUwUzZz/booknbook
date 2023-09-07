<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/member/unregister.css">
    <title>Password Confirmation</title>
    <script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
</head>
<body>
    <div class="header"></div>
    <div class="titleArea">
        <h2>Find ID</h2>
        <ul>
            <li>아이디 찾기 페이지요.</li>
            <li>법인사업자 회 법인명과 법인번호 또는 이름과 등록번호를 입력해 주세요.</li>
        </ul>
    </div>
     
    <form id="findIdForm" name="findIdForm" action="/member/findId" method="post" target="_self" enctype="multipart/form-data">
        <input id="returnUrl" name="returnUrl" value="/member/id/find_id_result.html" type="hidden">
        <div class="findId">
           
            <fieldset>   <legend>아이디 찾기</legend>
             
                <p class="member"></p>
                    <strong>회원유형</strong>
                    <select id="searchType" name="searchType" fw-label="회원유형">
                        <option value="indi" selected="selected">개인회원</option>
                        <option value="indibuis">개인 사업자회원</option>
                    </select>
                </p>
            
                <p class="check">
                    <input id="check_method1" name="check_method" value="2" type="radio" checked="checked" onchange="toggleInput('email');">
                    <label for="check_method1">이메일</label>
                    <input id="check_method2" name="check_method" value="3" type="radio" onchange="toggleInput('mobile');">
                    <label for="check_method2"><span id="search_type_mobile_label">휴대폰번호</span></label>
                </p>
                <p class="input-group" id="input_id">
                    <strong class="input_label">사용자ID</strong>
                    <input id="input_field_id" name="input_field_id" class="lostInput" placeholder="아이디를 입력하세요" value="" type="text">
                </p>
                <p class="input-group" id="input_email">
                    <strong class="input_label">이메일 입력</strong>
                    <input id="input_field_email" name="input_field_email" class="lostInput" placeholder="이메일을 입력하세요" value="" type="text">
                </p>
                <p class="input-group" id="input_mobile" style="display: none;">
                    <strong class="input_label">휴대폰 입력</strong>
                    <input id="input_field_mobile" name="input_field_mobile" class="lostInput" placeholder="휴대폰 번호를 입력하세요" value="" type="text">
                </p>
                <div class="ec-base-button gColumn" id="bu">
                    <!-- <a href="#none" class="btnSubmit sizeM" onclick="findIdAction(); return false;">확인</a> -->
                    <button type="button" onclick="location.href='/member/emailAuth'">이메일보내기</button>
                </div>
            </fieldset>
        </div>
    </form>
    
    <script>
        function toggleInput(inputType) {
            const emailInput = document.getElementById('input_email');
            const mobileInput = document.getElementById('input_mobile');
            const nameInput = document.getElementById('input_name');
    
            // 모든 입력 필드를 기본적으로 숨깁니다.
            emailInput.style.display = 'none';
            mobileInput.style.display = 'none';
            nameInput.style.display = 'block'; // 이름 입력 필드는 항상 보여줍니다.
    
            if (inputType === 'email') {
                emailInput.style.display = 'block';
            } else if (inputType === 'mobile') {
                mobileInput.style.display = 'block';
            }
        }
    
        // 페이지 로딩 시 기본 설정: "이메일" 입력창이 선택되어 표시됩니다.
        window.onload = function() {
            toggleInput('email');
        }
    </script>
</body>
</html>