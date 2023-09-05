<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/member/unregister.css">
    <title>Find ID</title>
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
     
    <form id="findIdForm" name="findIdForm" action="/exec/front/Member/findId/" method="post" target="_self" enctype="multipart/form-data">
        <input id="returnUrl" name="returnUrl" value="/member/id/find_id_result.html" type="hidden">
        <div class="findId">
            <fieldset>   
                <legend>아이디 찾기</legend>
                <p>
                    <strong>회원유형</strong>
                    <select id="searchType" name="searchType" fw-label="회원유형">
                        <option value="indi" selected="selected">개인회원</option>
                        <option value="indibuis">개인 사업자회원</option>
                    </select>
                </p>
                <p class="check">
                    <input id="check_method1" name="check_method" value="2" type="radio" checked="checked">
                    <label for="check_method1">이메일</label>
                </p>
                <p class="input-group" id="input_name">
                    <strong class="input_label">이름 </strong>
                    <input id="input_field_name" name="input_field_name" class="lostInput" placeholder="이름을 입력하세요" value="" type="text">
                </p>
                <p class="input-group" id="input_email">
                    <strong class="input_label">이메일 입력</strong>
                    <input id="input_field_email" name="input_field_email" class="lostInput" placeholder="이메일을 입력하세요" value="" type="text">
                </p>
                <div class="ec-base-button gColumn" id="button_group">
                    <button type="submit" id="submit_button" class="btnSubmit sizeM" onclick="findIdAction(); return false;">확인</button>
                </div>
            </fieldset>
        </div>
    </form>
    <p class="input-group" id="input_verification_code" style="display:none;">
        <strong class="input_label">인증 코드 입력</strong>
        <input id="verification_code" name="verification_code" class="lostInput" placeholder="인증 코드를 입력하세요" type="text">
    </p>
    <div class="ec-base-button gColumn" id="verify_button_group">
        <button type="submit" id="verify_button" class="btnSubmit sizeM" onclick="verifyCode(); return false;" style="display:none;">인증 확인</button>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
    <script>
       function findIdAction() {
    var inputData = {
        name: $("#input_field_name").val(),
        email: $("#input_field_email").val()
    };

    // AJAX 요청: 이메일로 인증 코드 발송
    $.ajax({
        type: "POST", // 요청 방식
        url: "/some-endpoint", // 요청을 보낼 서버 URL, 해당 URL을 적절하게 수정해야 합니다.
        data: inputData, // 서버에 전송할 데이터
        success: function(response) {
            if (response.success) {
                alert('인증 코드가 이메일로 발송되었습니다.');
                document.getElementById('input_verification_code').style.display = 'block';
                document.getElementById('submit_button').style.display = 'none';
                document.getElementById('verify_button').style.display = 'block';
            } else {
                alert('해당하는 아이디를 찾을 수 없습니다.');
            }
        },
        error: function(error) {
            alert('오류가 발생했습니다. 다시 시도해주세요.');
        }
    });
}
    </script>
</body>
</html>