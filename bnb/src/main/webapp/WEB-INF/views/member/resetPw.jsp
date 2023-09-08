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
            <li>아이디, 이름, 이메일을 입력하여 본인 확인 후 비밀번호를 재설정하세요.</li>
        </ul>
    </div>

    <form id="resetPasswordForm" name="resetPasswordForm" action="/exec/front/Member/resetPassword/" method="post" target="_self" enctype="multipart/form-data">
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
                url: "/member/verifyUser",
                data: inputData,
                success: function(response) {
                    if (response) {
                        // TODO: 여기에 비밀번호 재설정 로직을 추가하실 수 있습니다.
                    } else {
                        alert('아이디, 이름 또는 이메일이 일치하지 않습니다.');
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