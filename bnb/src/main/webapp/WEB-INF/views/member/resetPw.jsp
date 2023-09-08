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

    <form id="resetPasswordForm" name="resetPasswordForm" action="/exec/front/Member/resetPassword/" method="post" target="_self" enctype="multipart/form-data">
        <div class="findId">
            <fieldset>   
                <legend>본인 확인</legend>
                <p class="input-group">
                    <strong class="input_label">아이디</strong>
                    <input id="input_field_id" name="userId" class="lostInput" placeholder="아이디를 입력하세요" type="text">
                </p>
                <p class="input-group">
                    <strong class="input_label">비밀번호</strong>
                    <input id="input_field_password" name="password" class="lostInput" placeholder="비밀번호를 입력하세요" type="password">
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
                userId: $("#input_field_id").val(),
                password: $("#input_field_password").val()
            };

            $.ajax({
                type: "POST",
                url: "/member/verifyUser",
                data: inputData,
                success: function(response) {
                    if (response) {
                        // 본인 확인에 성공하면 새 비밀번호 입력창과 확인창을 보여준다.
                        $("#new_password_field").show();
                        $("#confirm_password_field").show();
                    } else {
                        alert('아이디 또는 비밀번호가 일치하지 않습니다.');
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