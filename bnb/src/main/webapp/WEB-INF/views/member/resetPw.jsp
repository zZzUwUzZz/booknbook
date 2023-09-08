<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/member/findId.css">
    <title>Reset Password</title>
</head>
<body>
    <div class="header"></div>
    
    <div class="titleArea">
        <h2>Reset Password</h2>
        <ul>
            <li>비밀번호를 잊으셨나요?</li>
            <li>아이디와 현재 비밀번호를 입력하여 본인 확인 후 비밀번호를 재설정하세요.</li>
        </ul>
    </div>

    <form id="resetPasswordForm" name="resetPasswordForm" action="/member/resetPw" method="post" target="_self" enctype="multipart/form-data">
        <div class="findId">
            <fieldset>   
                <legend>본인 확인</legend>
                
                <p class="input-group">
                    <strong class="input_label">이름</strong>
                    <input id="input_field_name" name="name" class="lostInput" placeholder="이름을 입력하세요" type="text">
                </p>
                <p class="input-group">
                    <strong class="input_label">아이디</strong>
                    <input id="input_field_id" name="userId" class="lostInput" placeholder="아이디를 입력하세요" type="text">
                </p>
                <p class="input-group">
                    <strong class="input_label">이메일</strong>
                    <input id="input_field_email" name="email" class="lostInput" placeholder="이메일을 입력하세요" type="text">
                </p>
               
                <!-- 새로운 비밀번호와 확인 입력창 (초기 상태에서는 숨김) -->
                <p class="input-group" id="new_password_field" style="display:none;">
                    <strong class="input_label">새로운 비밀번호</strong>
                    <input id="input_new_password" name="newPassword" class="lostInput" placeholder="새로운 비밀번호를 입력하세요" type="password">
                </p>
                <p class="input-group" id="confirm_password_field" style="display:none;">
                    <strong class="input_label">비밀번호 확인</strong>
                    <input id="input_confirm_password" class="lostInput" placeholder="비밀번호를 다시 입력하세요" type="password">
                </p>
                <div class="ec-base-button gColumn" id="button_group">
                    <button type="submit" id="submit_button" class="btnSubmit sizeM" onclick="verifyUser(); return false;">확인</button>
                </div>        
            </fieldset>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script>
       function verifyUser() {
            var inputData = {
                name: $("#input_field_name").val(),
                userId: $("#input_field_id").val(),
                email: $("#input_field_email").val()
            };

            $.ajax({
        type: "POST",
        url: "/member/resetPw",
        contentType: "application/json",  // <- 이 부분 추가
        data: JSON.stringify(inputData),  // <- JSON 형식으로 변환
        success: function(response) {
                        if (response) {
                        $("#new_password_field").fadeIn();
                        $("#confirm_password_field").fadeIn();
                        
                        $("#submit_button").off("click").on("click", resetPassword).text("비밀번호 재설정");
                    } else {
                        alert('아이디, 이름 또는 이메일이 일치하지 않습니다.');
                    }
                },
                error: function(error) {
                    alert('오류가 발생했습니다. 다시 시도해주세요.');
                }
            });
        }


      
       
    function resetPassword() {
    var newPassword = $("#input_new_password").val();
    var confirmPassword = $("#input_confirm_password").val();

    // 비밀번호 유효성 검사
    if (!/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$/.test(newPassword)) {
        alert("비밀번호는 영문, 숫자, 특수문자 중 2가지 이상 조합으로 6자 이상 입력해주세요.");
        return;
    }

    if (newPassword !== confirmPassword) {
        alert("비밀번호가 일치하지 않습니다.");
        return;
    }

    // 서버로 새 비밀번호 전송
    var sendData = {
        userId: $("#input_field_id").val(),
        newPassword: newPassword
    };

    $.ajax({
    type: "POST",
    url: "/member/resetPw",
    contentType: "application/json",  // <- 이 부분 추가
    data: JSON.stringify(sendData),  // <- JSON 형식으로 변환
    success: function(response) {
            if (response) {
                alert('비밀번호가 성공적으로 변경되었습니다.');
            } else {
                alert('비밀번호 변경에 실패하였습니다.');
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